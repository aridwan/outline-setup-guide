# Configuration

In order to make our application work well, we need to configure or `.env` file with our local environment. But before we start to config our app, make sure to successfully run Outline on web browser `http://outline:3000`.

## Storage 
We used Minio service for storage, so we need to create bucket for our app. Go to `http://storage:9000` and log in to admin dashboard (default username: `minio`, password: `miniostorage`). \

*[image minio bucket]*

After successfully create a bucket, now we need to create acess key to use our bucket. Go to Access Keys -> Create Access Key. \

*[image create access key]*

Now save the values given and add to our `.env`. \
`AWS_ACCESS_KEY_ID` = Access Key value, \
`AWS_SECRET_ACCESS_KEY` = Secret Key value. \
`AWS_S3_UPLOAD_BUCKET_NAME` = outline-bucket

```ini
AWS_ACCESS_KEY_ID=dmiZadmJfFdvvjryikjW
AWS_SECRET_ACCESS_KEY=rsFRLO7rFl7DegzGp8HRvEA0vZJ2xERK3eWPXLao
AWS_REGION=local
AWS_S3_ACCELERATE_URL=
AWS_S3_UPLOAD_BUCKET_URL=http://storage:9000
AWS_S3_UPLOAD_BUCKET_NAME=outline-bucket
FILE_STORAGE_UPLOAD_MAX_SIZE=262144000
AWS_S3_FORCE_PATH_STYLE=true
AWS_S3_ACL=private
```

## Keycloak 
Outline use third party service to do authentication, so we need at least one OAuth2 service if we want login using our local environment. In this example we will use Keycloak. Go to `http://keycloak:8080` and go to administration console and login to admin dashboard (default username: `admin`, password: `admin`). \

First we need to create Realm to manage a set of users, credentials, roles, and groups. 

*[image create realm]*

Next, we need to create client.

*[image create client]*

And set General settings.

*[image general settings]*

Next, we create user from Users menu on sidebar.

*[image create user]*

Then, we need to set password for our user root, go to `Credentials` tab and set password.

*[image set password]*

Now, we need to set out client ID to `.env` to get its value from `Clients` sidebar select `outline-client` and go to `Credentials` tab.

*[image keycloak secret]*

Next, set the value to our `.env` file

```ini
OIDC_CLIENT_ID=outline-client
OIDC_CLIENT_SECRET=7qe2xbVCVunb0kuNGJNdIF8EPl6RPid8 
OIDC_AUTH_URI=http://keycloak:8080/realms/outline/protocol/openid-connect/auth
OIDC_TOKEN_URI=http://keycloak:8080/realms/outline/protocol/openid-connect/token
OIDC_USERINFO_URI=http://keycloak:8080/realms/outline/protocol/openid-connect/userinfo
```

Finally you can restart your container. 

```
docker-compose down 
docker-compose up
```

Now you can login to Outline using Keycloak with username and password for root.

*[image final]*