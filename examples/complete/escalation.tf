module "escalation" {
  source = "../../modules/escalation"

  escalation = {
    name          = "${module.this.id}-escalation"
    owner_team_id = module.team.team_id

    rule = {
      recipients = [{
        type = "team"
        id   = module.sub_team.team_id
      }]
    }
  }

  context = module.this.context
}
