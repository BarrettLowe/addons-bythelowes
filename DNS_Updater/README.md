# DNS Updater
This add on is used to update Route53 A record. It simply automates calling the script from [this example](https://github.com/awslabs/route53-dynamic-dns-with-lambda)

## Installation

The installation of this add-on is pretty straightforward and not different in
comparison to installing any other Hass.io add-on.

1. Add the *addons-bythelowes* repository to your Home Assistant addon store
1. Search for the "Route53 DNS Updater" add-on in the 'Addons ByTheLowes' add-on store
   and install it.
1. Configure the `server`, `api_endpoint`, `cron_pattern`, and `secret` options.
1. Start the "Route53 DNS Updater" add-on.
1. Check the logs of the "Route53 DNS Updater" add-on to see if everything
    went well.

## Configuration
**Note**: _Remember to restart the add-on when the configuration is changed._

- __server__ - The domain to update eg. *this.domain.example.com.* (When following the instructions from the link above, you will have the dot at the end)
- __api_endpoint__ - The the endpoint setup in API Gateway on AWS
- __cron_pattern__ - Cron pattern to specify how often the DNS should be updated (API Gateway Charges may apply check before updating too often)
- __secret__ - The secret specified in the config file in S3 used to verify the request is authenticated 

### Config Example
```json
{
    "cron_pattern": "*/5 * * * *",
    "servers": [
        "server": "my.domain.com.",
        "secret": "s3_config_secret",
        "api_endpoint": "https://abcd012345.execute-api.<REGION>.amazonaws.com/prod"
    ]
}
```
