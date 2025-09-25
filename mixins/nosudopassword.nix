{
  security.sudo.extraRules = [{
    users = [ "pasha" ];
    commands = [{
      command = "ALL";
      options = [ "NOPASSWD" ];
    }];
  }];
}
