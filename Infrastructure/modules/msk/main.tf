resource "aws_msk_cluster" "this" {
  cluster_name           = var.cluster_name
  kafka_version          = var.kafka_version
  number_of_broker_nodes = var.number_of_broker_nodes

  broker_node_group_info {
    instance_type  = var.instance_type
    client_subnets = var.client_subnets

    storage_info {
      ebs_storage_info {
        volume_size = var.volume_size
      }
    }

   security_groups = []
  }

  encryption_info {
    encryption_at_rest_kms_key_arn = var.kms_key_arn
  }

  open_monitoring {
    prometheus {
      jmx_exporter {
        enabled_in_broker = var.jmx_exporter_enabled
      }
      node_exporter {
        enabled_in_broker = var.node_exporter_enabled
      }
    }
  }

  logging_info {
    broker_logs {
      cloudwatch_logs {
        enabled   = var.cloudwatch_logs_enabled
        log_group = var.cloudwatch_log_group_name
      }
      firehose {
        enabled         = var.firehose_enabled
        delivery_stream = var.firehose_delivery_stream_name
      }
      s3 {
        enabled = var.s3_logs_enabled
        bucket  = var.s3_bucket_name
        prefix  = "logs/msk-"
      }
    }
  }

  tags = var.tags
}
