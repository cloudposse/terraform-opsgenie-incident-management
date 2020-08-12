module "team" {
  source = "../../modules/team"

  team = {
    name        = module.label.id
    description = "team-description"
  }
}

module "sub_team" {
  source = "../../modules/team"

  team = {
    name        = "${module.label.id}.team"
    description = "sub-team-description"
  }
}
