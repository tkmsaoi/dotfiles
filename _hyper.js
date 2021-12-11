module.exports = {
  config: {
    updateChannel: "stable",

    fontSize: 10,
    fontFamily:
      'Monaco, Menlo, "DejaVu Sans Mono", Consolas, "Lucida Console", monospace',
    fontWeight: "normal",
    fontWeightBold: "bold",
    lineHeight: 1,
    letterSpacing: 0,

    cursorColor: "rgba(248,28,229,0.8)",
    cursorAccentColor: "#000",
    cursorShape: "BLOCK",
    cursorBlink: false,

    foregroundColor: "#fff",
    backgroundColor: "#000",
    selectionColor: "rgba(248,28,229,0.3)",
    borderColor: "#333",

    // custom CSS to embed
    css: `
      .xterm-viewport::-webkit-scrollbar-thumb {
				background-color: rgba(255, 255, 255, 0.06);
			}
    `,

    termCSS: "",

    showHamburgerMenu: "",
    showWindowControls: "",

    // custom padding (CSS format, i.e.: `top right bottom left`)
    // padding: '12px 14px',
    padding: "10px 10px",

    colors: {
      black: "#000000",
      red: "#C51E14",
      green: "#1DC121",
      yellow: "#C7C329",
      blue: "#0A2FC4",
      magenta: "#C839C5",
      cyan: "#20C5C6",
      white: "#C7C7C7",
      lightBlack: "#686868",
      lightRed: "#FD6F6B",
      lightGreen: "#67F86F",
      lightYellow: "#FFFA72",
      lightBlue: "#6A76FB",
      lightMagenta: "#FD7CFC",
      lightCyan: "#68FDFE",
      lightWhite: "#FFFFFF"
    },

    // the shell to run when spawning a new session (i.e. /usr/local/bin/fish)
    // if left empty, your system's login shell will be used by default
    //
    // Windows
    // - Make sure to use a full path if the binary name doesn't work
    // - Remove `--login` in shellArgs
    //
    // Bash on Windows
    // - Example: `C:\\Windows\\System32\\bash.exe`
    //
    // PowerShell on Windows
    // - Example: `C:\\WINDOWS\\System32\\WindowsPowerShell\\v1.0\\powershell.exe`
    shell: "",

    shellArgs: ["--login"],

    env: {},

    // set to `false` for no bell
    bell: "SOUND",

    copyOnSelect: false,

    // if `true` (without backticks and without quotes), hyper will be set as the default protocol client for SSH
    defaultSSHApp: true,

    quickEdit: false,

    // choose either `'vertical'`, if you want the column mode when Option key is hold during selection (Default)
    // or `'force'`, if you want to force selection regardless of whether the terminal is in mouse events mode
    // (inside tmux or vim with mouse mode enabled for example).
    macOptionSelectionMode: "vertical",

    // URL to custom bell
    // bellSoundURL: 'http://example.com/bell.mp3',

    // Whether to use the WebGL renderer. Set it to false to use canvas-based
    // rendering (slower, but supports transparent backgrounds)
    webGLRenderer: true,

    confirmQuit: true,

    bgtext: [
      {
        pattern: /colopl-stg@prd-builder-main-gcp-done-9eba05ac/,
        text: "DONE STG",
        style: {
          fontFamily: "'Project Paintball', Avenir",
          fontWeight: "bold",
          right: "20px",
          bottom: "0px",
          color: "rgba(250, 234, 90, .3)",
          fontSize: "12em"
        }
      }
    ]
  },

  plugins: [
    "hyper-dracula",
    "hyper-opacity",
    "hyper-confirm",
    "hyperterm-tabs"
  ],

  keymaps: {}
};
