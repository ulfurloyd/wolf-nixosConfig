{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.programs.sptlrx;
  yamlFormat = pkgs.formats.yaml { };
  formatValue =
    value:
    if value == null then
      "\"\""
    else if builtins.isBool value then
      (if value then "true" else "false")
    else if builtins.isInt value then
      builtins.toString value
    else if builtins.isList value then
      "[${builtins.concatStringsSep ", " (map builtins.toString value)}]"
    else
      lib.strings.escapeNixString value;
in
{
  options.programs.sptlrx = {
    enable = mkEnableOption "Enable sptlrx, a synced lyrics viewer for music clients.";

    package = mkOption {
      type = types.package;
      default = pkgs.sptlrx;
      defaultText = literalExpression "pkgs.sptlrx";
      description = "The sptlrx package to install.";
    };

    settings = mkOption {
      type = yamlFormat.type;
      default = { };

      apply =
        v:
        recursiveUpdate {
          cookie = "";
          player = "spotify";
          host = "lyricsapi.vercel.app";
          ignoreErrors = true;
          timerInterval = 200;
          updateInterval = 2000;
          style = {
            hAlignment = "center";
            before = {
              background = "";
              foreground = "";
              bold = true;
              italic = false;
              underline = false;
              strikethrough = false;
              blink = false;
              faint = false;
            };
            current = {
              background = "";
              foreground = "";
              bold = true;
              italic = false;
              underline = false;
              strikethrough = false;
              blink = false;
              faint = false;
            };
            after = {
              background = "";
              foreground = "";
              bold = false;
              italic = false;
              underline = false;
              strikethrough = false;
              blink = false;
              faint = true;
            };
          };
          pipe = {
            length = 0;
            overflow = "word";
          };
          mpd = {
            address = "127.0.0.1:6600";
            password = "";
          };
          mopidy = {
            address = "127.0.0.1:6680";
          };
          mpris = {
            players = [ ];
          };
          browser = {
            port = 8974;
          };
          local = {
            folder = "";
          };
        } v;

      example = {
        player = "mpd";
        ignoreErrors = false;
        style = {
          hAlignment = "left";
        };
      };
      description = "YAML configuration for sptlrx.";
    };
  };

  config = mkIf cfg.enable {
    home.packages = [ cfg.package ];

    xdg.configFile."sptlrx/config.yaml".text = lib.concatStringsSep "\n" (
      [ ]
      ++ [ "cookie: ${formatValue cfg.settings.cookie}" ]
      ++ [ "player: ${formatValue cfg.settings.player}" ]
      ++ [ "host: ${formatValue cfg.settings.host}" ]
      ++ [ "ignoreErrors: ${formatValue cfg.settings.ignoreErrors}" ]
      ++ [ "timerInterval: ${formatValue cfg.settings.timerInterval}" ]
      ++ [ "updateInterval: ${formatValue cfg.settings.updateInterval}" ]

      ++ [ "style:" ]
      ++ [ "  hAlignment: ${formatValue cfg.settings.style.hAlignment}" ]
      ++ [ "  before:" ]
      ++ (mapAttrsToList (name: value: "    ${name}: ${formatValue value}") cfg.settings.style.before)
      ++ [ "  current:" ]
      ++ (mapAttrsToList (name: value: "    ${name}: ${formatValue value}") cfg.settings.style.current)
      ++ [ "  after:" ]
      ++ (mapAttrsToList (name: value: "    ${name}: ${formatValue value}") cfg.settings.style.after)

      ++ [ "pipe:" ]
      ++ (mapAttrsToList (name: value: "  ${name}: ${formatValue value}") cfg.settings.pipe)

      ++ [ "mpd:" ]
      ++ (mapAttrsToList (name: value: "  ${name}: ${formatValue value}") cfg.settings.mpd)

      ++ [ "mopidy:" ]
      ++ [ "  address: ${formatValue cfg.settings.mopidy.address}" ]

      ++ [ "mpris:" ]
      ++ [ "  players: ${formatValue cfg.settings.mpris.players}" ]

      ++ [ "browser:" ]
      ++ [ "  port: ${formatValue cfg.settings.browser.port}" ]

      ++ [ "local:" ]
      ++ [ "  folder: ${formatValue cfg.settings.local.folder}" ]
    );
  };

  meta.maintainers = with lib.maintainers; [ eklavyasood ];
}
