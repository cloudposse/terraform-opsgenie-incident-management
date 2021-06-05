package test

import (
	"github.com/gruntwork-io/terratest/modules/terraform"
	"testing"
)


// Test the Terraform module in examples/integration_action using Terratest.
func TestExamplesIntegrationAction(t *testing.T) {
	terraformOptions := &terraform.Options{
		// The path to where our Terraform code is located
		TerraformDir: "../../examples/integration_action",
		Upgrade:      true,
		// Variables to pass to our Terraform code using -var-file options
		VarFiles: []string{"fixtures.tfvars"},
	}

  // At the end of the test, run `terraform destroy` to clean up any resources that were created
	defer terraform.Destroy(t, terraformOptions)

	// This will run `terraform init` and `terraform apply` and fail the test if there are any errors
	terraform.InitAndApply(t, terraformOptions)
}
