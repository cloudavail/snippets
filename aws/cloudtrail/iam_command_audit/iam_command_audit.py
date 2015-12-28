#!/usr/bin/env python
import argparse
import logging

import boto3
import terminaltables

client = boto3.client('cloudtrail')


def get_all_events(username):
    lookup_attributes = [{'AttributeKey': 'Username',
                         'AttributeValue': username}]
    events_exhausted = False
    events = []
    event_response = client.lookup_events(LookupAttributes=lookup_attributes)
    logging.info('Number of Events found {}'.format(len(event_response['Events'])))
    for event in event_response['Events']:
        events.append(event)
    if event_response.get('NextToken'):
        next_token = event_response.get('NextToken')
        while events_exhausted is False:
            event_response = client.lookup_events(LookupAttributes=lookup_attributes,
                                                  NextToken=next_token)
            logging.info('Number of Events found {}'.format(len(event_response['Events'])))
            for event in event_response['Events']:
                events.append(event)
            if event_response.get('NextToken'):
                logging.info('Next Token Found. More events.')
                next_token = event_response.get('NextToken')
            else:
                logging.info('Next Token Not Found. Reached end of events.')
                events_exhausted = True
    return events


def output_events(events):
    table_data = [['Event Time', 'Username', 'Event Name']]
    for event in events:
        table_data.append([str(event['EventTime']),
                           str(event['Username']),
                           str(event['EventName'])])
    table = terminaltables.SingleTable(table_data)
    print table.table


parser = argparse.ArgumentParser()
parser.add_argument('--username', required=True)
args = parser.parse_args()

events = get_all_events(args.username)
logging.info('Total Number of Events {}'.format(len(events)))
output_events(events)
