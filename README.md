# ios-gurunavi-apikit
This iOS app shows restaurant infomations in Gurunavi reataurant search API.

## State machine
In this app, I introduced state machine to manage API access, which has so called state monad.

Here is a state transition diagram in code and image file:

```uml
@startuml

[*] --> root

root --> loadedError : errorOccur
root --> partiallyLoaded : loadPartially
root --> fullyLoaded : loadFully

loadedError --> loadedError : errorOccur
loadedError -right-> partiallyLoaded : loadPartially
loadedError -right-> fullyLoaded : loadFully

partiallyLoaded -left-> loadedError : errorOccur
partiallyLoaded --> partiallyLoaded : loadPartially
partiallyLoaded -right-> fullyLoaded : loadFully

fullyLoaded -left-> loadedError : errorOccur
fullyLoaded -left-> partiallyLoaded : loadPartially
fullyLoaded --> fullyLoaded : loadFully

@enduml
```


![state transition diagram image](https://raw.githubusercontent.com/sahara-ooga/ios-gurunavi-apikit/image/image/plantuml_state%401-21.png)
