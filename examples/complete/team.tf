module "team" {
  source = "../../modules/team"

  team = {
    name           = module.this.id
    description    = "team-description"
    ignore_members = false

    members = [
      {
        id   = module.user.user_id
        role = "admin"
      }
    ]
  }
}

module "sub_team" {
  source = "../../modules/team"

  team = {
    name        = "${module.this.id}.team"
    description = "sub-team-description"
  }
}
