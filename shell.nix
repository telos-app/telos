{pkgs ? import <nixpkgs> {}}:
pkgs.mkShell {
  nativeBuildInputs = with pkgs; [
    pkg-config
    gobject-introspection
    cargo
    rustc
    cowsay
    nodejs_24
    pnpm
  ];

  buildInputs = with pkgs; [
    at-spi2-atk
    atkmm
    cairo
    gdk-pixbuf
    glib
    gtk3
    harfbuzz
    librsvg
    libsoup_3
    pango
    webkitgtk_4_1
    openssl
    gsettings-desktop-schemas
  ];

  GREETING = "DEV MODE ON";

  shellHook = ''
        echo $GREETING | cowsay

    export GDK_PIXBUF_MODULE_FILE=$(echo ${pkgs.librsvg}/lib/gdk-pixbuf-2.0/*/loaders.cache)

    export XDG_DATA_DIRS=${pkgs.gsettings-desktop-schemas}/share/gsettings-schemas/${pkgs.gsettings-desktop-schemas.name}:${pkgs.gtk3}/share/gsettings-schemas/${pkgs.gtk3.name}:$XDG_DATA_DIRS
  '';
}
