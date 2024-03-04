ASDF_PLUGINS := nodejs erlang elixir ruby

.PHONY: all
all: brew asdf macos

macos:
	$(HOME)/.local/share/install/macos

brew:
	which $@ &> /dev/null || curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh | bash
	brew update
	brew upgrade
	brew bundle

asdf:
	which $@ &> /dev/null || git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.0
	. $(HOME)/.asdf/asdf.sh
	for PLUGIN in $(ASDF_PLUGINS); do asdf plugin add $$PLUGIN https://github.com/asdf-vm/asdf-$$PLUGIN.git; done
	for PLUGIN in $(ASDF_PLUGINS); do asdf install $$PLUGIN latest; done
	for PLUGIN in $(ASDF_PLUGINS); do asdf global $$PLUGIN latest; done
	asdf update
# vim: set tabstop=4:softtabstop=4:shiftwidth=4:noexpandtab
