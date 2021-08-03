resource "aws_cloudwatch_kafka_disk_space_saturation_alarm" "kafka_alarm" {
  alarm_name                = "kafka-disk-space-saturation"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = "2"
  metric_name               = "DiskSpaceUtilization"
  namespace                 = "AWS/EC2"
  period                    = "60"
  statistic                 = "Average"
  threshold                 = "50"
  alarm_description         = "This metric monitors kafka disk utilization"
  insufficient_data_actions = []
}