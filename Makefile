SHELL = /bin/bash
ASDF_PLUGINS := nodejs ruby erlang elixir
ASDF_NPM_PACKAGES := typescript vscode-langservers-extracted typescript-language-server typescript @fsouza/prettierd eslint_d

.PHONY: all
all: brew asdf macos

macos:
	$(HOME)/.local/share/install/macos

brew:
	which $@ &> /dev/null || curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh | bash
	brew update
	brew upgrade
	brew bundle --file=$(HOME)/.local/share/install/Brewfile

asdf:
	which $@ &> /dev/null || git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.8.1
	. $(HOME)/.asdf/asdf.sh
	if [ ! -f $(HOME)/.default-npm-packages ]; then \
		for PKG in $(ASDF_NPM_PACKAGES); do echo $$PKG >> $(HOME)/.default-npm-packages; done; \
	fi;
	for PLUGIN in $(ASDF_PLUGINS); do asdf plugin add $$PLUGIN https://github.com/asdf-vm/asdf-$$PLUGIN.git; done
	for PLUGIN in $(ASDF_PLUGINS); do asdf install $$PLUGIN latest; done
	for PLUGIN in $(ASDF_PLUGINS); do asdf global $$PLUGIN latest; done
	asdf update
# vim: set tabstop=4:softtabstop=4:shiftwidth=4:noexpandtab
