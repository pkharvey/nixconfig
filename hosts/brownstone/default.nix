{ config, pkgs, ... }:

{
  # Enable F-Droid and the F-Droid privileged extension
  apps.fdroid.enable = true;

  # Disable the LineageOS Updater
  source.dirs."packages/apps/Updater".enable = false;

  device = "hlte";
  flavor = "lineageos";
  androidVersion = 11;
}
