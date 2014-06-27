all:
	# Creating backupfile
	if test -f ~/.vimrc; then mv ~/.vimrc ~/.vim.bk/; fi
	if test -f ~/.gvimrc; then mv ~/.gvimrc ~/.vim.bk/; fi
	if test -d ~/.vim; then mv ~/.vim ~/.vim.bk/; fi
	
	# Symlinking
	ln -s `pwd`/vimrc ~/.vimrc
	#ln -s `pwd`/gvimrc ~/.gvimrc
	ln -s `pwd`/vim ~/.vim
	vim +PluginInstall +qall
update:
	git pull origin master

clean:
	rm ~/.vim ~/.vimrc ~/.gvimrc
	if test -f ~/.vim.bk/.vimrc; then mv ~/.vim.bk/.vimrc ~; fi
	if test -f ~/.vim.bk/.gvimrc; then mv ~/.vim.bk/.gvimrc ~; fi
	if test -d ~/.vim.bk/.vim; then mv ~/.vim.bk/.vim ~; fi
	rm -rf ~/.vim.bk
