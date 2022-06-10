
call plug#begin()

if has("nvim")
	Plug 'neoclide/coc.nvim', {'branch': 'release'}	
	Plug 'windwp/nvim-autopairs'
	Plug 'dart-lang/dart-vim-plugin'
  Plug 'Shougo/defx.nvim', {'do': ':UpdateRemotePlugins'}
  Plug 'kristijanhusak/defx-git'
  Plug 'kristijanhusak/defx-icons'
  Plug 'hoob3rt/lualine.nvim'
  Plug 'nvim-telescope/telescope.nvim'
endif	

call plug#end()
