module "escalation" {
  source = "../../modules/escalation"

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
