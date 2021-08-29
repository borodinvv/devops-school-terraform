output "rds_addresses" {
    value = "${aws_db_instance.WeatherApp_DB.*.address}"
}

output "app_domain_name" {
    value = "${aws_elastic_beanstalk_environment.env.*.cname}"
}

