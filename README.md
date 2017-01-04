## Requirements

### On your local machine (not on the cluster)
This is also based on linux and Mac, but you can figure it out on other stuff

#### Install these on your laptop

Python
- On Linux
-- paramiko `sudo apt-get install python-paramiko`
-- scp `sudo apt-get install python-scp`
- On Mac
-- pip install paramiko
-- pip install scp


BlueMix / Cloud Foundry
- [IBM Docs](https://console.ng.bluemix.net/docs/cli/index.html#cli)
- `cf login -a https://api.ng.bluemix.net`
-- or `cf login` and then `https://api.ng.bluemix.net` when it asks you for an API enpoint

Setup Bluemix Services Code Base
* cd `<CLONE_DIR>`
* git clone https://github.com/rawkintrevo/bluemix-extra-services.git
  * Note that in the `<CLONE_DIR>` directory, there are a number of example installation scripts. 


#### Cloud Environment Setup

Hadoop Environment
- BigInsights 4.2 instance using Big Insights on Cloud preferred on Bluemix
- BigInsights 4.3 will not work with zeppelin spark interpreter yet, as Spark binaries currently compiled for Spark 1.6

Amazon S3 Creds (for Zeppelin Notebook Storage)
- ACCOUNT_NAME_PULL_DOWN (look in upper right hand corner)
    |-> My Security Credentials -> Continue to Security Credentials -> Access Keys -> Create New Access Keys
- save rootkey.csv to `<CLONE_DIR>`/data/resources/aws`
- Setup a bucket in s3 as `<bucketName>`.  
-- Folders will automatically get created in this bucket when the script is run the first time.  You will have to make sure your deploy script matches the `<bucketName>` you selected.  (see Code Base section below)

- Review this first: https://zeppelin.apache.org/docs/0.5.5-incubating/storage/storage.html
- ALWAYS run `z.setS3auth(S3_USERNAME, S3_BUCKET)` before adding any additional configs, e.g. `z.addMahoutConfig(new_terp_name)`. This is imporant bc `zeppelin-env.sh` is overwritten.


#### Ports Used

These are not the default ports per the projects- I've done a little traffic control so they don't conflict on a box. Everyone seems to want to use `8080`.
- Flink Stand Alone Cluster:
  - WebUI: `8083`
  - master: `6121` - Did this so Zeppelin LocalMiniCluster wouldn't get in its way
- Nifi: 8084
- Zeppelin: 8081, 8082


#### Example Configuration and Deployment
* cd `<CLONE_DIR>`
  * Copy one of the *.py scripts and edit the header section as shown in example below

- APP_PREFIX="example-tunnel" # anything you want- but must be unique
- SERVER = "bi-hadoop-prod-xxxx.bi.services.us-south.bluemix.net" # You get this in the manage clusters section of BigInsights on Cloud
- USERNAME = "user1"    # must correspond to the user you added when you created BigInsights on cloud instance
- PASSWORD = "passw0rd" # must correspond to the password you added when you created the BigInsights on cloud instance
- S3_BUCKET = "your-s3-bucketname"  # must correspond to the bucket you created in s3
- S3_USERNAME = 'aws-user-id'       # should correspond to the username on aws, but can be arbitrary

Then run the setup code for the services you want 
`python your_setup_script.py`
