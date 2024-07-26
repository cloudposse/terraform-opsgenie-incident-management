package test

import (
	"github.com/gruntwork-io/terratest/modules/terraform"
	testStructure "github.com/gruntwork-io/terratest/modules/test-structure"
	"github.com/stretchr/testify/assert"
	"testing"
)

// Test the Terraform module in examples/team_routing_rule using Terratest.
func TestExamplesTeamRoutingRule(t *testing.T) {

	platform := detectPlatform()
	attributes := []string{platform}

	rootFolder := "../../"
	terraformFolderRelativeToRoot := "examples/team_routing_rule"
	varFiles := []string{"fixtures.tfvars"}

	tempTestFolder := testStructure.CopyTerraformFolderToTemp(t, rootFolder, terraformFolderRelativeToRoot)

	terraformOptions := &terraform.Options{
		// The path to where our Terraform code is located
		TerraformDir: tempTestFolder,
		Upgrade:      true,
		// Variables to pass to our Terraform code using -var-file options
		VarFiles: varFiles,
		Vars: map[string]interface{}{
			"attributes": attributes,
		},
	}

	// At the end of the test, run `terraform destroy` to clean up any resources that were created
	defer cleanup(t, terraformOptions, tempTestFolder)

	// This will run `terraform init` and `terraform apply` and fail the test if there are any errors
	terraform.InitAndApply(t, terraformOptions)

	// Run `terraform output` to get the value of an output variable
	outputTeamRoutingRuleName := terraform.Output(t, terraformOptions, "team_routing_rule_name")
	expectedTeamRoutingRuleName := "eg-test-team-routing-rule-" + platform
	// Verify we're getting back the outputs we expect
	assert.Equal(t, expectedTeamRoutingRuleName, outputTeamRoutingRuleName)
}
