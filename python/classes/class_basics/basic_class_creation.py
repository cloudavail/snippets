#!/usr/bin/env python

# objective: understand basic classes in Python


class Node:
    '''a node represents a unique device'''

    # node_count is a "class variable" - a class variable is shared amongst all
    # instances of a class.
    node_count = 0

    # __init__ is a "special method" that is called each time an instance of
    # a class is created. __init__ is also wrongly called a constructor -
    # the instance has already been created when __init__ is called
    # __init__ is called just *after* construction
    #
    # self is a reference to the instance of the class itself. For example,
    # if I create "web_server_01" then "self" references that
    # object. Note that "self" can be another variable name - it could be
    # my_object, my_instance - Python convention is to use self.
    #
    # fqdn is an instance variable - this variable is specific to each and
    # every instance of the "Node" class
    #
    def __init__(self, fqdn):
        self.fqdn = fqdn
        # increases the Node class variable named "node_count" by a value of
        # one. This occurs for each instance of the "Node" class
        Node.node_count += 1

    # def get_hostname creates an instance method
    # reference: http://www.alan-g.me.uk/tutor/
    def get_hostname(self):
        ''' returns the hostname of a host given an fqdn '''
        return self.fqdn.split('.')[0]


# creates an object named web_server_01
web_server_01 = Node(fqdn='web_server_01.example.com')
# creates an object named web_server_02
web_server_02 = Node(fqdn='web_server_02.example.com')

# Node.node_count accesses the class variable "node_count" for the Node class
# Node.node_count is also an attribute of the "Node" class
print Node.node_count

# web_server_01.get_hostname() calls the get_hostname() method on web_server_01
print web_server_01.get_hostname()
# Node.get_hostname(web_server_02) calls the "get_hostname" method
# with web_server_02 as the first argument
print Node.get_hostname(web_server_02)
# doesn't work:
# Node.get_hostname()
# returns:
# TypeError: unbound method get_hostname() must be called with Node instance as first argument (got nothing instead)

# web_server_01.ip_address is a "data attribute"
# although this isn't recommended, apparently you can create an attribute
# without first defining the attribute as part of the class
# note that "the default semantics of an attribute is to provide access to a
# an instance variable"
web_server_01.ip_address = '192.168.0.1'
print web_server_01.ip_address

# web_server_01.__dict__ will return a dictionary containing all attributes of
# a particular object
# from: http://www.cafepy.com/article/python_attributes_and_methods/python_attributes_and_methods.html
print web_server_01.__dict__


print Node.__dict__

# Definitions:
#
# instance variable - a variable that is specific to each instance of a class
#
# class variable - a variable that is shared amongst a class
#
# method - "a function defined in a class definition"
#
# special method - a special method is called indirectly - Python calls them
# when you perform an action on a class or an instance of a class
#
# encapsulation - allows the restricting of access to some parts of an object
# and allows the bundling of data with function that operation on that data
# an example of encapsulation is using web_server_01.get_ip_address() instead
# of web_server_01.ip_address - we are using a getter to access a method to
# access the attribute of an object

# Not Defined:
# attribute
# constructor

# Outside of Scope
# classmethod - uses decorator
# staticmethod - uses decorator
