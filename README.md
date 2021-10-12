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

Development



#### Production

Go to production folder and you will see all the required files.
```bash
cd production
```
To run the application locally in one shot which will also create and use a `postgresql` database on your localhost, use the `docker-compose` file and run it using below command.
```bash
docker-compose up -d --build
```

This will start your application on `https://localhost:3000/`. Please note that since this is using `Production` mode, don't try to hit the default url i.e. `https://localhost:3000` as it will give 404 error because it is not having any static pages.

Use a tool like `postman` to hit the api for creating user but first make sure ssl verification is off as shown below:




Now send a `POST` request to this url `https://localhost:3000/users/create?username=testuser&password=mypassword` and you will result like this:




As you can see a user is created successfully, so everything is working fine.

In case you want to use this image only with this Dockerfile.

Create your own db and enter its details in .env file
Build image: docker build -t test:latest .
Run image: docker run -d -p3000:3000 -v /home/agarg/tmp/think/volumes/certs:/myapp/config/certs --env-file .env --name ruby test:latest



### What did you not include in your solution that you want us to know about?
Were you short on time and not able to include something that you want us to know
about? Please list it here so that we know that you considered it.
### Other information about your submission that you feel it's important that we know if applicable.
