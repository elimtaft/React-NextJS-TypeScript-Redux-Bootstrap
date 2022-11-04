# Strapi application

Generic Strapi backend

## Introduction


## Development Notes

### Setup:

#### Install nvm on Debian 10:

    sudo apt install curl
    curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash

#### Use Node version v14

    nvm install v14
    nvm use v14

#### Install yarn

    npm install --global yarn

#### Install dependencies

    cd into/project/root/directory
    yarn

#### Database setup

This project uses PostgreSQL. Install:

    apt install postgresql postgresql-contrib

Create the user / database to use for testing by executing the following script:

    $ ./scripts/db_local_create.sh

You will need some environment variables to connect to the database.
If you kept everything the same from the above db_local_create.sh script, you can use this example env file:

    $ cp .env.local.example .env

Otherise, you can copy that file and then fill in with the appropriate credentials.

#### Run the application locally (development)

    cd into/project/root/directory
    yarn develop

#### Sample Content

*Note*: If you are trying to use this in conjunction with the react-nextjs-typescript-redux project,
that project is set up to query this Strapi backend for a page whose slug is "strapi-sample-homepage-content". This should be done automatically if you uncommnent the line in the
env file to load initial data when first building that project. See that README.md for more details. Otherwise, you can set this up manually yourself as follows:

   - Create a page with the title "Strapi Sample Homepage Content".
   - Enter some content.
   - Click "Save" and then "Publish."
   - Go [here](http://localhost:1337/admin/settings/users-permissions/roles/2)
   - Under permissions for PAGE, check the box next to "findone" and "find."

Now the front-end react-nextjs-typescript-redux application should display that page's content on its homescreen [here](http://localhost:3000/).
