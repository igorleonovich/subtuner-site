#!/bin/bash

PGPASSWORD=password psql -h localhost -U postgres -d subtuner \
    -c "drop schema public cascade; \
    create schema public; \
    grant all on schema public to postgres; \
    grant all on schema public to subtuner; \
    grant all on schema public to public;"
