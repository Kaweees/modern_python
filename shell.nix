{
  pkgs ? import <nixpkgs> { },
}:

pkgs.mkShell {
  buildInputs = with pkgs; [
    python312 # Python 3.12
    uv # Python package manager
    nixfmt # Nix formatter
    just # Just
    stdenv.cc.cc.lib # C++ standard library
  ];

  # Shell hook to set up environment
  shellHook = ''
    export TMPDIR=/tmp
    export UV_PYTHON="${pkgs.python312}/bin/python"
    export LD_LIBRARY_PATH="${pkgs.stdenv.cc.cc.lib}/lib:$LD_LIBRARY_PATH"
    just install
  '';
}
