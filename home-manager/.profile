if [ -f "/etc/profiles/per-user/$USER/etc/profile.d/hm-session-vars.sh" ]; then
    "/etc/profiles/per-user/$USER/etc/profile.d/hm-session-vars.sh"
elif [ -f '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
    . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
fi

case ":$XDG_DATA_DIRS:" in
    *:$HOME/.nix-profile/share:*) return ;;
    *) XDG_DATA_DIRS="$HOME/.nix-profile/share:$XDG_DATA_DIRS" ;;
esac
