# Nintendo Gallery

## Colors

* Default: #F0C40F
* DefaultDark: #273238

## UI Development

> Programmatic implementation

## Info

All fonts and sizes are default.

Uses `ApplicationCoordinator` for handling view navigation

## ViewControllers

* HomeViewController
    - Show's all character in list using `tableView`
* ShowcaseViewController
    - Display the character's image in full size
* WebViewController
    - Display webview with pre selected query with the value of the `gameSeries`
        field from the character. Default landing page is the Images tab in
        google.

## Requirements
   * ">= iOS 13"
   * ">= Xcode 11

## Setup

There's a setup script in the repo named `project_setup.sh`

To run script just simply enter this command from the root directory:
```
./project_setup.sh
```

This will:
  * Check if **ruby** is installed
  * Check if **brew** is installed
  * Check if **bundler** is installed and install it if not
  * Install **Gems**
  * Install **Cocoapods**
  * Build **Xcode**
  * Run tests using **Fastlane**

## Architecture

It's a swift project using MVVM Framework together with ReactiveCocoa
