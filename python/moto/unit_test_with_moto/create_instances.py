
import boto
from moto import mock_ec2


@mock_ec2
def create_x_instances(desired_instances=1):
    '''
    creates and tags "x" instances
    '''
    conn = boto.ec2.connect_to_region('us-east-1')

    for x in range(0, desired_instances):
        created_instance = conn.run_instances('ami-a427efcc', min_count=1,
                                              max_count=1,
                                              instance_type='t1.micro')
        #print 'Created Instance with id: {!s}'.format(created_instance.instances[0].id)
        created_tag = conn.create_tags(created_instance.instances[0].id,
                                       tags={'instance_number': x})
        #print created_tag

create_x_instances(desired_instances=50)
