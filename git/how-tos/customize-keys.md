#How-To Install and get started with docker on linux:

Ref guide at: [stackoverflow1][1]

1. Check the current status of your local repo:
    - `git config --list`

2. (opt) Change username & email locally:
    - `git config --local user.name "Your Name"
    - `git config --local user.email "your@email.com
    - `git config credential.username "xxx" (TODO verify this)
    - Per repo basis you could also manually modify this file:
        `.git/config`

3. Utilize git enviorment variable `GIT_SSH_COMMAND` with any of git commands:
    - `GIT_SSH_COMMAND='ssh -i ~/.ssh/your_private_key' git <command>`

4. Configure your local repository using git config:
    - `git config --add --local core.sshCommand 'ssh -i <path_to_ssh_key>'`

5. (opt) Another alternative is to combine few techniques and edit the configs:
    - `vim ~/.ssh/config`
    - ```
      # Personal GitHub
      Host github.com
        HostName github.com
        User git
        AddKeysToAgent yes
        UseKeychain yes
        IdentityFile ~/.ssh/personal_id_ed2519

      # Work GitHub
        Host github-work
        HostName github.com
        User git
        AddKeysToAgent yes
        UseKeychain yes
        IdentityFile ~/.ssh/work_github_id_rsa

      Host *
        IdentitiesOnly yes
      ```
    - `vim ~/.gitconfig`
    - ```
      [user]
      name = My Name
      email = personal@email.com

      [includeIf "gitdir:~/dev/work/"]
      path = ~/dev/work/.gitconfig

      [url "github-work:work-github-org/"]
      insteadOf = git@github.com:work-github-org/
      ```
    - `vim ~/dev/work.gitconfig`
    - ```
      [user]
          email = work@email.com
      ```
    - As long as you will keep all your work repos under `~/dev/work` and  
      personal stuff elsewhere git will use the correct SSH key when doing  
      commands to the server and it will also attach the correct email address  
      to all of your commits.
    - Refs: [stackoverflow2][2], [stackoverflow3][3]

[1]: <https://stackoverflow.com/questions/7927750/specify-an-ssh-key-for-git-push-for-a-given-domain> "stackoverflow1"
[2]: <https://stackoverflow.com/questions/4220416/can-i-specify-multiple-users-for-myself-in-gitconfig/43654115#43654115>  "stackoverflow2>
[3]: <https://stackoverflow.com/questions/3860112/multiple-github-accounts-on-the-same-computer>  "stackoverflow3>
