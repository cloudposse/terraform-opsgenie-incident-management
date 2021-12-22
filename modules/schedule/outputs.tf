output "schedule_id" {
  description = "The ID of the Opsgenie Schedule"
  value       = try(opsgenie_schedule.default[*].id, null)
}
