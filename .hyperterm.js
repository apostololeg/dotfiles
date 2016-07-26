var backgroundColor = '#262626';

module.exports = {
  config: {
    // default font size in pixels for all tabs
    fontSize: 12,
    // font family with optional fallbacks
    fontFamily: 'Menlo, "DejaVu Sans Mono", "Lucida Console", monospace',
    // terminal cursor background color (hex)
    cursorColor: '#b3bcc1',
    // color of the text
    foregroundColor: '#fff',
    // terminal background color
    backgroundColor: backgroundColor,
    // border color (window, tabs)
    borderColor: '#444',
    // custom css to embed in the main window
    css: `
        .active_1gcgehd:before {
            border-color: ${backgroundColor}
        }
        .header_header {
            background-color: rgb(27, 27, 27) !important;
        }
        .tab_active {
            background-color: ${backgroundColor}
        }
    `,
    // custom css to embed in the terminal window
    termCSS: `
        .cursor-node {
            height: 3px !important;
            margin-top: .8em;
        }
    `,
    // custom padding (css format, i.e.: `top right bottom left`)
    padding: '12px 14px',
    // some color overrides. see http://bit.ly/29k1iU2 for
    // the full list
    colors: [
      '#000000',
      '#ff0000',
      '#33ff00',
      '#ffff00',
      '#0066ff',
      '#cc00ff',
      '#00ffff',
      '#d0d0d0',
      '#808080',
      '#ff0000',
      '#33ff00',
      '#ffff00',
      '#0066ff',
      '#cc00ff',
      '#00ffff',
      '#ffffff'
    ]
  },
  // a list of plugins to fetch and install from npm
  // format: [@org/]project[#version]
  // examples:
  //   `hyperpower`
  //   `@company/project`
  //   `project#1.0.1`
  plugins: [
  ],
  // in development, you can create a directory under
  // `~/.hyperterm_plugins/local/` and include it here
  // to load it and avoid it being `npm install`ed
  localPlugins: []
};
