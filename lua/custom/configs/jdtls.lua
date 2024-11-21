local jdtls = require('jdtls')

local M = {}

local home = os.getenv("HOME")
local workspace_dir = home .. "/.workspace/"

local config = {
  cmd = {
    -- Point to your Java installation and jdtls
    'java', '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    '-Xmx1g',
    '-jar', home .. '/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_1.6.900.v20240613-2009.jar',
    '-configuration', home .. '/.local/share/nvim/mason/packages/jdtls/config_linux',
    '-data', workspace_dir,
  },
  root_dir = require('jdtls.setup').find_root({'.git', 'mvnw', 'gradlew'}),
  settings = {
    java = {
      signatureHelp = { enabled = true },
      contentProvider = { preferred = 'fernflower' }, -- Use FernFlower for decompiling
    },
  },
}

function M.setup()
  jdtls.start_or_attach(config)
end

return M
