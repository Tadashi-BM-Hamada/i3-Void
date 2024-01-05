# !/usr/bin/env /bash
# This is an install script for setting up Void Linux musl the way I did
# All credit for this i3 rice goes to Luke Smith on github
# All credit for everything goes to their respective owners
#

# Update Void Linux
update() {
	echo "Updating Void Linux:"
	sudo xbps-install -Su
}

srcpkg_install() {
	echo "Installing Void Linux src-pkgs:"
	sudo xbps-install -S util-linux tar coreutils binutils
	mkdir "$HOME"/.local/pkgs && cd "$HOME"/.local/pkgs || exit
	git clone https://github.com/void-linux/void-packages.git
	cd void-packages || exit
	./xbps-src binary-bootstrap
}

dep_install() {
	echo "Installing dependencies for this setup:"
	while IFS= read -r package; do
		sudo xbps-install -S "$package"
	done <dependencies.txt
}

copy_files() {
	echo "Copying config files:"
	cp -rf .calcurse "$HOME"
	cp -rf .config "$HOME"
	cp -rf .dbus "$HOME"
	cp -rf .local "$HOME"
	cp -rf .pki "$HOME"
	cp -rf .scripts "$HOME"
	cp -rf .vim "$HOME"
	cp -rf .Renviron "$HOME"
	cp -rf .Rprofile "$HOME"
	cp -rf .Xauthority "$HOME"
	cp -rf .Xdefaults "$HOME"
	cp -rf .bash_history "$HOME"
	cp -rf .bash_logout "$HOME"
	cp -rf .bashrc "$HOME"
	cp -rf .fehbg "$HOME"
	cp -rf .gtkrc-2.0 "$HOME"
	cp -rf .i3blocks.conf "$HOME"
	cp -rf .inputrc "$HOME"
	cp -rf .tmux.conf "$HOME"
	cp -rf .urlview "$HOME"
	cp -rf .viminfo "$HOME"
	cp -rf .vimrc "$HOME"
	cp -rf .xinitrc "$HOME"
	cp -rf pic.jpg "$HOME"
}
