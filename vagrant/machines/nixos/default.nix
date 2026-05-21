{ ... }:
{
  imports = [ ./infra <modules> ];

  nixsap.deployment.keyrings.root = [ "/run/keys/foo" ];
}

