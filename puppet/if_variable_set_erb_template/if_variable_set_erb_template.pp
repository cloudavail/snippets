# to run, copy the file mytemplate.erb into /var/tmp
# next run puppet apply if_variable_set_erb_template.pp
# a file named /var/tmp/mytemplate_result.txt will be generated from the erb
# template

# objective: if a given variable is set, use the variable value
# objective 2: if a given variable is not set, catch with "else" and execute
# a different block of code

$variable_with_value = 'San Francisco'
$variable_without_value = ''


file { 'mytemplate':
  ensure  => present,
  path    => '/var/tmp/mytemplate_result.txt',
  mode    => '0660',
  content => template('/var/tmp/mytemplate.erb')
}
