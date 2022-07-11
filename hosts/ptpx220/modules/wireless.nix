{
  # Configures a list of networks I want to connect to.
  # NOT: $ mkpasswd -m sha-512
  # $ wpa_passphrase SSID password
  networking.wireless.networks = { 
    Pixel_1852.pskRaw = "0929bd89543ec23ee382b47273b1e54cf79692acc40e4067a56ae662dc553a5a";
    AndroidAP_1445.pskRaw = "4b078244546e82f5f3d555283c4400dba6e6089b6baf452500c2e2aa4f556f09";
    Astral_Ship_5GHz.pskRaw = "157bddfe695338f0fc6a2cfa88dbb6134a3489579f7e748714fa1ae2e8a82192";
    Astral_Ship.pskRaw = "ff866b7b9494bd6915c28a06c8604d1e2396e590e64f71b2fdf9c0c9709ec2c4";
    Astral_ship_Festri.pskRaw = "a20c6252f348eddc73efc0a0956c7cf66c958a327d7d7b943d72cf477008d8f2";
    DoESLiverpool.pskRaw = "63e49f779a41eda7be1510a275a07e519d407af706d0f2d3cc3140b9aecd412f"; 
    bebop = { 
      pskRaw = "0c89c6e287005f99efda5199d432f94cf8d08ea7925ba2d24eef24e268aabe67"; 
      priority = 10; 
    }; 
  };
}
