{ lib,
  config,
  ...
}:
let
  font_family = "${config.profile.font} 10";
in

lib.mkIf config.optional.hypr.enable {
  catppuccin.hyprlock.enable = true;
  programs.hyprlock = {
    enable = true;

    settings = {
      general = {
        ignore_empty_input = true;
        disable_loading_bar = true;
        hide_cursor = true;
      };

      label = [
        # Hi there, $USER
        {
          monitor = "";
          text = "Hi there, $USER";
          text_align = "center";      # center/right 或者不写默认为 left
          color = "rgba(200, 200, 200, 1.0)";
          inherit font_family;
          font_size = 60;
          rotate = 0;                # 逆时针度数

          position = "0, 80";
          halign = "center";
          valign = "center";
        }
        # $TIME
        {
          monitor = "";
          text = "<span><b>$TIME</b></span>";
          text_align = "center";
          color = "rgba(200, 200, 200, 1.0)";
          font_size = 120;
          font_family = "font_family";
          rotate = 0;

          position = "0, 240";
          halign = "center";
          valign = "center";
        }
      ];

      input-field = [
        {
          monitor = "eDP-1";
          size = "200, 50";
          outline_thickness = 3;
          outer_color = "rgb(151, 151, 151)";
          inner_color = "rgb(200, 200, 200)";
          font_color = "rgb(10, 10, 10)";
          fade_on_empty = true;
          fade_timeout = 1000;        # ms
          placeholder_text = "<i>Input Password...</i>";
          hide_input = false;
          rounding = -1;              # -1 完全圆角
          check_color = "rgb(204, 136, 34)";
          fail_color = "rgb(204, 34, 34)";
          fail_text = "<i>$FAIL <b>($ATTEMPTS)</b></i>";
          fail_transition = 300;      # ms
          capslock_color = -1;
          numlock_color = -1;
          bothlock_color = -1;
          invert_numlock = false;
          swap_font_color = false;

          position = "0, -20";
          halign = "center";
          valign = "center";
        }
      ];

      background = [
        {
          monitor = "";
          path = "screenshot";      # 若需要截图背景可启用
          color = "rgba(0, 0, 0, 0.7)";
        }
      ];
    };
  };
}
