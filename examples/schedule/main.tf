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
    description   = "team-schedule-description"
    owner_team_id = module.owner_team.team_id
  }
}

module "schedule" {
  source = "../../modules/schedule"

  schedule = {
    enabled     = module.this.enabled
    name        = module.this.id
    description = "schedule-description"
  }
}
