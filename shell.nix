{
  pkgs ? import <nixpkgs> { },
}:

pkgs.mkShell {
  buildInputs = with pkgs; [
    python312 # Python 3.12
    uv # Python package manager
    nixfmt # Nix formatter
    just # Just
  ];

  # Shell hook to set up environment
  shellHook = ''
    export TMPDIR=/tmp
    just install
  '';
}
