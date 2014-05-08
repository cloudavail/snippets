# how to run:
# set your test_dir as appropriate
# when running, ensure to enable the "future" parser
# puppet apply for_loop_create_directories.pp --parser future

$test_dir = '/Temp/snippets/puppet/for_loop_create_directories'

$dirs_to_create = [ "$test_dir/.npm", "$test_dir/node_modules", "$test_dir/tmp" ]

each($dirs_to_create) |$directory| {
  file { $directory:
      ensure  => directory,
  }  
}