###***elastic-tool.sh***###
-----------------------

It allows to manage easily elastic and kibana.



####***Configuration***####
-----------------------

Elastic default host is "http://localhost:9200"
If yours is different, you can change it. You have to edit the .sh file.

####***Getting started***####
-----------------------

	 $ ./elastic-tool.sh 


If you have an error message like : 


	 $ bash : $ ./elastic-tool.sh  : Permission denied
do this :


	 $ chmod +x elastic-tool.sh 
	 $ ./elastic-tool.sh .sh

----
You access to the help with all arguments : 

  INDEX
  create_index  : to create an index in elasticSearch
  create_alias  : to create an alias for your index
  delete_index  : to delete an index from elastic
  delete_kibana : to delete a visualization or dashboard from kibana

  CLUSTER
  status : general status of your elasticSearch
  health : to print your cluster health 

------------------


**Example : **
	 
	 $ ./elastic-tool.sh  delete_index

**************
