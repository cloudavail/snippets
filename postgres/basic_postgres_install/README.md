# Initial Login

Connect the a new install: `sudo -u postgres psql`

## Programmatic Method to Change Password

Or just change the default password: `sudo -u postgres psql --user=postgres -c "alter user postgres with password 'sde'";`

Now you can login as follows: `psql --user=postgres --host=127.0.0.1 --password`

# User Administration

## View Users

`\du+`

## Create a User

User creation can be done via SQL command or via the `createuser` command. I prefer the SQL command as this maintains a similar interface as MySQL.

`CREATE USER colin WITH LOGIN PASSWORD 'sde';`

Note that this user will not (depending on configuration) be able to login. This is because of the default behavior of (at least) the psql client attempting to connect to a database named `$USER` if not specified.

## Grant access to all Tables in Public

`GRANT CONNECT ON DATABASE postgres TO colin;`
`GRANT SELECT ON ALL TABLES IN SCHEMA public TO colin;`

## View Permissions

`\z` will show no permissions to a table.

```
postgres=# \z
                             Access privileges
 Schema | Name  | Type  | Access privileges | Column privileges | Policies 
--------+-------+-------+-------------------+-------------------+----------
 public | books | table |                   |                   | 
(1 row)
```

## Create Table
```
CREATE TABLE books (
    title        varchar(40),
    author       varchar(40)
);
```

## Grant access to all Tables in Public

`GRANT CONNECT, SELECT ON ALL TABLES IN SCHEMA public TO colin;`

## View Permissions

`\z` will show no permissions to a table.

```
postgres=# \z
                             Access privileges
 Schema | Name  | Type  | Access privileges | Column privileges | Policies 
--------+-------+-------+-------------------+-------------------+----------
 public | books | table |                   |                   | 
(1 row)
```

## Connect

`psql --user=colin --host=127.0.0.1 --password postgres`
