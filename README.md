# Jenkins-Monitor-tvOS (and Travis :smirk:)
Apple TV Monitor for Jenkins Fork to add some fun graphics thanks to Julie Fiolet (http://cargocollective.com/juliefiolet)

This fork also supports Travis-Ci build status monitoring (not build progress). To add a travis monitoring, use the public URL of travis like this :
https://api.travis-ci.org/repos/[username] where [username] is your 

## Screenshot

<p align="center">
<img src="https://user-images.githubusercontent.com/19813688/36481636-b60ef89a-1710-11e8-8f50-caa0f04d302c.png" 
width="300" alt="Screenshot">
<img src="https://user-images.githubusercontent.com/19813688/36481642-b87fbdc6-1710-11e8-9ab5-2b2e07922e33.png" 
width="300" alt="Screenshot">
</p>


## Original Instructions


First check if the [Build Monitor Plugin](https://wiki.jenkins-ci.org/display/JENKINS/Build+Monitor+Plugin) for Jenkins is installed and running.

If you don't have it yet, please install [Carthage](https://github.com/Carthage/Carthage). You can do it with homebrew:

```
brew update
brew install carthage
```

Then download this code, open its folder and build the dependencies:

```carthage update```

You should be able to execute the app now, open JenkinsMonitor.xcodeproj and run it.

For instruction on how to use, please refer to original repository .
