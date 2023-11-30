export PROJECT=$(gcloud config get-value project)

# Use gsutil to create the Dataproc cluster
gcloud dataproc clusters create <cluster_name> --region <region> --zone <zone>
--master-machine-type n2-standard-4 --master-boot-disk-size 500 --num-workers 2
--worker-machine-type n2-standard-4 --worker-boot-disk-size 500 --image-version 2.0-debian10 --optional-components HIVE_WEBCHAT, ZOOKEEPER, HBASE --projectt ${PROJECT}

# Use gsutil to create the Cloud storage bucket
gsutil mb -c regional -l us-central1 gs://${PROJECT}-tpch

# HDFS to Cloud storage bucket
gcloud compute ssh [CLUSTER_NAME]-m

# Migration tools
# 1. DistCp tool
# 2. hdfs2gcs
# 3. Storage Transfer Service

# 1. DistCp tool
# HDFS to Cloud storage bucket
# hadoop distcp hdfs://nn1:8020/user/admin/dataset1/sample gs://bucket/20231128

# HDFS to Dataproc cluster
# hadoop distcp hdfs://nn1:8020/user/admin/dataset1/sample hdfs://<dataproc_master>/test/sample/sample
