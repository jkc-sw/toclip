{
  description = "A simple bash script that copy text to local or remote clipboard from stdin or arguments.";

  inputs = {
    # Nixpkgs / NixOS version to use.
    nixpkgs.url = "nixpkgs/nixos-21.05";
    # utils for flake
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system: let
      name = "toclip";
      version = "1.0.0";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      # Provide some binary packages for selected system types.
      packages = rec {
        toclip = pkgs.callPackage (import ./toclip.nix) {};
        default = toclip;
      };
    });

    # # A Nixpkgs overlay.
    # overlay = final: prev: {
    #   hello = with final; stdenv.mkDerivation rec {
    #     name = "hello-${version}";
    #     unpackPhase = ":";
    #     buildPhase =
    #       ''
    #         cat > hello <<EOF
    #         #! $SHELL
    #         echo "Hello Nixers!"
    #         EOF
    #         chmod +x hello
    #       '';
    #     installPhase =
    #       ''
    #         mkdir -p $out/bin
    #         cp hello $out/bin/
    #       '';
    #   };
    # };

    # # Tests run by 'nix flake check' and by Hydra.
    # checks = forAllSystems
    #   (system:
    #     with nixpkgsFor.${system};
    #
    #     {
    #       inherit (self.packages.${system}) hello;
    #
    #       # Additional tests, if applicable.
    #       test = stdenv.mkDerivation {
    #         name = "hello-test-${version}";
    #
    #         buildInputs = [ hello ];
    #
    #         unpackPhase = "true";
    #
    #         buildPhase = ''
    #           echo 'running some integration tests'
    #           [[ $(hello) = 'Hello Nixers!' ]]
    #         '';
    #
    #         installPhase = "mkdir -p $out";
    #       };
    #     }
    #   );
}

/*
  SOURCE_THESE_VIMS_START
  nnoremap <leader>ne <cmd> silent execute "!tmux send-keys -t :.+1 'time { nix flake check --all-systems --show-trace }' Enter"<cr>
  nnoremap <leader>no <cmd> silent execute "!tmux send-keys -t :.+1 'time { nix build . }' Enter"<cr>
  echom 'Sourced'
  SOURCE_THESE_VIMS_END
*/

# vim:et ts=2 sts=2 sw=2
