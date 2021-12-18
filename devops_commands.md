Linux Commands

clear
Just type this in the terminal and the terminal will be cleared.

pwd
Type this to see the present working directory or the folder you are currently working in.

ls
This command shows all the directories and files in the pwd.

ls -al
This command prints all the additional information of all files and directories.

dir
This command prints out all available directories in the pwd.

cd
This is used to change directories.

mkdir
This command makes a new directory.

sudo su
This command login you in as root user.

touch
It is used to create a new file or to change the timestamp of an existing file.

rm
Use this command to remove/del file from a directory.

cat
It shows the contents of the file.

cp
You can copy a file or a folder using this command.

mv
It will move files inside your system.

wget
This command is used to download anything from the internet.

grep
This command you can search for a pattern in which specific words lie.

ps
This command will gives the list of current processes.

tar
This command is used archive files and directories and can store them on tapes.

ping
This command is used it is used to check connectivity to a server.

wc
This command will counts the number of lines, number of words, and number of characters. Then it displays the result in the same sequence.

sudo
This command allows a normal user to execute a command with root privilege.

DevOPS Commands

git init 
This command is used to initialize a new Git repo locally in your project root.

git add .
The command below will add all files to the staging area.

git status
This command will show the status of the current repository including staged, unstaged, and untracked files.
git commit

git pull
you can retrieve the latest changes made to the remote repository with this command.

git fetch
This command will download the changes from a remote repo but will not perform a merge on your local branch 

git remote update
This lets you update the remote without merging any content into the local branches

git push -f
This command will force a push request. This is usually fine for pull request branches because nobody else should have cloned them.


git branch -r
This command shows the name of all remote branches that Git is tracking for the current repository

AWS CLI Commands 

aws configure region
Specify your AWS Region

aws dynamodb list-tables | jq -r .TableNames []
List DynamoDB tables 

aws –version
To check the existing version of AWS CLI

aws iam get-user --user-name
This command gets a single user

aws iam create-user --user-name audit-temp
This command adds a single user

aws iam list-users
This command lists users

aws iam list-policies
This command lists policies

aws iam list-access-keys
This command list access keys in aws

aws s3 ls
This command lists your buckets in aws









