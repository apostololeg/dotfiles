var backgroundColor = '#262626';
var activeColor = 'darkcyan';
var highlightColor = '#152929';

module.exports = {
  config: {
    shell: '/bin/zsh',
    bell: false,
    copyOnSelect: true,
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
        .borderShim_1bzgot8 {
            border-bottom-width: 0;
        }
        .header_header {
            background-color: ${backgroundColor} !important;
        }
        .tab_tab {
          border: 0;
          transition: background-color .2s ease-out;
          overflow: hidden;
        }
        .tab_tab:after {
          content: '';
          position: absolute;
          top: -3px;
          height: 3px;
          width: 100%;
          background-color: ${activeColor};
          transition: transform .2s ease-out, box-shadow .2s ease-out;
        }
        .tabs_list:hover .tab_active:not(:hover):after {
          transform: translateY(0px);
          box-shadow: none;
        }
        .tab_tab:hover:after {
          transform: translateY(1px);
        }
        .tab_active:after, .tab_active:hover:after {
          transform: translateY(3px);
          box-shadow: 0 5px 10px ${activeColor};
        }
        .tabs_list:not(:hover) .tab_tab:after {
          transition-duration: 2s;
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
