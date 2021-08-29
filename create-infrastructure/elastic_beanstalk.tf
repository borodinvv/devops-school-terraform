resource "aws_elastic_beanstalk_application" "app" {
  name        = "weather-app"
}

resource "aws_elastic_beanstalk_environment" "env" {
  name                = "weather-env"
  application         = aws_elastic_beanstalk_application.app.name
  solution_stack_name = "64bit Amazon Linux 2 v3.3.4 running Python 3.8"

  setting {
        namespace = "aws:autoscaling:launchconfiguration"
        name      = "IamInstanceProfile"
        value     = "aws-elasticbeanstalk-ec2-role"
      }
}