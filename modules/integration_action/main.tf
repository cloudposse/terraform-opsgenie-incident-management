resource "opsgenie_integration_action" "this" {
  count = module.this.enabled ? 1 : 0

  integration_id = var.integration_action.integration_id

  dynamic "create" {
    for_each = try(var.integration_action.create, [])

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
    for_each = try(var.integration_action.close, [])

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
    for_each = try(var.integration_action.acknowledge, [])

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
    for_each = try(var.integration_action.add_note, [])

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
    for_each = try(var.integration_action.ignore, [])

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
