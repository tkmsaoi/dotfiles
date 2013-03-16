(require 'pi-php-mode)
(add-hook 'pi-php-mode
          (lambda ()
            (c-set-style "stroustrup")
            (c-set-offset 'case-label' 4)
            (c-set-offset 'arglist-intro' 4)
            (c-set-offset 'arglist-cont-nonempty' 4)
            (c-set-offset 'arglist-close' 0)))
