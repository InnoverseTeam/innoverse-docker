<?php

$config = [
    'apps' => [
        [
            'name' => 'innoverse',
            'script' => './repos/index.php',
            'watch' => true,
            'env' => [
                'NODE_ENV' => 'development'
            ],
            'env_production' => [
                'NODE_ENV' => 'production'
            ]
        ],
        [
            'name' => 'account',
            'script' => './repos/index.php',
            'watch' => true,
            'env' => [
                'NODE_ENV' => 'development'
            ],
            'env_production' => [
                'NODE_ENV' => 'production'
            ]
        ],
        [
            'name' => 'innoverse-ui',
            'script' => './repos/index.php',
            'watch' => true,
            'env' => [
                'NODE_ENV' => 'development'
            ],
            'env_production' => [
                'NODE_ENV' => 'production'
            ]
        ],
        [
            'name' => 'proxy',
            'script' => './repos/index.php',
            'watch' => true,
            'env' => [
                'NODE_ENV' => 'development'
            ],
            'env_production' => [
                'NODE_ENV' => 'production'
            ]
        ],
    ]
];
