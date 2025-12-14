[private]
default:
  @just --list

# initialise opentofu
[group("tofu")]
init:
  tofu init

# upgrade opentofu providers
[group("tofu")]
upgrade:
  tofu init -upgrade

# preview changes
[group("tofu")]
plan: init
  tofu plan

# apply changes
[group("tofu")]
apply: init
  tofu apply

# update all flake inputs
[group("flake")]
update:
  nix flake update

# all checks on all system types
[group("flake")]
check:
  nix flake check --all-systems

# pre-commit checks
[group("checks")]
pre-commit:
  pre-commit run --all-files

alias fmt := format
# format all files
[group("repo")]
format:
  nix fmt

# clean repository
[no-exit-message]
[group("repo")]
clean:
  rm --recursive */.terraform/ */*.tfstate*
