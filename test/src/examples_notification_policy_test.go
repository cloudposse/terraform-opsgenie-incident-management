package test

import (
	"github.com/gruntwork-io/terratest/modules/random"
	"github.com/gruntwork-io/terratest/modules/terraform"
	testStructure "github.com/gruntwork-io/terratest/modules/test-structure"
	"github.com/stretchr/testify/assert"
	"strings"
	"testing"
)

// Test the Terraform module in examples/notification_policy using Terratest.
func TestExamplesNotificationPolicyDeDuplicationAction(t *testing.T) {
	// We are skipping this test because of the following error:
	//    Error: Error occurred with Status code: 403, Message: You are not authorized to use policies!, Took: 0.001000, RequestId: 66e46694-8e4c-4e20-9644-178db4b2f4c1
	t.SkipNow()

	t.Parallel()
	randID := strings.ToLower(random.UniqueId())
	attributes := []string{randID}

	rootFolder := "../../"
	terraformFolderRelativeToRoot := "examples/notification_policy"
	varFiles := []string{"fixtures.de_duplication_action.tfvars"}

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
	outputNotificationPolicyName := terraform.Output(t, terraformOptions, "notification_policy_name")

	// Verify we're getting back the outputs we expect
	assert.Regexp(t, "^eg-test-notification-policy$", outputNotificationPolicyName)
}

func TestExamplesNotificationPolicyDelayAction(t *testing.T) {
	// We are skipping this test because of the following error:
	//    Error: Error occurred with Status code: 403, Message: You are not authorized to use policies!, Took: 0.001000, RequestId: 66e46694-8e4c-4e20-9644-178db4b2f4c1
	t.SkipNow()

	t.Parallel()
	randID := strings.ToLower(random.UniqueId())
	attributes := []string{randID}

	rootFolder := "../../"
	terraformFolderRelativeToRoot := "examples/notification_policy"
	varFiles := []string{"fixtures.delay_action.tfvars"}

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
	outputNotificationPolicyName := terraform.Output(t, terraformOptions, "notification_policy_name")

	// Verify we're getting back the outputs we expect
	assert.Regexp(t, "^eg-test-notification-policy$", outputNotificationPolicyName)
}
