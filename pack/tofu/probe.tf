resource "apstra_raw_json" "ddos_probe" {
  depends_on = [
 	apstra_raw_json.ddos_collector 
 ]
  url = format("/api/blueprints/%s/probes",var.blueprint_id)
  payload   = <<-EOT
  {
    "label": "DDOS_Protection_Protocols",
    "description": "",
    "processors": [
      {
        "name": "Extensible Service Collector",
        "type": "extensible_data_collector",
        "properties": {
        "service_name": "DDoS_Protection_Protocols",
        "service_interval": "60",
        "value_map": {},
        "graph_query": [
        "match(node('system', name='system', deploy_mode='deploy', role=is_in(['leaf', 'access', 'spine', 'superspine'])).out().node('interface_map').out('device_profile').node('device_profile', name='DP'))"
        ],
        "service_input": "''",
        "query_group_by": [],
        "Device_Profile": "str(DP.label)",
        "keys": [],
        "ingestion_filter": {},
        "data_type": "dynamic",
        "query_tag_filter": {
        "filter": {},
        "operation": "and"
      },
      "execution_count": "-1",
      "system_id": "system.system_id",
      "query_expansion": {},
      "enable_streaming": false
    },
    "inputs": {},
    "outputs": {
      "out": "Extensible Service Collector"
    }
    },
    {
      "name": "Periodic Change",
      "type": "periodic_change",
      "properties": {
      "graph_query": [],
      "period": 60,
      "enable_streaming": false
    },
    "inputs": {
      "in": {
      "stage": "Extensible Service Collector",
      "column": "value"
      }
    },
    "outputs": {
      "out": "Periodic Change"
    }
    },
    {
    "name": "Range",
    "type": "range_check",
    "properties": {
    "property": "value",
    "raise_on_nan": false,
    "raise_anomaly": true,
    "graph_query": [],
    "anomaly_retention_duration": 86400,
    "range": {
    "min": 1
    },
    "enable_streaming": false,
    "anomaly_retention_size": 1073741824,
    "enable_anomaly_logging": false
    },
    "inputs": {
    "in": {
    "stage": "Periodic Change",
    "column": "value"
    }
    },
    "outputs": {
    "out": "Range"
    }
    }
  ],
  "stages": [
    {
    "name": "Extensible Service Collector",
    "description": "",
    "units": {
    "value": ""
    },
    "enable_metric_logging": false,
    "retention_duration": 86400,
    "retention_size": 0,
    "graph_annotation_properties": {}
    },
    {
    "name": "Periodic Change",
    "description": "",
    "units": {
    "value": ""
    },
    "enable_metric_logging": false,
    "retention_duration": 86400,
    "retention_size": 0,
    "graph_annotation_properties": {}
    },
    {
    "name": "Range",
    "description": "",
    "units": {
    "value": ""
    },
    "enable_metric_logging": false,
    "retention_duration": 86400,
    "retention_size": 0,
    "graph_annotation_properties": {}
    }
  ]
}
EOT
}
