

# use the token you generated in the setup
export KUBEBOT_SLACK_TOKEN="xoxb-156828687825-ta4J3FolLzGxEmk0mOutcKiB" 

# use as many channels ids you want; use a space as a separator
export KUBEBOT_SLACK_CHANNELS_IDS="#ping-zonar #team-zonar" 

# use as many admin nicknames as you want; use a space as separator
export KUBEBOT_SLACK_ADMINS_NICKNAMES="jfelten maratoid kmansel l337ch stevehetzel" 

# set which kubectl commands the admins will be able to run
export KUBEBOT_SLACK_VALID_COMMANDS="get describe logs explain"

bin/kubebot

