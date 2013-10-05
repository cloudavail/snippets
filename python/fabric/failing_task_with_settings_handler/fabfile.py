# objective: to understand what happens when a command within a task fails
# how to run: fab test_task

from fabric.api import local
from fabric.api import settings

def test_task():
    with settings(warn_only=True):
        # local command ls -la runs without failure
        print 'Calling local command: ls -la'
        local('ls -la')
        # local command nonexistent_executable will fail because the executable 
        # nonexistent_executable does not exist
        print 'Calling local command: nonexistent_executable'
        local('nonexistent_executable')
        # after the nonexistent_executable command is run fab will note an 
        # error but will continue to run local command ls -la will run because 
        # the fab application will only warn on failing commands
        print 'Calling local command: ls -la'
        local('ls -la')