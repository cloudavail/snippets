# objective:
# inputs:
## user provides name of resource
## user provides an array of values
# outputs:
## a file is created that is equal to name
## inside file the array of values is printed

# creates a configuration_one resource
configuration {'configuration_one':
  file_content => 'this is configuration one',
}

# creates a configuration_two resource
configuration {'configuration_two':
  file_content => 'this is configuration two',
}

file { '/Temp/basic_defined_resource':
  ensure => directory,
}

define configuration ($file_content) {
# $name is, by convention, the name of the calling resource
  file { "/Temp/basic_defined_resource/${name}.txt":
    ensure  => present,
    content => $file_content,
  }

}
