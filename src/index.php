<?php

$runtime = new parallel\Runtime;
$future = $runtime->run(function(){
    return "World";
});
printf("Hello %s\n", $future->value());