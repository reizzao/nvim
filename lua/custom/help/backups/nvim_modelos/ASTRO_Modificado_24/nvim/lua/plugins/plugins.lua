vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'
  use { "catppuccin/nvim", as = "catppuccin" }
  use 'preservim/nerdcommenter'
  use 'dracula/vim'
  use 'wbthomason/packer.nvim'
  use 'terroo/vim-simple-emoji'
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use 'kyazdani42/nvim-web-devicons'
  use 'tamton-aquib/staline.nvim'
  use 'lukas-reineke/indent-blankline.nvim'
  use 'jiangmiao/auto-pairs' -- este indicado pelo hundcode >> funciona automaticamente sem configs.
  -- use 'windwp/nvim-autopairs' -- este auto pairs nao funciona automaticamente
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'saadparwaiz1/cmp_luasnip'
  use 'L3MON4D3/LuaSnip'
  use 'rafamadriz/friendly-snippets'
  use 'ray-x/lsp_signature.nvim'
  use {'tzachar/cmp-tabnine', run='./install.sh', requires = 'hrsh7th/nvim-cmp'}
  use 'onsails/lspkind-nvim'
  use {'akinsho/bufferline.nvim', tag = "*", requires = 'kyazdani42/nvim-web-devicons'}

  use {'nvim-treesitter/nvim-treesitter'} --:TSUpdate

--
  use 'matze/vim-move'
  use 'rcarriga/nvim-notify'
  use 'voldikss/vim-floaterm'
  use 'morhetz/gruvbox'
  use 'navarasu/onedark.nvim'
  use 'elvessousa/sobrio'

  -- explorer neo-tree
  use {
    "nvim-neo-tree/neo-tree.nvim",
      branch = "v2.x",
      requires = {
        "MunifTanjim/nui.nvim",
      }
    }

end)



