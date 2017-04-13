#!/usr/bin/env bash

# Bash completion script for Heroku CLI

function _heroku_completion() {

    local cur prev opts

    COMPREPLY=()

    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"

    case "${prev}" in
        --app|-a)
            opts=$(heroku apps | grep -E "^(\w|\d|\-)+$")
            COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
            return 0
            ;;
        --remote|-r)
            opts=$([[ -d .git ]] && git remote)
            COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
            return 0
            ;;
        access|access:*|domains|domains:*|drains|drains:*|features|features:*|labs|labs:*|ps|ps:*)
            opts="-a --app -r --remote --json"
            COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
            return 0
            ;;
        addons|addons:*)
            opts="-A --all -a --app -r --remote --json"
            COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
            return 0
            ;;
        apps:create)
            opts="--remote --region --buildpack"
            COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
            return 0
            ;;
        apps|apps:*)
            opts="-A --all -o --org -p --personal -s --space --json"
            COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
            return 0
            ;;
        authorizations|authorizations:*|clients|clients:*|commands|pipelines|pipelines:*|plugins|plugins:*|sessions|sessions:*|status|teams)
            opts="--json"
            COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
            return 0
            ;;
        config)
            opts="-a --app -r --remote --json -s --shell"
            COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
            return 0
            ;;
        git:*)
            opts="-a --app -r --remote --ssh-git"
            COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
            return 0
            ;;
        heroku)
            opts=$(heroku commands)
            COMPREPLY=( $(compgen -W "${opts} help" -- ${cur}) )
            return 0
            ;;
        help)
            opts=$(heroku commands)
            COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
            return 0
            ;;
        join|maintenance|maintenance:*|pg|pg:*|redis|redis:*)
            opts="-a --app -r --remote"
            COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
            return 0
            ;;
        keys|keys:*)
            opts="-l --long --json"
            COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
            return 0
            ;;
        local|local:*)
            opts="-e --env -p --port -f --procfile"
            COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
            return 0
            ;;
        logs)
            opts="-a --app -d --dyno -n --num -r --remote -s --source -t --tail --force-colors"
            COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
            return 0
            ;;
        members|members:*)
            opts="-o --org -r --role -t --team --json --pending"
            COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
            return 0
            ;;
        notifications|notifications:*)
            opts="-A --all -a --app -r --remote --json --read"
            COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
            return 0
            ;;
        orgs|orgs:*)
            opts="--enterprise --teams --json"
            COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
            return 0
            ;;
        regions)
            opts="--common --private --json"
            COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
            return 0
            ;;
        releases|releases:*)
            opts="-a --app -n --num -r --remote --json"
            COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
            return 0
            ;;
        run|run:*)
            opts="-a --app -e --env -x --exit-code -r --remote -s --size --no-tty"
            COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
            return 0
            ;;
        spaces|spaces:*)
            opts="-o --org --json"
            COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
            return 0
            ;;
        trusted-ips|trusted-ips:*)
            opts="-s --space --json"
            COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
            return 0
            ;;
        *)
            ;;
    esac

}
complete -F _heroku_completion heroku
