Script to auto rotate wordpress password on terminal.

# Prerequisite:
- Setup Azure blob storage
- Install AzCopy V10 or latest(Make AzCopy global to your local machine, add it to your environment variable)
- Install AZ CLI 2.22 or latest

# Installation:
Use the git to clone and pull.
```bash
git clone git@github.com:cenon4dno/azCopy-for-file-sync.git
```
Or donwload as ZIP on https://github.com/cenon4dno/azCopy-for-file-sync.

# Configuration:
1. Create a SAS key on your Azure blob storage      
2. You have 2 options (bash or powershell) to setup your app to connect to Azure blob storage:
    - (BASH) Open setup/blob-setup.sh 
    - (Powershell) Open setup/blob-setup.ps1
3. Fill in the NameOfBlobStorage, containerName and GeneratedSasKey below, based on your setup on #1. 
```bash
blobStorageLink='https://<NameOfBlobStorage>.blob.core.windows.net/<containerName>'
blobStorageDelimiter='?'
blobStorageSAS='<GeneratedSasKey>'
```
4. Rename file from setup/
    - (BASH) blob-setup.sh to blob.sh
    - (Powershell) blob-setup.ps1 to blob.ps1
5. Move the blob file to:
    - (BASH) blob.sh to bash directory
    - (Powershell) blob.ps1 to powershell directory

# Usage
- Place all files you want to sync in the share directory then go back to root directory and execute:
    - BASH
    ```bash
    ./bash/main.sh
    ```
    - Powershell
    ```bash
    .\poweshell\main.ps1
    ```
- Open logs directory, you should be able to find 3 types of logs:
    - FileUrl logs: You can get every files link share url here.
    - Run logs: You can see what were the changes of the previous run.
    - History logs: You can see activities of the app.

# Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## Rerefence


## License
[MIT](https://choosealicense.com/licenses/mit/)
