# 🌍 Terraform Multi-Cloud: AWS + Azure (Ubuntu)

Este proyecto de Terraform crea dos instancias Ubuntu en la nube:

- ☁️ Una en **Amazon Web Services (AWS)**
- 🔷 Otra en **Microsoft Azure**

## 📦 Requisitos

- [Terraform](https://developer.hashicorp.com/terraform/install)
- Cuenta en AWS (credenciales configuradas)
- Cuenta en Azure con `az login` ejecutado

## 📂 Archivos

- `main.tf`: Recursos principales
- `providers.tf`: Configura AWS y Azure
- `variables.tf`: Variables configurables
- `outputs.tf`: Salidas útiles
- `README.md`: Esta guía

## 🚀 Instrucciones

```bash
terraform init
terraform plan
terraform apply
```

## 📤 Resultados

- IP pública de instancia en AWS
- Nombre de VM en Azure

## 🔐 Seguridad

**Este proyecto usa una contraseña de ejemplo.** En producción, usa autenticación SSH segura.

---

Hecho con 💻 por @juantopx (un sysadmin curioso) ✨
