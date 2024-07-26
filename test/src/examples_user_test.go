package test

import (
	"github.com/gruntwork-io/terratest/modules/terraform"
	testStructure "github.com/gruntwork-io/terratest/modules/test-structure"
	"github.com/opsgenie/opsgenie-go-sdk-v2/client"
	opsgenieUser "github.com/opsgenie/opsgenie-go-sdk-v2/user"
	"github.com/stretchr/testify/assert"
	"os"
	"testing"
)

// Test the Terraform module in examples/user using Terratest.
func TestExamplesUser(t *testing.T) {
	t.Parallel()

	platform := detectPlatform()
	attributes := []string{platform}

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
			"attributes": attributes,
		},
	}

	// At the end of the test, run `terraform destroy` to clean up any resources that were created
	defer cleanup(t, terraformOptions, tempTestFolder)

	// This will run `terraform init` and `terraform apply` and fail the test if there are any errors
	terraform.InitAndApply(t, terraformOptions)

	// Run `terraform output` to get the value of an output variable
	userId := terraform.Output(t, terraformOptions, "user_id")

	// Verify we're getting back the outputs we expect
	assert.NotEmpty(t, userId)

	opsGenieUserClient, err := opsgenieUser.NewClient(&client.Config{
		ApiKey: os.Getenv("OPSGENIE_API_KEY"),
	})

	list, err := opsGenieUserClient.List(nil, &opsgenieUser.ListRequest{
		// Queries don't like + signs which makes + addressing email addresses a problem
		Query: "username: opsgenie-test*" + platform + "*",
	})
	if err != nil {
		t.Fatal(err)
	}

	//for _, listItem := range list.Users {
	//	t.Logf("User: %+v", listItem)
	//}

	if len(list.Users) == 1 {
		userId = list.Users[0].Id
	} else if len(list.Users) == 0 {
		t.Fatal("User not found")
	} else {
		t.Fatal("Multiple users found")
	}
	if err != nil {
		t.Fatal(err)
	}
	result, err := opsGenieUserClient.Delete(nil, &opsgenieUser.DeleteRequest{Identifier: userId})

	if err != nil {
		t.Fatal(err)
	}

	assert.Equal(t, result.Result, "Deleted")
}
