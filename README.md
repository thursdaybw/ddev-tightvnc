[![tests](https://github.com/thursdaybw/ddev-vnc/actions/workflows/tests.yml/badge.svg)](https://github.com/thursdaybw/ddev-vnc/actions/workflows/tests.yml) ![project is maintained](https://img.shields.io/maintenance/yes/2024.svg)

# ddev-vnc <!-- omit in toc -->

* [What is ddev-vnc?](#what-is-ddev-vnc)
* [Components of the repository](#components-of-the-repository)
* [Getting started](#getting-started)
* [How to debug tests (Github Actions)](#how-to-debug-tests-github-actions)

## What is ddev-vnc?

`ddev-vnc` is a DDEV add-on that provides VNC (Virtual Network Computing) capabilities for DDEV projects. This allows developers to access a graphical desktop environment within their DDEV containers.

## Components of the repository

* The fundamental contents of the add-on service or other component. For example, in this template there is a [docker-compose.vnc.yaml](docker-compose.vnc.yaml) file.
* An [install.yaml](install.yaml) file that describes how to install the service or other component.
* A test suite in [test.bats](tests/test.bats) that makes sure the service continues to work as expected.
* [Github actions setup](.github/workflows/tests.yml) so that the tests run automatically when you push to the repository.

## Getting started

1. Create the new repository by using this template.
2. Globally replace "addon-template" with "ddev-vnc".
3. Add the files that need to be added to a DDEV project to the repository.
4. Update the `install.yaml` to give the necessary instructions for installing the add-on:
   * The fundamental line is the `project_files` directive, a list of files to be copied from this repo into the project `.ddev` directory.
   * You can optionally add files to the `global_files` directive as well, which will cause files to be placed in the global `.ddev` directory, `~/.ddev`.
   * Finally, `pre_install_commands` and `post_install_commands` are supported.
5. Update `tests/test.bats` to provide a reasonable test for your repository.
6. When everything is working, including the tests, you can push the repository to GitHub.
7. Create a [release](https://docs.github.com/en/repositories/releasing-projects-on-github/managing-releases-in-a-repository) on GitHub.
8. Test manually with `ddev get thursdaybw/ddev-vnc`.
9. You can test PRs with `ddev get https://github.com/thursdaybw/ddev-vnc/tarball/<branch>`.
10. Update the `README.md` to describe the add-on, how to use it, and how to contribute.

## How to debug tests (Github Actions)

1. You need an SSH-key registered with GitHub. You either pick the key you have already used with `github.com` or you create a dedicated new one with `ssh-keygen -t ed25519 -a 64 -f tmate_ed25519 -C "$(date +'%d-%m-%Y')"` and add it at `https://github.com/settings/keys`.
2. Add the following snippet to `~/.ssh/config`:
   ```
   Host *.tmate.io
       User git
       AddKeysToAgent yes
       UseKeychain yes
       PreferredAuthentications publickey
       IdentitiesOnly yes
       IdentityFile ~/.ssh/tmate_ed25519
   ```
3. Go to `https://github.com/thursdaybw/ddev-vnc/actions/workflows/tests.yml`.
4. Click the `Run workflow` button and you will have the option to select the branch to run the workflow from and activate `tmate` by checking the `Debug with tmate` checkbox for this run.
5. After the `workflow_dispatch` event was triggered, click the `All workflows` link in the sidebar and then click the `tests` action in progress workflow.
6. Pick one of the jobs in progress in the sidebar.
7. Wait until the current task list reaches the `tmate debugging session` section and the output shows something like:
   ```
   106 SSH: ssh PRbaS7SLVxbXImhjUqydQBgDL@nyc1.tmate.io
   107 or: ssh -i <path-to-private-SSH-key> PRbaS7SLVxbXImhjUqydQBgDL@nyc1.tmate.io
   108 SSH: ssh PRbaS7SLVxbXImhjUqydQBgDL@nyc1.tmate.io
   109 or: ssh -i <path-to-private-SSH-key> PRbaS7SLVxbXImhjUqydQBgDL@nyc1.tmate.io
   ```
8. Copy and execute the first option `ssh PRbaS7SLVxbXImhjUqydQBgDL@nyc1.tmate.io` in the terminal and continue by pressing either <kbd>q</kbd> or <kbd>Ctrl</kbd> + <kbd>c</kbd>.
9. Start the Bats test with `bats ./tests/test.bats`.

For a more detailed documentation about `tmate` see [Debug your GitHub Actions by using tmate](https://mxschmitt.github.io/action-tmate/).

**Contributed and maintained by [@thursdaybw](https://github.com/thursdaybw)**
