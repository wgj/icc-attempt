### Setup
```shell
ssh-keygen
```

### Troubleshoot
```shell
aws --profile wgj sts decode-authorization-message --encoded-message=foo --query DecodedMessage --output text | jq '.
```

### Test
```shell
ssh -i terraform/id_rsa ec2-user@50.18.145.200 
```
