<?php
    header('HTTP/1.1 426 Upgrade Required', true, 426);
    // php versions greater than 5.4 can use the following:
    // http_response_code(426);
?>