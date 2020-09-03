resource "aws_cloudwatch_dashboard" "main" {
  manager_id = var.manager_id
  dashboard_name = "Petclinic_Dashboard"

  dashboard_body = <<EOF
{
  "start": "-PT9H",
  "periodOverride": "inherit",
  "widgets": [
    {
      "type":"metric",
      "x":0,
      "y":0,
      "width":18,
      "height":9,
      "properties":{
        "metrics": [
          [
            "AWS/EC2",
            "CPUUtilization",
            "InstanceId",
            "${manager_id}"
          ]
        ],
        "view": "timeSeries",
        "stacked": false,
        "region":"eu-west-1",
        "title":"Node Instance CPU"
      }
    }
  ]
}
EOF
}