{
  programs.git = {
    enable = true;

    extraConfig = {
      user = {
        name = "Rotem Horesh";
        email = "horesh.rotem@gmail.com";
        signingkey = "2EB4713F273AA239";
      };
      core = {
        editor = "nvim";
      };
      init = {
        defaultBranch = "main";
      };
      commit = {
        gpgSign = true;
      };
    };
  };
}
