package test

import (
	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
	"testing"
)

// Test the Terraform module in examples/alert_policy using Terratest.
func TestExamplesAlertPolicy(t *testing.T) {
	terraformOptions := &terraform.Options{
		// The path to where our Terraform code is located
		TerraformDir: "../../examples/alert_policy",
		Upgrade:      true,
		// Variables to pass to our Terraform code using -var-file options
		VarFiles: []string{"fixtures.us-east-2.tfvars"},
	}

	// At the end of the test, run `terraform destroy` to clean up any resources that were created
	defer terraform.Destroy(t, terraformOptions)

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
