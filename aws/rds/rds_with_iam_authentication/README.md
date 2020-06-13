# AWS Resource Setup

- VPC
- Subnet(s)
- RDS Security Group
- RDS Instance (with enable-iam-database-authentication)

## Reference

https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/UsingWithRDS.IAMDBAuth.Enabling.html

# AWS Configuration

- create an IAM user with (rds-db:connect) - this user already exists
https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/UsingWithRDS.IAMDBAuth.IAMPolicy.html

# Create an MySQL user that uses IAM Authentication

1. Connect to RDS Server (using master username/password)
2. CREATE USER joey IDENTIFIED WITH AWSAuthenticationPlugin AS 'RDS';
3. GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, RELOAD, PROCESS, REFERENCES, INDEX, ALTER, SHOW DATABASES, CREATE TEMPORARY TABLES, LOCK TABLES, EXECUTE, REPLICATION SLAVE, REPLICATION CLIENT, CREATE VIEW, SHOW VIEW, CREATE ROUTINE, ALTER ROUTINE, CREATE USER, EVENT, TRIGGER ON *.* TO 'joey'@'%' WITH GRANT OPTION;
4. FLUSH PRIVILEGES;

it is believed the user "randy" must also exist in AWS IAM

# Test

Connect to the database using Randy's IAM username/password

## Reference

https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/UsingWithRDS.IAMDBAuth.Connecting.AWSCLI.html

# To generate an aws token
aws rds generate-db-auth-token \
   --hostname rr1w4h6xpdq2fxe.cqqr62fdusov.us-west-2.rds.amazonaws.com \
   --port 3306 \
   --region us-west-2 \
   --username cjohnson

# Log in for mysql after generating aws authorized token
mysql --host=rr1w4h6xpdq2fxe.cqqr62fdusov.us-west-2.rds.amazonaws.com --port=3306 --enable-cleartext-plugin --user=cjohnson --password='rr1w4h6xpdq2fxe.cqqr62fdusov.us-west-2.rds.amazonaws.com:3306/?Action=connect&DBUser=cjohnson&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIASXIEDV6PIPHLYMXE%2F20190912%2Fus-west-2%2Frds-db%2Faws4_request&X-Amz-Date=20190912T174746Z&X-Amz-Expires=900&X-Amz-SignedHeaders=host&X-Amz-Signature=1c8e7412b35a80ba0f70d6602f00e6b8ce5dc5a6126a5eac2a76c7bbc613f98f'

# JSON example script policy to connect to db
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "rds-db:connect"
            ],
            "Resource": [
                "arn:aws:rds-db:us-west-2:187376578462:dbuser:db-YLB73BNNCPF7YC3ZETX25JOSWE/randy",
                "arn:aws:rds-db:us-west-2:187376578462:dbuser:db-YLB73BNNCPF7YC3ZETX25JOSWE/cjohnson"
            ]
        }
    ]
}

## Resource
https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/UsingWithRDS.IAMDBAuth.IAMPolicy.html

# Describes DB instance to create policy for that DB instance
aws rds describe-db-instances --query "DBInstances[].[DBInstanceIdentifier,DbiResourceId]"


# Policy format in the IAM user management console; edit [region], [account ID], [DbiResourceId] and [db-user-name]
arn:aws:rds-db:region:account-id:dbuser:DbiResourceId/db-user-name