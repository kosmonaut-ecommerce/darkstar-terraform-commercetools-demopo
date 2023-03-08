module "demoprovisioner" {
   source  = "commercetools-demo/demoprovisioner/commercetools"
   configfile = "./ct-config-emea.yml"
}

# register the terraform provider, this needs to happen in the root module
terraform {
   required_providers {
      commercetools = {
         source = "labd/commercetools"
      }
   }
}


provider "commercetools" {
   client_id     = module.demoprovisioner.config.client.client_id
   client_secret = module.demoprovisioner.config.client.client_secret
   project_key   = module.demoprovisioner.config.client.project_key
   token_url     = module.demoprovisioner.config.client.auth_url
   api_url       = module.demoprovisioner.config.client.api_url
   scopes        = module.demoprovisioner.config.client.scopes
}