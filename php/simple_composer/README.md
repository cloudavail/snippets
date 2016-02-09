# Overview:
This snippet will describe how to utilize composer for php Package Management.

# Install Composer
`curl -sS https://getcomposer.org/installer | php`
Note that composer can be installed anywhere on your system - composer does not need to be installed within a repository, for instance.

# Create a composer.json File
A composer.json file can be created one of two ways:

## Manually creating composer.json File
cat > ./composer.json <<EOF
{
    "require": {}
}
EOF

## Interactively creating composer.json File
`php composer.phar init`

# Adding Requirements to a composer.json File

## Manually
1. Open the composer.json file
2. In the "require" attribute section, add a requirement such as `aws/aws-sdk-php`

An example is below:

{
    "name": "cloudavail/snippets",
    "authors": [
        {
            "name": "Colin Johnson",
            "email": "colinbjohnson@gmail.com"
        }
    ],
    "require": {
        "aws/aws-sdk-php": "^3.14"
    }
}

## Automatically
`composer require aws/aws-sdk-php`
The automate method will download the requirements into the `./vendor` directory within your php project.

# Install Dependencies
To install dependencies, run the following:
`php composer.json install`

# The composer.lock File
When installing dependencies, composer writes the actual installed versions of a package into the `composer.lock` file. This file can be manually edited - but allowing composer to manage this file will ensure greater consistency.

# Questions:
1. Where are these packages gotten from? The main Composer repository is "Packagist" at https://packagist.org/.