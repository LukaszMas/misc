# Determine if process runs inside of a docker container

Ref guide: [baeldung.com][1]

1. Check for existence of `.dockerenv` file
    - `echo `[ ! -f /.dockerenv ]` $?`

[1]: <https://www.baeldung.com/linux/is-process-running-inside-container> "www.baeldung.com/linux"
