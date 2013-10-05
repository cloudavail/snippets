# objective: to understand what happens when a command within a task fails
# how to run: fab test_task

from fabric.api import local

def test_task():
    # local command ls -la runs without failure
    print 'Calling local command: ls -la'
    local('ls -la')
    # local command nonexistent_executable will fail because the executable 
    # nonexistent_executable does not exist
    print 'Calling local command: nonexistent_executable'
    local('nonexistent_executable')
    # after this command is run fab exits with error code 1
    # local command ls -la will not run because the fab application has already exited
    print 'Calling local command: ls -la'
    local('ls -la')