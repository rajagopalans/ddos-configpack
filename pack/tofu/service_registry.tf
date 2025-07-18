resource "apstra_raw_json" "ddos_service" {
  url = "/api/telemetry-service-registry"
  id = "DDoS_Protection_Protocols"
  payload = jsonencode(
    {
      description        = "DDOS service registry"
      application_schema = {
        properties = {
          key = {
            properties = {
              Protocol = {
                type : "string"
              }
            },
            required = [
              "Protocol"
            ],
            type = "object"
          },
          value = {
            type = "integer"
          }
        }
          required = [
            "key",
            "value"
          ],
          type = "object"
        },
        telemetry-values = [
          {
            value-name = "value",
            value-type = "aos.sdk.telemetry.schemas.iba_integer_data"
          }
        ],
        service_name = "DDoS_Protection_Protocols",
        storage_schema_path = "aos.sdk.telemetry.schemas.iba_integer_data",
        telemetry-keys = [
          {
            key-name = "Protocol",
            key-type = "string"
          }
        ]
      }
  )
}
