resource "aws_efs_file_system" "jenkins_fs" {
  creation_token   = "jenkins-fs"
  performance_mode = "generalPurpose"
  encrypted        = true
  kms_key_id       = aws_kms_key.jenkins_fs_key.arn
  tags = {
    Name           = "jenkins-fs",
    "project-name" = "disraptor-jenkins"
    "owner"        = "shibule"
    "application"  = "jenkins"
    "environment"  = "prod"
  }

}

resource "aws_kms_key" "jenkins_fs_key" {
  description         = "KMS key for Jenkins EFS"
  enable_key_rotation = true

  tags = {
    Name           = "jenkins-kms-key",
    "project-name" = "disraptor-jenkins"
    "owner"        = "Shibule"
    "application"  = "jenkins"
    "environment"  = "prod"

  }
}

resource "aws_efs_backup_policy" "jenkins_fs_backup_policy" {
  file_system_id = aws_efs_file_system.jenkins_fs.id
  backup_policy {
    status = "ENABLED"
    # lifecycle = "AFTER_7_DAYS"
  }

}