//
//  UIFloatLabelTextField.h
//  UIFloatLabelTextField
//
//  Created by Arthur Sabintsev on 3/3/14.
//  Copyright (c) 2014 Arthur Ariel Sabintsev. All rights reserved.
//

#import <UIKit/UIKit.h>

//! Project version number for UIFloatLabelTextField.
FOUNDATION_EXPORT double UIFloatLabelTextFieldVersionNumber;

//! Project version string for UIFloatLabelTextField.
FOUNDATION_EXPORT const unsigned char UIFloatLabelTextFieldVersionString[];

/**
 A typedef that delineates the states of the float label
 */
#ifndef UIFloatLabelAnimationType
typedef NS_ENUM(NSUInteger, UIFloatLabelAnimationType)
{
    UIFloatLabelAnimationTypeShow = 0,
    UIFloatLabelAnimationTypeHide
};
#define UIFloatLabelAnimationType UIFloatLabelAnimationType
#endif

@interface UIFloatLabelTextField : UITextField

/**
 A UILabel that @a floats above the contents of the UITextField
 */
@property (nonatomic, strong) UILabel *floatLabel;

/**
 * The font for @c floatLabel.
 *
 * Defaults to Helvetica Neue Bold 12.0f.
 */
@property (nonatomic, strong) UIFont *floatLabelFont UI_APPEARANCE_SELECTOR;

/**
 * The inactive color for the floatLabel. 
 *
 * Defaults to @c lightGrayColor.
 */
@property (nonatomic, strong) UIColor *floatLabelPassiveColor UI_APPEARANCE_SELECTOR;

/**
 The inactive color for the floatLabel. 
 * 
 * Defaults to @c blueColor.
 */
@property (nonatomic, strong) UIColor *floatLabelActiveColor UI_APPEARANCE_SELECTOR;

/**
 * The animation duration when animating-in the float label.
 * This @c NSNumber value is converted to a @c float.
 *
 * Defaults to 0.25 seconds.
 */
@property (nonatomic, strong) NSNumber *floatLabelShowAnimationDuration UI_APPEARANCE_SELECTOR;

/**
 * The animation duration when animating-out the float label.
 * This @c NSNumber value is converted to a @c float.
 *
 * Defaults to 0.05 seconds.
 */
@property (nonatomic, strong) NSNumber *floatLabelHideAnimationDuration UI_APPEARANCE_SELECTOR;

/**
 * Dismiss the keyboard when interacting with the textField clear button (found on one edge of the textField).
 * This @c NSNumber value is converted to a @c BOOL.
 *
 * Defaults to NO.
 */
@property (nonatomic, assign) NSNumber *dismissKeyboardWhenClearingTextField UI_APPEARANCE_SELECTOR;

/**
 * THe amount of padding to add to the left and right boundaries of the text field.
 *
 * Defaults to 5.0.
 */
@property (nonatomic, assign) CGFloat horizontalPadding UI_APPEARANCE_SELECTOR;

/**
 * Disables the option to @a paste in the @c UIMenuController. 
 * This @c NSNumber value is converted to a @c BOOL.
 *
 * Defaults to YES.
 */
@property (nonatomic, assign) NSNumber *pastingEnabled UI_APPEARANCE_SELECTOR;

/**
 * Disables the option to @a copy in the @c UIMenuController.
 * This @c NSNumber value is converted to a @c BOOL.
 *
 * Defaults to YES.
 */
@property (nonatomic, assign) NSNumber *copyingEnabled UI_APPEARANCE_SELECTOR;

/**
 * Disables the option to @a cut in the @c UIMenuController.
 * This @c NSNumber value is converted to a @c BOOL.
 *
 * Defaults to YES.
 */
@property (nonatomic, assign) NSNumber *cuttingEnabled UI_APPEARANCE_SELECTOR;

/**
 * Disables the option to @a select in the @c UIMenuController.
 * This @c NSNumber value is converted to a @c BOOL.
 *
 * Defaults to YES.
 */
@property (nonatomic, assign) NSNumber *selectEnabled UI_APPEARANCE_SELECTOR;

/**
 * Disables the option to @a select-all in the @c UIMenuController.
 * This @c NSNumber value is converted to a @c BOOL.
 *
 * Defaults to YES.
 */
@property (nonatomic, assign) NSNumber *selectAllEnabled UI_APPEARANCE_SELECTOR;

/**
 * The textField's clear button.
 *
 * Read-only variable.
 */
@property (nonatomic, strong, readonly) UIButton *textFieldClearButton;

/**
 Toggles the float label using an animation
 @param animationType The desired animation (and final state) for the float label.
 */
- (void)toggleFloatLabel:(UIFloatLabelAnimationType)animationType;

@end
