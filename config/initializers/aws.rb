# aws ses: https://github.com/aws/aws-sdk-ruby/
AWS.config(
  :access_key_id => Setting.aws_access_key_id,
  :secret_access_key => Setting.aws_secret_access_key
)
