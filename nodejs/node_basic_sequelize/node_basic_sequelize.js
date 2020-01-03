#!/usr/bin/env node

const Sequelize = require('sequelize');

const databaseHost =  process.env['DATABASE_HOST']
const databaseName =  process.env['DATABASE_NAME']
const databasePassword =  process.env['DATABASE_PASSWORD']
const databaseUsername =  process.env['DATABASE_USERNAME']

// Option 1: Passing parameters separately
const sequelize = new Sequelize(databaseName, databaseUsername, databasePassword, {
  host: databaseHost,
  dialect: 'mysql'
});

sequelize
  .authenticate()
  .then(() => {
    console.log('Connection has been established successfully.');
  })
  .catch(err => {
    console.error('Unable to connect to the database:', err);
  });
