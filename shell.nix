{ pkgs ? import <nixpkgs> { } }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    python311 # Python 3.11
    uv # Python package manage
    just # Just
    nixfmt-classic # Nix formatterr
  ];

  # Shell hook to set up environment
  shellHook = ''
    just install
  '';
}
