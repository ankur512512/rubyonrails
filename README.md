## Notes
*Please do not supply your name or email address in this document. We're doing our best to remain unbiased.*

### Date
The date you're submitting this.

### Location of deployed application
Need to deploy locally.

### Time spent
7 hours

### Assumptions made
I am assuming we are free to make some changes if needed in the Gemfile, as I had to upgrade puma version to enable ssl.

### Shortcuts/Compromises made
If applicable. Did you do something that you feel could have been done better in a real-world application? Please
let us know.

### Stretch goals attempted
If applicable, use this area to tell us what stretch goals you attempted. What went well? What do you wish you
could have done better? If you didn't attempt any of the stretch goals, feel free to let us know why.

### Instructions to run assignment locally
Take a clone of this repo and go inside the clone directory:

```bash
git clone https://github.com/ankur512512/think.git
cd think
```
#### Development

Go to development folder and you will see all the required files there, then use docker-compose command to get everything up and running in single shot:

```bash
$ cd development
$ docker-compose up -d --build
```



#### Production

Go to production folder and you will see all the required files.
```bash
cd production
```
To run the application locally in one shot which will also create and use a `postgresql` database on your localhost, use the `docker-compose` file and run it using below command.
```bash
docker-compose up -d --build
```

This will start your application on localhost. Please note that since this is using `Production` mode, don't try to hit the default url i.e. `https://localhost:3000` as it will give 404 error because it is not having any static pages.

To hit the api for creating user, you can simply use a curl command on the same host:
```bash
$ curl -X POST -k "https://localhost:3000/users/create?username=testuser&password=testingpassword"
```
You will get response like this:
```bash
{"data":{"id":"1","type":"user","attributes":{"api_key":"9XoQuT7NmRRjMHFbsPgvmpxh"}},"jsonapi":{"version":"1.0"}}
```

Alternatively, use a tool like `postman` to hit the api for creating user but first make sure ssl verification is off as shown below:


![ssl_verify_off](https://user-images.githubusercontent.com/12583640/136906128-f57e548c-cb2e-4d9d-ae8c-0763cf4d5100.jpg)


Now send a `POST` request to this url `https://localhost:3000/users/create?username=testuser&password=mypassword` and you will result like this:

![create_user](https://user-images.githubusercontent.com/12583640/136908136-3e47223b-e84c-49bb-9cbd-3714b534a670.jpg)

As you can see a user is created successfully, so everything is working fine.

In case you want to use this application Dockerfile only, without `docker-compose` (for ex: you already have your own postgres database server running), follow these steps:

1. First of all, build the docker image using below command:

```bash
docker build -t test:latest .
```
2. It will take some time to build the image and after it's done, edit the `.env` file to enter your own database related details. For example, if your database username is 'postgres', password is 'postgres@123' and host ip is '172.17.0.2' with port '5432' then your `DATABASE_URL` will look like below:
```bash
DATABASE_URL=postgresql://postgres:postgres@123@172.17.0.2:5432
```
Keep the other two variables as it is as you don't need to change them.

3. You might want to use your own CA trusted certificates in production. To do that, copy your .crt and .key file for your PROD certificate to `./volumes/certs`. Make sure you rename them to `prod.key` and `prod.crt`, else the application won't be able to pick them up.

After doing that run the docker image using below command, note that we are mounting the volume for certs and passing the .env file as environment variable to inject values for required environment variables.
```bash
docker run -d -p3000:3000 -v /home/agarg/tmp/think/production/volumes/certs:/myapp/config/certs --env-file .env --name ruby test:latest
```
Give it around 20-30 seconds to get ready and after that verify if it's working fine, again, using a simple curl command from the same host:

```bash
$ curl -X POST -k "https://localhost:3000/users/create?username=testuser&password=testingpassword"
```
You will get response like this:
```bash
{"data":{"id":"1","type":"user","attributes":{"api_key":"9XoQuT7NmRRjMHFbsPgvmpxh"}},"jsonapi":{"version":"1.0"}}
```

So this is the production ready image which we can use and modify our required DB details or certificates whenever we need on our host itself. Whenever we have to do any change in the DB details or certificates we just need to re-do the deployment (which can be easily done in a rolling fashion using kubernetes etc.) without needing to rebuild the image.

***Future Scope:*** We can also make the .env file as mountable volume so as to keep the secrets always up-to-date without redoing the deployment. However, we might still need to restart the application if we make any change at runtime to reflect the changes in environment variables.

### What did you not include in your solution that you want us to know about?
Were you short on time and not able to include something that you want us to know
about? Please list it here so that we know that you considered it.
### Other information about your submission that you feel it's important that we know if applicable.
