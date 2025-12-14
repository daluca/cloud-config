[private]
default:
  @just --list

init:
  tofu init

format: init
  tofu fmt

apply: init
  tofu apply

clean:
  rm -rv */.terraform/ */*.tfstate* || true
