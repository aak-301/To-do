# todo

Todo App with some interesting features 

# About

This application is not only for scheduling you tasks, bu also for colaborating with other developers and people to work on any project / product. 
This can be used by any one, whether it be college grad or someone professional.
All you hae to do is to create ideas. Rest you can leave on us. Right from schedulling tasks to assigning, tracking progress to completion rate.
At last you won't get bored as we have something to entertain you as well. Earn coins while completing tasks and play games as much as you want.
Well here hard work pays you a joyfull day.

## Folder structure

   Here is the core folder structure of our app.
    
        stores/
        ├───.dart_tool
        ├───.github
        ├───android
        ├───assets
        ├───ios
        ├───lib
        ├───linux
        ├───macos
        ├───test
        ├───web
        └───windows
        
   Here is the lib folder structure we have been using in this project
    
        
        lib/   
        ├───api/              # It contains different endpoints and routes for getting data from backend
        ├───common/           # It contains custom widgets and different classes which is reusable
        ├───constants/        # It contains application level constants for UI and API.
        ├───gameZone/         # It contains different game logics in app.
        ├───healthStatus/     # This folder contains logic and screens for heath tab.
        ├───Notification/     # All the functions and data related to notification are stored here.
        └───Wallet/           # It contains different sections such as:
            ├───chat/         # It contains mini chat app logic for different contributors.
            ├───coins/        # It contains logic for how will a user earn a coin.
            ├───profile/      # It contains user related data.
            ├───story/        # It contains user story related data and user badge
            └───task/         # It is used for creating Pririty and Custom tasks and managing their progress.
        
   <br />
     
   ___
  
 
 ## Best Practise to Contribute
 
 * `Frequent Commits` will help you in writting brief commit messages that are short and also informative.
 * `Semantic Commit Messages` should be made. And it should have an explanation that why you need to update the code in the first place or what has been altered
 * `Creating Branches` will help you add new changes without altering the main branch with any broken codes. While you’re working on a git branch, make sure you run git pull regularly, it will reduce the probability of merge conflicts.
 * `One Branch, One Feature` pattern should be followed. In this pattern we should create a new dedicted branch for any new functionality which we add in our project. And once completed make a pull request and merge changes to main branch.
 * `Don't Commit Dependencies` as this will always increase the size of project repository. Always add these dependencies to .gitignore files.
 * `Never Commit Broken Code` because this could block other developers from their work. Always test your codes before committing.
 * `Use Tags` because tags store the branch's state at that moment. And it will help you to record the project release notes, which are valuable for your team and stakeholders.
 * `Trunk-based Development` is used for getting early feedback because we create a short lived branches for a particular feature and then we merge it in to master. It helps us in avoiding huge git merge conflicts.<br>
 Our project uses this approach. 
 
<br>
