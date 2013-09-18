#!/bin/bash
virtual_environment_name="my_app"
my_script="/Temp/my_app.py"
modules_to_install="boto mysql-connector-python"

mkdir -p /Temp
cd /Temp

echo "Creating a Python Virtual Environment named $virtual_environment_name."
virtualenv $virtual_environment_name

echo "Activating the Python Virtual Environment named $virtual_environment_name."
source /Temp/$virtual_environment_name/bin/activate

echo "Installing module the Virtual Environment named $virtual_environment_name."
#installs a module into the Virtual Environment named $virtual_environment_name
for module in $modules_to_install
do
	echo "Installing Module $module."
	pip install $module --upgrade
done

echo "Running the script $my_script in the Virtual Environment named $virtual_environment_name."
chmod +x /Temp/$virtual_environment_name/bin/activate
/Temp/$virtual_environment_name/bin/activate $my_script

echo "Deactivating the Virtual Environment named $virtual_environment_name."
deactivate