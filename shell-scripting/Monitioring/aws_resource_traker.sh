#!/bin/bash

##############################
#Author: Sourabh
#Date: 22/05/2024
#Versio: 1.0
#
#This script is to report AWS resource usage
##############################################
#

set -e
set -o pipefail
set -x

#AWS S3
#list s3 bucket
aws s3 ls

#AWS EC2
#list ec2 instance
aws ec2 describe-instances | jq '.Reservations[].Instances[].InstanceId'

#AWS Lambda
#list lambda functions
aws lambda list-functions

#AWS IAM
#list users
aws iam list-users | jq '.Users[].UserName'
