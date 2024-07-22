# We are disabling this test for now as we receive a 403 error
#  Error: Error occurred with Status code: 403, Message: You are not authorized to use policies!,
#  Took: 0.003000, RequestId: ...
enabled = false

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
