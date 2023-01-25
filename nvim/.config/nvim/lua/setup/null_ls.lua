local status_ok, null_ls = pcall(require, 'null-ls')
if not status_ok then
  return
end

local diagnostics = null_ls.builtins.diagnostics
local formatting = null_ls.builtins.formatting

null_ls.setup({
  sources = {
    diagnostics.clang_check,
    diagnostics.cpplint.with({ filetypes = {"cpp"}, }), -- Check google's cpp style guide
    formatting.clang_format,
  },
})