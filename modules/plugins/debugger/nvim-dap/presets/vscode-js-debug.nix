{
  lib,
  pkgs,
  config,
  ...
}: let
  inherit (lib.modules) mkIf;
  inherit (lib.options) mkEnableOption;
  inherit (lib.meta) getExe;

  cfg = config.vim.debugger.nvim-dap.presets.vscode-js-debug;
in {
  options.vim.debugger.nvim-dap.presets.vscode-js-debug = {
    enable = mkEnableOption ''
      Debug adapter for nodejs using vscode-js-debug.
      Use {option}`vim.debugger.nvim-dap.adapters.vscode-js-debug` for customization.

      A configuration is also needed for your filetype in
      {option}`vim.debugger.nvim-dap.configurations`
    '';
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
