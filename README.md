# UIFloatLabelTextField

### A subclassed UITextField that implements the Float Label UI design pattern.

![Cocoapods](https://img.shields.io/cocoapods/v/UIFloatLabelTextField.svg) ![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)
___

## Note
If you are looking for the `UITextView` equivalent of this class, please visit my [UIFloatLabelTextView](http://www.github.com/ArtSabintsev/UIFloatLabelTextView) repository.

## About
In 2013, [**Matt D. Smith**](http://twitter.com/mds) unveiled the **[Float Label](http://www.floatlabel.com)** user interface design pattern. In short, it retains a text field's placeholder above said text field as a *floating label*. This label is brightly colored when the field is active, and dimly colored when a user has finished editing that field.

![Sample Gif of Library in Action](http://d13yacurqjgara.cloudfront.net/users/6410/screenshots/1254439/form-animation-_gif_.gif)

Image credit: [Matt D. Smith](http://twitter.com/mds).

## Features
- Works with all view `init` styles
	- Visual Formatting Language (for programmatic NSAutoLayout)
	- Manual Frame Initialization
	- Storyboards and Xibs
- Works with all `NSTextAlignments`
- Support for disabling all default UIMenuController options
	- E.g., Paste, Copy, Cut, Select, Select All
- Animations
	- Animation when toggling UILabel visibility
	- Animation when clearing text

## Installation

### CococaPods
``` ruby
pod 'UIFloatLabelTextField'
```

### Carthage
``` swift
github "ArtSabintsev/UIFloatLabelTextField"
```

## Setup
Check out `UIFloatLabelTextField.h` for a full list of editable properties. Also, check out the **UIFloatLabelSampleApp** for an example implementation of the application.

## Credit
I want to credit [**Jared Verdi**](http://twitter.com/jverdi) for developing the first iOS implementation of this pattern in his [**JVFloatLabeledTextField**](https://github.com/jverdi/JVFloatLabeledTextField) project. I used it as a reference to make this version, but executed most aspects differently. I also added many other features that I personally needed, and plan on continuing to enhance this library over time.

## Created and maintained by
[Arthur Ariel Sabintsev](http://www.sabintsev.com/)

## License
Please refer to the **LICENSE** file.
