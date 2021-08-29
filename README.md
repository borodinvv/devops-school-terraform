# Пример разворачивания среды для приложения из дипломной работы с помощью Terraform

Приложение собирается в zip через GitHub Actions, сохраняется в S3 бакет и деплоится в Elastic Beanstalk

## Создание S3 бакета

Разворачиваем S3 бакет из папки:

```bash
create-s3
```

## Разворачиваем среду для приложения (Elastic Beanstalk) + MySQL (RDS) 

Разворачиваем из папки:

```bash
create-infrastructure
```

## Описание .tf файлов

- `backend.tf` - state-файл хранится в AWS S3
- `elastic_beanstalk.tf` - разворачивается среда и приложение в AWS Elastic Beanstalk
- `secret.tf` - генерируется пароль и сохраняется в AWS Secrets Manager
- `main.tf` - создается база данных с открытым портом 3306 для входящих соединений и с паролем из AWS Secrets Manager
- `outputs.tf` - выходные переменные
