 module "configuration1" {
 source = "./NIC"
  nic = "anji_nic"
  ipconfig = "anjiip"
  vsubid = module.configuration4.vsubid
  location = "eastus"
  rg = module.configuration2.rgid
}
module "configuration2" {
  source = "./Resource_Group"
  resource_group = "anjiRG"
  location = "eastus"
  }

module "configuration3" {
  source = "./VM"
  vm= "anjivm1"
  size = "standard_f2"
  vmuser_name = "anjiweb1"
  user_password = "webanji@2022"
  rights = "ReadWrite"
  storage = "Standard_LRS"
  micsft = "microsoftwindowsserver"
  win = "windowsserver"
  vmwin_versing = "2016-datacenter"
  location = "eastus"
  rg = module.configuration2.rgid
  nic = module.configuration1.nicid
}
module "configuration4" {
  source = "./VNet"
  vnet = "anjivnet"
  cidr_block = "192.168.0.0/16"
  vsub = "anjisubnet"
  ip_address = "192.168.2.0/24"
  location = "eastus"
  rg = module.configuration2.rgid
}