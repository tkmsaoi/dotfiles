(with-eval-after-load 'csharp-mode
  (defun csharp-maybe-insert-codedoc (arg)

    "Insert an xml code documentation template as appropriate, when
typing slashes.  This fn gets bound to / (the slash key), in
csharp-mode.  If the slash being inserted is not the third
consecutive slash, the slash is inserted as normal.  If it is the
third consecutive slash, then a xml code documentation template
may be inserted in some cases. For example,

  a <summary> template is inserted if the prior line is empty,
        or contains only an open curly brace;
  a <remarks> template is inserted if the prior word
        closes the <summary> element;
  a <returns> template is inserted if the prior word
        closes the <remarks> element;
  an <example> template is inserted if the prior word closes
        the <returns> element;
  a <para> template is inserted if the prior word closes
        a <para> element.

In all other cases the slash is inserted as normal.

If you want the default cc-mode behavior, which implies no automatic
insertion of xml code documentation templates, then use this in
your `csharp-mode-hook' function:

     (local-set-key (kbd \"/\") 'c-electric-slash)

 "
    (interactive "*p")
    ;;(message "csharp-maybe-insert-codedoc")
    (let (
          (cur-point (point))
          (char last-command-event)
          (cb0 (char-before (- (point) 0)))
          (cb1 (char-before (- (point) 1)))
          is-first-non-whitespace
          did-auto-insert
          )

      ;; check if two prior chars were slash, in other words,
      ;; check if this is the third slash in a row.
      (if (and (= char ?/) cb0 (= ?/ cb0) cb1 (= ?/ cb1))

          (progn
            ;;(message "yes - this is the third consecutive slash")
            (setq is-first-non-whitespace
                  (save-excursion
                    (back-to-indentation)
                    (= cur-point (+ (point) 2))))

            (if is-first-non-whitespace
                ;; This is a 3-slash sequence.  It is the first non-whitespace text
                ;; on the line. Now we need to examine the surrounding context
                ;; in order to determine which xml cod doc template to insert.
                (let (word-back char0 char1
                                word-fore char-0 char-1
                                text-to-insert         ;; text to insert in lieu of slash
                                fn-to-call     ;; func to call after inserting text
                                (preceding-line-is-empty (or
                                                          (= (line-number-at-pos) 1)
                                                          (save-excursion
                                                            (forward-line -1)
                                                            (beginning-of-line)
                                                            (looking-at "[ \t]*$\\|[ \t]*{[ \t]*$"))))
                                (flavor 0) ;; used only for diagnostic purposes
                                )

                  ;;(message "starting a 3-slash comment")
                  ;; get the prior word, and the 2 chars preceding it.
                  (backward-word)

                  (setq word-back (thing-at-point 'word)
                        char0 (char-before (- (point) 0))
                        char1 (char-before (- (point) 1)))

                  ;; restore prior position
                  (goto-char cur-point)

                  ;; get the following word, and the 2 chars preceding it.
                  (forward-word)
                  (backward-word)
                  (setq word-fore (thing-at-point 'word)
                        char-0 (char-before (- (point) 0))
                        char-1 (char-before (- (point) 1)))

                  ;; restore prior position again
                  (goto-char cur-point)

                  (cond
                   ;; The preceding line is empty, or all whitespace, or
                   ;; contains only an open-curly.  In this case, insert a
                   ;; summary element pair.
                   (preceding-line-is-empty
                    (setq text-to-insert  "/ <summary>\n/// \n/// </summary>"
                          flavor 1) )

                   ;; The preceding word closed a summary element.  In this case,
                   ;; if the forward word does not open a remarks element, then
                   ;; insert a remarks element.
                   ((and (string-equal word-back "summary") (eq char0 ?/)  (eq char1 ?<))
                    (if (not (and (string-equal word-fore "remarks") (eq char-0 ?<)))
                        (setq text-to-insert "/ <remarks>\n///   <para>\n///     \n///   </para>\n/// </remarks>"
                              flavor 2)))

                   ;; The preceding word closed the remarks section.  In this case,
                   ;; insert an example element.
                   ((and (string-equal word-back "remarks")  (eq char0 ?/)  (eq char1 ?<))
                    (setq text-to-insert "/ <example>\n///   \n/// </example>"
                          flavor 3))

                   ;; The preceding word closed the example section.  In this
                   ;; case, insert an returns element.  This isn't always
                   ;; correct, because sometimes the xml code doc is attached to
                   ;; a class or a property, neither of which has a return
                   ;; value. A more intelligent implementation would inspect the
                   ;; syntax state and only inject a returns element if
                   ;; appropriate.
                   ((and (string-equal word-back "example")  (eq char0 ?/)  (eq char1 ?<))
                    (setq text-to-insert "/ <returns></returns>"
                          fn-to-call (lambda ()
                                       (backward-word)
                                       (backward-char)
                                       (backward-char)
                                       (c-indent-line-or-region)
                                       )
                          flavor 4))

                   ;; The preceding word opened the remarks section, or it
                   ;; closed a para section. In this case, insert a para
                   ;; element, using appropriate indentation with respect to the
                   ;; prior tag.
                   ((or
                     (and (string-equal word-back "remarks")  (eq char0 ?<)  (or (eq char1 32) (eq char1 9)))
                     (and (string-equal word-back "para")     (eq char0 ?/)  (eq char1 ?<)))

                    (let (prior-point spacer)
                      (save-excursion
                        (backward-word)
                        (backward-char)
                        (backward-char)
                        (setq prior-point (point))
                        (skip-chars-backward "\t ")
                        (setq spacer (buffer-substring (point) prior-point))
                        ;;(message (format "pt(%d) prior(%d) spacer(%s)" (point) prior-point spacer))
                        )

                      (if (string-equal word-back "remarks")
                          (setq spacer (concat spacer "   ")))

                      (setq text-to-insert (format "/%s<para>\n///%s  \n///%s</para>"
                                                   spacer spacer spacer)
                            flavor 6)))

                   ;; The preceding word opened a para element.  In this case, if
                   ;; the forward word does not close the para element, then
                   ;; close the para element.
                   ;; --
                   ;; This is a nice idea but flawed.  Suppose I have a para element with some
                   ;; text in it. If I position the cursor at the first line, then type 3 slashes,
                   ;; I get a close-element, and that would be inappropriate.  Not sure I can
                   ;; easily solve that problem, so the best thing might be to simply punt, and
                   ;; require people to close their own elements.
                   ;;
                   ;;              ( (and (string-equal word-back "para")  (eq char0 60)  (or (eq char1 32) (eq char1 9)))
                   ;;                (if (not (and (string-equal word-fore "para") (eq char-0 47) (eq char-1 60) ))
                   ;;                    (setq text-to-insert "/   \n/// </para>\n///"
                   ;;                          fn-to-call (lambda ()
                   ;;                                       (previous-line)
                   ;;                                       (end-of-line)
                   ;;                                       )
                   ;;                          flavor 7) )
                   ;;                )

                   ;; the default case - do nothing
                   (t nil))

                  (if text-to-insert
                      (progn
                        ;;(message (format "inserting special text (f(%d))" flavor))

                        ;; set the flag, that we actually inserted text
                        (setq did-auto-insert t)

                        ;; save point of beginning of insertion
                        (setq cur-point (point))

                        ;; actually insert the text
                        (insert text-to-insert)

                        ;; indent the inserted string, and re-position point, either through
                        ;; the case-specific fn, or via the default progn.
                        (if fn-to-call
                            (funcall fn-to-call)

                          (let ((newline-count 0) (pos 0) ix)

                            ;; count the number of newlines in the inserted string
                            (while (string-match "\n" text-to-insert pos)
                              (setq pos (match-end 0)
                                    newline-count (+ newline-count 1) )
                              )

                            ;; indent what we just inserted
                            (c-indent-region cur-point (point) t)

                            ;; move up n/2 lines. This assumes that the
                            ;; inserted text is ~symmetric about the halfway point.
                            ;; The assumption holds if the xml code doc uses a
                            ;; begin-elt and end-elt on a new line all by themselves,
                            ;; and a blank line in between them where the point should be.
                            ;; A more intelligent implementation would use a specific
                            ;; marker string, like @@DOT, to note the desired point.
                            (forward-line (- 0 (/ newline-count 2)))
                            (end-of-line)))))))))

      (if (not did-auto-insert)
          (self-insert-command (prefix-numeric-value arg)))))

  )
