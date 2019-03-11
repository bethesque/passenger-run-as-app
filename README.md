# Passenger 'run as app' demo

This repository demonstrates the issue that occurs when trying to run the docker container as the `app` user as per https://github.com/phusion/passenger-docker#the-app-user.

## Usage

Run `docker-compose up --build`

The following output is shown:

```
$ dc up --build
Building the_app

...

Attaching to passenger-run-as-app_the_app_1
the_app_1  | *** Killing all processes...
the_app_1  | Traceback (most recent call last):
the_app_1  |   File "/sbin/my_init", line 414, in <module>
the_app_1  |     main(args)
the_app_1  |   File "/sbin/my_init", line 330, in main
the_app_1  |     import_envvars(False, False)
the_app_1  |   File "/sbin/my_init", line 90, in import_envvars
the_app_1  |     for envfile in listdir("/etc/container_environment"):
the_app_1  |   File "/sbin/my_init", line 74, in listdir
the_app_1  |     return sorted(os.listdir(path))
the_app_1  | PermissionError: [Errno 13] Permission denied: '/etc/container_environment'
```

If the `USER app` line is removed, the docker container runs successfully. You can test that it is operating by executing `curl http://localhost:80`.
