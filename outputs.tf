output "aws_instance_public_ip" {
  value = aws_instance.ubuntu_aws.public_ip
}

output "azure_vm_name" {
  value = azurerm_linux_virtual_machine.ubuntu_vm.name
}