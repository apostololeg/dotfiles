all:
	@ mkdir `pwd`/.vim/bundle
	@ echo "===> fetch vim bundles..."
	@ git clone git://github.com/gmarik/vundle.git `pwd`/.vim/bundle/vundle > /dev/null 2>&1
	@ rm -rf ${HOME}/.vim ${HOME}/.zsh;
	@ find `pwd` -maxdepth 1 -mindepth 1 -name '.*' -not -name '.git' -exec ln -s -f {} ${HOME} \;
	@ vim -u `pwd`/.vim/vundle.vimrc +BundleInstall! +qa
	@ echo "===> setup 'commant-t' bundle..."
	@ ruby -C `pwd`/.vim/bundle/command-t/ruby/command-t/ extconf.rb > /dev/null 2>&1
	@ make -C `pwd`/.vim/bundle/command-t/ruby/command-t/ > /dev/null 2>&1
	@ echo "\033[00;34m --- workflow setup complete! ---"

customs:
	@ while [ -z "$$CUSTOM_DOTFILES" ]; do \
		echo "\n"; \
        read -r -p " Custom dotfiles repository (or press Enter): " CUSTOM_DOTFILES_REPO; \
		if [ ! $$CUSTOM_DOTFILES_REPO == "" ]; then \
			read -r -p "Custom dotfiles directory (or press Enter): " CUSTOM_DOTFILES_DIR; \
			if [ ! $$CUSTOM_DOTFILES_DIR == "" ]; then \
				CUSTOMS_ROOT=customs; \
				mkdir $$CUSTOMS_ROOT > /dev/null 2>&1; \
				mkdir $$CUSTOMS_ROOT/$$CUSTOM_DOTFILES_DIR \
					&& echo "===> fetch custom dotfiles..." \
					&& git clone $$CUSTOM_DOTFILES_REPO $$CUSTOMS_ROOT/$$CUSTOM_DOTFILES_DIR; \
			else \
				break; \
			fi; \
		else \
			break; \
		fi; \
	done ;

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
