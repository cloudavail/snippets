# Objective:
Creates a single Apache Solr Server using a download from an Apache Solr distribution mirror.

# Solr Commands:
## Create a Collection
After having started Solr, run the command below from the directory where Solr is installed. This will create a collection named `gettingstarted`.

`bin/solr create -c gettingstarted`

## Populate a Collection with Documents
After having started Solr, run the command below from the directory where Solr is installed.

`bin/post -c gettingstarted example/exampledocs/*.xml`

## Query a Collection
`curl http://localhost:8983/solr/gettingstarted/select?q=solr&wt=json&indent=true`