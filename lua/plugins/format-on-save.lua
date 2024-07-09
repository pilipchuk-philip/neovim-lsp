return {
  "elentok/format-on-save.nvim",
  config = function()
    local format_on_save = require("format-on-save")
    local formatters = require("format-on-save.formatters")

    format_on_save.setup({
      exclude_path_patterns = {
        "/node_modules/",
        ".local/share/nvim/lazy",
      },
      formatter_by_ft = {
        css = formatters.lsp,
        html = formatters.lsp,
        java = formatters.lsp,
        json = formatters.lsp,
        lua = formatters.lsp,
        markdown = formatters.prettierd,
        openscad = formatters.lsp,
        rust = formatters.lsp,
        scad = formatters.lsp,
        scss = formatters.lsp,
        sh = formatters.shfmt,
        terraform = formatters.lsp,
        typescript = formatters.prettierd,
        typescriptreact = formatters.prettierd,
        yaml = formatters.lsp,
        javascript = formatters.lsp,
        text = formatters.remove_trailing_whitespace,

        -- TODO:
        -- https://github.com/elentok/format-on-save.nvim

        -- Add your own shell formatters:
        -- TODO: Пример как можно создать свой язык и далее формативание
        -- myfiletype = formatters.shell({ cmd = { "myformatter", "%" } }),

        -- Add lazy formatter that will only run when formatting:
        -- TODO: вот в место этой функции написать для проекта ruff
        --[[ my_custom_formatter = function()
          if vim.api.nvim_buf_get_name(0):match("/README.md$") then
            return formatters.prettierd
          else
            return formatters.lsp({})
          end
        end, ]]

        -- Concatenate formatters
        python = {
          -- TODO: HERE NEEDS TO BE SETTING
          formatters.lsp,
          formatters.remove_trailing_whitespace,
          -- formatters.shell({ cmd = { "tidy-imports" } }),
          -- formatters.black,
          -- formatters.ruff,
        },

        -- Use a tempfile instead of stdin
        go = {
          formatters.shell({
            cmd = { "goimports-reviser", "-rm-unused", "-set-alias", "-format", "%" },
            tempfile = function()
              return vim.fn.expand("%") .. '.formatter-temp'
            end
          }),
          formatters.shell({ cmd = { "gofmt" } }),
        },

      },

      -- Optional: fallback formatter to use when no formatters match the current filetype
      fallback_formatter = {
        formatters.remove_trailing_whitespace,
        formatters.remove_trailing_newlines,
        formatters.prettierd,
      },

      -- By default, all shell commands are prefixed with "sh -c" (see PR #3)
      -- To prevent that set `run_with_sh` to `false`.
      run_with_sh = false,
    })
  end,
}
