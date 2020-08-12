# # --------------------------------------------------------------------
# # Setup PATH Variable
# # --------------------------------------------------------------------
function export-limited-path
{
    # Figure out what PATH should be
    # Paths are not added if they do not exist
    typeset -U common_paths

    # Remove /bin /usr/bin and /usr/bin/local from default path
    # so we can override the order
    common_paths=(
        # List in preferred order
        /usr/bin /usr/sbin
        /bin /sbin
    )
    unset PATH_tmp
    unsetopt NOMATCH

    for temp_path in ${common_paths}; do
        # (u0r^IWt,Ur^IWt) seems to check read/write permissions on the directory and
        # the following command fails if the directory is group writable by the user.
        # Homebrew makes /usr/local/bin group writable and the following command does
        # allow it to be in the path.
        #test -d "${temp_path}"(u0r^IWt,Ur^IWt) && PATH_tmp="${PATH_tmp}${temp_path}:"
        test -d "${temp_path}" && PATH_tmp="${PATH_tmp}${temp_path}:"
    done
    setopt NOMATCH
    export PATH=${PATH_tmp/%:/}
    unset common_paths temp_path PATH_tmp
}

function export-default-path
{
    # Figure out what PATH should be
    # Paths are not added if they do not exist
    typeset -U common_paths

    # Remove /bin /usr/bin and /usr/bin/local from default path
    # so we can override the order
    default_path=(${path} ${=$(command -p getconf PATH)//:/ })
    default_path=${default_path:gs/\/usr\/local\/bin//}
    default_path=${default_path:gs/\/usr\/local\/sbin//}
    default_path=${default_path:gs/\/usr\/bin//}
    default_path=${default_path:gs/\/usr\/sbin//}
    default_path=${default_path:gs/ \/bin//}
    default_path=${default_path:gs/ \/sbin//}
    # Split string by space
    default_path=(${(s: :)default_path})

    common_paths=(
        # List in preferred order
        ${HOME}/bin
        ${HOME}/dev/scripts
        ${default_path}
        /usr/local/bin /usr/local/sbin
        /usr/bin /usr/sbin
        /bin /sbin
    )
    unset PATH_tmp
    unsetopt NOMATCH

    for temp_path in ${common_paths}; do
        # (u0r^IWt,Ur^IWt) seems to check read/write permissions on the directory and
        # the following command fails if the directory is group writable by the user.
        # Homebrew makes /usr/local/bin group writable and the following command does
        # allow it to be in the path.
        #test -d "${temp_path}"(u0r^IWt,Ur^IWt) && PATH_tmp="${PATH_tmp}${temp_path}:"
        test -d "${temp_path}" && PATH_tmp="${PATH_tmp}${temp_path}:"
    done
    setopt NOMATCH
    export PATH=${PATH_tmp/%:/}
    unset common_paths temp_path PATH_tmp
}

export-default-path
