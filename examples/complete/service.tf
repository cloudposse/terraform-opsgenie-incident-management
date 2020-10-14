module "service" {
  source = "../../modules/service"

  # Services are Opsgenie Enterprise feature, disable it for now
  enabled = false

  service = {
    name        = "frontend"
    description = "Frontend service"
    team_id     = module.team.team_id
  }
}
