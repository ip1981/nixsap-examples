{ pkgs, ... }:
{
  programs.bash = {
    completion.enable = true;
    promptInit = ''
      LIGHT_BLUE="\[\033[1;34m\]"
      BLACK="\[\033[0;30m\]"
      BLUE="\[\033[0;34m\]"
      GREEN="\[\033[0;32m\]"
      CYAN="\[\033[0;36m\]"
      RED="\[\033[0;31m\]"
      PURPLE="\[\033[0;35m\]"
      BROWN="\[\033[0;33m\]"
      LIGHT_GRAY="\[\033[0;37m\]"

      DARK_GRAY="\[\033[1;30m\]"
      LIGHT_BLUE="\[\033[1;34m\]"
      LIGHT_GREEN="\[\033[1;32m\]"
      LIGHT_CYAN="\[\033[1;36m\]"
      LIGHT_RED="\[\033[1;31m\]"
      LIGHT_PURPLE="\[\033[1;35m\]"
      YELLOW="\[\033[1;33m\]"
      WHITE="\[\033[1;37m\]"

      NO_COLOUR="\[\033[0m\]"

      DEFAULT_COLOUR=$LIGHT_GRAY
      PATH_COLOUR=$LIGHT_BLUE
      HOST_COLOUR=$YELLOW

      if_root() {
        case "$(id -u)" in
          0) echo "$1";;
          *) echo "$2";;
        esac
      }

      export PS1=$(cat << PS1
      $DEFAULT_COLOUR
      (\$(date -R))
      [\$(if_root "$RED" "$GREEN")\u$DEFAULT_COLOUR@$HOST_COLOUR\h$DEFAULT_COLOUR:$PATH_COLOUR\w$DEFAULT_COLOUR]
      \$(if_root '#' '$') $NO_COLOUR
      PS1
      )
    '';
  };

  environment.variables = {
    HISTFILE = "/dev/null";
    HISTIGNORE = "&";
    MYSQL_HISTFILE = "/dev/null";
    PSQL_HISTORY = "/dev/null";
  };

  environment.shellAliases = {
    grep = "grep --color=auto";
    rm = "rm -i";
    sudo = "sudo ";
  };

  environment.systemPackages = with pkgs;
    [
      curl.bin
      file
      htop
      iftop
      inetutils
      iotop
      jq
      lsof
      mtr
      ncdu
      nmap
      openssl.bin
      pigz
      pv
      pwgen
      pxz
      sysstat
      tcpdump
      tmux
      traceroute
      tree
    ];
}
