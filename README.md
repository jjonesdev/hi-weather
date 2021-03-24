## Hi Weather

Hi Weather! is a basic weather app (currently uncompleted) built as a side project to show my current coding skills when building an app from scratch.

<p align="center">
  <img src="https://user-images.githubusercontent.com/36642060/112347251-11b8a600-8c9d-11eb-8802-fa11f4da0403.gif" />
</p>

## Given More Time (3/22)
As this app was started over a weekend with some spare time, here are a few things I would like to do more of given the time:
* The app is set up for easy testing, but I would like to write more robust tests around the ViewModels and Frameworks.
* Creating a more generic base class for UICollectionViewCell types to inherit from would be nice, as most of them currently implement similar behavior with the same method names.
* Implement CoreLocation to automatically detect the users location.
* Find a way to break my Models out of the Networking framework, or just considering a new approach for this in general. Currently, I am needing to import WeatherService purely to access models. I'd like to not import WeatherService, and find a different way to share the models. This could look like another framework, or even a translation layer for what type is returned from the AppState (possibly a new model specific to the App as opposed to response related).


## Architecture
Hi Weather! uses the MVVM+Coordinator pattern along with an AppState object to control different states throughout the app.

### Coordinators
Coordinators are responsible for managing app flow and screen presentation. Using the Coordinator pattern allows app flows to be decoupled from views and have the flexibility to present different flows to a user, easily.

### MVVM
Model-View-ViewModel is used in this app to promote seperation of concerns. ViewModels will be injected with state that will be bound to the corresponding View to automatically update. Using this architecture cleanly seperates logic as well as providing the opportunity to easily test logic outside of the View context. This allows the views to be "dumb" and only display the state/data they should be in.

### App State
AppState is a single source of truth for all things App State related. Currently the app is so small it is hard to see the benefit of implementing this framework. However, once needed it can provide a lot of flexibility for sharing different state across multiple areas of the app. It also decouples the Main App from Networking, and offloads that for AppState to trigger certain requests. All the main app needs to do is ask AppState for new information, or for what State it should be in, and the corresponding View will reflect that.

