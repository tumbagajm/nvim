return {
  {
    "kevinhwang91/nvim-ufo",
    dependencies = { "kevinhwang91/promise-async" }, -- Ensure promise-async is listed as a dependency
    config = function()
      -- Set up UFO
      require("ufo").setup({
        fold_virt_text_handler = function(virtText, lnum, endLnum, width, truncate)
          local newVirtText = {}
          local suffix = ("  %d lines "):format(endLnum - lnum)
          local sufWidth = vim.fn.strdisplaywidth(suffix)
          local targetWidth = width - sufWidth
          local curWidth = 0

          for _, chunk in ipairs(virtText) do
            local chunkText = chunk[1]
            local chunkWidth = vim.fn.strdisplaywidth(chunkText)
            if targetWidth > curWidth + chunkWidth then
              table.insert(newVirtText, chunk)
            else
              chunkText = truncate(chunkText, targetWidth - curWidth)
              table.insert(newVirtText, { chunkText, chunk[2] })
              break
            end
            curWidth = curWidth + chunkWidth
          end

          table.insert(newVirtText, { suffix, "MoreMsg" })
          return newVirtText
        end,
      })

      -- Enable folding with Treesitter
      vim.o.foldmethod = "expr"
      vim.o.foldexpr = "nvim_treesitter#foldexpr()"

      -- Set default folding behavior
      vim.o.foldenable = true
      vim.o.foldlevel = 99
      vim.o.foldcolumn = "1"

      -- Ensure UFO does not interfere with Codeium autocompletion
      vim.api.nvim_set_keymap(
        "n",
        "zR",
        "<Cmd>lua require('ufo').openAllFolds()<CR>",
        { noremap = true, silent = true }
      )
      vim.api.nvim_set_keymap(
        "n",
        "zM",
        "<Cmd>lua require('ufo').closeAllFolds()<CR>",
        { noremap = true, silent = true }
      )
    end,
  },
}

