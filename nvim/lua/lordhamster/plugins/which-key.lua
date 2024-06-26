-- 💥 Create key bindings that stick. WhichKey is a lua plugin for Neovim 0.5 that displays a popup with possible keybindings of the command you started typing.
return {
  -- https://github.com/folke/which-key.nvim
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 500
  end,
  config = function()
    local wk = require("which-key")

    local opts = {
      mode = "n", -- NORMAL mode
      prefix = "<leader>",
      buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    }

    local mappings = {
      ["/"] = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Current buffer fuzzy find" },
      ["1"] = { "<cmd>lua require('harpoon'):list():select(1)<cr>", "Harpoon select 1" },
      ["2"] = { "<cmd>lua require('harpoon'):list():select(2)<cr>", "Harpoon select 2" },
      ["3"] = { "<cmd>lua require('harpoon'):list():select(3)<cr>", "Harpoon select 3" },
      ["4"] = { "<cmd>lua require('harpoon'):list():select(4)<cr>", "Harpoon select 4" },
      ["<Space>"] = { "<cmd>e #<CR>", "Switch to Other Buffer" },
      ["a"] = { "<cmd>lua require('harpoon'):list():add()<cr>", "Harpoon add" },
      ["b"] = { "<cmd>Telescope buffers<cr>", "Buffers" },
      ["c"] = { "<cmd>Telescope commands<cr>", "Commands" },
      ["e"] = { "<cmd>Oil<cr>", "Oil" },
      ["h"] = { "<cmd>nohlsearch<CR>", "No Highlight" },
      ["p"] = { '"ap', "Paste from 'a' register" },
      ["q"] = { "<cmd>:qa<CR>", "Quit Nvim" },
      ["w"] = { "<cmd>w!<CR>", "Save" },
      ["x"] = { "<cmd>:Bdelete<CR>", "Close Buffer" },
      ["y"] = { "<cmd>let @a = @+<CR>", "Let 'a' register copy from '+' register" },
      ["z"] = { "<cmd>ZenMode<CR>", "ZenMode" },

      -- t = {
      --   name = "m_taskwarrior_d",
      --   e = { "<cmd>TWEditTask<cr>", "Taskwarrior edit" },
      --   q = { "<cmd>TWBufQueryTasks<cr>", "Taskwarrior query task in buffer" },
      --   s = { "<cmd>TWSyncTasks<cr>", "Taskwarrior sync" },
      --   t = { "<cmd>ToggleTerm direction=float<CR>", "ToggleTerm" },
      --   v = { "<cmd>TWView<cr>", "Taskwarrior view" },
      -- },
      -- b = {
      --   name = "Bufferline",
      --   h = { "<cmd>BufferLineMovePrev<cr>", "Bufferline move prev" },
      --   l = { "<cmd>BufferLineMoveNext<cr>", "Bufferline move next" },
      --   o = { "<cmd>BufferLineCloseOthers<cr>", "Bufferline close others" },
      --   p = { "<cmd>BufferLinePick<cr>", "Bufferline pick" },
      --   t = { "<cmd>BufferLineTogglePin<cr>", "Bufferline toggle pin" },
      -- },
      o = {
        name = "Obsidian",
        T = { "<cmd>ObsidianTags<cr>", "Obsidian tags" },
        b = { "<cmd>ObsidianBacklinks<cr>", "Obsidian backlinks" },
        c = { "<cmd>ObsidianToggleCheckbox<cr>", "Obsidian toggle checkbox" },
        d = { "<cmd>ObsidianDailies<cr>", "Obsidian dailies" },
        f = { "<cmd>ObsidianQuickSwitch<cr>", "Obsidian find files" },
        n = { "<cmd>ObsidianNew<cr>", "Obsidian new" },
        o = { "<cmd>ObsidianOpen<cr>", "Obsidian open" },
        s = { "<cmd>ObsidianSearch<cr>", "Obsidian find text" },
        t = { "<cmd>ObsidianTemplate<cr>", "Obsidian template" },
      },
      -- e = {
      --   name = "NvimTree",
      --   c = { "<cmd>NvimTreeCollapse<cr>", "Collapse file explorer" },
      --   e = { "<cmd>NvimTreeFocus<cr>", "Focus file explorer" },
      --   f = { "<cmd>NvimTreeFindFile<cr>", "Find current file on file explorer" },
      --   r = { "<cmd>NvimTreeRefresh<cr>", "Refresh file explorer" },
      --   t = { "<cmd>NvimTreeToggle<cr>", "Toggle file explorer" },
      -- },
      f = {
        name = "File Manage",
        c = { "<cmd>cexpr []<cr>", "Clear Quickfix" },
        f = {
          "<cmd>lua require'telescope.builtin'.find_files({ find_command = {'rg', '--files', '--hidden', '-g', '!.git' }})<cr>",
          "Find file",
        },
        g = { "<cmd>Telescope git_files<cr>", "Telescope git files" },
        h = { "<cmd>Telescope help_tags<cr>", "Help" }, -- list available help tags
        l = { "<cmd>ToggleHarpoonList<cr>", "Harpoon quick menu" },
        m = { "<cmd>Telescope marks<cr>", "Marks" },
        q = { "<cmd>copen<cr>", "Quickfix" },
        r = { "<cmd>Telescope oldfiles<cr>", "Recently used files" },
        s = { "<cmd>TelescopeCustomLiveGrep<cr>", "Search text(1 regex,2 full match,3 case sensitive)" }, -- find string in current working directory as you type
        t = { "<cmd>TodoTelescope<cr>", "Find todos" },
        w = { "<cmd>Telescope grep_string<cr>", "Find word under cursor" },
      },
      l = {
        name = "LSP",
        -- f = { "<cmd>lua vim.lsp.buf.format{async=true}<cr>", "Format" },
        R = { "<cmd>LspRestart<CR>", "Restart LSP" },
        a = { vim.lsp.buf.code_action, "Code Action" },
        d = { "<cmd>Telescope diagnostics bufnr=0<cr>", "Document Diagnostics" },
        i = { "<cmd>LspInfo<cr>", "Info" },
        o = { "<cmd>Outline<CR>", "Outline" },
        r = { vim.lsp.buf.rename, "Rename" },
        w = { "<cmd>Telescope diagnostics<cr>", "Workspace Diagnostics" },
        z = { "<cmd>Lazy<cr>", "Lazy" },
      },
      g = {
        name = "Git",
        R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
        b = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
        j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
        k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
        p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
        r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
      },
    }

    wk.setup({
      window = {
        border = "double", -- none, single, double, shadow
        position = "bottom", -- bottom, top
        margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
        padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
        winblend = 0,
      },
      layout = {
        height = { min = 4, max = 25 }, -- min and max height of the columns
        width = { min = 20, max = 50 }, -- min and max width of the columns
        spacing = 3, -- spacing between columns
        align = "center", -- align columns left, center or right
      },
    })
    wk.register(mappings, opts)
  end,
}
