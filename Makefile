all: antigen links
	@ source .zshrc
	@ echo "\033[00;34m --- Workspace setup complete"

antigen:
	@if [ -f antigen.zsh ]; then \
		echo "\033[00;34m --- Antigen already installed"; \
	else \
		echo ">>> get antigen..."; \
		curl -L git.io/antigen > antigen.zsh; \
		ln -s ${HOME}/antigen.zsh ../; \
		echo "\033[00;34m --- Antigen installed"; \
	fi;

links:
	@ find `pwd` -maxdepth 1 -mindepth 1 -name '.*' -not -name '.git' -exec ln -s -f {} ${HOME} \;
	@ ln -s -f "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" /usr/local/bin/subl
	@ echo "\033[00;34m --- Links to dotfiles has been created"

custom_dotfiles:
	@ while [ -z "$$CUSTOM_DOTFILES" ]; do \
		echo "\n"; \
        read -r -p " Custom dotfiles repository (or press Enter): " CUSTOM_DOTFILES_REPO; \
		if [ ! $$CUSTOM_DOTFILES_REPO == "" ]; then \
			read -r -p "Custom dotfiles directory (or press Enter): " CUSTOM_DOTFILES_DIR; \
			if [ ! $$CUSTOM_DOTFILES_DIR == "" ]; then \
				CUSTOMS_ROOT=customs; \
				mkdir $$CUSTOMS_ROOT > /dev/null 2>&1; \
				mkdir $$CUSTOMS_ROOT/$$CUSTOM_DOTFILES_DIR \
					&& echo ">>> fetch custom dotfiles..." \
					&& git clone $$CUSTOM_DOTFILES_REPO $$CUSTOMS_ROOT/$$CUSTOM_DOTFILES_DIR; \
			else \
				break; \
			fi; \
		else \
			break; \
		fi; \
	done ;

update:
	@ git stash > /dev/null 2>&1;
	@ git pull
	@ git stash apply > /dev/null 2>&1;
	@ if [ ! -n $(git ls-files --unmerged) ]; then \
		echo "\033[00;34m --- There some CONFLICTS when applying current state"; \
	else \
		echo "\033[00;34m --- Update complete"; \
	fi;
