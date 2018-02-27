#!/usr/bin/env python

import logging

# the name of this function must match the name of the function defined in serverless.yml
def hello(event, context):
    # TODO implement
    logging.info("event Is: {}".format(event))
    logging.info("context Is: {}".format(dir(context)))
    logging.info("context.aws_request_id Is: {}".format(context.aws_request_id))
    logging.info("context.client_context Is: {}".format(context.client_context))
    logging.info("context.function_name Is: {}".format(context.function_name))
    logging.info("context.get_remaining_time_in_millis Is: {}".format(context.get_remaining_time_in_millis()))
    logging.info("context.identity Object Type Is: {}".format(type(context.identity)))
    cognito_identity_object = context.identity
    logging.info("context.identity.cognito_identity_id Is: {}".format(cognito_identity_object.cognito_identity_id))
    logging.info("context.identity.cognito_identity_pool_id Is: {}".format(cognito_identity_object.cognito_identity_pool_id))
    logging.info("context.invoked_function_arn Is: {}".format(context.invoked_function_arn))
    logging.info("context.log Is: {}".format(context.log))
    logging.info("context.log_group_name Is: {}".format(context.log_group_name))
    logging.info("context.log_stream_name Is: {}".format(context.log_stream_name))
    logging.info("context.memory_limit_in_mb Is: {}".format(context.memory_limit_in_mb))
    return "Hello from Lambda"

# allows the "handler" function to be called via command line
# so this can be run via either lambda or via ./hello_world.py
if __name__ == "__main__":
    handler()
