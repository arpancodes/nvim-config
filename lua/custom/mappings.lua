local M = {}

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = { "<cmd> DapToggleBreakpoint <CR>" },
    ["<leader>dus"] = {
      function ()
        local widgets = require('dap.ui.widgets');
        local sidebar = widgets.sidebar(widgets.scopes);
        sidebar.open();
      end,
      "Open debugging sidebar"
    }
  }
}

M.dap_go = {
  plugin = true,
  n = {
    ["<leader>dgt"] = {
      function ()
        require('dap-go').debug_test()
      end,
      "Debug go test"
    },
    ["<leader>dgl"] = {
      function ()
        require("dap-go").debug_last()
      end,
      "Debug last go test"
    }
  }
}

M.crates = {
  plugin = true,
  n = {
    ["<leader>rcu"] = {
      function ()
        require('crates').upgrade_all_crates()
      end,
      "update crates"
    }
  }
}

M.elixir = {
  plugin = true,
  n = {
    ["<leader>cf"] = { "<cmd> MixFormat <CR>", "Format Elixir code" }
  }
}

M.java_lsp = {
  n = {
    ["<leader>cf"] = { "<cmd>lua vim.lsp.buf.formatting()<CR>", "Format Java code" },
    ["<leader>ca"] = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Code Actions" },
    ["<leader>rr"] = { "<cmd>JdtCompile<CR>", "Run Java Code" },
  }
}

return M
