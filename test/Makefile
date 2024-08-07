TEST_HARNESS ?= https://github.com/cloudposse/test-harness.git
TEST_HARNESS_BRANCH ?= master
TEST_HARNESS_PATH = $(realpath .test-harness)
BATS_ARGS ?= --tap
BATS_LOG ?= test.log

# Define a macro to run the tests
define RUN_TESTS
@echo "Running tests in $(1)"
@cd $(1) && bats $(BATS_ARGS) $(addsuffix .bats,$(addprefix $(TEST_HARNESS_PATH)/test/terraform/,$(TESTS)))
endef

default: all

-include Makefile.*

## Provision the test-harnesss
.test-harness:
	[ -d $@ ] || git clone --depth=1 -b $(TEST_HARNESS_BRANCH) $(TEST_HARNESS) $@

## Initialize the tests
init: .test-harness

## Install all dependencies (OS specific)
deps::
	@exit 0

## Clean up the test harness
clean:
	[ "$(TEST_HARNESS_PATH)" == "/" ] || rm -rf $(TEST_HARNESS_PATH)

## Run all tests
all: module pre-test examples/complete examples/advanced_features examples/alert_policy examples/api_integration examples/complete examples/config examples/escalation examples/integration_action examples/notification_policy examples/schedule examples/team examples/team_routing_rule examples/user

## Run basic sanity checks against the module itself
module: export TESTS ?= installed lint get-modules module-pinning get-plugins provider-pinning validate terraform-docs input-descriptions output-descriptions
module: deps
	$(call RUN_TESTS, ../)

pre-test:
	export TESTS ?= installed lint get-modules get-plugins validate

## Run tests against example
examples/complete: deps
	$(call RUN_TESTS, ../$@)
examples/advanced_features:  deps
	$(call RUN_TESTS, ../$@)
examples/alert_policy:  deps
	$(call RUN_TESTS, ../$@)
examples/api_integration:  deps
	$(call RUN_TESTS, ../$@)
examples/complete:  deps
	$(call RUN_TESTS, ../$@)
examples/config:  deps
	$(call RUN_TESTS, ../$@)
examples/escalation:  deps
	$(call RUN_TESTS, ../$@)
examples/integration_action:  deps
	$(call RUN_TESTS, ../$@)
examples/notification_policy:  deps
	$(call RUN_TESTS, ../$@)
examples/schedule:  deps
	$(call RUN_TESTS, ../$@)
examples/team:  deps
	$(call RUN_TESTS, ../$@)
examples/team_routing_rule:  deps
	$(call RUN_TESTS, ../$@)
examples/user:  deps
	$(call RUN_TESTS, ../$@)
