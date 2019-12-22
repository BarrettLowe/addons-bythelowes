# DNS Updater
This add on is used to update Route53 A record. It simply automates calling the script from [this example](https://github.com/awslabs/route53-dynamic-dns-with-lambda)

### Config Options
- server - The domain to update eg. *this.domain.example.com*
- api_endpoint - The the endpoint setup in API Gateway on AWS
- cron_pattern - Cron pattern to specify how often the DNS should be updated (API Gateway Charges may apply check before updating too often)
- secret - The secret specified in the config file in S3 used to verify the request is authenticated 
