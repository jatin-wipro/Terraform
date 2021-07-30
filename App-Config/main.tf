#create app-config name
resource "aws_appconfig_application" "oasproducer" {
  name        = "oasproducerapplication"
  description = "OAS AppConfig Application"

  tags = {
    Type = "AppConfig"
  }
}

#create environment for app
resource "aws_appconfig_environment" "oas_environment" {
  name           = "oas-environment"
  description    = "oas AppConfig Environment"
  application_id = aws_appconfig_application.oasproducer.id

  tags = {
    Type = "AppConfig Environment"
  }
}

#create app configuration
resource "aws_appconfig_configuration_profile" "oas_configure" {
  application_id = aws_appconfig_application.oasproducer.id
  description    = "oas Configuration Profile"
  name           = "oas-configuration-profile"
  location_uri   = "hosted"

  tags = {
    Type = "AppConfig Configuration Profile"
  }
}

#send json to configuration
resource "aws_appconfig_hosted_configuration_version" "oas_json" {
  application_id           = aws_appconfig_application.oasproducer.id
  configuration_profile_id = aws_appconfig_configuration_profile.oas_configure.configuration_profile_id
  description              = "oas Hosted Configuration Version"
  content_type             = "application/json"

  content = jsonencode("${file("test.json")}")
}

#select deployment strategy
resource "aws_appconfig_deployment_strategy" "oas_strategy" {
  name                           = "oas-deployment-strategy"
  description                    = "OAS Deployment Strategy"
  deployment_duration_in_minutes = 3
  final_bake_time_in_minutes     = 4
  growth_factor                  = 10
  growth_type                    = "LINEAR"
  replicate_to                   = "NONE"

  tags = {
    Type = "AppConfig Deployment Strategy"
  }
}

#Final Deployment
resource "aws_appconfig_deployment" "oas_deployment" {
  application_id           = aws_appconfig_application.oasproducer.id
  configuration_profile_id = aws_appconfig_configuration_profile.oas_configure.configuration_profile_id
  configuration_version    = aws_appconfig_hosted_configuration_version.oas_json.version_number
  deployment_strategy_id   = aws_appconfig_deployment_strategy.oas_strategy.id
  description              = "My OAS deployment"
  environment_id           = aws_appconfig_environment.oas_environment.environment_id

  tags = {
    Type = "AppConfig Deployment"
  }
}
