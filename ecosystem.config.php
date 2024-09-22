<?php

$config = [
    'apps' => [
        [
            'name' => 'account',
            'script' => 'index.js',
            'path' => './repos/account/'
        ]
    ]
];

file_put_contents('ecosystem.config.json', json_encode($config));
