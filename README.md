# KTOptionMenu

[![Version](https://img.shields.io/cocoapods/v/KTOptionMenu.svg?style=flat)](https://cocoapods.org/pods/KTOptionMenu)
[![License](https://img.shields.io/cocoapods/l/KTOptionMenu.svg?style=flat)](https://cocoapods.org/pods/KTOptionMenu)
[![Platform](https://img.shields.io/cocoapods/p/KTOptionMenu.svg?style=flat)](https://cocoapods.org/pods/KTOptionMenu)

## Description

KTOptionMenu is a swift library based on the various options menu in material design in Android that allows you to easily create a user-friendly and attractive option menu. KTOptionMenu is a popover style menu that can be employed easily in any UIViewController with every added action corresponding to a button. All actions are easily handled with a completion handler.

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Preview

<img src="https://user-images.githubusercontent.com/93727769/141182672-a58426a9-b8f9-4dcf-a13b-14678d971d96.gif" alt="Preview" width=300>

## Requirements



## Installation

KTOptionMenu is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'KTOptionMenu'
```
## Usage

```swift

import UIKit
import KTOptionMenu

class ViewController: UIViewController {
    
    @IBOutlet weak var clickMeBtn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func clickMeAction(_ sender: UIButton) {
                
        KTOptionMenu(sender: sender, options: ["Edit", "View", "Rename", "Delete", "Favorite", "Unfavorite"]) { index in
            //Do actions on click
            if index == 0 {
                //Edit
            }
            else if index == 1 {
                //View
            }
            else if index == 2 {
                //Rename
            }
            else if index == 3 {
                //Delete
            }
            else if index == 4 {
                //Favorite
            }
            else {
                //Unfavorite
            }
            
        }
    }
}

```


## Author

iOSDevKamal, kamaltrapasiya@gmail.com

## License

KTOptionMenu is available under the MIT license. See the LICENSE file for more info.
