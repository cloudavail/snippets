# to run, copy the file mytemplate.erb into /var/tmp
# next run puppet apply basic_erb_template.pp
# a file named /var/tmp/mytemplate_result.txt will be generated from the erb
# template

$my_variable = 'San Francisco'

file { 'mytemplate':
  ensure  => present,
  path    => '/var/tmp/mytemplate_result.txt',
  mode    => '0660',
  content => template('/var/tmp/mytemplate.erb')
}
