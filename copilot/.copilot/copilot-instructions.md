## Commands

Assume Linux and use shell commands instead of writing scripts for simple tasks.

- `ls -la` to list directory contents
- `tree` to inspect file hierarchies
- `cat` to read file contents
- `find` to search for files in a directory hierarchy
- `grep` to find patterns in files

Assume the following tools to be available.

- `jq` to process JSON and its wrappers
  - `xq` for XML
  - `yq` for YAML
  - `tomlq` for TOML

## Git

You will never make a commit unless you are asked to.

## Docker

Assume Podman as the container service.

## Java

Assume Java 21 as the language level.

Prefer switch over else-if.

Prefer var over explicit type.

Always use imports instead of qualified names when there is no conflict.

Prefer records over classes for DTOs.

## JS/TS

Read the `package.json` file to inform yourself about available dependencies and scripts.

`prettier` is installed globally for formatting.

Assume baseline for browser features.

Use coalescing operators and optional chaining over if statements.

Destructure objects in arrow functions if there are no conflicts.

## GitHub Actions

Use `actionlint` to lint GitHub workflow defintions.

Ask to use nektos `act` to test GitHub actions where reasonable.
