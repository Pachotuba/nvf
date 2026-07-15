vim.opt.runtimepath:append({"/nix/store/d2xhp2mlqq9pqq5ryhns7mmr9nmxyg2y-treesitter-queries"})



-- SECTION: asm_tab_settings
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "asm", "nasm" },
  callback = function()
    vim.opt_local.tabstop = 8
    vim.opt_local.shiftwidth = 8
    vim.opt_local.softtabstop = 8
  end,
})


-- SECTION: theme

-- Base16 theme
require('base16-colorscheme').setup({["base00"] = "#ffdccf",
["base01"] = "#ffeee7",
["base02"] = "#e6c6ba",
["base03"] = "#88807d",
["base04"] = "#3b3330",
["base05"] = "#554945",
["base06"] = "#cd5622",
["base07"] = "#cd5622",
["base08"] = "#c92222",
["base09"] = "#cd5622",
["base0A"] = "#a09e37",
["base0B"] = "#5a8a40",
["base0C"] = "#408a74",
["base0D"] = "#50408a",
["base0E"] = "#8a4078",
["base0F"] = "#7a4023"})




-- SECTION: filetype
vim.filetype.add({})


-- SECTION: globalsScript
vim.g.editorconfig = true
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.tpipeline_autoembed = 1
vim.g.tpipeline_clearstl = 1
vim.g.undotree_SetFocusWhenToggle = 1


-- SECTION: basic








vim.o.smartcase = false
vim.o.ignorecase = false



-- SECTION: optionsScript
vim.opt.autoindent = true
vim.opt.backup = false
vim.opt.clipboard = "unnamedplus"
vim.opt.cmdheight = 1
vim.opt.cursorlineopt = "line"
vim.opt.encoding = "utf-8"
vim.opt.errorbells = false
vim.opt.expandtab = true
vim.opt.hidden = true
vim.opt.list = true
vim.opt.listchars = "trail:·,tab:» ,nbsp:␣"
vim.opt.mouse = "nvi"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 8
vim.opt.shiftwidth = 2
vim.opt.showmatch = true
vim.opt.signcolumn = "yes"
vim.opt.smartindent = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.tabstop = 2
vim.opt.termguicolors = true
vim.opt.tm = 500
vim.opt.undofile = true
vim.opt.updatetime = 300
vim.opt.visualbell = false
vim.opt.wrap = false
vim.opt.writebackup = false


-- SECTION: lazyConfigs
require('lz.n').load({{"fzf-lua",
["after"] = function()
  
  require("fzf-lua").setup({"fzf-tmux",
["fzf_bin"] = "/nix/store/pcbbf398f2x03sci0hk7j0c1w7p3zgys-fzf-0.72.0/bin/fzf",
["winopts"] = {["border"] = "rounded"}})
  
end
,
["cmd"] = {"FzfLua"}},
{"nvim-dap-ui",
["after"] = function()
  
  require("dapui").setup({})
  
end
,
["keys"] = {{"<leader>du",
function() require('dapui').toggle() end,
["desc"] = "Toggle DAP-UI",
["expr"] = false,
["mode"] = "n",
["noremap"] = true,
["nowait"] = false,
["script"] = false,
["silent"] = true,
["unique"] = false}}},
{"nvim-web-devicons",
["after"] = function()
  
  require("nvim-web-devicons").setup({["color_icons"] = true,
["override"] = {}})
  
end
,
["event"] = {"DeferredUIEnter"}},
{"undotree",
["cmd"] = {"UndotreeToggle",
"UndotreeShow",
"UndotreeHide",
"UndotreePersistUndo",
"UndotreeFocus"}},
{"yazi.nvim",
["after"] = function()
  
  require("yazi").setup({["open_for_directories"] = false})
  
end
,
["event"] = {"BufAdd",
"VimEnter"},
["keys"] = {{"<leader>e",
"<cmd>Yazi<CR>",
["desc"] = "Open yazi at the current file [yazi.nvim]",
["expr"] = false,
["mode"] = "n",
["noremap"] = true,
["nowait"] = false,
["script"] = false,
["silent"] = true,
["unique"] = false},
{"<leader>cw",
"<cmd>Yazi cwd<CR>",
["desc"] = "Open the file manager in nvim's working directory [yazi.nvim]",
["expr"] = false,
["mode"] = "n",
["noremap"] = true,
["nowait"] = false,
["script"] = false,
["silent"] = true,
["unique"] = false},
{"<c-up>",
"<cmd>Yazi toggle<CR>",
["desc"] = "Resume the last yazi session [yazi.nvim]",
["expr"] = false,
["mode"] = "n",
["noremap"] = true,
["nowait"] = false,
["script"] = false,
["silent"] = true,
["unique"] = false}}}})
require('lzn-auto-require').enable()


