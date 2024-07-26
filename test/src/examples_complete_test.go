package test

import (
	"regexp"
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	testStructure "github.com/gruntwork-io/terratest/modules/test-structure"
	"github.com/stretchr/testify/assert"
)

// Test the Terraform module in examples/complete using Terratest.
func TestExamplesComplete(t *testing.T) {

	platform := detectPlatform()
	attributes := []string{platform}

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
	expectedWorkflowName := "eg-test-complete-" + platform
	assert.Equal(t, expectedWorkflowName, outputApiIntegrationName)

	// Run `terraform output` to get the value of an output variable

	outputEscalationName := terraform.Output(t, terraformOptions, "escalation_name")
	expectedEscalationName := "eg-test-complete-" + platform + "-escalation"

	// Verify we're getting back the outputs we expect
	assert.Equal(t, expectedEscalationName, outputEscalationName)

	// Run `terraform output` to get the value of an output variable
	outputTeamRoutingRuleName := terraform.Output(t, terraformOptions, "team_routing_rule_name")
	expectedTeamRoutingRuleName := "eg-test-complete-" + platform

	// Verify we're getting back the outputs we expect
	assert.Equal(t, expectedTeamRoutingRuleName, outputTeamRoutingRuleName)

	// Run `terraform output` to get the value of an output variable
	outputTeamName := terraform.Output(t, terraformOptions, "team_name")
	expectedTeamName := "eg-test-complete-" + platform
	// Verify we're getting back the outputs we expect
	assert.Equal(t, expectedTeamName, outputTeamName)
}

func TestExamplesCompleteDisabled(t *testing.T) {

	platform := detectPlatform()
	attributes := []string{platform}

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
			"enabled":    false,
		},
	}

	// At the end of the test, run `terraform destroy` to clean up any resources that were created
	defer cleanup(t, terraformOptions, tempTestFolder)

	// This will run `terraform init` and `terraform apply` and fail the test if there are any errors
	results := terraform.InitAndApply(t, terraformOptions)

	// Should complete successfully without creating or changing any resources.
	// Extract the "Resources:" section of the output to make the error message more readable.
	re := regexp.MustCompile(`Resources: [^.]+\.`)
	match := re.FindString(results)
	assert.Equal(t, "Resources: 0 added, 0 changed, 0 destroyed.", match, "Re-applying the same configuration should not change any resources")
}
