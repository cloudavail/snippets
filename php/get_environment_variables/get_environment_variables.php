<?php
// run with MY_VARIABLE='testing' php get_environment_variables.php

// if getenv('MY_VARIABLE') exists it is a string
// if getenv('MY_VARIABLE') does not exist it is a boolean
// getenv('MY_VARIABLE') == true evaluates true
// getenv('MY_VARIABLE') === true always evaluates false

if (getenv('MY_VARIABLE') == true) {
	$my_variable = getenv('MY_VARIABLE');
    echo "MY_VARIABLE was set in the environment and is set to \"$my_variable.\"\n" ;
}
else {
    echo "MY_VARIABLE was not set." ;
}

$my_variable_type = gettype(getenv('MY_VARIABLE'));
echo "MY_VARIABLE type is $my_variable_type.\n";

?>