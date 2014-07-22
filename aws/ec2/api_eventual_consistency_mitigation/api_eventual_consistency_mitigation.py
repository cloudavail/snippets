#!/usr/bin/env python

# objective:
# to mitigate the problems created by Amazon's eventually consistent API
# this script works correctly but is proof of concept

import logging

import boto.ec2
# https://github.com/rholder/retrying
from retrying import retry


region = 'us-east-1'
vpc_id = 'vpc-fda17b98'
conn = boto.ec2.connect_to_region(region)


log = logging.getLogger(__name__)
log.setLevel(logging.DEBUG)
ch = logging.StreamHandler()
log.addHandler(ch)

errors_create = 0
errors_count = 0
errors_get = 0
errors_delete = 0


def create_security_group(name, description, vpc_id=None):
    # create_security_group retries:
    # throttle retry = marginal value
    # accuracy retry = no value. Avoid issue of retry by create_security_group
    #   every time. Determining "exists" first is a bad idea
    global errors_create
    created_group = None
    try:
        log.info('Creating group: {!s}'.format(group_name))
        created_group = conn.create_security_group(name=group_name,
                                                   description=group_name,
                                                   vpc_id=vpc_id)
    except boto.exception.EC2ResponseError as e:
        # two types of errors
        # 1. group already exists - in which case, created is True
        # 2. group can't be created - in which case, created is False
        errors_create += 1
        log.warn('Could not create. Exception is: {!s}\n'.format(e))
    return created_group


def delete_result_eval(result):
    if result is False:
        # if result was group was not deleted, try again
        return True
    else:
        return False


@retry(retry_on_result=delete_result_eval, stop_max_attempt_number=24, wait_fixed=10000)
def delete_security_group(group):
    # delete_security_group retries:
    # throttle retry = marginal value
    # accuracy retry = marginal value
    global errors_delete
    deleted_group = False
    try:
        if group:
            log.debug('trying to delete security_group {!s}'.format(group.id))
        else:
            log.debug('trying to delete security_group {!s}'.format(group.id))
        deleted_group = conn.delete_security_group(group_id=group.id)
    except NameError as e:
        errors_delete += 1
        log.warn('Could not delete. Exception is: {!s}\n'.format(e))
    except AttributeError as e:
        errors_delete += 1
        log.warn('Could not delete. Exception is: {!s}\n'.format(e))
    except boto.exception.EC2ResponseError as e:
        errors_delete += 1
        log.warn('Could not delete. Exception is: {!s}\n'.format(e))
    return deleted_group


def get_security_group_eval(result):
    if result is False:
        return True
    else:
        return False


@retry(retry_on_result=get_security_group_eval, stop_max_attempt_number=24, wait_fixed=10000)
def get_security_group(name=None, vpc_id=None, group_id=None):
    # get_security_group retries:
    # throttle retry = marginal value
    # accuracy retry = high value if using to make programmatic decisions
    #   or to validate an action occured
    #   for example, if a group has security rules applied
    #   or if a group has been deleted or created
    global errors_get
    global errors_count
    try:
        #groups = conn.get_all_security_groups(group_ids=[group_id])
        #groups = conn.get_all_security_groups(groupnames=[group_name])
        groups = conn.get_all_security_groups(filters=group_filter)
    except boto.exception.EC2ResponseError as e:
        errors_get += 1
        log.warn('Could not locate. Exception is: {!s}\n'.format(e))
    if len(groups) != 1:
        return False
        errors_count += 1
    else:
        return groups[0]


for x in range(1, 100):
    groups = []
    group_name = 'test-{!s}'.format(x)
    group_filter = {'group-name': group_name, 'vpc-id': vpc_id}

    new_security_group = create_security_group(group_name, group_name, vpc_id)
    security_group = get_security_group(group_name, vpc_id)
    deleted_group = delete_security_group(new_security_group)


print 'Results:'
print 'errors_create: {!s}'.format(errors_create)
print 'errors_get: {!s}'.format(errors_get)
print 'errors_count: {!s}'.format(errors_count)
print 'errors_delete: {!s}'.format(errors_delete)
