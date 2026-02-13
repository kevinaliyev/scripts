# simple script to list how many packages and casks are installed on your system

echo -e "\033[1;33mBrew\033[0m has found: \033[1;33m$(brew list --formula | wc -l | xargs)\033[0m \033[1;33mpackages\033[0m,\n\n\033[1;33m& has found\033[0m \033[1;33m$(brew list --cask | wc -l | xargs)\033[0m \033[1;33mcasks\033[0m!"

