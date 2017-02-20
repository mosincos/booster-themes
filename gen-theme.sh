#/usr/bin/env bash
themedata="/home/booster/.local/github/booster-themes"
themename=purplerage

function compileshell {
  mkdir -p "$themedata/output/gnome-shell/3.22/"
  cp -r "$themedata/common/gnome-shell/3.22/common-assets" "$themedata/output/gnome-shell/3.22/assets-$themename"
  cp -r "$themedata/common/gnome-shell/3.22/dark-assets/checkbox" "$themedata/output/gnome-shell/3.22/assets-$themename"
  cp -r "$themedata/common/gnome-shell/3.22/dark-assets/menu" "$themedata/output/gnome-shell/3.22/assets-$themename"
  cp -r "$themedata/common/gnome-shell/3.22/dark-assets/misc" "$themedata/output/gnome-shell/3.22/assets-$themename"
  cp -r "$themedata/common/gnome-shell/3.22/dark-assets/switch" "$themedata/output/gnome-shell/3.22/assets-$themename"
  cp -r "$themedata/common/gnome-shell/3.22/gnome-shell-dark.css" "$themedata/output/gnome-shell/3.22/gnome-shell-$themename.css"
}

function compilegtk2 {
  mkdir -p "$themedata/output/gtk-2.0/"
  cd "$themedata/common/gtk-2.0"
  sh ./render-assets.sh

  cp -r "$themedata/common/gtk-2.0/assets/" "$themedata/output/gtk-2.0/assets-$themename"
  cp $themedata/common/gtk-2.0/*.rc "$themedata/output/gtk-2.0/"
  cp -r "$themedata/common/gtk-2.0/gtkrc-dark" "$themedata/output/gtk-2.0/gtkrc-$themename"
}

function compilegtk3 {
  mkdir -p "$themedata/output/gtk-3.0/3.22/"
  cd "$themedata/common/gtk-3.0/3.22/"
  sh ./render-assets.sh

  cp -r "$themedata/common/gtk-3.0/3.22/assets/" "$themedata/output/gtk-3.0/3.22/assets-$themename/"
  cp -r "$themedata/common/gtk-3.0/3.22/gtk-solid-dark.css" "$themedata/output/gtk-3.0/3.22/gtk-$themename.css"
}

rm -rf $themedata/output/

compileshell
compilegtk2
compilegtk3
