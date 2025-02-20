local null_ls = require("null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local opts = {
  sources = {
    null_ls.builtins.formatting.clang_format,
    null_ls.builtins.formatting.gofmt,
    null_ls.builtins.formatting.goimports_reviser,
    null_ls.builtins.formatting.mix,
    null_ls.builtins.formatting.prettierd,
    null_ls.builtins.formatting.google_java_format.with({
      extra_args = { "--aosp" },  -- Use Android Open Source Project style if preferred
    }),
  },
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({
        group = augroup,
        buffer = bufnr,
      })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ bufnr = bufnr})
        end,
      })
    end
  end,
}

return opts
