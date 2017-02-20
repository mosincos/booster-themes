#/usr/bin/env bash

themename=purplerage
themeauthor="Booster"
themepkg="Purple-Rage"
themeinput="/home/booster/.local/github/booster-themes"
themeoutput="$themeinput/output/$themepkg"

function compiletheme {
  cp $themeinput/common/index.theme $themeoutput/index.theme
  sed -i 's|^Name=.*$|Name=Booster-Purple-Rage|' $themeoutput/index.theme
}

function nodeinstall {
  if [ ! -d "$themeinput/node_modules" ]; then
    npm install gulp-sass gulp-rename gulp
  fi
}

function convertsvg {
  for f in *.svg
  do
    echo Rendering ${f%%.*}.png
    inkscape --export-background-opacity=0 --export-png=${f%%.*}.png ${f%%.*}.svg > /dev/null \
    && optipng -o7 --quiet ${f%%.*}.png \
    && rm ${f%%.*}.svg
  done
}

function convertshell {
  cd "$themeoutput/gnome-shell/assets/checkbox"
  convertsvg
  cd "$themeoutput/gnome-shell/assets/dash"
  convertsvg
  cd "$themeoutput/gnome-shell/assets/menu"
  convertsvg
  cd "$themeoutput/gnome-shell/assets/misc"
  convertsvg
  cd "$themeoutput/gnome-shell/assets/panel"
  convertsvg
  cd "$themeoutput/gnome-shell/assets/switch"
  convertsvg
}


function compileshell {
  mkdir -p "$themeoutput/gnome-shell/"
  cp -r "$themeinput/common/gnome-shell/3.22/assets" "$themeoutput/gnome-shell/assets"
  cp -r "$themeinput/common/gnome-shell/3.22/gnome-shell-dark.css" "$themeoutput/gnome-shell/gnome-shell.css"
  convertshell
}

function compilegtk2 {
  mkdir -p "$themeoutput/gtk-2.0/"
  cd "$themeinput/common/gtk-2.0"
  sh ./render-assets.sh

  cp -r "$themeinput/common/gtk-2.0/assets/" "$themeoutput/gtk-2.0/assets"
  cp $themeinput/common/gtk-2.0/*.rc "$themeoutput/gtk-2.0/"
  cp -r "$themeinput/common/gtk-2.0/gtkrc" "$themeoutput/gtk-2.0/gtkrc"
  cp -r "$themeinput/common/gtk-2.0/menubar-toolbar" "$themeoutput/gtk-2.0/"
}

function compilegtk3 {
  mkdir -p "$themeoutput/gtk-3.0/"
  cd "$themeinput/common/gtk-3.0/3.22/"
  sh ./render-assets.sh

  cp -r "$themeinput/common/gtk-3.0/3.22/assets/" "$themeoutput/gtk-3.0/"
  cp -r "$themeinput/common/gtk-3.0/3.22/gtk-solid-dark.css" "$themeoutput/gtk-3.0/gtk.css"
}

function compileall {
  compileshell
  compilegtk2
  compilegtk3
  compiletheme
}

rm -rf $themeinput/output/
mkdir -p "$themeoutput"

nodeinstall
gulp
compileall
