# UIFloatLabelTextField
### A subclassed UITextField that implements the Float Label UI design pattern. 
___

### About
In 2013, [Matt D. Smith](http://twitter.com/mds) unveiled the **Float Label** user interface design pattern. In short, it retains a text field's placeholder above said text field as a *floating label*. This label is brightly colored when the field is active, and dimly colored when a user has finished editing that field. 

I also want to credit [Jared Verdi](http://twitter.com/jverdi) for developing the first iOS implementation of this pattern in his [JVFloatLabeledTextField](https://github.com/jverdi/JVFloatLabeledTextField) project. I used it as a reference to make this version, but executed many aspects differently. I also added a few other features that I personally needed, and plan on enhancing this library overtime.

->![Sample](UIFloatLabelTextFieldSample.gif =211x375) <-

### Changelog (v1.0.0)
- Initial Commit

### Features
- Works with all `NSTextAlignments`
- Works with all view `init` styles
	- Visual Formatting Language (for programmatic NSAutoLayout)
	- Manual Frame Initialization
	- Storyboards and Xibs
- Support for disabling all default UIMenuController options
	- Paste, Copy, Cut, Select, Select All
- Animations
	- UILabel animation for toggling UILabel visibility
	- Animation for clearing text

### Installation
```
pod 'UIFloatLabelTextField'
```

### Usage
Checkout `UIFloatLabelTextField.h` for a full list of editable properties. Also, checkout **UIFloatLabelSampleApp** for an example impementation of the application.

### Created and maintained by
[Arthur Ariel Sabintsev](http://www.sabintsev.com/) 

### LICENSE
Please refer to the **LICENSE** file.