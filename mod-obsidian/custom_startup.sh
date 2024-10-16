#!/bin/bash

# VARS
now=`date +%Y-%m-%d_%H-%M-%S`
remote_repo="https://github.com/signoredellarete/openshift-kasmvnc.git"
git_dir='/tmp/custom'
git_custom_tasks='/tmp/custom/mod-obsidian/custom-tasks.sh'
local_custom_tasks='/tmp/custom/mod-obsidian/local-custom-tasks.sh'
local_conf_backup_file='/tmp/custom/mod-obsidian/local-custom-tasks.sh.'${now}
custom_tasks_log='/tmp/custom/mod-obsidian/local-custom-tasks.log'


# BINS
git='/usr/bin/git'
diff='/usr/bin/diff'
cp='/usr/bin/cp'


# FUNCTIONS
clone_remote_repo(){
  if [ ! -d ${git_dir} ];then
    ${git} clone ${remote_repo} ${git_dir}
  fi
}

update_local_repo(){
  cd ${git_dir}
  ${git} pull > /dev/null 2>&1
}

exec_local_tasks(){
  nohup ${local_custom_tasks} >> ${custom_tasks_log} 2>&1 &
}

is_different(){
  ${diff} ${local_custom_tasks} ${git_custom_tasks} > /dev/null 2>&1
  echo $?
}

backup_custom_tasks(){
  ${cp} ${local_custom_tasks} ${local_conf_backup_file}
}

update_local_custom_tasks(){
  ${cp} ${git_custom_tasks} ${local_custom_tasks}
  chmod +x ${local_custom_tasks}
}


# EXEC
echo ${now}" - /dockerstartup/custom_startup.sh started"
clone_remote_repo
update_local_custom_tasks
exec_local_tasks

while
  true
do
  update_local_repo
  if [ $(is_different) -eq 1 ];then
    echo ${now} "Remote file is different! Local customuration will be updated."
    backup_custom_tasks
    update_local_custom_tasks
    exec_local_tasks
  fi
  sleep 60
done
