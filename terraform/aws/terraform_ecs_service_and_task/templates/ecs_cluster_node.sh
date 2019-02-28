#!/bin/bash -

cat > /etc/ecs/ecs.config <<EOF
ECS_CLUSTER=${ECS_CLUSTER_NAME}
EOF
