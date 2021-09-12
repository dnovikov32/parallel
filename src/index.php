<?php

use parallel\Runtime;

//$runtime = new Runtime;
//$future = $runtime->run(function(){
//    return "World";
//});
//printf("Hello %s\n", $future->value());

$runtime = new Runtime();

$future = $runtime->run(function(){
    for ($i = 0; $i < 1150000; $i++) {
        echo "*";
    }

    return "easy";
});

for ($i = 0; $i < 1150000; $i++) {
    echo ".";
}

printf("\nUsing parallel Runtime is %s\n", $future->value());