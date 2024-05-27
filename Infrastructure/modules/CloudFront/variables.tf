variable "cloudfront_access_control_name" {
  description = "A unique name that identifies the CloudFront Origin Access Control."
  type        = string
}

variable "cloudfront_access_control_description" {
  description = "The description of the CloudFront Origin Access Control. Defaults to 'This is used to log the website into the S3 bucket which is enabled for logging' if omitted."
  type        = string
  default     = "This is used to log the website into the S3 bucket which is enabled for logging"
}

variable "region" {
  description = "The AWS region where the infrastructure will be deployed. The default region is 'af-south-1'."
  type        = string
  default     = "af-south-1"
}

variable "domain_name" {
  description = "DNS domain name of either the S3 bucket, or web site of your custom origin."
  type        = string
}

variable "default_root_object" {
  description = "Object that you want CloudFront to return (for example, index.html) when an end user requests the root URL."
  type        = string
  default     = "index.html"
}

variable "s3_cloudfront_logging_bucket" {
  description = "The S3 bucket used for logging CloudFront access logs. It should be formatted as 'bucket-name.s3.amazonaws.com'."
  type        = string
}

variable "prefix_value" {
  description = "Prefix value for CloudFront logging to help organize logs within the logging bucket. Do not include a trailing '/'. The default prefix is 'cloudfront-logging'."
  type        = string
  default     = "cloudfront-logging"
}

variable "logging_config" {
  description = <<-EOT
    Configuration for CloudFront logging. Specifies whether CloudFront logs include cookies, the bucket for storing logs, and the prefix for log files.

    Attributes:
    - include_cookies: A boolean value indicating whether CloudFront includes cookies in access logs.
      - true: Include cookies in logs.
      - false: Do not include cookies in logs.
    - bucket: The S3 bucket where CloudFront access logs are stored. It should be in the format 'bucket-name.s3.amazonaws.com'.
    - prefix: The prefix for CloudFront log files within the specified bucket to help organize logs.
  EOT
  type = list(object({
    include_cookies = bool
    bucket          = string
    prefix          = string
  }))
}

variable "cloudfront_tags" {
  description = "Specifies the tags (key, value pairs) to be associated with the eventBridge rule"
  type        = map(string)
}

variable "default_cache_behavior" {
  description = <<-EOT
    Defines the default cache behavior for an AWS CloudFront distribution.
    
    Attributes:
    - allowed_methods: A list of HTTP methods that CloudFront processes and forwards to your origin. Common methods include "GET", "HEAD", "OPTIONS", "PUT", "POST", "PATCH", and "DELETE".
    - cached_methods: A subset of allowed methods that CloudFront caches responses for. Typically includes "GET" and "HEAD".
    - target_origin_id: The ID of the origin that CloudFront routes requests to when they match the default cache behavior. This should be a valid origin ID configured in the distribution.
    - viewer_protocol_policy: The policy that specifies the protocol users can use to access the files. Options are "allow-all" (HTTP and HTTPS), "https-only" (HTTPS only), and "redirect-to-https" (HTTP to HTTPS).
    - min_ttl: The minimum amount of time (in seconds) that an object will stay in the cache before CloudFront forwards another request to your origin.
    - default_ttl: The default amount of time (in seconds) that an object will stay in the cache before CloudFront forwards another request to your origin.
    - max_ttl: The maximum amount of time (in seconds) that an object will stay in the cache before CloudFront forwards another request to your origin.
  EOT
  type = list(object({
    allowed_methods        = list(string)
    cached_methods         = list(string)
    target_origin_id       = string
    viewer_protocol_policy = string
    min_ttl                = number
    default_ttl            = number
    max_ttl                = number
  }))
  default = []
}


# variable "allowed_methods" {
#   description = "Controls which HTTP methods CloudFront processes and forwards to your Amazon S3 bucket or your custom origin."
#   type        = list(string)
#   default     = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
# }

# variable "cached_methods" {
#   description = "Controls whether CloudFront caches the response to requests using the specified HTTP methods."
#   type        = list(string)
#   default     = ["GET", "HEAD"]
# }

variable "forwarded_values" {
  description = <<-EOT
    Configures how CloudFront handles query strings and cookies in viewer requests for caching and forwarding.

    Attributes:
    - query_string: A boolean value indicating whether CloudFront includes query strings in the cache key and forwards them to the origin. 
      - true: Query strings are included in the cache key and forwarded to the origin.
      - false: Query strings are not included in the cache key or forwarded to the origin.
    - forward: Specifies how CloudFront handles cookies in viewer requests. Options are:
      - "none": CloudFront does not forward cookies to the origin and does not include cookies in the cache key.
      - "whitelist": CloudFront forwards only the cookies that you specify to the origin.
      - "all": CloudFront forwards all cookies to the origin and includes them in the cache key.
  EOT
  type = list(object({
    query_string = bool
    forward      = string
  }))
  default = []
}

