SHELL = /bin/bash
ASDF_PLUGINS := nodejs ruby erlang elixir
ASDF_NPM_PACKAGES := typescript vscode-langservers-extracted typescript-language-server typescript @fsouza/prettierd eslint_d

.PHONY: bootstrap
bootstrap:
	cd ~ || exit
	git clone --separate-git-dir="$(HOME)/.dotfiles" https://github.com/jssee/.dotfiles.git tmp_dotfiles
	rsync --recursive --verbose --exclude ".git" --exclude "README.md" --no-perms tmp_dotfiles/ $(HOME)/
	rm -r tmp_dotfiles
	source $(HOME)/.zshrc
	dg s

.PHONY: all
all: brew asdf

brew:
	is-executable $@ || curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh | bash
	brew update
	brew upgrade
	brew bundle --file=$(HOME)/.local/share/install/Brewfile

asdf:
	is-executable $@ || git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.8.1
	. $(HOME)/.asdf/asdf.sh
	for PKG in $(ASDF_NPM_PACKAGES); do echo $$PKG >> $(HOME)/.default-npm-packages; done
	for PLUGIN in $(ASDF_PLUGINS); do asdf plugin add $$PLUGIN https://github.com/asdf-vm/asdf-$$PLUGIN.git; done
	for PLUGIN in $(ASDF_PLUGINS); do asdf install $$PLUGIN latest; done
	for PLUGIN in $(ASDF_PLUGINS); do asdf global $$PLUGIN latest; done
	asdf update
# vim: set tabstop=4:softtabstop=4:shiftwidth=4:noexpandtab
