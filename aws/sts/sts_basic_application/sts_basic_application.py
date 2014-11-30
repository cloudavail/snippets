#!/usr/bin/env python

# objective:
# demonstrate the use of Amazon Web Service's STS

# Reference:
# http://technology.bernews.com/using-temporary-credentials-with-the-ec2-cli/
# http://youtu.be/4OpZmBp9S0k?t=35m9s
# https://web-identity-federation-playground.s3.amazonaws.com/index.html

import argparse
import logging
import sys

import boto.sts


def validate_user(username, password):
    '''
    Validate user performs a check using an if statement - this could be
    extended to check against a text file, against a database or any other
    authentication service.
    '''
    logging.debug('validate_user called.')
    print 'Username provided is {!s}.'.format(username)
    print 'Password provided is {!s}.'.format(password)
    if (username == 'colin') and (password == 'test'):
        logging.info('User is valid.')
        return True
    else:
        logging.info('User is not valid.')
        return False


def assume_role(arn):
    '''
    Allows a given IAM user to assume an IAM role.
    '''
    logging.debug('assume_role called.')
    sts_interface = boto.connect_sts()
    assumed_role = sts_interface.assume_role(arn, 'test_session_name')
    print 'Assumed Role ARN: {!s}'.format(assumed_role.user.arn)
    print 'Assumed Role ID: {!s}'.format(assumed_role.user.assume_role_id)
    credentials = assumed_role.credentials
    print 'Access Key: {!s}'.format(credentials.access_key)
    print 'Secret Key: {!s}'.format(credentials.secret_key)


def get_federation_token():
    '''
    Allows a given IAM user to request an STST token.
    '''
    logging.debug('get_federation_token called.')
    sts_interface = boto.connect_sts()
    token = sts_interface.get_federation_token('test')
    credentials = token.credentials
    print 'Federated User ID: {!s}'.format(token.federated_user_id)
    print 'Federated User ARN: {!s}'.format(token.federated_user_arn)
    print 'Access Key: {!s}'.format(credentials.access_key)
    print 'Secret Key: {!s}'.format(credentials.secret_key)


parser = argparse.ArgumentParser()
parser.add_argument('--username')
parser.add_argument('--password')
parser.add_argument('--mode', default='assumerole',
                    choices=['get_federation_token', 'assume_role'])
parser.add_argument('--role')
parser.add_argument('--log-level', dest='log_level', default='INFO',
                    choices=['DEBUG', 'INFO', 'WARNING', 'ERROR', 'CRITICAL'])
args = parser.parse_args()

# configure logging
log_format = '%(message)s'
log_level = str.upper(args.log_level)
logging.basicConfig(level=log_level, format=log_format)


if args.mode == 'get_federation_token':
    valid_user = validate_user(args.username, args.password)
    if valid_user is True:
        get_federation_token()
    else:
        logging.warning('User not valid. Token will not be issued.')
        exit(1)
elif args.mode == 'assume_role':
    assume_role(args.role)
else:
    sys.exit(1)
