resource "apstra_raw_json" "ddos_collector" {
  depends_on = [
    apstra_raw_json.ddos_service
  ]
  url = "/api/telemetry/collectors"
  id = "DDoS_Protection_Protocols"
  payload = jsonencode({
    service_name = "DDoS_Protection_Protocols",
    collectors = [
      {
        platform = {
          os_type = "junos",
          os_version =  "21.2r2",
          family = "junos,junos-ex,junos-qfx",
          model = ""
        },
        source_type = "cli",
        cli = "show ddos-protection protocols statistics brief",
        query = {
          accessors = {
            Protocol = "/ddos-protocols-information/ddos-protocol-group/ddos-protocol/ddos-system-statistics/group-name",
            value = "/ddos-protocols-information/ddos-protocol-group/ddos-protocol/ddos-system-statistics/policer-violation-count"
          },
          keys = {
            Protocol = "Protocol"
          },
          values = {
            value = "int(re_match('\\d+', value))"
          },
          filter = ""
        },
        relaxed_schema_validation = true
      }
    ],
  }
  )
}
