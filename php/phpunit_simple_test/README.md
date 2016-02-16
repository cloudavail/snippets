# Overview

# Running carTests
The following command will run all unit tests located in the CarTest.php file.
`./phpunit CarTest`



# Installing phpunit
phpunit has been installed already and checked into the codebase - so you don't need to install phpunit. Note that the steps for installing phpunit are described below.
## Install Composer in current directory
`curl -sS https://getcomposer.org/installer | php`
## Install phpunit
`./composer.phar require phpunit/phpunit`

## Create phpunit link to allow easy execution
The command below will allow running of phpunit test at "root" of project.
`ln -s vendor/phpunit/phpunit/phpunit phpunit`

