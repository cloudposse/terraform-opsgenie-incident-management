resource "opsgenie_schedule_rotation" "this" {
  for_each = module.this.enabled ? { for schedule_rotation in local.schedule_rotations : schedule_rotation.name => schedule_rotation } : tomap()

  name = each.value.name
  type = each.value.type

  start_date = each.value.start_date
  end_date   = try(each.value.end_date, null)
  length     = try(each.value.length, null)

  # Look up our schedule id by name
  schedule_id = try(opsgenie_schedule.this[each.value.schedule_name].id, null)

  dynamic "participant" {
    for_each = try(each.value.participants, [])

    content {
      type = participant.value.type
      id   = try(opsgenie_user.this[participant.value.username].id, data.opsgenie_user.this[participant.value.username].id)
    }
  }

  dynamic "time_restriction" {
    for_each = try(each.value.time_restriction, null) != null ? ["true"] : []

    content {
      type = each.value.time_restriction.type

      dynamic "restriction" {
        for_each = each.value.time_restriction.type == "time-of-day" ? each.value.time_restriction.restrictions : []

        content {
          start_hour = restriction.value.start_hour
          start_min  = restriction.value.start_min
          end_hour   = restriction.value.end_hour
          end_min    = restriction.value.end_min
        }
      }

      dynamic "restrictions" {
        for_each = each.value.time_restriction.type == "weekday-and-time-of-day" ? each.value.time_restriction.restrictions : []

        content {
          start_day  = restrictions.value.start_day
          end_day    = restrictions.value.end_day
          start_hour = restrictions.value.start_hour
          start_min  = restrictions.value.start_min
          end_hour   = restrictions.value.end_hour
          end_min    = restrictions.value.end_min
        }
      }
    }
  }
}
