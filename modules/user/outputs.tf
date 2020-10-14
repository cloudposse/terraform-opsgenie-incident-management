output "user_id" {
  description = "The ID of the Opsgenie User"
  value       = join("", opsgenie_user.this.*.id)
}

output "user_name" {
  description = "The username of the Opsgenie User"
  value       = join("", opsgenie_user.this.*.username)
}
