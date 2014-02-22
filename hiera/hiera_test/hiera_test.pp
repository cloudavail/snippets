# requires an /etc/hiera.yaml file - a sample is provided below:
# :backends:
#   - yaml
# :yaml:
#   :datadir: $path_to_snippets_repo/hiera/hiera_test
# :hierarchy:
#   - common
# puppet apply hiera_test.pp --hiera_config=/etc/hiera.yaml 

$my_value = hiera('my_value')
notify {"The value is: $my_value": }