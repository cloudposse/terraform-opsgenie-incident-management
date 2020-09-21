module "team" {
  source = "../../modules/team"

  team = {
    name           = module.this.id
    description    = "team-description"
    ignore_members = var.ignore_members
  }
}

module "sub_team" {
  source = "../../modules/team"

  team = {
    name        = "${module.this.id}.team"
    description = "sub-team-description"
  }
}
