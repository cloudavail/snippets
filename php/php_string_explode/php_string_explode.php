<?php
$request_path = "/path/file?query=21";
$path_split = explode("/", $request_path);
echo "The first part of the URI is: " . $path_split[1] . "\n" ;
echo "The second part of the URI is: " . $path_split[2] . "\n" ;
?>