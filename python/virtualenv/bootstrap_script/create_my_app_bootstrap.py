#!/usr/bin/python
import virtualenv

# indentation_string will be used to determine the string utilized for 
# creating indentation level
indentation_string = '    '
after_install_script_name = './my_app_after_install.py'

after_install_contents_file = open(after_install_script_name, 'r')
after_install_script_header = 'def after_install(options, home_dir):\n'
# after_install_contents_file.readlines() creates a list object
# the list object is perfect for inserting the required 4 space indentation
# before each line
after_install_script_body_list = after_install_contents_file.readlines()
# create after_install_script_body string
after_install_script_body = ''

# for each line/string in after_install_script_body_list
# add indentation_string preceding the line and 
# if indentation_string is set to '    ' (four spaces) this has the impact of
# rendering the following:
# def after_install(options, home_dir):
#     line1
#     line2
for line in after_install_script_body_list:
    after_install_script_body = after_install_script_body + indentation_string + line

after_install_script = after_install_script_header + after_install_script_body

bootstrap_contents = virtualenv.create_bootstrap_script(after_install_script)
bootstrap_file = open('./my_app_bootstrap.py', 'w').write(bootstrap_contents)