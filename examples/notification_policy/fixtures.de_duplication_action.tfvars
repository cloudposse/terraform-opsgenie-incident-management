namespace = "eg"
name      = "notification-policy"
stage     = "test"

de_duplication_action = {
  de_duplication_action_type = "frequency-based"
  count                      = 2
  duration = {
    time_unit   = "minutes"
    time_amount = 5
  }
}
