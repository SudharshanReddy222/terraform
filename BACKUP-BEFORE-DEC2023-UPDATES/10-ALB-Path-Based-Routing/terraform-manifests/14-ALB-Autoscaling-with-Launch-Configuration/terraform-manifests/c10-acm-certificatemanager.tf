# Get DNS information from AWS Route53
data "aws_route53_zone" "mydomain" {
  name = "jayavardhanreddy616.xyz"
}

# ACM Module - To create and Verify SSL Certificates
module "acm" {
  source  = "terraform-aws-modules/acm/aws"
  version = "~> 2.0"

  domain_name = trimsuffix(data.aws_route53_zone.mydomain.name, ".") 
  zone_id     = data.aws_route53_zone.mydomain.id
  subject_alternative_names = [
    "apps.jayavardhanreddy616.xyz",
    "app1.jayavardhanreddy616.xyz",
    "app2.jayavardhanreddy616.xyz",
    "default.jayavardhanreddy616.xyz",
    "custom-header.jayavardhanreddy616.xyz",
    "redirects1.jayavardhanreddy616.xyz",
    "lb-to-db1.jayavardhanreddy616.xyz",
    "asg-lc2.jayavardhanreddy616.xyz",
  ]
}