terraform {
  backend "azurerm" {
    resource_group_name  = "Capstone-RG"
    storage_account_name = "credbackendstorage"
    container_name       = "statefile"
    key                  = "credpay.terraform.tfstate"
  }
}