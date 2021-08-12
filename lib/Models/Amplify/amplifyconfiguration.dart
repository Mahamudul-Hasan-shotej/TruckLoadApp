const amplifyconfig = ''' {
    "UserAgent": "aws-amplify-cli/2.0",
    "Version": "1.0",
    "auth": {
        "plugins": {
            "awsCognitoAuthPlugin": {
                "UserAgent": "aws-amplify-cli/0.1.0",
                "Version": "0.1.0",
                "IdentityManager": {
                    "Default": {}
                },
                "CredentialsProvider": {
                    "CognitoIdentity": {
                        "Default": {
                            "PoolId": "ap-southeast-1:0c5bc003-b661-46a8-8899-f22f26c3bcf7",
                            "Region": "ap-southeast-1"
                        }
                    }
                },
      
                "CognitoUserPool": {
                    "Default": {
                        "PoolId": "ap-southeast-1_UGu0pXcfA",
                        "AppClientId": "7amu60gcr3h8s61ouk82p0nrf5",
                        "Region": "ap-southeast-1"
                    }
                },
                "Auth": {
                    "Default": {
                        "authenticationFlowType": "USER_SRP_AUTH"
                    }
                },
                  "S3TransferUtility": {
                    "Default": {
                        "Bucket": "truckload-admin-backend-dev-attachmentsbucket-a2yymllnb7aj",
                        "Region": "ap-southeast-1"
                    }
                }
            }
        }
    },
"storage": {
        "plugins": {
            "awsS3StoragePlugin": {
                "bucket": "truckload-admin-backend-dev-attachmentsbucket-a2yymllnb7aj",
                "region": "ap-southeast-1",
                "defaultAccessLevel": "guest"
            }
        }
    }

}''';
