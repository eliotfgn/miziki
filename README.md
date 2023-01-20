# Miziki

A music streaming application.

## System requirements
- Flutter 3

# Notes for developers
***Please read this carefully before continue.***

# Commits

# **Never Ever Push On Master**
When you first open the project, create a branch with the name of the feature you will work on.

*Example*:
I want to develop search screen. First I create a branch with **git checkout -b search-screen'**. Then I make my commits and push with **git push -u origin search-screen**   
Here is a link to help you with git commands: https://rogerdudler.github.io/git-guide/   
When it's done, you can create a pull request on github.
Here is a link to help you with pull requests: https://help.github.com/en/github/collaborating-with-issues-and-pull-requests/creating-a-pull-request

# Naming conventions

## Variable
* Variable names should be english world
* **camelCase** for variable names
* Variable names should be meaningful (No **a**, **b**, **c** but **name**, **age**, **address**, **color**)

## Classes
* Class names should be english world
* **PascalCase** for class names
* Class names should express what the class is
* For Widget that represent a screen, the name should end with **Screen**
* For Widget that represent a component, the name should end with **Component** but this is not necessary

## Functions
* Function names should be english world
* **camelCase** for function names
* Function names should express what the function does
* Function names should be short and concise
* Function names should be meaningful
* Function names should be in the imperative mood

## Constants
* Constant names should be english world
* **UPPERCASE** for constant names

## Files
* File names should be english world
* **snake_case** for file names

# Tips
* Think about reusability by creating components, functions and constants as much as possible
* Try to follow clean code rules by creating functions that do one thing and one thing only
* Shorten your widgets by using components

# Directory structure
* **lib** - contains all the code
* **lib/widgets** - contains all the components
* **lib/screens** - contains all the screens
* **lib/models** - contains all the models
* **lib/services** - contains all the services
* **lib/utils** - contains all the utilities
* **constants.dart** - contains all the constants
* **main.dart** - contains the main function

# Main
This is the entry point of the project. It contains the main function and the **MaterialApp** widget. **Do not modify this file while merging.** You can add the screen you are working on to the home property of the **MaterialApp** widget but make sure to suppress this before your final commit and push.

# Happy coding and *NEVER PUSH ON MASTER !*
