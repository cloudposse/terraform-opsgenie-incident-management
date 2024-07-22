namespace = "eg"
name      = "notification-policy"
stage     = "test"

delay_action = {
  delay_option = "for-duration"
  duration     = {
    time_unit   = "minutes"
    time_amount = 10
  }
}
