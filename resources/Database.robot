*Settings*
Documentation       Database Helpers

Library     DatabaseLibrary
Library     factories/Users.py

*Keywords*
Connect To Postgres
    Connect To Database     psycopg2
    ...                     idcwtzcv
    ...                     idcwtzcv
    ...                     p7an-bRRN3R5G7jVk7yqqdYdFKo_BYI2
    ...                     fanny.db.elephantsql.com
    ...                     5432

Reset Env
    Execute SQL String      DELETE from public.geeks;
    Execute SQL String      DELETE from public.users;

Insert User
    [Arguments]     ${u}

    ${password}     Get Hashed Pass     ${u}[password]

    ${q}    Set Variable       INSERT INTO public.users (name, email, password_hash, is_geek) values ('${u}[name] ${u}[lastname]', '${u}[email]', '${password}', false)     

    Execute SQL String         ${q}

Users Seed

    ${user}     Factory User        login
    Insert User  ${user}

    ${user2}     Factory User       be_geek
    Insert User  ${user2}

    ${user3}     Factory User       attempt_be_geek
    Insert User  ${user3}

    ${user4}     Factory User       field_alert
    Insert User  ${user4}
