resource "opsgenie_integration_action" "this" {
  for_each = module.this.enabled ? toset(local.integration_actions) : toset()

  # Look up our integration id by name
  integration_id = try(opsgenie_api_integration.this[each.value.integration_name].id, null)

  dynamic "create" {
    for_each = try(each.value.create, [])

    content {
      name          = try(create.value.name, null)
      tags          = try(create.value.tags, [])
      user          = try(create.value.user, null)
      note          = try(create.value.note, null)
      alias         = try(create.value.alias, null)
      source        = try(create.value.source, null)
      message       = try(create.value.message, null)
      description   = try(create.value.description, null)
      entity        = try(create.value.entity, null)
      alert_actions = try(create.value.alert_actions, [])

      filter {
        type = try(create.value.filter.type, null)

        dynamic "conditions" {
          for_each = try(create.value.filter.conditions, [])

          content {
            field          = try(conditions.value.field, null)
            operation      = try(conditions.value.operation, null)
            expected_value = try(conditions.value.expected_value, null)
          }
        }
      }
    }
  }

  dynamic "close" {
    for_each = try(each.value.close, [])

    content {
      name = try(close.value.name, null)

      filter {
        type = try(close.value.filter.type, null)

        dynamic "conditions" {
          for_each = try(close.value.filter.conditions, [])

          content {
            field          = try(conditions.value.field, null)
            operation      = try(conditions.value.operation, null)
            expected_value = try(conditions.value.expected_value, null)
          }
        }
      }
    }
  }

  dynamic "acknowledge" {
    for_each = try(each.value.acknowledge, [])

    content {
      name = try(acknowledge.value.name, null)

      filter {
        type = try(acknowledge.value.filter.type, null)

        dynamic "conditions" {
          for_each = try(acknowledge.value.filter.conditions, [])

          content {
            field          = try(conditions.value.field, null)
            operation      = try(conditions.value.operation, null)
            expected_value = try(conditions.value.expected_value, null)
          }
        }
      }
    }
  }

  dynamic "add_note" {
    for_each = try(each.value.add_note, [])

    content {
      name = try(add_note.value.name, null)
      note = try(add_note.value.name, null)

      filter {
        type = try(add_note.value.filter.type, null)

        dynamic "conditions" {
          for_each = try(add_note.value.filter.conditions, [])

          content {
            field          = try(conditions.value.field, null)
            operation      = try(conditions.value.operation, null)
            expected_value = try(conditions.value.expected_value, null)
          }
        }
      }
    }
  }

  dynamic "ignore" {
    for_each = try(each.value.ignore, [])

    content {
      name = try(ignore.value.name, null)

      filter {
        type = try(ignore.value.filter.type, null)

        dynamic "conditions" {
          for_each = try(ignore.value.filter.conditions, [])

          content {
            field          = try(conditions.value.field, null)
            operation      = try(conditions.value.operation, null)
            expected_value = try(conditions.value.expected_value, null)
          }
        }
      }
    }
  }
}
