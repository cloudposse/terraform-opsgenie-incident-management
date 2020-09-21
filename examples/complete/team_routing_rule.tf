module "team_routing_rule" {
  source = "../../modules/team_routing_rule"

  team_routing_rule = {
    name    = module.this.id
    team_id = module.team.team_id

    notify = [{
      type = "escalation"
      id   = module.escalation.escalation_id
    }]
  }
}
