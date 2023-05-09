local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
    'clangd',
    'lua_ls',
})

-- Fix Undefined global 'vim'
lsp.nvim_workspace()

local cmp = require('cmp')
local cmp_mappings = lsp.defaults.cmp_mappings({
    ["<CR>"] = cmp.mapping.confirm({
        select = true,
        behavior = cmp.ConfirmBehavior.Replace,
    }),

    ["<C-Space>"] = cmp.mapping.complete(),

    ["<C-j>"] = cmp.mapping(function()
        if cmp.visible() then
            cmp.select_next_item()
        else
            cmp.complete()
        end
    end),

    ["<C-k>"] = cmp.mapping(function()
        if cmp.visible() then
            cmp.select_prev_item()
        else
            cmp.complete()
        end
    end),
})

lsp.setup_nvim_cmp({
    mapping = cmp_mappings
})

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", ",,", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
    vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
    vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
    vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "<leader>vrr", require('telescope.builtin').lsp_references, opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, opts)
    -- vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help(), opts)
end)

lsp.setup()

require('luasnip.loaders.from_vscode').lazy_load()
cmp.setup({
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip', keyword_length = 2 },
        { name = 'path' },
        { name = 'buffer',  keyword_length = 3 },
    }
})

vim.diagnostic.config({
    virtual_text = true
})
