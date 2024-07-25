package test

import (
	"github.com/gruntwork-io/terratest/modules/random"
	"github.com/gruntwork-io/terratest/modules/terraform"
	testStructure "github.com/gruntwork-io/terratest/modules/test-structure"
	"github.com/stretchr/testify/assert"
	"os"
	"strings"
	"testing"
)

// Test the Terraform module in examples/user using Terratest.
func TestExamplesUser(t *testing.T) {
	t.Parallel()
	randID := strings.ToLower(random.UniqueId())
	attributes := []string{randID}

	rootFolder := "../../"
	terraformFolderRelativeToRoot := "examples/user"
	varFiles := []string{"fixtures.tfvars"}

	tempTestFolder := testStructure.CopyTerraformFolderToTemp(t, rootFolder, terraformFolderRelativeToRoot)

	terraformOptions := &terraform.Options{
		// The path to where our Terraform code is located
		TerraformDir: tempTestFolder,
		Upgrade:      true,
		// Variables to pass to our Terraform code using -var-file options
		VarFiles: varFiles,
		Vars: map[string]interface{}{
			"attributes":    attributes,
			"random_string": randID,
		},
	}

	// At the end of the test, run `terraform destroy` to clean up any resources that were created
	defer cleanupUser(t, terraformOptions, tempTestFolder)

	// This will run `terraform init` and `terraform apply` and fail the test if there are any errors
	terraform.InitAndApply(t, terraformOptions)

	// Run `terraform output` to get the value of an output variable
	userId := terraform.Output(t, terraformOptions, "user_id")

	// Verify we're getting back the outputs we expect
	assert.NotEmpty(t, userId)

	//opsGenieUserClient, err := opsgenieUser.NewClient(&client.Config{ApiKey: os.Getenv("OPSGENIE_API_KEY")})
	//if err != nil {
	//	t.Fatal(err)
	//}
	//result, err := opsGenieUserClient.Delete(nil, &opsgenieUser.DeleteRequest{Identifier: userId})
	//if err != nil {
	//	t.Fatal(err)
	//}
	//
	//t.Logf("Result: %+v", result)
	//
	//assert.Equal(t, result.Result, "Deleted")
}

func cleanupUser(t *testing.T, terraformOptions *terraform.Options, tempTestFolder string) {
	terraform.Apply(t, &terraform.Options{
		TerraformDir: terraformOptions.TerraformDir,
		Upgrade:      terraformOptions.Upgrade,
		// Variables to pass to our Terraform code using -var-file options
		VarFiles: terraformOptions.VarFiles,
		Vars: map[string]interface{}{
			"attributes":    terraformOptions.Vars["attributes"],
			"random_string": terraformOptions.Vars["random_string"],
			"enabled":       false,
		},
	})
	_ = os.RemoveAll(tempTestFolder)
}
