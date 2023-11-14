{ lib }:
let

  link = url: text: ''[${text}](${url})'';

  serviceRef = fragment:
    ''See ${link "https://docs.docker.com/compose/compose-file/05-services/#${fragment}" "Docker Compose Services #${fragment}"}'';

  networkRef = fragment:
    ''See ${link "https://docs.docker.com/compose/compose-file/06-networks/#${fragment}" "Docker Compose Network #${fragment}"}'';

  secretRef = fragment:
    ''See ${link "https://docs.docker.com/compose/compose-file/09-secrets/#${fragment}" "Docker Compose Secrets #${fragment}"}'';

in
{
  inherit
    link
    networkRef
    serviceRef
    secretRef
    ;
}
