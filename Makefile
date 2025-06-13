FISH_PATH := grep "fish" /etc/shells

.PHONY: all
all: brew macos check_shell

macos:
	$(HOME)/.local/share/install/macos

brew:
	which $@ &> /dev/null || /bin/bash -c "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	brew update
	brew upgrade
	brew bundle

check_shell:
	@if [ "$$SHELL" != "$$(command -v fish)" ]; then \
		echo "Changing shell to fish..."; \
		$(FISH_PATH) | xargs chsh -s; \
		else \
		echo "Current shell is fish."; \
		fi
# vim: set tabstop=4:softtabstop=4:shiftwidth=4:noexpandtab
