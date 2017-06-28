# RSA Project
--- 

This project is my implementation of the RSA encryption in Swift. This version is very limited but can encrypt and decrypt a String. Tested on macOS 10.12. 

## Compiling the project :

Requirements : 

- [Xcode 8](https://itunes.apple.com/fr/app/xcode/id497799835?l=en&mt=12)
- [CocoaPods](https://cocoapods.org)
- [Swift 3.1](https://swift.org)

1. Download or clone the repository
2. Install required dependencies with `pod update`
3. Open the *RSA.xcworkspace* file.
4. Run the project with Xcode. 

## Unit testing : 

Once the project is compiled you can test it by going into the *Product* menu and clicking *Test* or using keyboard shortcut <kbd>Command</kbd> + <kbd>U</kbd> 

## Docs : 

The docs are placed in the docs directory on this project. Just open the *index.html* file. 

To generate the documentation you will need to install [Jazzy](https://github.com/realm/jazzy). Then run the command : 

```bash
jazzy --clean --min-acl private
```
