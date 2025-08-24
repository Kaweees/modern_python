{
  pkgs ? import <nixpkgs> { },
}:

pkgs.mkShell {
  buildInputs = with pkgs; [
    python311 # Python 3.11
    uv # Python package manager
    nixfmt # Nix formatter
    just # Just
  ];

  # Shell hook to set up environment
  shellHook = ''
    just install
  '';
}
