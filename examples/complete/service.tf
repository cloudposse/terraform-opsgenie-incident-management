module "service" {
  source = "../../modules/service"

  service = {
    name        = "frontend"
    description = "Frontend service"
    team_id     = module.team.team_id
  }
}
