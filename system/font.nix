{ pkgs, inputs, ... }:

{
  fonts = {
    # 启用默认字体包（包括常见的西文和 CJK 字体）
    enableDefaultPackages = true;

    # 允许自定义字体目录
    fontDir.enable = true;

    # 安装的字体列表
    packages = with pkgs; [
      # icon fonts
      material-symbols

      # Sans(Serif) 字体
      libertinus
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-emoji
      roboto
      (google-fonts.override { fonts = [ "Inter" ]; })

      # 等宽字体
      jetbrains-mono
      inputs.monolisa.packages.${pkgs.system}.monolisa

      # Nerdfonts
      nerd-fonts.jetbrains-mono
      nerd-fonts.symbols-only
    ];

    # Fontconfig 默认字体族，明确包含 CJK 回退
    fontconfig.defaultFonts = {
      serif     = [ "Libertinus Serif" "Noto Serif CJK SC" ];
      sansSerif = [ "Inter" "Noto Sans CJK SC" ];
      monospace = [ "MonoLisa" "Noto Sans CJK SC" ];
      emoji     = [ "Noto Color Emoji" ];
    };
  };
}
