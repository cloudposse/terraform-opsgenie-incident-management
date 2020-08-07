package test

import (
	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
	"testing"
)

// Test the Terraform module in examples/team_routing_rule using Terratest.
func TestExamplesTeamRoutingRule(t *testing.T) {
	terraformOptions := &terraform.Options{
		// The path to where our Terraform code is located
		TerraformDir: "../../examples/team_routing_rule",
		Upgrade:      true,
		// Variables to pass to our Terraform code using -var-file options
		VarFiles: []string{"fixtures.tfvars"},
	}

	// At the end of the test, run `terraform destroy` to clean up any resources that were created
	defer terraform.Destroy(t, terraformOptions)

	// This will run `terraform init` and `terraform apply` and fail the test if there are any errors
	terraform.InitAndApply(t, terraformOptions)

	// Run `terraform output` to get the value of an output variable
	outputTeamRoutingRuleName := terraform.Output(t, terraformOptions, "team_routing_rule_name")

	// Verify we're getting back the outputs we expect
	assert.Regexp(t, "^eg-test-team-routing-rule$", outputTeamRoutingRuleName)
}
