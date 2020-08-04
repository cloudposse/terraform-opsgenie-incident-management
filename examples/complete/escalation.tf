module "escalation" {
  source = "../../modules/escalation"

  provider_api_key = var.opsgenie_provider_api_key

  escalation = {
    name          = "${module.label.id}-escalation"
    owner_team_id = module.team.team_id

    rule = {
      recipients = [{
        type = "team"
        id   = module.sub_team.team_id
      }]
    }
  }

}
