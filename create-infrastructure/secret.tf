resource "random_password" "db_master_pass" {
  length            = 9
  special           = true
  min_special       = 5
  override_special  = "!#$%^{}<>:?"
  keepers           = {
    pass_version  = 1
  }
}


resource "aws_secretsmanager_secret" "pass-db" {
  name = "pass-db-${terraform.workspace}"
}

resource "aws_secretsmanager_secret_version" "pass-db-value" {
  secret_id     = aws_secretsmanager_secret.pass-db.id
  secret_string = random_password.db_master_pass.result
}