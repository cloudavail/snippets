#!/usr/bin/env python

# objective:
# to test the eventual consistency of the Amazon API
# function parameters all passed as keywords for readability

import logging

import boto.ec2

log = logging.getLogger(__name__)
log.setLevel(logging.DEBUG)
ch = logging.StreamHandler()
log.addHandler(ch)

region = 'us-east-1'
vpc_id = 'vpc-fda17b98'

errors_create = 0
errors_count = 0
errors_get = 0
errors_delete = 0

conn = boto.ec2.connect_to_region(region)

for x in range(1, 100):
    groups = []
    group_name = 'test-{!s}'.format(x)
    group_filter = {'group-name': group_name, 'vpc-id': vpc_id}

    # create a new group
    try:
        log.info('Creating group: {!s}'.format(group_name))
        created = conn.create_security_group(name=group_name,
                                             description=group_name,
                                             vpc_id=vpc_id)
    except boto.exception.EC2ResponseError as e:
        errors_create += 1
        log.warn('Could not create. Exception is: {!s}\n'.format(e))
    try:
        #groups = conn.get_all_security_groups(group_ids=[group_id])
        #groups = conn.get_all_security_groups(groupnames=[group_name])
        groups = conn.get_all_security_groups(filters=group_filter)
    except boto.exception.EC2ResponseError as e:
        errors_get += 1
        log.warn('Could not locate. Exception is: {!s}\n'.format(e))
    if len(groups) != 1:
        errors_count += 1

    try:
        group = conn.delete_security_group(group_id=created.id)
    except NameError as e:
        log.warn('Could not delete. Exception is: {!s}\n'.format(e))
    except boto.exception.EC2ResponseError as e:
        errors_delete += 1
        log.warn('Could not delete. Exception is: {!s}\n'.format(e))

print 'Results:'
print 'errors_create: {!s}'.format(errors_create)
print 'errors_get: {!s}'.format(errors_get)
print 'errors_count: {!s}'.format(errors_count)
print 'errors_delete: {!s}'.format(errors_delete)
