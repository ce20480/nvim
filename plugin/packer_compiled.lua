-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/aaronvinod/.cache/nvim/packer_hererocks/2.1.1703358377/share/lua/5.1/?.lua;/Users/aaronvinod/.cache/nvim/packer_hererocks/2.1.1703358377/share/lua/5.1/?/init.lua;/Users/aaronvinod/.cache/nvim/packer_hererocks/2.1.1703358377/lib/luarocks/rocks-5.1/?.lua;/Users/aaronvinod/.cache/nvim/packer_hererocks/2.1.1703358377/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/aaronvinod/.cache/nvim/packer_hererocks/2.1.1703358377/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Comment.nvim"] = {
    loaded = true,
    path = "/Users/aaronvinod/.local/share/nvim/site/pack/packer/start/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  LuaSnip = {
    loaded = true,
    path = "/Users/aaronvinod/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/Users/aaronvinod/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/aaronvinod/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/Users/aaronvinod/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/Users/aaronvinod/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/Users/aaronvinod/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\nW\0\4\n\1\4\0\14\14\0\3\0X\4\1€4\3\0\0-\4\0\0=\4\0\0036\4\1\0009\4\2\0049\4\3\4\18\6\0\0\18\a\1\0\18\b\2\0\18\t\3\0B\4\5\1K\0\1\0\0À\bset\vkeymap\bvim\vbuffer#\0\0\2\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\1À\14next_hunk#\0\0\2\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\1À\14prev_hunk$\0\0\2\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\1À\15stage_hunk$\0\0\2\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\1À\15reset_hunkn\0\0\6\1\6\1\17-\0\0\0009\0\0\0004\2\3\0006\3\1\0009\3\2\0039\3\3\3'\5\4\0B\3\2\2>\3\1\0026\3\1\0009\3\2\0039\3\3\3'\5\5\0B\3\2\0?\3\0\0B\0\2\1K\0\1\0\1À\6v\6.\tline\afn\bvim\15stage_hunk\5€€À™\4n\0\0\6\1\6\1\17-\0\0\0009\0\0\0004\2\3\0006\3\1\0009\3\2\0039\3\3\3'\5\4\0B\3\2\2>\3\1\0026\3\1\0009\3\2\0039\3\3\3'\5\5\0B\3\2\0?\3\0\0B\0\2\1K\0\1\0\1À\6v\6.\tline\afn\bvim\15reset_hunk\5€€À™\0041\0\0\3\1\2\0\5-\0\0\0009\0\0\0005\2\1\0B\0\2\1K\0\1\0\1À\1\0\1\tfull\2\15blame_line(\0\0\3\1\2\0\5-\0\0\0009\0\0\0'\2\1\0B\0\2\1K\0\1\0\1À\6~\rdiffthisè\4\1\1\b\0\"\0Q6\1\0\0009\1\1\0019\1\2\0013\2\3\0\18\3\2\0'\5\4\0'\6\5\0003\a\6\0B\3\4\1\18\3\2\0'\5\4\0'\6\a\0003\a\b\0B\3\4\1\18\3\2\0'\5\4\0'\6\t\0003\a\n\0B\3\4\1\18\3\2\0'\5\4\0'\6\v\0003\a\f\0B\3\4\1\18\3\2\0'\5\r\0'\6\t\0003\a\14\0B\3\4\1\18\3\2\0'\5\r\0'\6\v\0003\a\15\0B\3\4\1\18\3\2\0'\5\4\0'\6\16\0009\a\17\1B\3\4\1\18\3\2\0'\5\4\0'\6\18\0009\a\19\1B\3\4\1\18\3\2\0'\5\4\0'\6\20\0009\a\21\1B\3\4\1\18\3\2\0'\5\4\0'\6\22\0009\a\23\1B\3\4\1\18\3\2\0'\5\4\0'\6\24\0003\a\25\0B\3\4\1\18\3\2\0'\5\4\0'\6\26\0009\a\27\1B\3\4\1\18\3\2\0'\5\4\0'\6\28\0009\a\29\1B\3\4\1\18\3\2\0'\5\4\0'\6\30\0003\a\31\0B\3\4\1\18\3\2\0'\5\4\0'\6 \0009\a!\1B\3\4\0012\0\0€K\0\1\0\19toggle_deleted\15<leader>td\0\15<leader>hD\rdiffthis\15<leader>hd\30toggle_current_line_blame\15<leader>tb\0\15<leader>hb\17preview_hunk\15<leader>hp\17reset_buffer\15<leader>hR\20undo_stage_hunk\15<leader>hu\17stage_buffer\15<leader>hS\0\0\6v\0\15<leader>hr\0\15<leader>hs\0\15<leader>gp\0\15<leader>gn\6n\0\rgitsigns\vloaded\fpackageP\1\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0003\3\3\0=\3\5\2B\0\2\1K\0\1\0\14on_attach\1\0\0\0\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/Users/aaronvinod/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["lspkind.nvim"] = {
    loaded = true,
    path = "/Users/aaronvinod/.local/share/nvim/site/pack/packer/start/lspkind.nvim",
    url = "https://github.com/onsails/lspkind.nvim"
  },
  ["lspsaga.nvim"] = {
    loaded = true,
    path = "/Users/aaronvinod/.local/share/nvim/site/pack/packer/start/lspsaga.nvim",
    url = "https://github.com/glepnir/lspsaga.nvim"
  },
  ["lualine.nvim"] = {
    loaded = true,
    path = "/Users/aaronvinod/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/Users/aaronvinod/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason-null-ls.nvim"] = {
    loaded = true,
    path = "/Users/aaronvinod/.local/share/nvim/site/pack/packer/start/mason-null-ls.nvim",
    url = "https://github.com/jayp0521/mason-null-ls.nvim"
  },
  ["mason.nvim"] = {
    loaded = true,
    path = "/Users/aaronvinod/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["null-ls.nvim"] = {
    loaded = true,
    path = "/Users/aaronvinod/.local/share/nvim/site/pack/packer/start/null-ls.nvim",
    url = "https://github.com/jose-elias-alvarez/null-ls.nvim"
  },
  ["nvim-autopairs"] = {
    loaded = true,
    path = "/Users/aaronvinod/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/Users/aaronvinod/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/aaronvinod/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-tree.lua"] = {
    loaded = true,
    path = "/Users/aaronvinod/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/nvim-tree/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/Users/aaronvinod/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-context"] = {
    config = { "\27LJ\2\nD\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\23treesitter-context\frequire\0" },
    loaded = true,
    path = "/Users/aaronvinod/.local/share/nvim/site/pack/packer/start/nvim-treesitter-context",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-context"
  },
  ["nvim-ts-autotag"] = {
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/Users/aaronvinod/.local/share/nvim/site/pack/packer/opt/nvim-ts-autotag",
    url = "https://github.com/windwp/nvim-ts-autotag"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/aaronvinod/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/nvim-tree/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/aaronvinod/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/aaronvinod/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/Users/aaronvinod/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/Users/aaronvinod/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["typescript.nvim"] = {
    loaded = true,
    path = "/Users/aaronvinod/.local/share/nvim/site/pack/packer/start/typescript.nvim",
    url = "https://github.com/jose-elias-alvarez/typescript.nvim"
  },
  ["vim-ReplaceWithRegister"] = {
    loaded = true,
    path = "/Users/aaronvinod/.local/share/nvim/site/pack/packer/start/vim-ReplaceWithRegister",
    url = "https://github.com/inkarkat/vim-ReplaceWithRegister"
  },
  ["vim-fugitive"] = {
    commands = { "Gstatus", "Git", "Gdiffsplit", "Gread", "Gwrite", "Ggrep", "GMove", "GDelete", "GBrowse", "GRemove", "GRename", "Glgrep", "Glog", "Gedit" },
    config = { "\27LJ\2\nç\5\0\0\6\0\31\0I6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\a\0'\4\b\0005\5\t\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\n\0'\4\v\0005\5\f\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\r\0'\4\14\0005\5\15\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\16\0'\4\17\0005\5\18\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\19\0'\4\20\0005\5\21\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\22\0'\4\23\0005\5\24\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\25\0'\4\26\0005\5\27\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\28\0'\4\29\0005\5\30\0B\0\5\1K\0\1\0\1\0\2\vsilent\2\fnoremap\2\19:Git blame<CR>\15<leader>gb\1\0\2\vsilent\2\fnoremap\2\20:Gdiffsplit<CR>\15<leader>gD\1\0\2\vsilent\2\fnoremap\2\18:Git pull<CR>\15<leader>gL\1\0\2\vsilent\2\fnoremap\2\18:Git push<CR>\15<leader>gP\1\0\2\vsilent\2\fnoremap\2\20:Git commit<CR>\15<leader>gC\1\0\2\vsilent\2\fnoremap\2\19:Git add .<CR>\15<leader>gA\1\0\2\vsilent\2\fnoremap\2\29:Git reset HEAD -- %<CR>\15<leader>gu\1\0\2\vsilent\2\fnoremap\2\19:Git add %<CR>\15<leader>ga\1\0\2\vsilent\2\fnoremap\2\r:Git<CR>\15<leader>gS\6n\20nvim_set_keymap\bapi\bvim\0" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/aaronvinod/.local/share/nvim/site/pack/packer/opt/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-maximizer"] = {
    loaded = true,
    path = "/Users/aaronvinod/.local/share/nvim/site/pack/packer/start/vim-maximizer",
    url = "https://github.com/szw/vim-maximizer"
  },
  ["vim-nightfly-guicolors"] = {
    loaded = true,
    path = "/Users/aaronvinod/.local/share/nvim/site/pack/packer/start/vim-nightfly-guicolors",
    url = "https://github.com/bluz71/vim-nightfly-guicolors"
  },
  ["vim-rhubarb"] = {
    loaded = true,
    path = "/Users/aaronvinod/.local/share/nvim/site/pack/packer/start/vim-rhubarb",
    url = "https://github.com/tpope/vim-rhubarb"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/Users/aaronvinod/.local/share/nvim/site/pack/packer/start/vim-surround",
    url = "https://github.com/tpope/vim-surround"
  },
  ["vim-tmux-navigator"] = {
    loaded = true,
    path = "/Users/aaronvinod/.local/share/nvim/site/pack/packer/start/vim-tmux-navigator",
    url = "https://github.com/christoomey/vim-tmux-navigator"
  },
  ["which-key.nvim"] = {
    loaded = true,
    path = "/Users/aaronvinod/.local/share/nvim/site/pack/packer/start/which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: nvim-treesitter-context
time([[Config for nvim-treesitter-context]], true)
try_loadstring("\27LJ\2\nD\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\23treesitter-context\frequire\0", "config", "nvim-treesitter-context")
time([[Config for nvim-treesitter-context]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\nW\0\4\n\1\4\0\14\14\0\3\0X\4\1€4\3\0\0-\4\0\0=\4\0\0036\4\1\0009\4\2\0049\4\3\4\18\6\0\0\18\a\1\0\18\b\2\0\18\t\3\0B\4\5\1K\0\1\0\0À\bset\vkeymap\bvim\vbuffer#\0\0\2\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\1À\14next_hunk#\0\0\2\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\1À\14prev_hunk$\0\0\2\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\1À\15stage_hunk$\0\0\2\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\1À\15reset_hunkn\0\0\6\1\6\1\17-\0\0\0009\0\0\0004\2\3\0006\3\1\0009\3\2\0039\3\3\3'\5\4\0B\3\2\2>\3\1\0026\3\1\0009\3\2\0039\3\3\3'\5\5\0B\3\2\0?\3\0\0B\0\2\1K\0\1\0\1À\6v\6.\tline\afn\bvim\15stage_hunk\5€€À™\4n\0\0\6\1\6\1\17-\0\0\0009\0\0\0004\2\3\0006\3\1\0009\3\2\0039\3\3\3'\5\4\0B\3\2\2>\3\1\0026\3\1\0009\3\2\0039\3\3\3'\5\5\0B\3\2\0?\3\0\0B\0\2\1K\0\1\0\1À\6v\6.\tline\afn\bvim\15reset_hunk\5€€À™\0041\0\0\3\1\2\0\5-\0\0\0009\0\0\0005\2\1\0B\0\2\1K\0\1\0\1À\1\0\1\tfull\2\15blame_line(\0\0\3\1\2\0\5-\0\0\0009\0\0\0'\2\1\0B\0\2\1K\0\1\0\1À\6~\rdiffthisè\4\1\1\b\0\"\0Q6\1\0\0009\1\1\0019\1\2\0013\2\3\0\18\3\2\0'\5\4\0'\6\5\0003\a\6\0B\3\4\1\18\3\2\0'\5\4\0'\6\a\0003\a\b\0B\3\4\1\18\3\2\0'\5\4\0'\6\t\0003\a\n\0B\3\4\1\18\3\2\0'\5\4\0'\6\v\0003\a\f\0B\3\4\1\18\3\2\0'\5\r\0'\6\t\0003\a\14\0B\3\4\1\18\3\2\0'\5\r\0'\6\v\0003\a\15\0B\3\4\1\18\3\2\0'\5\4\0'\6\16\0009\a\17\1B\3\4\1\18\3\2\0'\5\4\0'\6\18\0009\a\19\1B\3\4\1\18\3\2\0'\5\4\0'\6\20\0009\a\21\1B\3\4\1\18\3\2\0'\5\4\0'\6\22\0009\a\23\1B\3\4\1\18\3\2\0'\5\4\0'\6\24\0003\a\25\0B\3\4\1\18\3\2\0'\5\4\0'\6\26\0009\a\27\1B\3\4\1\18\3\2\0'\5\4\0'\6\28\0009\a\29\1B\3\4\1\18\3\2\0'\5\4\0'\6\30\0003\a\31\0B\3\4\1\18\3\2\0'\5\4\0'\6 \0009\a!\1B\3\4\0012\0\0€K\0\1\0\19toggle_deleted\15<leader>td\0\15<leader>hD\rdiffthis\15<leader>hd\30toggle_current_line_blame\15<leader>tb\0\15<leader>hb\17preview_hunk\15<leader>hp\17reset_buffer\15<leader>hR\20undo_stage_hunk\15<leader>hu\17stage_buffer\15<leader>hS\0\0\6v\0\15<leader>hr\0\15<leader>hs\0\15<leader>gp\0\15<leader>gn\6n\0\rgitsigns\vloaded\fpackageP\1\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0003\3\3\0=\3\5\2B\0\2\1K\0\1\0\14on_attach\1\0\0\0\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd nvim-treesitter ]]
vim.cmd [[ packadd nvim-ts-autotag ]]
time([[Sequenced loading]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.api.nvim_create_user_command, 'Gstatus', function(cmdargs)
          require('packer.load')({'vim-fugitive'}, { cmd = 'Gstatus', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'vim-fugitive'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Gstatus ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Git', function(cmdargs)
          require('packer.load')({'vim-fugitive'}, { cmd = 'Git', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'vim-fugitive'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Git ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Gdiffsplit', function(cmdargs)
          require('packer.load')({'vim-fugitive'}, { cmd = 'Gdiffsplit', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'vim-fugitive'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Gdiffsplit ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Gread', function(cmdargs)
          require('packer.load')({'vim-fugitive'}, { cmd = 'Gread', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'vim-fugitive'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Gread ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Gwrite', function(cmdargs)
          require('packer.load')({'vim-fugitive'}, { cmd = 'Gwrite', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'vim-fugitive'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Gwrite ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Ggrep', function(cmdargs)
          require('packer.load')({'vim-fugitive'}, { cmd = 'Ggrep', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'vim-fugitive'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Ggrep ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'GMove', function(cmdargs)
          require('packer.load')({'vim-fugitive'}, { cmd = 'GMove', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'vim-fugitive'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('GMove ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'GDelete', function(cmdargs)
          require('packer.load')({'vim-fugitive'}, { cmd = 'GDelete', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'vim-fugitive'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('GDelete ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'GBrowse', function(cmdargs)
          require('packer.load')({'vim-fugitive'}, { cmd = 'GBrowse', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'vim-fugitive'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('GBrowse ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'GRemove', function(cmdargs)
          require('packer.load')({'vim-fugitive'}, { cmd = 'GRemove', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'vim-fugitive'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('GRemove ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'GRename', function(cmdargs)
          require('packer.load')({'vim-fugitive'}, { cmd = 'GRename', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'vim-fugitive'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('GRename ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Glgrep', function(cmdargs)
          require('packer.load')({'vim-fugitive'}, { cmd = 'Glgrep', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'vim-fugitive'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Glgrep ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Glog', function(cmdargs)
          require('packer.load')({'vim-fugitive'}, { cmd = 'Glog', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'vim-fugitive'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Glog ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Gedit', function(cmdargs)
          require('packer.load')({'vim-fugitive'}, { cmd = 'Gedit', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'vim-fugitive'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Gedit ', 'cmdline')
      end})
time([[Defining lazy-load commands]], false)


_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
