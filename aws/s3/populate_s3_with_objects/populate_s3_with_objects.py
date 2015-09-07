#!/usr/bin/env python

# given an object size and a total size, create this many objects in S3.
# Objects will be padded with a number of leading objects

import argparse
import random
import string

import boto3


def get_count_of_needed_objects(object_size, total_size):
    number_of_objects = None
    number_of_objects = total_size / object_size
    return number_of_objects


def create_object_of_given_size(object_size_mb):
    random_string = ""
    chars_generated = 0
    object_size_bytes = object_size_mb * 1048576
    char_size_bytes = 1
    chars_needed = object_size_bytes / char_size_bytes
    while chars_generated < chars_needed:
        random_char = random.choice(string.ascii_letters)
        chars_generated += 1
        random_string += random_char
    return random_string


def put_object(bucket_name, prefix, object_name, object_given_size):
    response = None
    if prefix is not None:
        object_name = '{!s}{!s}'.format(prefix, object_name)
    s3_object = s3_resource.Object(bucket_name, object_name)
    response = s3_object.put(Body=object_given_size)
    return response


parser = argparse.ArgumentParser()
parser.add_argument('--bucket', dest='bucket_name', required=True)
parser.add_argument('--prefix', default=None)
parser.add_argument('--object-size', dest='object_size', default=1, type=int,
                    help='size of object to be created, in MB')
parser.add_argument('--total-size', required=True, dest='total_size', type=int,
                    help='total size of all objects to be created')
args = parser.parse_args()

s3_resource = boto3.resource('s3')

number_of_objects_needed = get_count_of_needed_objects(args.object_size, args.total_size)
object_given_size = create_object_of_given_size(args.object_size)

number_of_objects_created = 0
while number_of_objects_created < number_of_objects_needed:
    object_name = '{!s}'.format(number_of_objects_created)
    put_object_response = put_object(args.bucket_name, args.prefix, object_name, object_given_size)
    number_of_objects_created += 1
