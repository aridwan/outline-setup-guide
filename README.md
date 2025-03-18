# How to run

#### Run `add-hosts.sh` \
Our app will use `http://outline:3000` for Base URL, we need to add domain to our `/etc/hosts` in order to make our host know the URL. \
You will need `sudo` access to run the script.
```sh
sudo ./add-hosts.sh 
```

#### Create `.env` \
Copy or rename `.env.example` into `.env`, and we'll adjust the value later.

#### Run `docker-compose.yaml` \
Execute this command to run our app 
```sh
docker-compose up
```

#### Access via browser \
Now you can access you app via browser on `http://outline:3000`, but you won't be able to login because your `.env` file still not configured yet. \
Check (config)[https://github.com/aridwan/outline-setup-guide/blob/main/docs/CONFIG.md] page for more information.

