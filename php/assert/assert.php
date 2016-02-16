<?php

# Array $fixture has no elements and we assert sizeof $fixture == 0
# assertion will pass
$fixture = Array();
assert(sizeof($fixture) == 0);

# Array $fixture has one elements and we assert sizeof $fixture == 1
# assertion will pass
$fixture = "new_element";
assert(sizeof($fixture) == 1);

# Array $fixture has one elements and we assert sizeof $fixture == 0
# assertion will fail
assert(sizeof($fixture) == 0);

?>
