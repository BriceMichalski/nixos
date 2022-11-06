{ config, lib, ... }:

with lib;

{
  options = {
    secrets = mkOption {
      type = types.attrs;
    };
  };

  config = {
    secrets = (lib.trivial.importJSON ./secrets.json);
  };
}
