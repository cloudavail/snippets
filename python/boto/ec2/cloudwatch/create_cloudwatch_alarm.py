#!/usr/bin/env python
#objective: create a cloudwatch alarm using Boto

from boto.ec2.cloudwatch import connect_to_region, MetricAlarm

aws_connection = connect_to_region('us-east-1')
print aws_connection.__class__

new_alarm = MetricAlarm(name='new_alarm',
                        metric='CPUUtilization',
                        namespace='AWS/EC2',
                        statistic='Average',
                        comparison='>=',
                        threshold=90.0,  # threshold is float
                        period=60,  # period is int, measured in seconds
                        evaluation_periods=5,
                        unit='Percent',
                        description='',
                        dimensions={'InstanceId': 'i-xxxxxxxx'},
                        alarm_actions=None,
                        insufficient_data_actions=None,
                        ok_actions=None)

print new_alarm.__class__

aws_connection.create_alarm(new_alarm)
