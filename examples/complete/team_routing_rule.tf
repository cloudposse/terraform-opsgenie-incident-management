module "team_routing_rule" {
  source = "../../modules/team_routing_rule"

  provider_api_key = var.opsgenie_provider_api_key

  team_routing_rule = {
    name    = module.label.id
    team_id = module.team.team_id

    notify = [{
      type = "escalation"
      id   = module.escalation.escalation_id
    }]
  }
}
