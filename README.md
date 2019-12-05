# ZorkAzure
![Ctrlaltdel.blog](https://ctrla1tdel.files.wordpress.com/2019/04/cropped-thumb-1920-865098.jpg)

When you use Azure resources, the naming of them is somewhat irrelevant isn’t it? Well no…..
The naming of the resource is somewhat important. The reason why is that Azure follows the same patterns for its resources. For example: 

- Blob storage: http://mystorageaccount.blob.core.windows.net
- Table storage: http://mystorageaccount.table.core.windows.net
- Queue storage: http://mystorageaccount.queue.core.windows.net
- Azure Files: http://mystorageaccount.file.core.windows.net
- Database: mydatabasename.database.windows.net

ZorkAzure allows you to query these using a wordlist. 

More Info: https://securethelogs.com/zorkazure-enumerating-azure-resources/

Running the script.......

Import the module.... 
- import-module [location of file]\zorkazure.ps1

Then run: zorkazure and enter the location of your wordlist:
![Securethelogs.com](https://ctrla1tdel.files.wordpress.com/2019/12/image-16.png)


