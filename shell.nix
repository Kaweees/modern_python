{ pkgs ? import <nixpkgs> { } }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    git # Git
    python311 # Python 3.11
    uv # Python package manager
    just # Just
    nixfmt-classic # Nix formatter
  ];

  # Shell hook to set up environment
  shellHook = ''
    just install
  '';
}
