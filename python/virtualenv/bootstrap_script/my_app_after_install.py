# pip_executable_path is the path to the pip executable within the virtualenv
my_app_executable_path = '/Temp/my_app.py'
python_executable_path = home_dir + '/bin/python'
pip_executable_path = home_dir + '/bin/pip'

print "after_install Function Called"
print "Home Dir is set to: " + home_dir

# subprocess.call accepts either a string or a list
# in the example below we'll use pip to install the python module boto
# subprocess.call([pip_executable_path, 'install', 'boto'])
# the call processed in shell would be my_app/bin/pip install boto

# use pip to install boto into my_app virtualenv
subprocess.call([pip_executable_path, 'install', 'boto'])
# use pip to install mysql-connector-python into my_app virtualenv
subprocess.call([pip_executable_path, 'install', 'mysql-connector-python'])
# run my_app.py using the virtualenv python
subprocess.call([python_executable_path, my_app_executable_path])
