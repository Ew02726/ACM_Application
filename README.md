# Georgia Southern ACM Student Chapter Application
Created by Griffin Bryant, Marquise Jennett, Dylan Myers, Mansi Pandya, and Everrick Wright

## Cloning the Repository
To clone the repo, navigate to the directory you would line to clone into and type the command:
```
git clone https://github.com/GSU-CS-Software-Engineering/project-gs-acm-application.git
```
## Creating the Database
To create the database and its respective tables, first create a mysql user (we used the username swe) and ensure it has permissions to write. Then run run the command:
```
mysql -u swe -p < acm.sql
```
## Running the Application
To run the GSU ACM Student Chapter application: 
1. You will need to edit the file DB.cs in the ViewModels folder to ensure that your database parameters are set up properly with your AWS Educate credentials.
2. Ensure you have either an Android or iOS emulator set up in Visual Studio
3. Build the application
4. Deploy the application to your emulator
