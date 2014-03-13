#compdef twgit
 
_twgit() { 
    local curcontext="$curcontext" state line
    typeset -A opt_args
 
    _arguments \
        '1: :->command'\
        '*: :->action'
 
    case $state in
    command)
        _arguments '1:Commands:(clean feature demo help init hotfix release tag update)'
    ;;
    *)
        case $words[2] in
	feature)
		compadd "$@" committers help list merge-into-release migrate push remove start status what-changed
	;;
	demo)
		compadd "$@" help list merge-feature push remove start status
	;;
	hotfix)
		compadd "$@" finish help list push remove start
	;;
        release)
		compadd "$@" committers finish help list push remove reset start
        ;;
	tag)
		compadd "$@" help list
        ;;
        *)
            _files 
        esac 
    esac 
}
 
_twgit "$@"
