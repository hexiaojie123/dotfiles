# gdb

> My gdb.

- Remove the limit on array or string printing (show full content):

`set print elements 0`

- Control thread execution while stepping (on: lock others; off: run all; step: lock others only during step):

`set scheduler-locking {{on|off|step}}`

- Do not stop or print when specific signals are received:

`handle SIGUSR1 SIGUSR2 SIG36 SIGSTOP noprint nostop`