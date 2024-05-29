local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use 'folke/tokyonight.nvim'
  use {'AlphaTechnolog/pywal.nvim', as = 'pywal'}

  use 'windwp/nvim-autopairs'
  use 'ryanoasis/vim-devicons'

  use 'williamboman/mason-lspconfig.nvim'
  use 'williamboman/mason.nvim'
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-buffer'

  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  use 'rafamadriz/friendly-snippets'

  use 'ThePrimeagen/vim-be-good'

  use {
	  'nvim-treesitter/nvim-treesitter',
	  run = ':TSUpdate'
  }

  use 'HiPhish/nvim-ts-rainbow2'
  use {
	  'nvim-lualine/lualine.nvim',
	  requires = {'nvim-tree/nvim-web-devicons'},
  }

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.5',
	  requires = { {'nvim-lua/plenary.nvim'}}
  }

  use {'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons'}

  use {
    'goolord/alpha-nvim',
	requires = { 'nvim-tree/nvim-web-devicons' },
    config = function ()
        require'alpha'.setup(require'alpha.themes.dashboard'.config)
	end
  }

  use 'github/copilot.vim'

  use {
	'CopilotC-Nvim/CopilotChat.nvim',
	requires = {'zbirenbaum/copilot.lua', 'nvim-lua/plenary.nvim'}
  }

  use 'xiyaowong/transparent.nvim'

  use {
		'windwp/nvim-ts-autotag',
		config = function ()
			require('core.plugin_config.treesitter')
		end,
  }

  require('packer').sync()
end)
