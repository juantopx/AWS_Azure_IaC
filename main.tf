# -------------------------------
# AWS Ubuntu Instance
# -------------------------------
resource "aws_instance" "ubuntu_aws" {
  ami           = "ami-0fc5d935ebf8bc3bc" # Ubuntu 22.04 (us-east-1)
  instance_type = "t2.micro"

  tags = {
    Name = "Ubuntu-AWS"
  }
}

# -------------------------------
# Azure Ubuntu Instance
# -------------------------------
resource "azurerm_resource_group" "rg" {
  name     = "TerraformResourceGroup"
  location = var.azure_location
}

resource "azurerm_virtual_network" "vnet" {
  name                = "terraformVNet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_subnet" "subnet" {
  name                 = "terraformSubnet"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_network_interface" "nic" {
  name                = "terraformNIC"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                    = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "ubuntu_vm" {
  name                = "UbuntuVM"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  size                = "Standard_B1s"
  admin_username      = "azureuser"
  network_interface_ids = [
    azurerm_network_interface.nic.id,
  ]

  admin_password = "P@ssword1234!"

  disable_password_authentication = false

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    name                 = "myOsDisk"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}