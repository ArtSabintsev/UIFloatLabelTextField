# UIFloatLabelTextField
### A subclassed UITextField that implements the Float Label UI design pattern. 
___

### About
In 2013, [**Matt D. Smith**](http://twitter.com/mds) unveiled the **[Float Label](http://www.floatlabel.com)** user interface design pattern. In short, it retains a text field's placeholder above said text field as a *floating label*. This label is brightly colored when the field is active, and dimly colored when a user has finished editing that field. 

I also want to credit [**Jared Verdi**](http://twitter.com/jverdi) for developing the first iOS implementation of this pattern in his [**JVFloatLabeledTextField**](https://github.com/jverdi/JVFloatLabeledTextField) project. I used it as a reference to make this version, but executed many aspects differently. I also added a few other features that I personally needed, and plan on enhancing this library overtime.

![Sample Gif of Library in Action](http://d13yacurqjgara.cloudfront.net/users/6410/screenshots/1254439/form-animation-_gif_.gif)

Image credit goes to [Matt D. Smith](http://twitter.com/mds). More information about this image and the float label pattern can be found at [FloatLabel.com](http://www.floatlabel.com).

### Changelog (v1.0.3)
- Bugfix for pre-populated text fields

### Features
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

### Installation
```
pod 'UIFloatLabelTextField'
```

### Usage
Check out `UIFloatLabelTextField.h` for a full list of editable properties. Also, check out the **UIFloatLabelSampleApp** for an example impementation of the application.

### Created and maintained by
[Arthur Ariel Sabintsev](http://www.sabintsev.com/) 

### License
Please refer to the **LICENSE** file.
