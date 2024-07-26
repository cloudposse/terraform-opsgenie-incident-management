package test

import (
	"github.com/gruntwork-io/terratest/modules/terraform"
	testStructure "github.com/gruntwork-io/terratest/modules/test-structure"
	"github.com/stretchr/testify/assert"
	"testing"
)

// Test the Terraform module in examples/alert_policy using Terratest.
func TestExamplesAlertPolicy(t *testing.T) {

	platform := detectPlatform()
	attributes := []string{platform}

	rootFolder := "../../"
	terraformFolderRelativeToRoot := "examples/alert_policy"
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

	// Run `terraform output` to get the value of an output variable and test it
	outputAlertPolicyName := terraform.Output(t, terraformOptions, "alert_policy_name")
	assert.Equal(t, "eg-test-alert-policy", outputAlertPolicyName)

	outputAlertPolicyPriority := terraform.Output(t, terraformOptions, "alert_policy_priority")
	assert.Equal(t, "P1", outputAlertPolicyPriority)

	expectedAlertPolicyTags := `[
  "test1",
  "test2",
]`
	outputAlertPolicyTags := terraform.Output(t, terraformOptions, "alert_policy_tags")
	assert.Equal(t, expectedAlertPolicyTags, outputAlertPolicyTags)

	expectedAlertPolicyFilter := `[
  {
    "conditions" = [
      {
        "expected_value" = ".*prod.*"
        "field" = "source"
        "key" = ""
        "not" = false
        "operation" = "matches"
        "order" = 0
      },
      {
        "expected_value" = "severity:critical"
        "field" = "tags"
        "key" = ""
        "not" = false
        "operation" = "contains"
        "order" = 0
      },
    ]
    "type" = "match-all-conditions"
  },
]`
	outputAlertPolicyFilter := terraform.Output(t, terraformOptions, "alert_policy_filter")
	assert.Equal(t, expectedAlertPolicyFilter, outputAlertPolicyFilter)

	expectedAlertPolicyResponders := `[
  {
    "id" = .*
    "name" = ""
    "type" = "team"
    "username" = ""
  },
]`
	outputAlertPolicyResponders := terraform.Output(t, terraformOptions, "alert_policy_responders")
	assert.Regexp(t, expectedAlertPolicyResponders, outputAlertPolicyResponders)
}
