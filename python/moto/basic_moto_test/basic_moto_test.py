import boto
from moto import mock_ec2

@mock_ec2
def test():
    conn = boto.ec2.connect_to_region('us-east-1')
    created = conn.create_security_group('test', 'test')
    print created
    print created.__class__

test()
