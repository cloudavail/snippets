Overview

This document describes how to run a VM (Virtual Machine) in Azure.

# Validate Template
`az group deployment validate --resource-group cloudavail --template-file azuredeploy.json`

# Deploy Template
`az group deployment create --resource-group cloudavail --template-file azuredeploy.json`