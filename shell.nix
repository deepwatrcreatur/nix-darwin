{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  # Define the packages you want in your environment
  buildInputs = with pkgs; [
    bash
];

  # Optional: Set environment variables or run shell commands
  shellHook = ''
    echo "Welcome to your Nix shell environment!"
    export PS1="nix-shell:\w\$ "  # Customize the prompt
  '';
}
