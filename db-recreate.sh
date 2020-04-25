#!/bin/bash

PGPASSWORD=password dropdb -h localhost -U postgres subtuner

PGPASSWORD=password psql -h localhost -U postgres -d postgres \
  -c "create database subtuner;"

PGPASSWORD=password psql -h localhost -U postgres -d postgres \
  -c "grant all privileges on database subtuner to subtuner;"
