return {
  {
    "xiyaowong/transparent.nvim",
    config = function()
      local config = require("transparent")
      config.setup({
        require('transparent').clear_prefix('NeoTree')
      })
    end
  }
}
