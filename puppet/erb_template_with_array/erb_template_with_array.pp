# to run, copy the file mytemplate.erb into /var/tmp
# next run puppet apply erb_template_with_array.pp
# a file named /var/tmp/mytemplate_result.txt will be generated from the erb
# template

$cities_in_california_zero = [ ] 
$cities_in_california_one = [ 'San Francisco' ] 
$cities_in_california_two = [ 'San Francisco', 'Berkeley' ] 

file { 'mytemplate':
  ensure  => present,
  path    => '/var/tmp/mytemplate_result.txt',
  mode    => '0660',
  content => template('/var/tmp/mytemplate.erb')
}
