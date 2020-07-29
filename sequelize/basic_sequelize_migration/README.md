# Overview

This snippet will test a Sequilize "migration" by doing the following:

1. Creating a new database (ideally using sequelize)
2. Apply a migration that creates the initial database.

# Setup

## Initial Setup

```
npm init
npm install --save sequelize
npm install --save mysql2
# npm install --save-dev sequelize-cli will install in "devDependencies" for running migrations
npm install --save-dev sequelize-cli
# npx sequelize-cli init will create an empty project
npx sequelize-cli init
```

## Customization

Modify the file `config/config.json` with connection information.

# Create Initial Migration

`npx sequelize-cli model:generate --name User --attributes firstName:string,lastName:string,email:string`

# Run Initial Migration

`npx sequelize-cli db:migrate`
