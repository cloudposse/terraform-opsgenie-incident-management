package test

import (
	"os"
	"os/exec"
	"strings"
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
)

func cleanup(t *testing.T, terraformOptions *terraform.Options, tempTestFolder string) {
	terraform.Destroy(t, terraformOptions)
	_ = os.RemoveAll(tempTestFolder)
}

func detectPlatform() string {
	cmd := exec.Command("terraform", "--version")
	out, _ := cmd.CombinedOutput()
	platform := ""
	if strings.Contains(string(out), "Terraform") {
		platform = "tf"
	} else if strings.Contains(string(out), "OpenTofu") {
		platform = "tofu"
	} else {
		platform = "unknown"
	}
	return platform
}
