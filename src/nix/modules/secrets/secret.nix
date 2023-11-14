{ config, lib, options, ... }:

let
  inherit (lib)
    mkOption
    optionalAttrs
    types
    ;
  inherit (import ../../lib.nix { inherit lib; })
    secretRef
    ;
in
{
  options = {
    file = mkOption {
      description = ''
        Sets the secret's value to this file.
        ${secretRef "secrets"}
      '';
      type = either path str;
    };
    external = mkOption {
      defaultText = false;
      description = ''
        Whether the value of this secret is set via other means.
        ${secretRef "secrets"}
      '';
      type = types.bool;
    };
  };

  config = {
    out =
      lib.mapAttrs
        (k: opt: opt.value)
        (lib.filterAttrs
          (k: opt: opt.isDefined)
          {
            inherit (options)
              file
              external
              ;
          }
        );
  };
}
