# distributed_jmeter

##### Steps to setup
1. Build your images with compose file
``` docker compose up  -d --build ```

2. Tag the image using aws cli and upload it to ECR (You can get the command by creating a repo in ECR and clicking 'Push commands' button in the repo.)

3. Create a security group with following inbound and out-bound rules and attach this group to all running instances.

In-bound rules

| TYPE      | PROTOCOL | PORT RANGE | SOURCE    | 
|---------- |--------- |----------- |---------- |
|All Traffic| All      |  All       | As Is     |
| SSH       | TCP      |  22        | 0.0.0.0/0 |


Out-Bound rules
| TYPE      | PROTOCOL | PORT RANGE | DESTINATION    | 
|---------- |--------- |----------- |--------------- |
|All Traffic| All      |  All       | 0.0.0.0/0      |

4. Create IAM policy with 
EC2FullAccess, ECSFullAccess, EC2RFullAccess, S3FullAccess, RoleForSSM

5. Go to ECS and create a cluster. (I had selected EC2 Linux + Networking). Select a VPC group from dropdown or create a new vpc and select security group created in step 3.

6. Select container instance IAM role and create a cluster.

7. Create a task defeinition of type EC2. While creating task definition in ECS, mention following in environment variable section for container for both master and slave.
```
-e Xms=256m -e Xmx=512m -e MaxMetaspaceSize=512m
```

Mount volumes 
```
/opt/Sharedvolume:/opt/Sharedvolume
```
8. Network type should be HOST and master should have container port as 60000 where as slave should have container ports as 50000 and 1099. Create task definitions and run 1 master task and 2 slave tasks.

For running distributed tests, please refer https://github.com/avtarjha/distributed_load_testing_jmeter_ecs
