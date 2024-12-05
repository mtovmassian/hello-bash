match($0, /^\[(.+)\]/, host_grp) { # Capture host group section
    printf "%s:\n  hosts:\n", host_grp[1];
    next;
}
{
    il1="  "; il2=il1""il1; il3=il2""il1 # YAML indentation levels
    split($2, ah, "=");
    split($3, au, "=");
    printf "%s%s:\n%s%s: %s\n%s%s: %s\n", il2, $1, il3, ah[1], ah[2], il3, au[1], au[2];
}