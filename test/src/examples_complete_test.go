package test

import (
	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
	"testing"
)

// Test the Terraform module in examples/complete using Terratest.
func TestExamplesComplete(t *testing.T) {
	terraformOptions := &terraform.Options{
		// The path to where our Terraform code is located
		TerraformDir: "../../examples/complete",
		Upgrade:      true,
		// Variables to pass to our Terraform code using -var-file options
		VarFiles: []string{"fixtures.tfvars"},
	}

	// At the end of the test, run `terraform destroy` to clean up any resources that were created
	defer terraform.Destroy(t, terraformOptions)

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
	outputNotificationPolicyName := terraform.Output(t, terraformOptions, "notification_policy_name")

	// Verify we're getting back the outputs we expect
	assert.Regexp(t, "^eg-test-incident-management-workflow$", outputNotificationPolicyName)

	// Run `terraform output` to get the value of an output variable
	outputTeamRoutingRuleName := terraform.Output(t, terraformOptions, "team_routing_rule_name")

	// Verify we're getting back the outputs we expect
	assert.Regexp(t, "^eg-test-incident-management-workflow$", outputTeamRoutingRuleName)

	// Run `terraform output` to get the value of an output variable
	outputTeamName := terraform.Output(t, terraformOptions, "team_name")

	// Verify we're getting back the outputs we expect
	assert.Regexp(t, "^eg-test-incident-management-workflow$", outputTeamName)
}
