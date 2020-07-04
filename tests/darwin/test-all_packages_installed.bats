# /usr/bin/env bats

@test "git should be successfully installed with brew" {
	run git --version
	[ "$?" -eq 0 ]
	brew list | grep git
	[ "$?" -eq 0 ]
}

@test "tmux should be successfully installed with brew" {
	run tmux --version
	[ "$?" -eq 0 ]
	brew list | grep tmux
	[ "$?" -eq 0 ]
}

#@test "peco should be successfully installed" {
#	brew list | grep peco
#	[ "$?" -eq 0 ]
#}
