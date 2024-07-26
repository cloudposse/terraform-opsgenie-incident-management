package test

import (
	"github.com/gruntwork-io/terratest/modules/terraform"
	testStructure "github.com/gruntwork-io/terratest/modules/test-structure"
	"github.com/stretchr/testify/assert"
	"testing"
)

// Test the Terraform module in examples/advanced_features using Terratest.
func TestExamplesAdvancedFeatures(t *testing.T) {

	platform := detectPlatform()
	attributes := []string{platform}

	rootFolder := "../../"
	terraformFolderRelativeToRoot := "examples/advanced_features"
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

	// Here we have to do a plan because our plan doesn't support advanced_integrations
	stdOut := terraform.InitAndPlan(t, terraformOptions)

	assert.Contains(t, stdOut, "eg-test-api-integration-"+platform)
}
