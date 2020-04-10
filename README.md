# distributed_jmeter

##### Steps to setup

###### Docker steps
1. Build your images with compose file
``` docker compose up  -d --build ```

2. While creating task definition in ECS, mention following in environment variable section for container for both master and slave.
```
-e Xms=256m -e Xmx=512m -e MaxMetaspaceSize=512m -v /opt/Sharedvolume:/opt/Sharedvolume
```

3. Network type should be HOST and master should have container port as 60000 where as slave should have container ports as 50000 and 1099

4. Create a security group with following inbound and out-bound rules and attach this group to all running instances.

| TYPE      | PROTOCOL | PORT RANGE | SOURCE    | 
|---------- |--------- |----------- |---------- |
|All Traffic| All      |  All       | As Is     |
| SSH       | TCP      |  22        | 0.0.0.0/0 |


Out-Bound rules
| TYPE      | PROTOCOL | PORT RANGE | DESTINATION    | 
|---------- |--------- |----------- |--------------- |
|All Traffic| All      |  All       | 0.0.0.0/0      |

5. Create IAM policy with 
EC2FullAccess, ECSFullAccess, EC2RFullAccess, S3FullAccess, RoleForSSM
