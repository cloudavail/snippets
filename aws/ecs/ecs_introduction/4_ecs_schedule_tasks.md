# Scheduling an Task
Lastly, you'll need to actually run the task. This will distribute the task to different container instances in the nginx cluster.

`aws ecs run-task --cluster nginx --task-definition nginx --count 2`

## run-task and start-task Compared:
1. `run-task` = random placement and default Amazon ECS scheduler
2. `start-task` = place task on specific container or your own scheduler