variable "restrictions" {
  description = "restriction_type takes in values of 'none', 'whitelist', 'blacklist'. locations  for which you want CloudFront either to distribute your content (whitelist) or not distribute your content (blacklist), if the type is specified as none an empty array can be used."
  type = list(object({
    restriction_type = string
    locations        = list(string)
  }))
  default = []
}

variable "cloudfront_default_certificate" {
  description = "A boolean value indicating whether to use the default CloudFront certificate. If set to true, CloudFront uses the default CloudFront certificate (*.cloudfront.net). If set to false, you must specify your own SSL/TLS certificate."
  type        = bool
  default     = true
}

variable "origin_id" {
  description = "A unique identifier for the origin. This ID is used to reference the origin in other parts of the CloudFront distribution configuration."
  type        = string
  default     = "myS3Origin"
}

# variable "target_origin_id" {
#   description = "value"
#   type        = string
#   default     = "myS3Origin"
# }

variable "origin_group" {
  description = <<-EOT
    Defines a group of origins for CloudFront with failover capabilities. Allows specifying primary and secondary origins along with the status codes that trigger a failover.

    Attributes:
    - origin_group_id: A unique identifier for the origin group.
    - status_codes: A list of HTTP status codes that, when returned by the primary origin, trigger CloudFront to failover to the secondary origin.
    - origin_member_id: The ID of the primary origin in the origin group.
    - origin_failover_id: The ID of the secondary origin in the origin group, which CloudFront will use if the primary origin returns one of the specified status codes.
  EOT
  type = list(object({
    origin_group_id   = string
    status_codes      = list(number)
    orgin_member_id   = string
    orgin_failover_id = string
  }))
  default = []
}

variable "primaryS3" {
  description = <<-EOT
    Specifies the configuration for the primary S3 origin used in CloudFront distributions. This includes the domain name of the S3 bucket and the origin access identity used to restrict access.

    Attributes:
    - domain_name: The DNS domain name of the S3 bucket configured as the primary origin.
    - origin_access_identity: The CloudFront origin access identity (OAI) associated with the S3 bucket, allowing CloudFront to access the bucket while preventing direct access.
  EOT
  type = list(object({
    domain_name            = string
    origin_access_identity = string
  }))
}


variable "ordered_cache_behavior" {
  description = <<-EOT
    Defines the ordered cache behaviors for an AWS CloudFront distribution. Cache behaviors specify how CloudFront handles requests based on the specified path pattern, caching settings, and other options.

    Attributes:
    - path_pattern: The pattern (for example, 'images/*.jpg') that specifies which requests to apply the behavior to. CloudFront compares the pattern with the URL of each request.
    - allowed_methods: A list of HTTP methods that CloudFront processes and forwards to your origin. Common methods include "GET", "HEAD", "OPTIONS", "PUT", "POST", "PATCH", and "DELETE".
    - cached_methods: A subset of allowed methods that CloudFront caches responses for. Typically includes "GET" and "HEAD".
    - target_prefix: The prefix CloudFront uses to construct the origin path by appending this value to the origin domain name.
    - query_string: A boolean value indicating whether CloudFront includes query strings in the cache key and forwards them to the origin.
      - true: Query strings are included in the cache key and forwarded to the origin.
      - false: Query strings are not included in the cache key or forwarded to the origin.
    - headers: A list of HTTP headers that CloudFront includes in the cache key and forwards to the origin.
    - cookies_forward: Specifies how CloudFront handles cookies in viewer requests. Options are:
      - "none": CloudFront does not forward cookies to the origin and does not include cookies in the cache key.
      - "whitelist": CloudFront forwards only the cookies that you specify to the origin.
      - "all": CloudFront forwards all cookies to the origin and includes them in the cache key.
    - min_ttl: The minimum amount of time (in seconds) that an object will stay in the cache before CloudFront forwards another request to your origin.
    - default_ttl: The default amount of time (in seconds) that an object will stay in the cache before CloudFront forwards another request to your origin.
    - max_ttl: The maximum amount of time (in seconds) that an object will stay in the cache before CloudFront forwards another request to your origin.
    - compress: A boolean value indicating whether CloudFront automatically compresses certain files for this cache behavior.
      - true: Enable automatic compression of certain files.
      - false: Disable automatic compression.
    - viewer_protocol_policy: The policy that specifies the protocol users can use to access the files. Options are "allow-all" (HTTP and HTTPS), "https-only" (HTTPS only), and "redirect-to-https" (HTTP to HTTPS).
  EOT
  type = list(object({
    path_pattern           = string
    allowed_methods        = list(string)
    cached_methods         = list(string)
    target_prefix          = string
    query_string           = bool
    headers                = list(string)
    cookies_foward         = string
    min_ttl                = number
    default_ttl            = number
    max_ttl                = number
    compress               = bool
    viewer_protocol_policy = string
  }))
}
