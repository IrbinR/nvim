local lsp = require('lsp-zero').preset('recommended')

vim.opt.signcolumn = 'yes'

-- Asegúrate de instalar los servidores que necesites
lsp.ensure_installed({
    'pyright',   -- Python
    'clangd',    -- C y C++
    'lua_ls',    --lua
    'html',  --html
    'ts_ls',  --typescript
})

-- Configuración de mappings
lsp.on_attach(function(client, bufnr)
    local opts = {buffer = bufnr, remap = false}

    -- Atajos de teclado
    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>f", function() vim.lsp.buf.format() end, opts) -- Formatear
    -- Agrega más atajos según sea necesario
end)

-- Configuración de autocompletado
lsp.setup_nvim_cmp({
    mapping = lsp.defaults.cmp_mappings({
        ['<C-p>'] = require('cmp').mapping.select_prev_item(),
        ['<C-n>'] = require('cmp').mapping.select_next_item(),
        ['<C-y>'] = require('cmp').mapping.confirm({ select = true }),
        ["<C-Space>"] = require('cmp').mapping.complete(),
    }),
    completion = {
        completeopt = 'menu,menuone,noinsert',
    }
})

-- Configuración específica para ciertos lenguajes
lsp.configure('lua_ls', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})

-- Configuración de diagnósticos
lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = '✖',
        warn = '⚠',
        hint = '➤',
        info = 'ℹ',
    }
})

lsp.setup()

-- Diagnósticos adicionales
vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    update_in_insert = false,
    underline = true,
    severity_sort = false,
    float = true,
})
