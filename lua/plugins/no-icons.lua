return {
  { "nvim-tree/nvim-web-devicons", enabled = false },
  {
    "folke/snacks.nvim",
    opts = {
      explorer = {
        replace_netrw = true,
      },
      picker = {
        icons = {
          files = {
            enabled = false,
          },
        },
        formatters = {
          file = { filename_first = false },
        },
      },
      indent = {
        indent = { enabled = true },
        chunk = { enabled = false },
      },
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    optional = true,
    opts = function(_, opts)
      opts.options = opts.options or {}
      opts.options.icons_enabled = false
      return opts
    end,
  },
  {
    "folke/which-key.nvim",
    optional = true,
    opts = {
      icons = {
        rules = false,
      },
    },
  },
}
