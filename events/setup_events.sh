#!/bin/bash

#make sure ran by sudo
[ "$UID" -eq 0 ] || exec sudo "$0" "$(whoami)" "$@"

#handle acpi events
for env in event_files/acpi_*;do 
  env_=/etc/acpi/events/${env##*/}
  cp $env $env_ 
  chown root:root $env_ 
  chmod 644 $env_ 
done

#handle udev events
for env in event_files/acpi_*;do 
  env_=/etc/acpi/events/${env##*/}
  cp $env $env_ 
  chown root:root $env_ 
  chmod 644 $env_ 
done

#handle actions
for ac in action_files/*;do
  ac_=/usr/bin/${ac##*/}
  cp $ac $ac_
  chown root:root $ac_ 
  chmod 755 $ac_
done
