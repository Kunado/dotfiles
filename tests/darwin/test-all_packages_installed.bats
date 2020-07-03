#!/usr/bin/env bats

@test "git should be successfully installed" {
	git --version
	[ "$?" -eq 0 ]
}
