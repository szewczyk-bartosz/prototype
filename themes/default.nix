{
    akasara = (import ./akasara.nix) // {
        wallpaper = ../wallpapers/cyberpunk-wallpaper.png;
    };
    sane = (import ./sane.nix) // {
        wallpaper = ../wallpapers/cyberpunk-wallpaper.png; # Using same wallpaper for now
    };
}
