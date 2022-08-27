# .gitconfig - Git config

The git config file is located in `~/.gitconfig` - this is where all the  
`--global` settings are saved.

Ref guide at: [docs.gitlab.com][1]
Github Repo: [github.com/git/git][2]

1. List all global settings:
    - `git config --list`

2. Set your global username and email:
    - `git config --global user.name <User Name>`
    - `git config --global user.email <user.name@email>`

3. Set your global text editor:
    - `git config --global core.editor <your editor ex. vim>`

4. Unsetting:
    - `git config --global --remove-section <User Name>`
    - `git config --global --unset-all <section ex. user.name>`

[1]: <https://docs.gitlab.com/ee/gitlab-basics/start-using-git.html>  "git basics"
[2]: <https://github.com/git/git>  "git"
