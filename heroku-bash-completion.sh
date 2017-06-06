#!/usr/bin/env bash

# Bash completion script for Heroku CLI

function _heroku_completion() {

    local cur prev opts commands

    COMPREPLY=()

    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    commands="2fa:disable 2fa:generate-recovery-codes access access:add access:remove access:update addons addons:add addons:attach addons:create addons:destroy addons:detach addons:docs addons:downgrade addons:info addons:open addons:plans addons:remove addons:rename addons:services addons:upgrade addons:wait apps apps:create apps:delete apps:destroy apps:errors apps:favorites apps:favorites:add apps:favorites:remove apps:fork apps:info apps:join apps:list apps:lock apps:open apps:rename apps:stacks apps:stacks:set apps:transfer auth:2fa auth:2fa:disable auth:2fa:generate auth:login auth:logout auth:token auth:whoami authorizations authorizations:create authorizations:info authorizations:revoke authorizations:update buildpacks buildpacks:add buildpacks:clear buildpacks:remove buildpacks:set certs certs:add certs:auto certs:auto:disable certs:auto:enable certs:auto:refresh certs:chain certs:generate certs:info certs:key certs:remove certs:rollback certs:update ci ci:config ci:config:get ci:config:set ci:config:unset ci:debug ci:info ci:last ci:list ci:migrate-manifest ci:open ci:rerun ci:run clients clients:create clients:destroy clients:info clients:update config config:add config:get config:remove config:set config:unset container:login container:logout container:push domains domains:add domains:clear domains:remove domains:wait drains drains:add drains:get drains:remove drains:set dyno:copy dyno:exec dyno:forward dyno:kill dyno:resize dyno:restart dyno:scale dyno:socks dyno:stop dyno:type features features:disable features:enable features:info git git:clone git:remote keys keys:add keys:clear keys:remove labs labs:disable labs:enable labs:info local local:run local:start local:version logs maintenance maintenance:off maintenance:on members members:add members:remove members:set notifications orgs orgs:default orgs:open outbound-rules:add outbound-rules:remove pg pg:backups pg:backups:cancel pg:backups:capture pg:backups:delete pg:backups:download pg:backups:info pg:backups:public-url pg:backups:publicurl pg:backups:restore pg:backups:schedule pg:backups:schedules pg:backups:unschedule pg:backups:url pg:copy pg:credentials pg:credentials:create pg:credentials:destroy pg:credentials:repair-default pg:credentials:rotate pg:credentials:url pg:diagnose pg:info pg:kill pg:killall pg:links pg:links:create pg:links:destroy pg:maintenance pg:maintenance:run pg:maintenance:window pg:promote pg:ps pg:psql pg:pull pg:push pg:reset pg:unfollow pg:upgrade pg:wait pipelines pipelines:add pipelines:create pipelines:destroy pipelines:diff pipelines:info pipelines:list pipelines:open pipelines:promote pipelines:remove pipelines:rename pipelines:setup pipelines:update plugins plugins:install plugins:link plugins:uninstall plugins:update ps ps:copy ps:exec ps:forward ps:kill ps:resize ps:restart ps:scale ps:socks ps:stop ps:type redis redis:cli redis:credentials redis:info redis:maintenance redis:maxmemory redis:promote redis:timeout redis:wait regions releases releases:info releases:output releases:rollback run run:detached run:inside sessions sessions:destroy sharing:access sharing:add sharing:remove sharing:transfer spaces spaces:create spaces:destroy spaces:info spaces:peering:info spaces:peerings spaces:peerings:accept spaces:peerings:destroy spaces:ps spaces:rename spaces:topology spaces:vpn:config spaces:vpn:create spaces:vpn:destroy spaces:vpn:info spaces:vpn:wait spaces:wait stack:set status teams trusted-ips:add trusted-ips:remove twofactor:disable twofactor:generate-recovery-codes"

    case "${prev}" in
        --app|-a|--from)
            opts=$(heroku apps | grep -E "^(\w|\d|\-)+$")
            COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
            return 0
            ;;
        --remote|-r)
            opts=$([[ -d .git ]] && git remote)
            COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
            return 0
            ;;
        -p|--policy)
            opts="allkeys-lru volatile-lru allkeys-random volatile-random volatile-ttl"
            COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
            return 0
            ;;
        features:disable|features:enable|ps:*)
            opts="-a --app -r --remote"
            COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
            return 0
            ;;
        access:add|access:update)
            opts="-a --app -r --remote --permissions"
            COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
            return 0
            ;;
        access|domains|domains:*|drains|drains:*|features|features:*|labs|labs:*|ps)
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
        apps:destroy|apps:info)
            opts=$(heroku apps | grep -E "^(\w|\d|\-)+$")
            COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
            return 0
            ;;
        apps:errors|apps:favorites:*)
            opts="-a --app -r --remote --json"
            COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
            return 0
            ;;
        apps:fork)
            opts="--confirm --from --region --skip-pg --to"
            COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
            return 0
            ;;
        access:remove|apps:join|apps:lock|apps:open|apps:stacks*|drains:add|drains:remove|dyno:*)
            opts="-a --app -r --remote"
            COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
            return 0
            ;;
        apps:rename)
            opts="-a --app -r --remote --ssh-git"
            COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
            return 0
            ;;
        apps:transfer)
            opts="-a --app -r --remote -l --locked --bulk"
            COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
            return 0
            ;;
        apps|apps:*)
            opts="-A --all -o --org -p --personal -s --space --json"
            COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
            return 0
            ;;
        authorizations:create)
            opts="-d --description -e --expires-in -s --scope --short"
            COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
            return 0
            ;;
        authorizations:update)
            opts="-d --description --client-id --client-secret"
            COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
            return 0
            ;;
        authorizations|authorizations:*|clients|clients:*|commands|pipelines|pipelines:*|sessions|sessions:*|status|teams)
            opts="--json"
            COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
            return 0
            ;;
        buildpacks:add|buildpacks:remove:buildpacks:set)
            opts="-a --app -r --remote -i --index"
            COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
            return 0
            ;;
        certs:add|certs:update)
            opts="-a --app -r --remote --bypass --domains --type"
            COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
            return 0
            ;;
        certs:generate)
            opts="-a --app -r --remote --area --city --country --keysize --now --owner --selfsigned --subject"
            COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
            return 0
            ;;
        certs:info|certs:remove|certs:rollback)
            opts="-a --app -r --remote --endpoint --name"
            COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
            return 0
            ;;
        clients:create)
            opts="-s --shell"
            COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
            return 0
            ;;
        clients:info)
            opts="-s --shell --json"
            COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
            return 0
            ;;
        clients:update)
            opts="-n --name --url"
            COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
            return 0
            ;;
        config)
            opts="-a --app -r --remote --json -s --shell"
            COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
            return 0
            ;;
        config:get)
            opts="-a --app -r --remote -s --shell"
            COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
            return 0
            ;;
        domains|drains)
            opts="-a --app -r --remote --json"
            COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
            return 0
            ;;
        domains:add)
            opts="-a --app -r --remote --wait"
            COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
            return 0
            ;;
        drains)
            opts=$(heroku apps | grep -E "^(\w|\d|\-)+$")
            COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
            return 0
            ;;
        git:*)
            opts="-a --app -r --remote --ssh-git"
            COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
            return 0
            ;;
        heroku)
            COMPREPLY=( $(compgen -W "${commands} help" -- ${cur}) )
            return 0
            ;;
        help)
            COMPREPLY=( $(compgen -W "${commands}" -- ${cur}) )
            return 0
            ;;
        buildpacks|buildpacks:clear|certs|certs:*|config:set|config:unset|domains:clear|domains:remove|join|maintenance|maintenance:*|pg|pg:*|redis|redis:*)
            opts="-a --app -r --remote"
            COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
            return 0
            ;;
        keys:add)
            opts="-y --yes"
            COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
            return 0
            ;;
        keys:add|keys:remove)
            opts=""
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
        local:run)
            opts="-e --env -p --port -f"
            COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
            return 0
            ;;
        local|local:*)
            opts="-e --env -p --port -f --procfile"
            COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
            return 0
            ;;
        lock)
            opts="-a --app -r --remote"
            COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
            return 0
            ;;
        members:add|members:set)
            opts="-o --org -r --role -t --team"
            COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
            return 0
            ;;
        members:remove)
            opts="-o --org -t --team"
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
        orgs:open)
            opts="-o --org"
            COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
            return 0
            ;;
        orgs|orgs:*)
            opts="--enterprise --teams --json"
            COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
            return 0
            ;;
        pg:backups:capture)
            opts="-a --app -r --remote -v --verbose --wait-interval"
            COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
            return 0
            ;;
        pg:backups:delete|pg:backups:download|pg:links:destroy|pg:reset|pg:unfollow|pg:upgrade|redis:cli)
            opts="-a --app -c --confirm -r --remote"
            COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
            return 0
            ;;
        pg:backups:restore|pg:copy)
            opts="-a --app -c --confirm -r --remote -v --verbose --wait-interval"
            COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
            return 0
            ;;
        pg:backups:schedule)
            opts="-a --app -r --remote --at"
            COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
            return 0
            ;;
        pg:credentials|redis:credentials)
            opts="-a --app -r --remote --reset"
            COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
            return 0
            ;;
        pg:kill|pg:maintenance:run)
            opts="-a --app -r --remote --force"
            COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
            return 0
            ;;
        pg:links:create)
            opts="-a --app -r --remote --as"
            COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
            return 0
            ;;
        pg:backups:ps)
            opts="-a --app -r --remote -v --verbose"
            COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
            return 0
            ;;
        pg:backups:psql)
            opts="-a --app -r --remote -c --command"
            COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
            return 0
            ;;
        pg:wait)
            opts="-a --app -r --remote --wait-interval"
            COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
            return 0
            ;;
        pipelines:add|pipelines:create|pipelines:update)
            opts="-a --app -r --remote -s --stage"
            COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
            return 0
            ;;
        pipelines:destroy|pipelines:open|pipelines:rename)
            opts=""
            COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
            return 0
            ;;
        pipelines:diff|pipelines:remove)
            opts="-a --app -r --remote"
            COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
            return 0
            ;;
        pipelines:promote)
            opts="-a --app -r --remote -t --to"
            COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
            return 0
            ;;
        pipelines:setup)
            opts="-o --organisation -t --team -y --yes"
            COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
            return 0
            ;;
        redis:maintenance)
            opts="-a --app -f --force -r --remote -w --window"
            COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
            return 0
            ;;
        redis:maxmemory)
            opts="-a --app -p --policy -r --remote"
            COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
            return 0
            ;;
        redis:timeout)
            opts="-a --app -r --remote -s --seconds"
            COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
            return 0
            ;;
        regions)
            opts="--common --private --json"
            COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
            return 0
            ;;
        releases:shell|releases:info)
            opts="-a --app -r --remote --json -s --shell"
            COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
            return 0
            ;;
        releases:output|releases:rollback)
            opts="-a --app -r --remote"
            COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
            return 0
            ;;
        releases)
            opts="-a --app -n --num -r --remote --json"
            COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
            return 0
            ;;
        run)
            opts="-a --app -e --env -x --exit-code -r --remote -s --size --no-tty"
            COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
            return 0
            ;;
        run:detached)
            opts="-a --app -e --env -r --remote -s --size -t --tail"
            COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
            return 0
            ;;
        spaces:create)
            opts="-o --org --json --region"
            COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
            return 0
            ;;
        spaces:destroy|spaces:vpn:destroy)
            opts="-s --space --confirm"
            COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
            return 0
            ;;
        spaces:info|spaces:peering:info|spaces:peerings|spaces:ps|spaces:topology|spaces:vpn:info)
            opts="-s --space --json"
            COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
            return 0
            ;;
        spaces:peerings:accept)
            opts="-s --space -p --pcxid"
            COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
            return 0
            ;;
        spaces:peerings:destroy)
            opts="-s --space -p --pcxid --confirm"
            COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
            return 0
            ;;
        spaces:rename)
            opts="--from --to"
            COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
            return 0
            ;;
        spaces:vpn:config)
            opts="-s --space"
            COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
            return 0
            ;;
        spaces:vpn:create)
            opts="-c --cidrs -i --ip -s --space"
            COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
            return 0
            ;;
        spaces:vpn:wait)
            opts="-i --interval -s --space -t --timeout --json"
            COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
            return 0
            ;;
        spaces|spaces:*)
            opts="-o --org --json"
            COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
            return 0
            ;;
        trusted-ips:add|trusted-ips:remove)
            opts="--confirm --space"
            COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
            return 0
            ;;

        trusted-ips)
            opts="-s --space --json"
            COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
            return 0
            ;;
        *)
            ;;
    esac

}
complete -F _heroku_completion heroku