-- SECTION: pluginConfigs
-- SECTION: conform-nvim
require("conform").setup({["default_format_opts"] = {["lsp_format"] = "fallback"},
["format_after_save"] = function()
  if not vim.g.formatsave or vim.b.disableFormatSave then
    return
  else
    return {["lsp_format"] = "fallback"}
  end
end
,
["format_on_save"] = function()
  if not vim.g.formatsave or vim.b.disableFormatSave then
    return
  else
    return {lsp_format = "fallback", timeout_ms = 500}
  end
end
,
["formatters"] = {["alejandra"] = {["command"] = "/nix/store/j3b13s8v6nn8n05zvhv8mlk1gx99wbmy-alejandra-4.0.0/bin/alejandra"},
["black"] = {["command"] = "/nix/store/m0nv5kyd9i1v8m8badmva3qfxnbhhkkr-python3.13-black-25.1.0/bin/black",
["stdin"] = true},
["prettier"] = {["command"] = "/nix/store/g00lfnlnjpyx42vmrvcvas01b7j7v5zp-prettier-3.8.3/bin/prettier",
["options"] = {["ft_parsers"] = {}},
["prepend_args"] = function(self, ctx)
  return ({})[vim.bo[ctx.buf].filetype] or {}
end
},
["shfmt"] = {["command"] = "/nix/store/2pk011vmyhh7hmc5cqgm7ixirckh48ml-shfmt-3.13.1/bin/shfmt"},
["typstyle"] = {["args"] = function(self, ctx)
  return {
    "--inplace",
    "--indent-width",
    vim.bo[ctx.buf].shiftwidth,
    "$FILENAME"
  }
end
,
["command"] = "/nix/store/ckjva6bw3ipwk7l47dpr0sbv0qk05d2b-typstyle-0.14.4/bin/typstyle",
["stdin"] = false}},
["formatters_by_ft"] = {["javascript"] = {"prettier"},
["json"] = {"prettier"},
["json5"] = {"prettier"},
["jsonc"] = {"prettier"},
["nix"] = {"alejandra"},
["python"] = {"black"},
["sh"] = {"shfmt"},
["typescript"] = {"prettier"},
["typst"] = {"typstyle"}}})


-- SECTION: gitsigns
require('gitsigns').setup({})


-- SECTION: lsp-setup
vim.g.formatsave = true;

