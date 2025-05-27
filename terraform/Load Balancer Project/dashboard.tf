resource "aws_cloudwatch_dashboard" "Instance_State" {
  dashboard_name = "EC2-Running-Instances-Percentage-Dashboard"

  dashboard_body = jsonencode({
    widgets = [
      {
        type = "metric",
        x    = 0,
        y    = 0,
        width = 12,
        height = 6,
        properties = {
          title  = "Running Instances Percentage",
          view   = "gauge",
          region = "us-east-1",
          metrics = [
            ["AWS/EC2", "CPUUtilization", "InstanceId", "i-017ad01d8a8f75814", {"stat": "Average", "id": "m1", "visible": false}],
            ["AWS/EC2", "CPUUtilization", "InstanceId", "i-03200bde89e31edef", {"stat": "Average", "id": "m2", "visible": false}],
            [{"expression": "(SUM([m1>0, m2>0]) / 2) * 100", "label": "Running %", "id": "e1"}]
          ],
          period = 300,
          stat = "Average",
          yAxis = {
            left = {
              min = 0,
              max = 100,
              label = "Percentage (%)"
            }
          }
        }
      }
    ]
  })
}