resource "apstra_raw_json" "ddos_dashboard" {
  url = format("/api/blueprints/%s/iba/dashboards",var.blueprint_id)
  payload = jsonencode({
    label = "DDoS Protection Protocols",
    description = "",
    grid = [
      [
        {
          label = "DDoS_Protection_Protocols",
          description = "",
          type = "stage",
          probe_id = apstra_raw_json.ddos_probe.id,
          stage_name = "Range",
          filter = "",
          visible_columns = [
            "properties.system_id",
            "properties.Device_Profile",
            "properties.Protocol",
            "anomaly",
            "value",
            "timestamp"
          ],
          orderby = "",
          max_items = 10,
          anomalous_only = true,
          show_context = false,
          spotlight_mode = false,
          data_source = "real_time",
          time_series_duration = 86400,
          aggregation_period = 300,
          aggregation_type = "unset",
          combine_graphs ="none"
        }
      ]
    ],
    default = false,
  }
  )
}