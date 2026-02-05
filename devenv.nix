{ pkgs, ... }:

{
  languages.ruby = {
    enable = true;
    # Explicitly use the official Nix package for Ruby 3.4
    package = pkgs.ruby_3_4;
    
    # Disable Nix bundler management. 
    # This allows you to run 'bundle install' normally and use pre-compiled binaries from RubyGems.
    bundler.enable = false;
  };

  packages = [
    # Standard libraries required to compile common gems (like Nokogiri, pg, etc.)
    pkgs.gnumake
    pkgs.pkg-config
    pkgs.openssl
    pkgs.libyaml
    pkgs.zlib
    pkgs.libiconv # Essential for macOS compatibility
  ];

  enterShell = ''
    echo "Ruby $(ruby -v) environment loaded."
  '';
}