## Thanks 
First of all, we would like to thank our sponsors for making this project possible. See the list of our [sponsors](https://github.com/Arnaud-Dorthe/ApocalypseDynamics/wiki/Sponsors).


## Short installation and simulation guide

To know more about the Apocalypse Dynamics project, have a look to the [Github Wiki tab](https://github.com/Arnaud-Dorthe/ApocalypseDynamics/wiki).

To know more about the roadmap and progress reports, click on the [Github Projects tab](https://github.com/Arnaud-Dorthe/ApocalypseDynamics/projects), and select a project.

### Installations

First of all, download the Apocalypse Dynamics package, either by [direct download](https://github.com/Arnaud-Dorthe/ApocalypseDynamics/archive/master.zip) if you are a simple user, or [through Git](https://github.com/Arnaud-Dorthe/ApocalypseDynamics.git) if you want to contribute to the project. In the latter case, you would need a Git client on your desktop. For your conveniance, I have added a [github-git-cheat-sheet.pdf](https://github.com/Arnaud-Dorthe/ApocalypseDynamics/blob/master/github-git-cheat-sheet.pdf) in the root directory.

Next, you must install a Modelica running environment as well. Here is how to install the OpenModelica one:

#### Linux

Go to your package manager and select the OpenModelica meta-package. Click Install.

![Linux Package Manager](UsersGuide/GitHub%20Images/Modelica%20Package%20Manager.png)


#### Windows & OSX

 [Download OpenModelica](https://www.openmodelica.org/download/download-linux) from the official website.
 Follow the the website's dowloading instructions.


### Simulations

Start OpenModelica connection editor (OMEdit). 
In the File menu, open the Apocalypse dynamics package you have been downloading. 

Then select WorldDynamics, World3 and one of the scenarios, e.g. Scenario 2. 
Click on the right‐arrow (‐>) simulate button (top row) to simulate. 
To simulate another scenario at the same time, click on that one and click the simulate button.

![simulate](UsersGuide/GitHub%20Images/Screenshot%20scenario%203.png)

Go to the "Plotting" tab, click on one or more of the variables in the right window. You can search for population by typing "population". You can simulate several scenarios and plot one or more variables from each simulation in the same diagram. Here-below the worldwide population plots from Scenario1, Scenario2, Scenario3:

![Scenario1, Scenario2, Scenario3](UsersGuide/GitHub%20Images/Scenario1%2C%20Scenario2%2C%20Scenario3%20population.png)

The plots given below come from Scenario2, Scenario3, and Scenario6. The green one ("green growth") was the only sustainable-one, that is to say without population collapse, as of 2004.

![Previous sustainable scenario](UsersGuide/GitHub%20Images/Scenario2%2C%20Scenario3%2C%20Scenario6%20population.png)

Now it's your turn: try to find a sustainable scenario from today !
Happy finding !

@Arnaud-Dorthe
:innocent:
