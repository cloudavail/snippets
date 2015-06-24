# Create a Task Defintion
The task definition defines a task. In this case, the file `nginx.json` contains a task that utilizes exactly one container definition, which utilizes the stock nginx image. It is not exiting, but the when the task definition is run, the following will happen:

1. An nginx "task" will be run.
2. The nginx "task" will launch one or more containers - in this case we are utilizing only a single container.
3. The container is comprised of a single image - the image is the latest nginx Docker image - from `https://registry.hub.docker.com/_/nginx/`.

## Run the "Register Task Definition" Command
Here is the actual command that will be run:

`aws ecs register-task-definition --cli-input-json file://./nginx.json`
