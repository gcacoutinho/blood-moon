{
  description = ''
    Simple flake to learn nix and learn pentest.
  '';

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs =
    { self, nixpkgs }@inputs:
    {
      devShells.aarch64-darwin.default =
        let
          pkgs = nixpkgs.legacyPackages.aarch64-darwin;
        in
        pkgs.mkShell {
          shellHook = ''
            export IN_NIX_SHELL=1
            ./utils/greeting.sh

            if [ -n "$ZSH_VERSION" ]; then
              setopt PROMPT_SUBST 2>/dev/null || true
              export PROMPT="(nix:%1~) $PROMPT"
            elif [ -n "$BASH_VERSION" ]; then
              export PS1="(nix:\W) $PS1"
            else
              export PS1="(nix) $PS1"
            fi
          '';

           packages = [
             pkgs.thc-hydra
             pkgs.crunch
             pkgs.mitmproxy
             pkgs.metasploit
             pkgs.hping
             pkgs.nmap
             pkgs.netcat
             pkgs.tcpdump
             pkgs.ripgrep
             pkgs.jq
             pkgs.msfpc
             pkgs.openvpn
             pkgs.wireshark
             pkgs.termshark
             pkgs.unzip
             pkgs.sqlmap
             pkgs.dnsrecon
             pkgs.dnsenum
             pkgs.exploitdb
             pkgs.go-exploitdb
             pkgs.htop
             pkgs.curl
             pkgs.wget
             pkgs.git
             pkgs.responder
             pkgs.whois
             pkgs.hashcat
             pkgs.hashcat-utils
             pkgs.freerdp
             pkgs.openssh
             pkgs.samba
             pkgs.gdb
             pkgs.gobuster
             pkgs.nbtscan
             pkgs.nbtscanner
             pkgs.enum4linux
             pkgs.john
             pkgs.nikto
             pkgs.socat
             pkgs.python3
             pkgs.ruby
             pkgs.perl
             pkgs.ffuf
           ]
           ++ (
             if builtins.getEnv "ALLOW_UNFREE" == "1" || (inputs.allowUnfree or false) then
               [
                 pkgs.unrar
                 pkgs.burpsuite
               ]
             else
               [ ]
           )
           ++ (
             if builtins.getEnv "ALLOW_BROKEN" == "1" || (inputs.allowBroken or false) then
               [
                 pkgs.tigervnc # Broken as of Nov/03
                 pkgs.bettercap # Broken as of Nov/03
               ]
             else
               [ ]
           )
           ++ [
             # I need to check these later
             # pkgs.smbmap # need to change base python version
             # pkgs.smbscan # need to change base python version
             # pkgs.enum4linux-ng # need to change base python version
           ];
        };
    };
}
