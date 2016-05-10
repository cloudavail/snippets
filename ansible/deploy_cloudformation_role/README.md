# Overview
The objective of this snippet is to:

1. provision two CloudFormation stacks using ansible. Specifically a "core" infrastructure stack and a "web" webserver stack.
2. create a "role" that could be re-used by many projects.


# Playbooks - Project Specific
Each project (in our case, "core" and "web") playbook should provide:

1. A path to a CloudFormation file specific to a given application.
2. The ability to provide application and environment specific vars.

These playbooks will rely on a role named `manage_cloudformation`.

# Role - "Manage CloudFormation"
The `manage_cloudformation` role should provide support for:

1. Doing anything that should be done across all stacks. Examples might include:
  - forcing all hosts to use a particular keypaid
  - passing particular parameters to a stack

## Vars
"Default" vars are provided by a file named `defaults/main.yml`. This file would be used within a company and populated with values that all projects should use. Examples could include:

1. A list of public subnets.
2. A list of NAT subnets.
3. A list of private subnets.
4. A "base AMI" if this is used.

# Run:

## Build "Core" Infrastructure
The command below will build the "core" infrastructure required to run a a "web" infastructure.
`ansible-playbook -c local -vvv playbooks/manage_cloudformation_core.yml`

## Build "Web" Infastructure
The command below will build the "web" infrastructure.
`ansible-playbook -c local -vvv playbooks/manage_cloudformation_webserver.yml`
