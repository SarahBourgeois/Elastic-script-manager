#!/bin/sh
# author : Sarah Bourgeois
# Description : script allows to manage your elastic stack


#Configuration file
#Unuse for the moment


#User Configuration
ELASTICSEARCH_HOST=http://localhost:9200
KIBANA_INDEX=".kibana"

#Internal command
CURL=curl

help_command () {

  echo  "help :

  INDEX
  ------------------------------------------------
  create_index  ==> to create an index in elasticSearch
  create_alias  ==> to create an alias for your index
  delete_index  ==> to delete an index from elastic
  delete_kibana ==> to delete a visualization or dashboard from kibana

  CLUSTER
  ------------------------------------------------
  status ==> general status of your elasticSearch
  health ==> to print your cluster health "
  echo "\n"
}

create_index () {
  read -p 'Which index ? ' nameindex
  curl -XPUT $ELASTICSEARCH_HOST/$nameindex?pretty
}

create_alias () {
  read -p 'create alias for which index ? ' nameindex
  read -p 'choose alias name : ' aliasname
  curl -XPOST -s http://localhost:9200/_aliases -d  '
  {
    "actions" : [
    { "add" : { "index" : "'$nameindex'" , "alias" : "'$aliasname'"} }
    ]
  }
}'
echo

}
delete_index () {
  read -p 'Which index ? ' elasticindex
  curl -XDELETE $ELASTICSEARCH_HOST/$elasticindex
  echo
  exit 0
}

delete_kibana () {
  read -p 'name of type :' typename
  read -p 'name of vizulisation or dashboard you want to delete ? : ' namedash
  curl -XDELETE $ELASTICSEARCH_HOST/$KIBANA_INDEX/$typename/$namedash
}

health () {
curl -i –XGET $ELASTICSEARCH_HOST/_cluster/health?pretty=true
}

status () {
  curl -i -XGET $ELASTICSEARCH_HOST
}



#######################################
###Arguments to use the Nudge script###
#######################################
if [[ $1 = '' ]];
then
  help_command
fi

if [[ $1 = 'create_index' ]];
then
  create_index
fi

if [[ $1 = 'create_alias' ]];
then
  create_alias
fi

if [[ $1 = 'delete_index' ]];
then
  delete_index
fi

if [[ $1 = 'delete_kibana' ]];
then
  delete_kibana
fi

if [[ $1 = 'health' ]];
then
  health
fi

if [[ $1 = 'status' ]];
then
  status
fi
