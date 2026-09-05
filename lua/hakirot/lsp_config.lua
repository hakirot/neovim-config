require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "lua_ls", "autotools_ls", "clangd", "basedpyright", "arduino_language_server", "zls" }
})

-- FOR REFERENCE
--nnoremap <buffer> K <cmd>lua vim.lsp.buf.hover()<cr>
--nnoremap <buffer> gd <cmd>lua vim.lsp.buf.definition()<cr>
--nnoremap <buffer> gD <cmd>lua vim.lsp.buf.declaration()<cr>
--nnoremap <buffer> gi <cmd>lua vim.lsp.buf.implementation()<cr>
--nnoremap <buffer> go <cmd>lua vim.lsp.buf.type_definition()<cr>
--nnoremap <buffer> gr <cmd>lua vim.lsp.buf.references()<cr>
--nnoremap <buffer> <C-k> <cmd>lua vim.lsp.buf.signature_help()<cr>
--nnoremap <buffer> <F2> <cmd>lua vim.lsp.buf.rename()<cr>
--nnoremap <buffer> <F4> <cmd>lua vim.lsp.buf.code_action()<cr>
--xnoremap <buffer> <F4> <cmd>lua vim.lsp.buf.range_code_action()<cr>

local on_attach = function(_, _)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action , {})
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
  vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, {})
  vim.keymap.set('n', '<F2>', vim.lsp.buf.rename, {})
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
  vim.keymap.set('n', '<leader>k', vim.diagnostic.open_float, {})
end

--" Diagnostics
--nnoremap <buffer> gl <cmd>lua vim.diagnostic.open_float()<cr>
--nnoremap <buffer> [d <cmd>lua vim.diagnostic.goto_prev()<cr>
--nnoremap <buffer> ]d <cmd>lua vim.diagnostic.goto_next()<cr>

vim.lsp.config('setup', {
  on_attach = on_attach
})

vim.diagnostic.config({
  virtual_text = false,
  update_in_insert = false,
  underline = false,
  severity_sort = true,
	open_float = true,

  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '',
      [vim.diagnostic.severity.WARN] = '',
      [vim.diagnostic.severity.HINT] = '',
      [vim.diagnostic.severity.INFO] = '',
    },
  },
})

--Set completeopt to have a better completion experience
-- :help completeopt
-- menuone: popup even when there's only one match
-- noinsert: Do not insert text until a selection is made
-- noselect: Do not select, force to select one from the menu
-- shortness: avoid showing extra messages when using completion
-- updatetime: set updatetime for CursorHold
vim.opt.completeopt = {'menuone', 'noselect', 'noinsert'}
vim.opt.shortmess = vim.opt.shortmess + { c = true}
vim.api.nvim_set_option('updatetime', 300)

vim.cmd([[
	set signcolumn=yes
]])

-- An example nvim-lspconfig capabilities setting
local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
