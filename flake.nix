{
  inputs = {
    pkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    prisma-utils.url = "github:VanCoding/nix-prisma-utils";
  };

  outputs =
    { pkgs, prisma-utils, ... }:
    let
      nixpkgs = import pkgs { system = "x86_64-linux"; };
      prisma =
        (prisma-utils.lib.prisma-factory {
          inherit nixpkgs;
          prisma-fmt-hash = "sha256-0mBGI+K+LmnJEZQxpIYQ/MqPkJxxQfhPFF1450p7pe0=";
          query-engine-hash = "sha256-Y3fNfhiSoKcWqBhAiNqNQjfxukrCYDSsoj0X+X04Mz0=";
          libquery-engine-hash = "sha256-Mksu9PgU30lN+vABNYMP88rhqwI5dWZv463qQfKTzkM=";
          schema-engine-hash = "sha256-Xtaf4pdnEiVuqTNWESYLC3iV7CWeT/S8fN2N/AQvZK8=";
        }).fromNpmLock
          ./blyackend/package-lock.json; # <--- path to our package-lock.json file that contains the version of prisma-engines
    in
    {
      devShells.x86_64-linux.default = nixpkgs.mkShell { 
        shellHook = prisma.shellHook + ''
        ''; 

        buildInputs = [
          nixpkgs.nodejs
          nixpkgs.openssl
          nixpkgs.nodePackages.typescript
          nixpkgs.nodePackages.typescript-language-server
        ];
      };
    };
}
