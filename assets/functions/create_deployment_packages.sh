#!/usr/bin/env bash

PWD=`pwd`

functions=("upload_result"  \
           "split_batch"  \
           "prepare_training"  \
           "prepare_batch"  \
           "meter_forecast" \
           "get_anomaly"  \
           "batch_anomaly_detection" \
           "crawler/trigger_glue_crawler" \
           "crawler/get_glue_crawler_state" \
           "state_topic_subscription" \
           "load_pipeline_parameter" \
           "check_initial_pipeline_run")

for lambda_folder in ${functions[*]};
do
   function_name=${lambda_folder////_}
   echo $function_name
   zip -9jqr "$PWD/packages/${function_name}.zip" "./${lambda_folder}"
done