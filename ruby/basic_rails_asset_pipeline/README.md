
# Overview

This project exists as an example of Rails compiling assets. The entire purpose of creating this file was for me to test performing any "Rails/Rake" based action in a Kubernetes init container. In the particular example, I was running `rake assets:precompile` in an "init" container and then running phusion later.

# Running Rake Assets Precompile

`rake assets:precompile`

# Create New Project

Note that this task has already been performed.

`rails new basic_rails_asset_pipeline`
