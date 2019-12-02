# Creates an AMI Region from us-east-1 to us-west-2 (or a region you prefer)

Current file builds an AMI and installs Apache

Run from current directory

```
packer build -var-file=./ami_two_regions_vars.json ./ami_two_regions.json
```

# Quick Notes about ami_two_regions packerfile

The `ami_two_regions.json` file contains the region of the source ami along with the subnet and vpc associated with the source ami.

To build another AMI from the source, add another region to the `builders --> ami_regions` group 