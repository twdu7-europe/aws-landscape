resource "aws_cloudwatch_metric_alarm" "kafka_disk_space_saturation_alarm" {
  alarm_name                = "kafka-disk-space-saturation"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = "2"
  metric_name               = "DiskSpaceUtilization"
  namespace                 = "System/Linux"
  period                    = "60"
  statistic                 = "Average"
  threshold                 = "80"
  alarm_description         = "This metric monitors kafka disk utilization"
  insufficient_data_actions = []
  dimensions = {
    InstanceId = "${aws_instance.kafka.id}"
    MountPath  = "/"
    Filesystem = "/dev/xvda1"
  }
  alarm_actions = ["${aws_sns_topic.kakfa-alarms-sns.id}"]
}
