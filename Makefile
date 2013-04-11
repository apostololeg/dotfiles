all:
	@ mkdir `pwd`/.vim/bundle
	@ echo ""
	@ while [ -z "$$CUSTOM_DOTFILES" ]; do \
        read -r -p "Custom dotfiles (or press Enter): " CUSTOM_DOTFILES; \
	done ; \
	if [ ! $$CUSTOM_DOTFILES == "" ]; then \
		mkdir custom && \
		echo "===> fetch custom dotfiles..."; \
		git clone $$CUSTOM_DOTFILES custom; \
	fi;
	@ echo "===> fetch vim bundles..."
	@ git clone git://github.com/gmarik/vundle.git `pwd`/.vim/bundle/vundle > /dev/null 2>&1
	@ rm -rf ${HOME}/.vim
	@ rm -rf ${HOME}/.zsh
	@ find `pwd` -maxdepth 1 -mindepth 1 -name '.*' -not -name '.git' -exec ln -s -f {} ${HOME} \;
	@ vim -u `pwd`/.vim/vundle.vimrc +BundleInstall! +qa
	@ echo "===> setup 'commant-t' bundle..."
	@ ruby -C `pwd`/.vim/bundle/command-t/ruby/command-t/ extconf.rb > /dev/null 2>&1
	@ make -C `pwd`/.vim/bundle/command-t/ruby/command-t/ > /dev/null 2>&1
	@ echo "\033[00;34m --- workflow setup complete! ---"

vim:
	@ echo ""
	@ echo "===> fetch vim ..."
	@ wget 'ftp://ftp.vim.org/pub/vim/unix/vim-7.3.tar.bz2' > /dev/null 2>&1
	@ tar -jxvf vim-7.3.tar.bz2
	@ cd vim73
	@ echo "===> configure..."
	@./configure --prefix=${HOME} --disable-gui --without-x --disable-nls --enable-multibyte --with-tlib=ncurses --enable-pythoninterp --enable-rubyinterp > /dev/null 2>&1
	@ echo "===> make ..."
	@ make
	@ echo "===> install ..."
	@ make install
	@ echo -e "\033[00;34m --- complete ---"

update:
	@ git pull > /dev/null 2>&1
	@ vim +BundleInstall! +qa
	@ echo -e "\033[00;34m --- update complete! ---"
