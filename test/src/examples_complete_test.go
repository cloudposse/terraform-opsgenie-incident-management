package test

import (
	"strings"
	"testing"

	"github.com/gruntwork-io/terratest/modules/random"
	"github.com/gruntwork-io/terratest/modules/terraform"
	testStructure "github.com/gruntwork-io/terratest/modules/test-structure"
	"github.com/stretchr/testify/assert"
)

// Test the Terraform module in examples/complete using Terratest.
func TestExamplesComplete(t *testing.T) {
	t.Parallel()
	randID := strings.ToLower(random.UniqueId())
	attributes := []string{randID}

	rootFolder := "../../"
	terraformFolderRelativeToRoot := "examples/complete"
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
	outputApiIntegrationName := terraform.Output(t, terraformOptions, "api_integration_name")

	// Verify we're getting back the outputs we expect
	assert.Regexp(t, "^eg-test-incident-management-workflow$", outputApiIntegrationName)

	// Run `terraform output` to get the value of an output variable
	outputEscalationName := terraform.Output(t, terraformOptions, "escalation_name")

	// Verify we're getting back the outputs we expect
	assert.Regexp(t, "^eg-test-incident-management-workflow-escalation$", outputEscalationName)

	// Run `terraform output` to get the value of an output variable
	outputTeamRoutingRuleName := terraform.Output(t, terraformOptions, "team_routing_rule_name")

	// Verify we're getting back the outputs we expect
	assert.Regexp(t, "^eg-test-incident-management-workflow$", outputTeamRoutingRuleName)

	// Run `terraform output` to get the value of an output variable
	outputTeamName := terraform.Output(t, terraformOptions, "team_name")

	// Verify we're getting back the outputs we expect
	assert.Regexp(t, "^eg-test-incident-management-workflow$", outputTeamName)
}
