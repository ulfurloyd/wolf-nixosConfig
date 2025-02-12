{
  networking = {
    wireless = {
      enable = true;
      userControlled.enable = true;
      networks =  {
        "ACT_5G" = {
          pskRaw = "f36bdb9db3c05809bab35ac05ebe68b36304638b82012eb6cb94114f1e7267e0";
          priority = 99;
        };

        "AndroidAP258A" = {
          pskRaw = "18b9b05829cd47bdb2af7bdd8100cee218cc179ae7ebf91527ddc51d7907a7f4";
          priority = 98;
        };

        "XIMI_STUDENT" = { };
      };
    };
  };
}
