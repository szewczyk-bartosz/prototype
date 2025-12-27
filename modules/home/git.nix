{ config, ... }:

{
  programs.git = {
    enable = true;

    userName = config.mikoshi.git.userName;
    userEmail = config.mikoshi.git.userEmail;

    extraConfig = {
      init = {
        defaultBranch = "main";
      };
      pull = {
        rebase = false;
      };
      push = {
        autoSetupRemote = true;
      };
    };

    aliases = {
      co = "checkout";
      br = "branch";
      ci = "commit";
      st = "status";
      unstage = "reset HEAD --";
      last = "log -1 HEAD";
      visual = "log --graph --oneline --all";
    };
  };
}
