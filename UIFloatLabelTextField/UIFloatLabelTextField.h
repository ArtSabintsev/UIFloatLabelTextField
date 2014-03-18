//
//  UIFloatLabelTextField.h
//  UIFloatLabelTextField
//
//  Created by Arthur Sabintsev on 3/3/14.
//  Copyright (c) 2014 Arthur Ariel Sabintsev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIFloatLabelTextField : UITextField

/**
 A UILabel that @a floats above the contents of the UITextField
 */
@property (nonatomic, strong) UILabel   *floatLabel;

/**
 * The font for @c floatLabel.
 *
 * Defaults to Helvetica Neue Bold 12.0f.
 */
@property (nonatomic, strong) UIFont    *floatLabelFont;                UI_APPEARANCE_SELECTOR

/**
 The inactive color for the floatLabel. 
 *
 * Defaults to @c lightGrayColor.
 */
@property (nonatomic, strong) UIColor   *floatLabelPassiveColor;        UI_APPEARANCE_SELECTOR

/**
 The inactive color for the floatLabel. 
 * 
 * Defaults to @c blueColor.
 */
@property (nonatomic, strong) UIColor   *floatLabelActiveColor;         UI_APPEARANCE_SELECTOR

/**
 * The duration for all animations. 
 * This @c NSNumber value is converted to a @c CGFloat.
 *
 * Defaults to 0.5 seconds.
 */
@property (nonatomic, strong) NSNumber  *floatLabelAnimationDuration;   UI_APPEARANCE_SELECTOR

/**
 * Disables the option to @a paste in the @c UIMenuController. 
 * This @c NSNumber value is converted to a @c BOOL.
 */
@property (nonatomic, assign) NSNumber  *disablePasting;                UI_APPEARANCE_SELECTOR

/**
 * Disables the option to @a copy in the @c UIMenuController.
 * This @c NSNumber value is converted to a @c BOOL.
 */
@property (nonatomic, assign) NSNumber  *disableCopying;                UI_APPEARANCE_SELECTOR

/**
 * Disables the option to @a cut in the @c UIMenuController.
 * This @c NSNumber value is converted to a @c BOOL.
 */
@property (nonatomic, assign) NSNumber  *disableCutting;                UI_APPEARANCE_SELECTOR

/**
 * Disables the option to @a select in the @c UIMenuController.
 * This @c NSNumber value is converted to a @c BOOL.
 */
@property (nonatomic, assign) NSNumber  *disableSelect;                 UI_APPEARANCE_SELECTOR

/**
 * Disables the option to @a select-all in the @c UIMenuController.
 * This @c NSNumber value is converted to a @c BOOL.
 */
@property (nonatomic, assign) NSNumber  *disableSelectAll;              UI_APPEARANCE_SELECTOR

@end
