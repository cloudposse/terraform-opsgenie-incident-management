module "team" {
  source = "../../modules/team"

  team = {
    name           = "${module.this.id}.security"
    description    = "${module.this.id} Security Team"
    ignore_members = false
  }

  context = module.this.context
}
