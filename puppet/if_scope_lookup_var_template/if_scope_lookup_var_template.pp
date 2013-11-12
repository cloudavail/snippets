# to run, copy the file mytemplate.erb into /var/tmp
# next run puppet apply if_scope_lookup_var_template.pp
# a file named /var/tmp/mytemplate_result.txt will be generated from the erb
# template

# objective: if a value is set, create a template that contains a particular
# string else write a different string.

$os = $::operatingsystem

file { 'mytemplate':
  ensure  => present,
  path    => '/var/tmp/mytemplate_result.txt',
  mode    => '0660',
  content => template('/var/tmp/mytemplate.erb')
}
