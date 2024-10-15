#!/bin/bash

# VARS
now=`date +%Y-%m-%d_%H-%M-%S`
git_dir='/tmp/config'
git_config_tasks='/tmp/config/mod-obsidian/config-tasks.sh'
local_config_tasks='/tmp/config/mod-obsidian/local-config-tasks.sh'
local_conf_backup_file='/tmp/config/mod-obsidian/local-config-tasks.sh.'${now}
config_tasks_log='/tmp/config/mod-obsidian/local-config-tasks.log'


# BINS
git='/usr/bin/git'
diff='/usr/bin/diff'
cp='/usr/bin/cp'


# FUNCTIONS
update_local_repo(){
  cd ${git_dir}
  ${git} pull > /dev/null 2>&1
}

exec_local_tasks(){
  nohup ${local_config_tasks} >> ${config_tasks_log} 2>&1 &
}

is_different(){
  ${diff} ${local_config_tasks} ${git_config_tasks} > /dev/null 2>&1
  echo $?
}

backup_config_tasks(){
  ${cp} ${local_config_tasks} ${local_conf_backup_file}
}

update_local_config_tasks(){
  ${cp} ${git_config_tasks} ${local_config_tasks}
  chmod +x ${local_config_tasks}
}

rollback(){
  ${cp} ${local_conf_backup_file} ${local_config_tasks}
}


# EXEC
update_local_repo
update_local_config_tasks
exec_local_tasks

while
  true
do
  update_local_repo
  if [ $(is_different) -eq 1 ];then
    echo ${now} "Remote file is different! Local configuration will be updated."
    backup_config_tasks
    update_local_config_tasks
    exec_local_tasks
  fi
  sleep 60
done


  