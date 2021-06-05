package test

import (
	"github.com/gruntwork-io/terratest/modules/terraform"
	"testing"
)

// Do not actually apply the Terraform module in examples/advanced_Features using Terratest.
// Instead, just test that this configuration can perform a plan. The reasoning behind this is
// that this configuration requires an OpsGenie plan that has access to advanced integrations.
// Otherwise, we will get the following error from the OpsGenie API:
// 'Your plan does not allow saving advanced integrations.''
func TestExamplesAdvancedFeatures(t *testing.T) {
	terraformOptions := &terraform.Options{
		// The path to where our Terraform code is located
		TerraformDir: "../../examples/advanced_features",
		Upgrade:      true,
		// Variables to pass to our Terraform code using -var-file options
		VarFiles: []string{"fixtures.tfvars"},
	}

	terraform.InitAndPlan(t, terraformOptions)
}
