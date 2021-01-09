# Overview

This document describes how to use automatic sidecar injection.

# Installation

A break from the normal simplicity of these snippets: I was surprised to find that this was the recommended method for istio sidecar injection. This violates both the "build it once" and "configuration as code" tennants of engineering. 

Although the configuration can be done manually, the complexity of the files for generating the sidecars (line count, conditions) are not something I would recommend.

The alternative would be to build the IP tables configuration into the containers, drop the `init` container and configure a sidecar in the container (a al AWS App Mesh).

`kubectl label namespace default istio-injection=enabled`

`kubectl describe namespace default`

# Running a Container

