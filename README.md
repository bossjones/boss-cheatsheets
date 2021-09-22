boss-cheatsheets
=====
[cheat](https://github.com/chrisallenlane/cheat) allows you to create and view interactive cheatsheets on the
command-line. It was designed to help remind \*nix system administrators of
options for commands that they use frequently, but not frequently enough to
remember.

This repo contains a number of commands that bossjones likes to use when debugging things, feel free to contribute to the list by making a PR!

## Install custom cheatsheets

```sh
# clone this repo somewhere on your laptop
git clone https://github.com/bossjones/boss-cheatsheets ~/dev/behance/devops-cheatsheets

# Edit the cheat yaml config to reference the location of your cheatsheets
~/dev/bossjones/boss-cheatsheets feature-git-search-history
❯ cat ~/.config/cheat/conf.yml
---
# The editor to use with 'cheat -e <sheet>'. Defaults to $EDITOR or $VISUAL.
editor: vim

# Should 'cheat' always colorize output?
colorize: true

# Which 'chroma' colorscheme should be applied to the output?
# Options are available here:
#   https://github.com/alecthomas/chroma/tree/master/styles
style: monokai

# Which 'chroma' "formatter" should be applied?
# One of: "terminal", "terminal256", "terminal16m"
formatter: terminal16m

# Through which pager should output be piped? (Unset this key for no pager.)
pager: less -FRX

# The paths at which cheatsheets are available. Tags associated with a cheatpath
# are automatically attached to all cheatsheets residing on that path.
#
# Whenever cheatsheets share the same title (like 'tar'), the most local
# cheatsheets (those which come later in this file) take precedent over the
# less local sheets. This allows you to create your own "overides" for
# "upstream" cheatsheets.
#
# But what if you want to view the "upstream" cheatsheets instead of your own?
# Cheatsheets may be filtered via 'cheat -t <tag>' in combination with other
# commands. So, if you want to view the 'tar' cheatsheet that is tagged as
# 'community' rather than your own, you can use: cheat tar -t community
cheatpaths:

  # Paths that come earlier are considered to be the most "global", and will
  # thus be overridden by more local cheatsheets. That being the case, you
  # should probably list community cheatsheets first.
  #
  # Note that the paths and tags listed below are placeholders. You may freely
  # change them to suit your needs.
  #
  # Community cheatsheets must be installed separately, though you may have
  # downloaded them automatically when installing 'cheat'. If not, you may
  # download them here:
  #
  # https://github.com/cheat/cheatsheets
  #
  # Once downloaded, ensure that 'path' below points to the location at which
  # you downloaded the community cheatsheets.

  - name: behance                   # a name for the cheatpath
    path: /Users/malcolm/dev/behance/devops-cheatsheets # the path's location on the filesystem
    tags: [ behance ]               # these tags will be applied to all sheets on the path
    readonly: false                    # if true, `cheat` will not create new cheatsheets here

  # - name: personal
  #   path: /Users/malcolm/documents/cheat/personal  # this is a separate directory and repository than above
  #   tags: [ personal ]
  #   readonly: false                   # new sheets may be written here

  - name: community
    path: /Users/malcolm/.config/cheat/cheatsheets/community
    tags: [ community ]
    readonly: true

  # # If you have personalized cheatsheets, list them last. They will take
  # # precedence over the more global cheatsheets.
  # - name: personal
  #   path: /Users/malcolm/.config/cheat/cheatsheets/personal
  #   tags: [ personal ]
  #   readonly: false

  # While it requires no configuration here, it's also worth noting that
  # 'cheat' will automatically append directories named '.cheat' within the
  # current working directory to the 'cheatpath'. This can be very useful if
  # you'd like to closely associate cheatsheets with, for example, a directory
  # containing source code.
  #
  # Such "directory-scoped" cheatsheets will be treated as the most "local"
  # cheatsheets, and will override less "local" cheatsheets. Likewise,
  # directory-scoped cheatsheets will always be editable ('readonly: false').

```

## Update custom cheatsheets

```sh
# update cheatsheets
pushd ~/.cheat
git pull
popd

# View cheatsheets
cheat -l
```


Example
-------
Forgot all of your go-to commands for sysdig? No problem, just run:

```sh
cheat sysdig
```

You will be presented with a cheatsheet resembling:

```sh
# Basic Command List

# Capture all the events from the live system and print them to screen
sysdig

# Capture all the events from the live system and save them to disk
sysdig -qw dumpfile.scap

# Read events from a file and print them to screen
sysdig -r dumpfile.scap

# Print all the open system calls invoked by cat
sysdig proc.name=cat and evt.type=open

#Print the name of the files opened by cat
./sysdig -p"%evt.arg.name" proc.name=cat and evt.type=open

# List the available chisels
./sysdig -cl

# Run the spy_ip chisel for the 192.168.1.157 IP address:
sysdig -c spy_ip 192.168.1.157

# Output Format

# By default, sysdig prints the information for each captured event on a single line, with the following format:
# <evt.time> <evt.cpu> <proc.name> <thread.tid> <evt.dir> <evt.type> <evt.args>
# where: evt.time is the event timestamp evt.cpu is the CPU number where the event was captured proc.name is the name of the process that generated the event thread.tid id the TID that generated the event, which corresponds to the PID for single thread processes evt.dir is the event direction, > for enter events and < for exit events evt.type is the name of the event, e.g. 'open' or 'read' evt.args is the list of event arguments.

# The output format can be customized with the -p switch, using any of the fields listed by 'sysdig -l'.

# Filtering

# sysdig filters are specified at the end of the command line. The simplest filter is a simple field-value check:
sysdig proc.name=cat

# The list of available fields can be obtained with 'sysdig -l'. Checks can use one of these comparison operators: =, !=, <, <=, >, >= and contains. e.g.
sysdig fd.name contains /etc

# Multiple checks can be combined through parentheses and the following boolean operators: and, or, not. e.g.
sysdig "not(fd.name contains /proc or fd.name contains /dev)"

# Chisels
# Sysdig’s chisels are little scripts that analyze the sysdig event stream to perform useful actions. To get the list of available chisels, type
sysdig –cl

# For each chisel, you get the description and the list of arguments it expects. To run one of the chisels, you use the –c flag, e.g.:
sysdig –c topfiles_bytes

# If a chisel needs arguments, you specify them after the chisel name:
sysdig –c spy_ip 192.168.1.157

# Chiesls can be combined with filters:
sysdig -c topfiles_bytes "not fd.name contains /dev"

# View the list of containers running on the machine and their resource usage
csysdig -vcontainers

# View the list of processes with container context
csysdig -pc

# See all the GET HTTP requests made by the machine
sysdig -s 2000 -A -c echo_fds fd.port=80 and evt.buffer contains GET

# See all the SQL select queries made by the machine
sysdig -s 2000 -A -c echo_fds evt.buffer contains SELECT

# See queries made via apache to an external MySQL server happening in real time
sysdig -s 2000 -A -c echo_fds fd.sip=192.168.30.5 and proc.name=apache2 and evt.buffer contains SELECT

# To get the list of available chisels, type
sysdig –cl

# list process by top CPU inside container @ name
sysdig -pc -c topprocs_cpu container.name=mesos-ad8a3341-0f7c-4a28-ac47-744c6767990e-S18.4b5c695e-f885-47f3-9a77-7b024ffa7aa

# Show all the interactive commands executed inside the container
sysdig -pc -c spy_users container.name=mesos-ad8a3341-0f7c-4a28-ac47-744c6767990e-S18.4b5c695e-f885-47f3-9a77-7b024ffa7aa1
```

To see what cheatsheets are available, run `cheat -l`.

Note that, while `cheat` was designed primarily for \*nix system administrators,
it is agnostic as to what content it stores. If you would like to use `cheat`
to store notes on your favorite cookie recipes, feel free.


Installing Cheat CLI
----------
It is recommended to install `cheat` with `pip`:

## Global Install cheat

```sh
[sudo] pip install cheat
```

## Virtualenv Install cheat

```sh
mkvirtualenv --python=python2 cheat2
pip install cheat
```

# Thanks

Borrowed some of the java cheats from https://github.com/chhsiao90/cheatsheets-java
