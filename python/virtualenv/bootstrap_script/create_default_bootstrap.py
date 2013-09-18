#!/usr/bin/python
import virtualenv
basic_bootstrap_script_contents = virtualenv.create_bootstrap_script("")
basic_bootstrap_script_file = open('./default_bootstrap.py', 'w').write(basic_bootstrap_script_contents)
# the output of the above is
# a file named ./basic_bootstrap_script.py
#
# ./basic_bootstrap_script.py is, at its core, a duplicate of the virtualenv python script
# for example:
# diff ./basic_bootstrap_script.py /Library/Python/2.7/site-packages/virtualenv.py returns the following:
#cjohnson:Temp cjohnson$ diff ./basic_bootstrap_script.py /Library/Python/2.7/site-packages/virtualenv.py
#2,3d1
#< ## WARNING: This file is generated
#< #!/usr/bin/env python
#1812c1810
#< 
#---
#> ##EXTEND##

