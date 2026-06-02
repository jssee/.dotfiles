.PHONY: all
all: brew macos check_shell

macos:
	$(HOME)/.local/bin/setup_macos

brew:
	@if ! command -v brew >/dev/null 2>&1; then \
		/bin/bash -c "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" || exit 1; \
	fi; \
	if command -v brew >/dev/null 2>&1; then \
		brew_path="$$(command -v brew)"; \
	elif [ -x /opt/homebrew/bin/brew ]; then \
		brew_path=/opt/homebrew/bin/brew; \
	elif [ -x /usr/local/bin/brew ]; then \
		brew_path=/usr/local/bin/brew; \
	else \
		echo "brew not found after install" >&2; \
		exit 1; \
	fi; \
	eval "$$($$brew_path shellenv)"; \
	brew update; \
	brew upgrade; \
	brew bundle

check_shell:
	@fish_path="$$(command -v fish)"; \
	if [ -z "$$fish_path" ]; then \
		echo "fish not found; run 'make brew' first" >&2; \
		exit 1; \
	fi; \
	if [ "$$SHELL" != "$$fish_path" ]; then \
		echo "Changing shell to fish..."; \
		if ! grep -Fxq "$$fish_path" /etc/shells; then \
			echo "$$fish_path" | sudo tee -a /etc/shells >/dev/null; \
		fi; \
		chsh -s "$$fish_path"; \
	else \
		echo "Current shell is fish."; \
	fi
# vim: set tabstop=4:softtabstop=4:shiftwidth=4:noexpandtab
