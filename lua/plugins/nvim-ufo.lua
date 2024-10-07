return {
    "kevinhwang91/nvim-ufo",
    dependencies = { "kevinhwang91/promise-async" },
    event = "BufRead",
    keys = {
        { "<leader>zz", function() require("ufo").openAllFolds()  end, desc = "Open all folds"},
        { "<leader>zx", function() require("ufo").closeAllFolds() end, desc = "Close all folds" },
        { "K", function()
            local winid = require('ufo').peekFoldedLinesUnderCursor()
            if not winid then
                vim.lsp.buf.hover()
            end
        end }
    },
    config = function()
      local o = vim.o

        o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
        o.foldcolumn = '0'
        o.foldlevel = 99
        o.foldlevelstart = 99
        o.foldenable = true
        
        local ufo = require("ufo")

        ufo.setup({
            close_fold_kinds_for_ft = {
                default = {'imports', 'comment'},
                json = {'array'},
                c = {'comment', 'region'}
            },
            preview = {
                win_config = {
                    border = {'', '─', '', '', '', '─', '', ''},
                    winhighlight = 'Normal:Folded',
                    winblend = 0
                },
                mappings = {
                    scrollU = '<C-u>',
                    scrollD = '<C-d>',
                    jumpTop = '[',
                    jumpBot = ']'
                }
            },
            provider_selector = function(bufnr, filetype, buftype)
                return {'treesitter', 'indent'}
            end
        })
    end,
} 
