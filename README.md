## ARM テンプレート
```
cd armtemplate
az group create -l japaneast -g rg-iac
az deployment group create -g rg-armtemplate --template-file storage.json
```

## Bicep
```
cd bicep
az group create -l japaneast -g rg-iac
az deployment group create -g rg-armtemplate --template-file storage.bicep
```

## Terraform
```
cd terraform
terraform init
terraform plan -out tfplan
terraform apply "tfplan"
```