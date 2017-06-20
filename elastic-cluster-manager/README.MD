
# elasticsearch-Cluster-Manager

## Overview 
Scripts which allows to easily manage index of your Elastic Stack (elasticsearch-kibana) and so all your nodes or Cluster.

##Getting started
First download the script.
Open it and edit the part : 
-User Configuration
ELASTICSEARCH_HOST=http://localhost:9200

To configure the script for your usage, you have just to change the elasticsearch host.

Launch it with 

```
$ ./elastic-tool.sh
```
If permission is denied do : 

```
$ chmod +x elastic-tool.sh
$ ./elastic-tool.sh
```


## Usage
You access to different properties  : 



| Property       | Value                                                       |
|----------------|-------------------------------------------------------------|
|create_index  |to create an index in elasticSearch                                 |
|create_alias |to create an alias for your index                           |
|delete_index|to delete an index from elastic                                   |
|elastic.index |The name of the Elastic index you want the plugin to write to|
|delete_kibana|to delete a visualization or dashboard from kibana              |
|status| general status of your elasticSearch     |
|  health|to print your cluster health           |

  
  So you can do for example : 
  ```
$ ./elastic-tool.sh delete_index
$ delete which index ? name_index-2017-06-* // for an index with date, delete all index in june for this example
```