local attach_keymaps = function(client, bufnr)
  vim.keymap.set('n', "<leader>lgD", vim.lsp.buf.declaration, {buffer=bufnr, noremap=true, silent=true, desc="Go to declaration"})
  vim.keymap.set('n', "<leader>lgd", vim.lsp.buf.definition, {buffer=bufnr, noremap=true, silent=true, desc="Go to definition"})
  vim.keymap.set('n', "go", vim.lsp.buf.type_definition, {buffer=bufnr, noremap=true, silent=true, desc="Go to type"})
  vim.keymap.set('n', "gi", vim.lsp.buf.implementation, {buffer=bufnr, noremap=true, silent=true, desc="List implementations"})
  vim.keymap.set('n', "gr", vim.lsp.buf.references, {buffer=bufnr, noremap=true, silent=true, desc="List references"})
  vim.keymap.set('n', "<leader>lgn", function()
  vim.diagnostic.jump({
    count = 1,
    on_jump = function(_, bufnr)
      vim.diagnostic.open_float({
        scope = "cursor",
        bufnr = bufnr,
        focus = false,
      })
    end,
  })
end
, {buffer=bufnr, noremap=true, silent=true, desc="Go to next diagnostic"})
  vim.keymap.set('n', "<leader>lgp", function()
  vim.diagnostic.jump({
    count = -1,
    on_jump = function(_, bufnr)
      vim.diagnostic.open_float({
        scope = "cursor",
        bufnr = bufnr,
        focus = false,
      })
    end,
  })
end
, {buffer=bufnr, noremap=true, silent=true, desc="Go to previous diagnostic"})
  vim.keymap.set('n', "<leader>le", vim.diagnostic.open_float, {buffer=bufnr, noremap=true, silent=true, desc="Open diagnostic float"})
  vim.keymap.set('n', "<leader>lH", vim.lsp.buf.document_highlight, {buffer=bufnr, noremap=true, silent=true, desc="Document highlight"})
  vim.keymap.set('n', "gs", vim.lsp.buf.document_symbol, {buffer=bufnr, noremap=true, silent=true, desc="List document symbols"})
  vim.keymap.set('n', "<leader>lwa", vim.lsp.buf.add_workspace_folder, {buffer=bufnr, noremap=true, silent=true, desc="Add workspace folder"})
  vim.keymap.set('n', "<leader>lwr", vim.lsp.buf.remove_workspace_folder, {buffer=bufnr, noremap=true, silent=true, desc="Remove workspace folder"})
  vim.keymap.set('n', "<leader>lwl", function() vim.notify(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, {buffer=bufnr, noremap=true, silent=true, desc="List workspace folders"})
  vim.keymap.set('n', "<leader>lws", vim.lsp.buf.workspace_symbol, {buffer=bufnr, noremap=true, silent=true, desc="List workspace symbols"})
  vim.keymap.set('n', "<leader>lh", vim.lsp.buf.hover, {buffer=bufnr, noremap=true, silent=true, desc="Trigger hover"})
  vim.keymap.set('n', "<C-k>", vim.lsp.buf.signature_help, {buffer=bufnr, noremap=true, silent=true, desc="Signature help"})
  vim.keymap.set('n', "<leader>r", vim.lsp.buf.rename, {buffer=bufnr, noremap=true, silent=true, desc="Rename symbol"})
  vim.keymap.set('n', "<leader>a", vim.lsp.buf.code_action, {buffer=bufnr, noremap=true, silent=true, desc="Code action"})
  vim.keymap.set('n', "<leader>lf", vim.lsp.buf.format, {buffer=bufnr, noremap=true, silent=true, desc="Format"})
  vim.keymap.set('n', "<leader>ltf", function() vim.b.disableFormatSave = not vim.b.disableFormatSave end, {buffer=bufnr, noremap=true, silent=true, desc="Toggle format on save"})
end


default_on_attach = function(client, bufnr)
  attach_keymaps(client, bufnr)
  
end

local capabilities = vim.lsp.protocol.make_client_capabilities()





-- SECTION: mini-surround
require("mini.surround").setup({})


-- SECTION: nvim-dap
local dap = require("dap")
vim.fn.sign_define("DapBreakpoint", { text = "🛑", texthl = "ErrorMsg", linehl = "", numhl = "" })

local nvf_dap_input_cache= {}
local function nvf_dap_cached_input(cache_key, prompt, default, completion)
  default = nvf_dap_input_cache[cache_key] or default
  nvf_dap_input_cache[cache_key] =
    vim.fn.input(prompt, default, completion)
  return nvf_dap_input_cache[cache_key]
end

dap.adapters["debugpy"] = function(cb, config)
  if config.request == "attach" then
    local port = (config.connect or config).port
    local host = (config.connect or config).host or "127.0.0.1"
    cb({
      type = "server",
      port = assert(port, "`connect.port` is required for a python `attach` configuration"),
      host = host,
      options = {
        source_filetype = "python",
      },
    })
  else
    cb({
      type = "executable",
      command = "/nix/store/hf85vmwh1lfdz6f05ap5559q8h82dkcx-python3-3.13.13-env/bin/python3.13",
      args = { "-m", "debugpy.adapter" },
      options = {
        source_filetype = "python",
      },
    })
  end
end



dap.configurations["python"] = {{["name"] = "Launch file",
["program"] = "${file}",
["pythonPath"] = function()
  -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
  -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
  -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
  local cwd = vim.fn.getcwd()
  if vim.fn.executable(cwd .. "/venv/bin/python") == 1 then
    return cwd .. "/venv/bin/python"
  elseif vim.fn.executable(cwd .. "/.venv/bin/python") == 1 then
    return cwd .. "/.venv/bin/python"
  elseif vim.fn.executable("python") == 1 then
    return vim.fn.exepath("python")
  else -- this uses the same python package as the debugger
    return nil
  end
end
,
["request"] = "launch",
["type"] = "debugpy"}}



-- SECTION: nvim-dap-ui
dap.listeners.after.event_initialized["dapui_config"] = function()
  require("dapui").open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  require("dapui").close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  require("dapui").close()
end


-- SECTION: nvim-lint
require("lint").linters_by_ft = {["bash"] = {"shellcheck"},
["nix"] = {"statix",
"deadnix"},
["python"] = {"mypy"},
["sh"] = {"shellcheck"},
["typescript"] = {"eslint_d"},
["zsh"] = {"shellcheck"}}

local linters = require("lint").linters
local nvf_linters = {["deadnix"] = {["cmd"] = "/nix/store/k2ib67i6akkchbnx9lfk0naxzf9v4zn9-deadnix-1.3.1/bin/deadnix"},
["eslint_d"] = {["cmd"] = "/nix/store/y4xyrw3nc9n167mqyyqqivwsd699s4lb-eslint_d-15.0.2/bin/eslint_d",
["required_files"] = {"eslint.config.js",
"eslint.config.mjs",
".eslintrc",
".eslintrc.json",
".eslintrc.js",
".eslintrc.yml"}},
["mypy"] = {["cmd"] = "/nix/store/jpc9qwp6bahcl913ybjhj2x8cfdf6x0g-python3.13-mypy-1.20.1/bin/mypy"},
["shellcheck"] = {["cmd"] = "/nix/store/vwvvnr1qxpwn0vffbsn8bkviqcgicizr-shellcheck-0.11.0-bin/bin/shellcheck"},
["statix"] = {["cmd"] = "/nix/store/yzbgzwz2m7iv52say9ml3dww15l8bzrc-statix-0-unstable-2026-05-14/bin/statix"}}
for linter, config in pairs(nvf_linters) do
  if linters[linter] == nil then
    linters[linter] = config
  else
    for key, val in pairs(config) do
      linters[linter][key] = val
    end
  end
end

nvf_lint = function(buf)
  local ft = vim.api.nvim_get_option_value("filetype", { buf = buf })
  local linters = require("lint").linters
  local linters_from_ft = require("lint").linters_by_ft[ft]

  -- if no linter is configured for this filetype, stops linting
  if linters_from_ft == nil then return end

  for _, name in ipairs(linters_from_ft) do
    local linter = linters[name]
    assert(linter, 'Linter with name `' .. name .. '` not available')

    if type(linter) == "function" then
      linter = linter()
    end
    -- for require("lint").lint() to work, linter.name must be set
    linter.name = linter.name or name
    local cwd = linter.required_files

    -- if no configuration files are configured, lint
    if cwd == nil then
      require("lint").lint(linter)
    else
      -- if configuration files are configured and present in the project, lint
      for _, fn in ipairs(cwd) do
        local path = vim.fs.joinpath(linter.cwd or vim.fn.getcwd(), fn);
        if vim.uv.fs_stat(path) then
          require("lint").lint(linter)
          break
        end
      end
    end
  end
end



-- SECTION: smartcolumn
require("smartcolumn").setup({["colorcolumn"] = "80",
["custom_colorcolumn"] = {["gitcommit"] = "72",
["javascript"] = "100",
["json"] = "200",
["jsonc"] = "200"},
["disabled_filetypes"] = {"help",
"text",
"markdown",
"NvimTree",
"alpha"}})


-- SECTION: treesitter-autocommands
vim.api.nvim_create_augroup("nvf_treesitter", { clear = true })

-- Enable treesitter highlighting for all filetypes
vim.api.nvim_create_autocmd("FileType", {
  group = "nvf_treesitter",
  pattern = "*",
  callback = function()
    pcall(vim.treesitter.start)
  end,
})


-- Enable treesitter highlighting for all filetypes
vim.api.nvim_create_autocmd("FileType", {
  group = "nvf_treesitter",
  pattern = "*",
  callback = function(args)

    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})





-- SECTION: treesitter-filetype-mappings
for lang, ft in pairs({["bash"] = {"ash",
"dash",
"zsh"}}) do
  vim.treesitter.language.register(lang, ft)
end


-- SECTION: typst-preview-nvim
require("typst-preview").setup({["dependencies_bin"] = {["tinymist"] = "/nix/store/rb97qqnfqn2b1hb3v0dbvzhsxgy6hwzn-tinymist-0.14.18/bin/tinymist",
["websocat"] = "/nix/store/nk0amy8z00z9d9y8s57xnj0487lz5vjw-websocat-1.14.0/bin/websocat"}})




-- SECTION: augroups
local nvf_autogroups = {}
for _, group in ipairs({{["clear"] = true,
["enable"] = true,
["name"] = "nvf_nvim_lint"},
{["clear"] = true,
["enable"] = true,
["name"] = "nvf_lazy_file_hooks"},
{["clear"] = true,
["enable"] = true,
["name"] = "nvf_lsp"}}) do
  if group.name then
    nvf_autogroups[group.name] = { clear = group.clear }
  end
end

for group_name, options in pairs(nvf_autogroups) do
  vim.api.nvim_create_augroup(group_name, options)
end


-- SECTION: autocmds
local nvf_autocommands = {{["callback"] = function(args)
  nvf_lint(args.buf)
end
,
["enable"] = true,
["event"] = {"BufWritePost"},
["nested"] = false,
["once"] = false},
{["command"] = "doautocmd User LazyFile",
["enable"] = true,
["event"] = {"BufReadPost",
"BufNewFile",
"BufWritePre"},
["group"] = "nvf_lazy_file_hooks",
["nested"] = false,
["once"] = true},
{["callback"] = function(event)
  local bufnr = event.buf
  local client = vim.lsp.get_client_by_id(event.data.client_id)
  default_on_attach(client, bufnr)

  
end
,
["desc"] = "LSP on-attach add keybinds, enable inlay hints, and other plugin integrations",
["enable"] = true,
["event"] = {"LspAttach"},
["group"] = "nvf_lsp",
["nested"] = false,
["once"] = false}}
for _, autocmd in ipairs(nvf_autocommands) do
  vim.api.nvim_create_autocmd(
    autocmd.event,
    {
      group     = autocmd.group,
      pattern   = autocmd.pattern,
      buffer    = autocmd.buffer,
      desc      = autocmd.desc,
      callback  = autocmd.callback,
      command   = autocmd.command,
      once      = autocmd.once,
      nested    = autocmd.nested
    }
  )
end


-- SECTION: basedpyright-util
local function basedpyright_set_python_path(server_name, command)
  local path = command.args
  local clients = vim.lsp.get_clients {
    bufnr = vim.api.nvim_get_current_buf(),
    name = server_name,
  }
  for _, client in ipairs(clients) do
    if client.settings then
      client.settings.python = vim.tbl_deep_extend('force', client.settings.python or {}, { pythonPath = path })
    else
      client.config.settings = vim.tbl_deep_extend('force', client.config.settings, { python = { pythonPath = path } })
    end
    client:notify('workspace/didChangeConfiguration', { settings = nil })
  end
end



-- SECTION: four_space_tab_languages
vim.api.nvim_create_autocmd("FileType", {
  pattern = {
  "javascript",
  "typescript",
  "python",
  "qml",
  "toml",
  "yaml",
  "json",
  "jsonc",
  "gitconfig"
  },
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.softtabstop = 4
  end,
})


-- SECTION: gitsigns_diff_q
vim.keymap.set("n", "<leader>d", function()
  require("gitsigns").diffthis()
  vim.keymap.set("n", "q", function()
    vim.cmd.bnext()
    vim.api.nvim_buf_delete(
      vim.api.nvim_get_current_buf(),
      {}
    )
    vim.cmd("diffoff")
  end, { silent = true })
end, { silent = true, desc = "Git diff" })


-- SECTION: highlights
local hl = vim.api.nvim_set_hl
local colors = require('base16-colorscheme').colors

hl(0, "ColorColumn", {
  bg = colors.base02
})

hl(0, "SLNormal", {
  fg = colors.base00,
  bg = colors.base05,
  bold = true
})

hl(0, "SLInsert", {
  fg = colors.base00,
  bg = colors.base0C,
  bold = true
})

hl(0, "SLVisual", {
  fg = colors.base00,
  bg = colors.base0B,
  bold = true
})

hl(0, "SLCommand",{
  fg = colors.base00,
  bg = colors.base0A,
  bold = true
})

hl(0, "SLReplace",{
  fg = colors.base00,
  bg = colors.base03,
  bold = true
})

hl(0, "SLYazi",   {
  fg = colors.base00,
  bg = colors.base04,
  bold = true
})

hl(0, "SLName",   {
  fg = colors.base05,
  bg = colors.base00
})

hl(0, "SLPos",    {
  fg = colors.base05,
  bg = colors.base02
})

hl(0, "SLType",   {
  fg = colors.base05,
  bg = colors.base00
})

hl(0, "SLBranch", {
  fg = colors.base00,
  bg = colors.base09,
  bold = true
})


-- SECTION: lsp-util
-- Port of nvim-lspconfig util
local util = { path = {} }

util.default_config = {
  log_level = vim.lsp.protocol.MessageType.Warning,
  message_level = vim.lsp.protocol.MessageType.Warning,
  settings = vim.empty_dict(),
  init_options = vim.empty_dict(),
  handlers = {},
  autostart = true,
  capabilities = vim.lsp.protocol.make_client_capabilities(),
}

-- global on_setup hook
util.on_setup = nil

do
  local validate = vim.validate
  local api = vim.api
  local lsp = vim.lsp
  local nvim_eleven = vim.fn.has 'nvim-0.11' == 1

  local iswin = vim.uv.os_uname().version:match 'Windows'

  local function escape_wildcards(path)
    return path:gsub('([%[%]%?%*])', '\\%1')
  end

  local function is_fs_root(path)
    if iswin then
      return path:match '^%a:$'
    else
      return path == '/'
    end
  end

  local function traverse_parents(path, cb)
    path = vim.uv.fs_realpath(path)
    local dir = path
    -- Just in case our algo is buggy, don't infinite loop.
    for _ = 1, 100 do
      dir = vim.fs.dirname(dir)
      if not dir then
        return
      end
      -- If we can't ascend further, then stop looking.
      if cb(dir, path) then
        return dir, path
      end
      if is_fs_root(dir) then
        break
      end
    end
  end

  util.root_pattern = function(...)
    local patterns = util.tbl_flatten { ... }
    return function(startpath)
      startpath = util.strip_archive_subpath(startpath)
      for _, pattern in ipairs(patterns) do
        local match = util.search_ancestors(startpath, function(path)
          for _, p in ipairs(vim.fn.glob(table.concat({ escape_wildcards(path), pattern }, '/'), true, true)) do
            if vim.uv.fs_stat(p) then
              return path
            end
          end
        end)

        if match ~= nil then
          return match
        end
      end
    end
  end

  util.root_markers_with_field = function(root_files, new_names, field, fname)
    local path = vim.fn.fnamemodify(fname, ':h')
    local found = vim.fs.find(new_names, { path = path, upward = true })

    for _, f in ipairs(found or {}) do
      -- Match the given `field`.
      for line in io.lines(f) do
        if line:find(field) then
          root_files[#root_files + 1] = vim.fs.basename(f)
          break
        end
      end
    end

    return root_files
  end

  util.insert_package_json = function(root_files, field, fname)
    return util.root_markers_with_field(root_files, { 'package.json', 'package.json5' }, field, fname)
  end

  util.strip_archive_subpath = function(path)
    -- Matches regex from zip.vim / tar.vim
    path = vim.fn.substitute(path, 'zipfile://\\(.\\{-}\\)::[^\\\\].*$', '\\1', '')
    path = vim.fn.substitute(path, 'tarfile:\\(.\\{-}\\)::.*$', '\\1', '')
    return path
  end

  util.get_typescript_server_path = function(root_dir)
    local project_roots = vim.fs.find('node_modules', { path = root_dir, upward = true, limit = math.huge })
    for _, project_root in ipairs(project_roots) do
      local typescript_path = project_root .. '/typescript'
      local stat = vim.loop.fs_stat(typescript_path)
      if stat and stat.type == 'directory' then
        return typescript_path .. '/lib'
      end
    end
    return ''
  end

  util.search_ancestors = function(startpath, func)
    if nvim_eleven then
      validate('func', func, 'function')
    end
    if func(startpath) then
      return startpath
    end
    local guard = 100
    for path in vim.fs.parents(startpath) do
      -- Prevent infinite recursion if our algorithm breaks
      guard = guard - 1
      if guard == 0 then
        return
      end

      if func(path) then
        return path
      end
    end
  end

  util.path.is_descendant = function(root, path)
    if not path then
      return false
    end

    local function cb(dir, _)
      return dir == root
    end

    local dir, _ = traverse_parents(path, cb)

    return dir == root
  end

  util.tbl_flatten = function(t)
    --- @diagnostic disable-next-line:deprecated
    return nvim_eleven and vim.iter(t):flatten(math.huge):totable() or vim.tbl_flatten(t)
  end
end


-- SECTION: lsp-servers
-- Individual LSP configurations managed by nvf.
vim.lsp.config["*"] = {["capabilities"] = capabilities,
["enable"] = true}

vim.lsp.config["basedpyright"] = {["cmd"] = {"/nix/store/333vlfcb9a2rrhz2khbq7vi3cv8h3axf-basedpyright-1.39.3/bin/basedpyright-langserver",
"--stdio"},
["enable"] = true,
["filetypes"] = {"python"},
["on_attach"] = function(client, bufnr)
  vim.api.nvim_buf_create_user_command(bufnr, 'LspPyrightOrganizeImports', function()
    local params = {
      command = 'basedpyright.organizeimports',
      arguments = { vim.uri_from_bufnr(bufnr) },
    }

    -- Using client.request() directly because "basedpyright.organizeimports" is private
    -- (not advertised via capabilities), which client:exec_cmd() refuses to call.
    -- https://github.com/neovim/neovim/blob/c333d64663d3b6e0dd9aa440e433d346af4a3d81/runtime/lua/vim/lsp/client.lua#L1024-L1030
    client.request('workspace/executeCommand', params, nil, bufnr)
  end, {
    desc = 'Organize Imports',
  })

  vim.api.nvim_buf_create_user_command(bufnr, 'LspPyrightSetPythonPath', basedpyright_set_python_path, {
    desc = 'Reconfigure basedpyright with the provided python path',
    nargs = 1,
    complete = 'file',
  })
end
,
["root_markers"] = {"Pipfile",
"pyproject.toml",
"requirements.txt",
"setup.cfg",
"setup.py",
".git",
"pyrightconfig.json"},
["settings"] = {["basedpyright"] = {["analysis"] = {["autoSearchPaths"] = true,
["diagnosticMode"] = "openFilesOnly",
["useLibraryCodeForTypes"] = true}}}}

vim.lsp.config["bash-language-server"] = {["cmd"] = {"/nix/store/wlkcb2w1kz4c8kvgqgwcb3kn789jppgn-bash-language-server-5.6.0/bin/bash-language-server",
"start"},
["enable"] = true,
["filetypes"] = {"bash",
"sh",
"ash",
"dash",
"zsh"},
["root_markers"] = {".git"},
["settings"] = {["bashIde"] = {["globPattern"] = vim.env.GLOB_PATTERN or '*@(.sh|.inc|.bash|.command)'}}}

vim.lsp.config["nil"] = {["cmd"] = {"/nix/store/80k9nw30gh6rfg6159kzg8493j81l30r-nil-2025-06-13/bin/nil"},
["enable"] = true,
["filetypes"] = {"nix"},
["root_markers"] = {"flake.nix",
".git"},
["settings"] = {["nil"] = {["nix"] = {["autoArchive"] = true}}}}

vim.lsp.config["tinymist"] = {["cmd"] = {"/nix/store/rb97qqnfqn2b1hb3v0dbvzhsxgy6hwzn-tinymist-0.14.18/bin/tinymist"},
["enable"] = true,
["filetypes"] = {"typst"},
["on_attach"] = function(client, bufnr)
  local function create_tinymist_command(command_name, client, bufnr)
    local export_type = command_name:match 'tinymist%.export(%w+)'
    local info_type = command_name:match 'tinymist%.(%w+)'
    if info_type and info_type:match '^get' then
      info_type = info_type:gsub('^get', 'Get')
    end
    local cmd_display = export_type or info_type
    local function run_tinymist_command()
      local arguments = { vim.api.nvim_buf_get_name(bufnr) }
      local title_str = export_type and ('Export ' .. cmd_display) or cmd_display
      local function handler(err, res)
        if err then
          return vim.notify(err.code .. ': ' .. err.message, vim.log.levels.ERROR)
        end
        vim.notify(export_type and res or vim.inspect(res), vim.log.levels.INFO)
      end
      if vim.fn.has 'nvim-0.11' == 1 then
        return client:exec_cmd({
          title = title_str,
          command = command_name,
          arguments = arguments,
        }, { bufnr = bufnr }, handler)
      else
        return vim.notify('Tinymist commands require Neovim 0.11+', vim.log.levels.WARN)
      end
    end
    local cmd_name = export_type and ('LspTinymistExport' .. cmd_display) or ('LspTinymist' .. cmd_display)
    local cmd_desc = export_type and ('Export to ' .. cmd_display) or ('Get ' .. cmd_display)
    return run_tinymist_command, cmd_name, cmd_desc
  end

  for _, command in ipairs {
    'tinymist.exportSvg',
    'tinymist.exportPng',
    'tinymist.exportPdf',
    'tinymist.exportMarkdown',
    'tinymist.exportText',
    'tinymist.exportQuery',
    'tinymist.exportAnsiHighlight',
    'tinymist.getServerInfo',
    'tinymist.getDocumentTrace',
    'tinymist.getWorkspaceLabels',
    'tinymist.getDocumentMetrics',
  } do
    local cmd_func, cmd_name, cmd_desc = create_tinymist_command(command, client, bufnr)
    vim.api.nvim_buf_create_user_command(bufnr, cmd_name, cmd_func, { nargs = 0, desc = cmd_desc })
  end
end
,
["root_markers"] = {".git"}}

vim.lsp.config["typescript-language-server"] = {["cmd"] = {"/nix/store/6awwk3l4m9nazkvpqynwal0lphx2kj97-typescript-language-server-5.3.0/bin/typescript-language-server",
"--stdio"},
["enable"] = true,
["filetypes"] = {"typescript",
"javascript"},
["handlers"] = {["_typescript.rename"] = function(_, result, ctx)
  local client = assert(vim.lsp.get_client_by_id(ctx.client_id))
  vim.lsp.util.show_document({
    uri = result.textDocument.uri,
    range = {
      start = result.position,
      ['end'] = result.position,
    },
  }, client.offset_encoding)
  vim.lsp.buf.rename()
  return vim.NIL
end
},
["init_options"] = {["hostInfo"] = "neovim"},
["on_attach"] = function(client, bufnr)
  -- ts_ls provides `source.*` code actions that apply to the whole file. These only appear in
  -- `vim.lsp.buf.code_action()` if specified in `context.only`.
  vim.api.nvim_buf_create_user_command(0, 'LspTypescriptSourceAction', function()
    local source_actions = vim.tbl_filter(function(action)
      return vim.startswith(action, 'source.')
    end, client.server_capabilities.codeActionProvider.codeActionKinds)

    vim.lsp.buf.code_action({
      context = {
        only = source_actions,
      },
    })
  end, {})
end
,
["root_markers"] = {".git",
"tsconfig.json",
"package.json"}}

vim.lsp.config["vscode-json-language-server"] = {["cmd"] = {"/nix/store/942j73k7h1q3dyg3xvchpjb67c935d8g-vscode-langservers-extracted-1.116.02821/bin/vscode-json-language-server",
"--stdio"},
["enable"] = true,
["filetypes"] = {"json",
"jsonc",
"json5"},
["init_options"] = {["provideFormatter"] = true},
["root_markers"] = {".git"}}



-- Enable configured LSPs explicitly
vim.lsp.enable({"basedpyright",
"bash-language-server",
"nil",
"tinymist",
"typescript-language-server",
"vscode-json-language-server"})


-- SECTION: mappings
vim.keymap.set("n", "]c", function()
  if vim.wo.diff then return "]c" end

  vim.schedule(function() package.loaded.gitsigns.next_hunk() end)

  return '<Ignore>'
end
, {["desc"] = "Next hunk [Gitsigns]",
["expr"] = true,
["noremap"] = true,
["nowait"] = false,
["remap"] = false,
["script"] = false,
["silent"] = true,
["unique"] = false})
vim.keymap.set("n", "[c", function()
  if vim.wo.diff then return "[c" end

  vim.schedule(function() package.loaded.gitsigns.prev_hunk() end)

  return '<Ignore>'
end
, {["desc"] = "Previous hunk [Gitsigns]",
["expr"] = true,
["noremap"] = true,
["nowait"] = false,
["remap"] = false,
["script"] = false,
["silent"] = true,
["unique"] = false})
vim.keymap.set("n", "<leader>hs", package.loaded.gitsigns.stage_hunk, {["desc"] = "Stage hunk [Gitsigns]",
["expr"] = false,
["noremap"] = true,
["nowait"] = false,
["remap"] = false,
["script"] = false,
["silent"] = true,
["unique"] = false})
vim.keymap.set("n", "<leader>hr", package.loaded.gitsigns.reset_hunk, {["desc"] = "Reset hunk [Gitsigns]",
["expr"] = false,
["noremap"] = true,
["nowait"] = false,
["remap"] = false,
["script"] = false,
["silent"] = true,
["unique"] = false})
vim.keymap.set("n", "<leader>hu", package.loaded.gitsigns.undo_stage_hunk, {["desc"] = "Undo stage hunk [Gitsigns]",
["expr"] = false,
["noremap"] = true,
["nowait"] = false,
["remap"] = false,
["script"] = false,
["silent"] = true,
["unique"] = false})
vim.keymap.set("n", "<leader>hS", package.loaded.gitsigns.stage_buffer, {["desc"] = "Stage buffer [Gitsigns]",
["expr"] = false,
["noremap"] = true,
["nowait"] = false,
["remap"] = false,
["script"] = false,
["silent"] = true,
["unique"] = false})
vim.keymap.set("n", "<leader>hR", package.loaded.gitsigns.reset_buffer, {["desc"] = "Reset buffer [Gitsigns]",
["expr"] = false,
["noremap"] = true,
["nowait"] = false,
["remap"] = false,
["script"] = false,
["silent"] = true,
["unique"] = false})
vim.keymap.set("n", "<leader>hP", package.loaded.gitsigns.preview_hunk, {["desc"] = "Preview hunk [Gitsigns]",
["expr"] = false,
["noremap"] = true,
["nowait"] = false,
["remap"] = false,
["script"] = false,
["silent"] = true,
["unique"] = false})
vim.keymap.set("n", "<leader>hb", function() package.loaded.gitsigns.blame_line{full=true} end, {["desc"] = "Blame line [Gitsigns]",
["expr"] = false,
["noremap"] = true,
["nowait"] = false,
["remap"] = false,
["script"] = false,
["silent"] = true,
["unique"] = false})
vim.keymap.set("n", "<leader>tb", package.loaded.gitsigns.toggle_current_line_blame, {["desc"] = "Toggle blame [Gitsigns]",
["expr"] = false,
["noremap"] = true,
["nowait"] = false,
["remap"] = false,
["script"] = false,
["silent"] = true,
["unique"] = false})
vim.keymap.set("n", "<leader>hd", package.loaded.gitsigns.diffthis, {["desc"] = "Diff this [Gitsigns]",
["expr"] = false,
["noremap"] = true,
["nowait"] = false,
["remap"] = false,
["script"] = false,
["silent"] = true,
["unique"] = false})
vim.keymap.set("n", "<leader>hD", function() package.loaded.gitsigns.diffthis('~') end, {["desc"] = "Diff project [Gitsigns]",
["expr"] = false,
["noremap"] = true,
["nowait"] = false,
["remap"] = false,
["script"] = false,
["silent"] = true,
["unique"] = false})
vim.keymap.set("n", "<leader>td", package.loaded.gitsigns.toggle_deleted, {["desc"] = "Toggle deleted [Gitsigns]",
["expr"] = false,
["noremap"] = true,
["nowait"] = false,
["remap"] = false,
["script"] = false,
["silent"] = true,
["unique"] = false})
vim.keymap.set("v", "<leader>hs", function() package.loaded.gitsigns.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end, {["desc"] = "Stage hunk [Gitsigns]",
["expr"] = false,
["noremap"] = true,
["nowait"] = false,
["remap"] = false,
["script"] = false,
["silent"] = true,
["unique"] = false})
vim.keymap.set("v", "<leader>hr", function() package.loaded.gitsigns.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end, {["desc"] = "Reset hunk [Gitsigns]",
["expr"] = false,
["noremap"] = true,
["nowait"] = false,
["remap"] = false,
["script"] = false,
["silent"] = true,
["unique"] = false})
vim.keymap.set("n", "<leader>dc", require('dap').continue, {["desc"] = "Continue",
["expr"] = false,
["noremap"] = true,
["nowait"] = false,
["remap"] = false,
["script"] = false,
["silent"] = true,
["unique"] = false})
vim.keymap.set("n", "<leader>dR", require('dap').restart, {["desc"] = "Restart",
["expr"] = false,
["noremap"] = true,
["nowait"] = false,
["remap"] = false,
["script"] = false,
["silent"] = true,
["unique"] = false})
vim.keymap.set("n", "<leader>dt", require('dap').terminate, {["desc"] = "Terminate",
["expr"] = false,
["noremap"] = true,
["nowait"] = false,
["remap"] = false,
["script"] = false,
["silent"] = true,
["unique"] = false})
vim.keymap.set("n", "<leader>d.", require('dap').run_last, {["desc"] = "Re-run Last Debug Session",
["expr"] = false,
["noremap"] = true,
["nowait"] = false,
["remap"] = false,
["script"] = false,
["silent"] = true,
["unique"] = false})
vim.keymap.set("n", "<leader>dr", require('dap').repl.toggle, {["desc"] = "Toggle Repl",
["expr"] = false,
["noremap"] = true,
["nowait"] = false,
["remap"] = false,
["script"] = false,
["silent"] = true,
["unique"] = false})
vim.keymap.set("n", "<leader>dh", require('dap.ui.widgets').hover, {["desc"] = "Hover",
["expr"] = false,
["noremap"] = true,
["nowait"] = false,
["remap"] = false,
["script"] = false,
["silent"] = true,
["unique"] = false})
vim.keymap.set("n", "<leader>db", require('dap').toggle_breakpoint, {["desc"] = "Toggle breakpoint",
["expr"] = false,
["noremap"] = true,
["nowait"] = false,
["remap"] = false,
["script"] = false,
["silent"] = true,
["unique"] = false})
vim.keymap.set("n", "<leader>dgc", require('dap').run_to_cursor, {["desc"] = "Continue to the current cursor",
["expr"] = false,
["noremap"] = true,
["nowait"] = false,
["remap"] = false,
["script"] = false,
["silent"] = true,
["unique"] = false})
vim.keymap.set("n", "<leader>dgi", require('dap').step_into, {["desc"] = "Step into function",
["expr"] = false,
["noremap"] = true,
["nowait"] = false,
["remap"] = false,
["script"] = false,
["silent"] = true,
["unique"] = false})
vim.keymap.set("n", "<leader>dgo", require('dap').step_out, {["desc"] = "Step out of function",
["expr"] = false,
["noremap"] = true,
["nowait"] = false,
["remap"] = false,
["script"] = false,
["silent"] = true,
["unique"] = false})
vim.keymap.set("n", "<leader>dgj", require('dap').step_over, {["desc"] = "Next step",
["expr"] = false,
["noremap"] = true,
["nowait"] = false,
["remap"] = false,
["script"] = false,
["silent"] = true,
["unique"] = false})
vim.keymap.set("n", "<leader>dgk", require('dap').step_back, {["desc"] = "Step back",
["expr"] = false,
["noremap"] = true,
["nowait"] = false,
["remap"] = false,
["script"] = false,
["silent"] = true,
["unique"] = false})
vim.keymap.set("n", "<leader>dvo", require('dap').up, {["desc"] = "Go up stacktrace",
["expr"] = false,
["noremap"] = true,
["nowait"] = false,
["remap"] = false,
["script"] = false,
["silent"] = true,
["unique"] = false})
vim.keymap.set("n", "<leader>dvi", require('dap').down, {["desc"] = "Go down stacktrace",
["expr"] = false,
["noremap"] = true,
["nowait"] = false,
["remap"] = false,
["script"] = false,
["silent"] = true,
["unique"] = false})
vim.keymap.set("n", "<leader><leader>", "<cmd>FzfLua files<CR>", {["desc"] = "Find files",
["expr"] = false,
["noremap"] = true,
["nowait"] = false,
["remap"] = false,
["script"] = false,
["silent"] = true,
["unique"] = false})
vim.keymap.set("n", "<leader>f", "<cmd>FzfLua live_grep<CR>", {["desc"] = "Live grep",
["expr"] = false,
["noremap"] = true,
["nowait"] = false,
["remap"] = false,
["script"] = false,
["silent"] = true,
["unique"] = false})
vim.keymap.set("n", "<leader>t", "<cmd>UndotreeToggle<CR>", {["desc"] = "Toggle undotree panel",
["expr"] = false,
["noremap"] = true,
["nowait"] = false,
["remap"] = false,
["script"] = false,
["silent"] = true,
["unique"] = false})


-- SECTION: statusline
local mode_map = {
  n         = { label = "NORMAL",   hl = "SLNormal"   },
  i         = { label = "INSERT",   hl = "SLInsert"   },
  v         = { label = "VISUAL",   hl = "SLVisual"   },
  V         = { label = "V-LINE",   hl = "SLVisual"   },
  ["\22"]   = { label = "V-BLOCK",  hl = "SLVisual"   },
  c         = { label = "COMMAND",  hl = "SLCommand"  },
  R         = { label = "REPLACE",  hl = "SLReplace"  },
  t         = { label = "YAZI",     hl = "SLYazi" },
}

_G.Mode = function()
  local m = mode_map[vim.fn.mode()]
  if not m then
    return "%#SLNormal# " .. vim.fn.mode() .. " "
  end
  return "%#" .. m.hl .. "# " .. m.label .. " "
end

_G.Branch = function()
  local b = vim.b.gitsigns_head or vim.g.gitsigns_head
  return b and ("  " .. b .. " ") or ""
end

_G.Type = function()
  local ft = vim.bo.filetype
  return ft ~= "" and (" " .. ft .. " ") or ""
end

_G.Mod = function()
  if vim.bo.modified then
    return "[+] "
  elseif not vim.bo.modifiable then
    return "[-] "
  else
    return ""
  end
end

vim.o.statusline = table.concat({
  "%{%v:lua.Mode()%}",
  "%#SLName# %t %{v:lua.Mod()}",
  "%=",
  "%#SLPos# %l:%v ",
  "%#SLType#%{v:lua.Type()}",
  "%#SLBranch#%{v:lua.Branch()}",
})



