<?php

$config = [
    'apps' => [
        [
            'name' => 'account',
            'script' => 'index.js',
            'path' => './repos/account/'
        ]
    ],
    'apps' => [
        [
            'name' => 'Innoverse-Patcher',
            'path' => './repos/Innoverse-Patcher/'
        ]
    ]
];

file_put_contents('ecosystem.config.json', json_encode($config));
