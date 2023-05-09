local status_ok, null_ls = pcall(require, 'null-ls')
if not status_ok then
    return
end

local diagnostics = null_ls.builtins.diagnostics
local formatting = null_ls.builtins.formatting

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
    sources = {
        -- C/C++
        diagnostics.clang_check,
        formatting.clang_format.with({ extra_args = { "--style=Google" } }),

        -- python
        formatting.black,

        -- shell
        diagnostics.shellcheck,

        -- Web ecosystem
        -- diagnostics.eslint,
        -- formatting.prettier,
    },

    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format({ bufnr = bufnr })
                end,
            })
        end
    end,
})
