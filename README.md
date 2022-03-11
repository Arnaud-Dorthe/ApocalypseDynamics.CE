### Introduction
First of all, we would like to thank our generous sponsors for making this project possible. See the list of our [sponsors](https://github.com/Arnaud-Dorthe/ApocalypseDynamics/wiki/Sponsors).

To read the Apocalypse Dynamics documentation, click on the [Wiki](https://github.com/Arnaud-Dorthe/ApocalypseDynamics/wiki) link.

To get insights about the roadmap and progress reports, click on the [Projects](https://github.com/Arnaud-Dorthe/ApocalypseDynamics/projects) link.

### User guide

#### Installation

 First of all, you must install a Modelica developping environment.
Download the free [OpenModelica](https://www.openmodelica.org/download/download-linux) environment from the official website.
Follow the installation instructions for your operating system. Then download the Apocalypse Dynamics package, either by [direct download](https://github.com/Arnaud-Dorthe/ApocalypseDynamics/archive/master.zip) if you are a simple user, or [through Git](https://github.com/Arnaud-Dorthe/ApocalypseDynamics.git) should you want to contribute to the project (See the section Contributing below). Extract the archive. This will create the ApocalypseDynamics directory containing the library's files.

#### Simulation

Start OpenModelica connection editor (OMEdit). 
In the File menu, click on "Open Model/library file(s)". 
![open](UsersGuide/GitHub%20Images/OMedit%20-%20Load%20library.png)

Then in the "ApocalypseDynamics" folder, select the "Package.mo" file.
The Apocalypse Dynamics library is loaded as you can see in the left panel "Libraries". 
![open](UsersGuide/GitHub%20Images/OMedit%20-%20Library%20loaded.png)

Then select WorldDynamics, World3 and one of the scenarios, e.g. Scenario 2. 
Click on the right‐arrow (‐>) simulate button (top row) to simulate. 
To simulate another scenario at the same time, click on that one and click the simulate button.

![simulate](UsersGuide/GitHub%20Images/Screenshot%20scenario%203.png)

Go to the "Plotting" tab, click on one or more of the variables in the right window. You can search for population by typing "population". You can simulate several scenarios and plot one or more variables from each simulation in the same diagram. Here-below the worldwide population plots from Scenario1, Scenario2, Scenario3:

![Scenario1, Scenario2, Scenario3](UsersGuide/GitHub%20Images/Scenario1%2C%20Scenario2%2C%20Scenario3%20population.png)

The plots given below come from Scenario2, Scenario3, and Scenario6. The green one ("green growth") was the only sustainable-one, that is to say without population collapse, as of 2004.

![Previous sustainable scenario](UsersGuide/GitHub%20Images/Scenario2%2C%20Scenario3%2C%20Scenario6%20population.png)

Now it's your turn: try to find a sustainable scenario for our common future !

May the force of the Mathematics be with you ! :innocent:

### Contributing

Should you want to contibute, see the issues on GibHub and the project tab for some tasks you can work on. 

Pull requests are welcomed.
Get a GitHub account if you don't have it already and clone the repository at with the "Fork" button in the top right corner of the page. Check out your clone to your machine, code away, push your changes to your clone and submit a pull request; instructions are available at <https://help.github.com/articles/fork-a-repo>.

In case you need them, more detailed instructions for creating pull requests are at <https://help.github.com/articles/using-pull-requests>, and a basic guide to GitHub is at <https://guides.github.com/activities/hello-world/>.  GitHub also
provides interactive learning at <https://lab.github.com/>.

For your conveniance, I have added a [github-git-cheat-sheet.pdf](https://github.com/Arnaud-Dorthe/ApocalypseDynamics/blob/master/github-git-cheat-sheet.pdf) in the root directory.

### Copyright
Apocalypse Dynamics is a trademark of Abak Consulting Gmbh. All rights reserved.Any copyright infringement will be prosecuted to the full extent permitted by the law and the perpetrators will be cursed.

[© 2015-2022 ArDor](https://sites.google.com/view/abak-consulting/home)
