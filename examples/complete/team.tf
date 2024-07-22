module "team" {
  source = "../../modules/team"

  team = {
    name           = module.this.id
    description    = "team-description"
    ignore_members = false
  }
  context = module.this.context
}

module "sub_team" {
  source = "../../modules/team"

  team = {
    name        = "${module.this.id}.team"
    description = "sub-team-description"
  }
  context = module.this.context
}
