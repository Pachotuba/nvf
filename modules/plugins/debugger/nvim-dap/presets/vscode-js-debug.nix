{
  lib,
  pkgs,
  config,
  ...
}: let
  inherit (lib.modules) mkIf;
  inherit (lib.options) mkEnableOption;
  inherit (lib.meta) getExe;
  inherit (lib.nvim.types) mkDapPresetEnableOption;

  cfg = config.vim.debugger.nvim-dap.presets.vscode-js-debug;
in {
  options.vim.debugger.nvim-dap.presets.debugpy = {
    enable = mkDapPresetEnableOption {
      option = "vscode-js-debug";
      display = "`vscode-js-debug`";
    };
  };

  config.vim.debugger.nvim-dap.adapters = mkIf cfg.enable {
    pwa-node = {
      type = "executable";
      # host = "127.0.0.1";
      # port = "\${port}";
      command = "${getExe pkgs.vscode-js-debug}";
      args = [
        "\${port}"
        "127.0.0.1"
      ];
    };
  };
}
