provider "opsgenie" {
  api_key = var.opsgenie_provider_api_key
}
module "owner_team" {
  source = "../../modules/team"

  team = {
    name        = "owner-team"
    description = "owner-team-description"
  }
}

module "team_schedule" {
  source = "../../modules/schedule"
  schedule = {
    enabled       = module.this.enabled
    name          = module.this.id
    description   = "schedule-description"
    owner_team_id = try(module.owner_team.team_id, null)
  }
}
module "schedule" {
  source = "../../modules/schedule"
  schedule = {
    enabled       = module.this.enabled
    name          = module.this.id
    description   = "schedule-description"
  }
}
