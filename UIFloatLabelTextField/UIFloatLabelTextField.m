//
//  UIFloatLabelTextField.m
//  UIFloatLabelTextField
//
//  Created by Arthur Sabintsev on 3/3/14.
//  Copyright (c) 2014 Arthur Ariel Sabintsev. All rights reserved.
//

#import "UIFloatLabelTextField.h"

typedef NS_ENUM(NSUInteger, UIFloatLabelAnimationType)
{
    UIFloatLabelAnimationTypeShow = 0,
    UIFloatLabelAnimationTypeHide
};

@interface UIFloatLabelTextField () <UITextFieldDelegate>

@property (nonatomic, copy) NSString *storedText;
@property (nonatomic, strong) UIButton *clearTextFieldButton;
@property (nonatomic, assign) CGFloat xOrigin;
@property (nonatomic, assign) CGFloat horizontalPadding;
@property (nonatomic, assign) CGFloat verticalPadding;

@end

@implementation UIFloatLabelTextField

#pragma mark - Initialization
- (id)init
{
    self = [super init];
    if (self) {
        [self setup];
    }
    
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setup];
    }
    
    return self;
}

#pragma mark - Breakdown
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UITextFieldTextDidChangeNotification
                                                  object:nil];
}

#pragma mark - Setup
- (void)setup
{
    // Build textField
    [self setupTextField];
    
    // Build floatLabel
    [self setupFloatLabelDefaults];
}

- (void)setupTextField
{
    // Textfield Padding
    _horizontalPadding = 5.0f;
    _verticalPadding = 0.5f * CGRectGetHeight(self.frame);
    
    // Text Alignment
    [self setTextAlignment:NSTextAlignmentLeft];
    
    // Enable clearButton when textField becomes firstResponder
    self.clearButtonMode = UITextFieldViewModeWhileEditing;
 
    /*
     Observer for replicating `textField:shouldChangeCharactersInRange:replacementString:` UITextFieldDelegate method,
     without explicitly using UITextFieldDelegate.
     */
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(textFieldUpdated:)
                                                 name:UITextFieldTextDidChangeNotification object:nil];
}

- (void)setupFloatLabelDefaults
{
    // floatLabel
    _floatLabel = [UILabel new];
    _floatLabel.textColor = [UIColor blackColor];
    _floatLabel.font =[UIFont boldSystemFontOfSize:12.0f];
    _floatLabel.alpha = 0.0f;
    [self addSubview:_floatLabel];
    [self centerFloatLabel];
    
    // colors
    _floatLabelPassiveColor = [UIColor lightGrayColor];
    _floatLabelActiveColor = [UIColor blueColor];
    
    // animationDuration
    _floatLabelAnimationDuration = @0.5;
}

- (void)setupClearTextFieldButton
{
    /*
     Traverse UIFloatLabelTextField view hierarchy in search of UIButton instance.
     
     The UIButton (there's only one and it represents the 'clear text' button)
     is initialized only once per UIFloatLabelTextField object, but is removed from 
     the view hiearchy when resignFirstResponder is called. It's re-added to the
     view hiearchy when becomeFirstResponder is called.
    */
     [self.clearTextFieldButton removeTarget:nil action:NULL forControlEvents:UIControlEventAllEvents];
    for (UIView *view in [self subviews]) {
        if ([view isMemberOfClass:[UIButton class]]) {
            _clearTextFieldButton = (UIButton *)view;
            [_clearTextFieldButton addTarget:self action:@selector(clearTextField) forControlEvents:UIControlEventTouchUpInside];
        }
    }
}

#pragma mark - Animation
- (void)toggleFloatLabel:(UIFloatLabelAnimationType)animationType
{
    // Placeholder
    self.placeholder = (animationType == UIFloatLabelAnimationTypeShow) ? nil : [_floatLabel text];
    
    // Reference textAlignment to reset origin of textField and floatLabel
    _floatLabel.textAlignment = self.textAlignment = [self textAlignment];
    
    // Common animation parameters
    UIViewAnimationOptions easingOptions = (animationType == UIFloatLabelAnimationTypeShow) ? UIViewAnimationOptionCurveEaseOut : UIViewAnimationOptionCurveEaseIn;
    UIViewAnimationOptions combinedOptions = UIViewAnimationOptionBeginFromCurrentState | easingOptions;
    void (^animationBlock)(void) = ^{

        _floatLabel.alpha = (animationType == UIFloatLabelAnimationTypeShow) ? 1.0f : 0.0f;
        CGFloat yOrigin = (animationType == UIFloatLabelAnimationTypeShow) ? 0.0f : _verticalPadding;
        _floatLabel.frame = CGRectMake(_xOrigin,
                                       yOrigin,
                                       CGRectGetWidth([_floatLabel frame]),
                                       CGRectGetHeight([_floatLabel frame]));
    };
    
    // Toggle floatLabel visibility via UIView animation
    [UIView animateWithDuration:[_floatLabelAnimationDuration floatValue]
                          delay:0.0f
                        options:combinedOptions
                     animations:animationBlock
                     completion:nil];
}


- (void)animateClearingTextFieldWithArray:(NSTimer *)timer
{
    // Reference textArray from NSTimer object
    NSMutableArray *textArray = [timer userInfo];
    
    /* 
     Remove last letter (e.g., last object in array) per method call,
     and display updated/truncated textField text.
     */
    if ([textArray count]) {
        [textArray removeLastObject];
        NSString *csvString = [textArray componentsJoinedByString:@","];
        _storedText = [csvString stringByReplacingOccurrencesOfString:@"," withString:@""];
        self.text = _storedText;
    } else {
        [[UIApplication sharedApplication] endIgnoringInteractionEvents];
        [timer invalidate];
        [self resignFirstResponder];
    }
}

#pragma mark - Helpers
- (UIEdgeInsets)floatLabelInsets
{
    return UIEdgeInsetsMake(_floatLabel.font.lineHeight,
                            _horizontalPadding,
                            0.0f,
                            _horizontalPadding);
}

- (void)textFieldUpdated:(NSNotification *)notification
{
    // Initialize clearButton
    if (![self clearTextFieldButton] && ![_disableClearingAnimation boolValue]) {
        [self setupClearTextFieldButton];
    }

    if (notification.name == UITextFieldTextDidChangeNotification) {
        if ([self.text length]) {
            _storedText = [self text];
            if (![_floatLabel alpha]) {
                [self toggleFloatLabel:UIFloatLabelAnimationTypeShow];
            }
        } else {
            [self toggleFloatLabel:UIFloatLabelAnimationTypeHide];
        }
    }
}

- (void)clearTextField
{
    // Create array, where each index contains one character from textField
    NSMutableArray *textArray = [@[] mutableCopy];
    NSUInteger i = 0;
    while (i < [_storedText length]) {
        NSString *character = [_storedText substringWithRange:NSMakeRange(i, 1)];
        [textArray addObject:character];
        ++i;
    }
    
    // Reset text before animation
    self.text = _storedText;
    
    // Calculate duraiton based on _floatLabelAnimationDuration and number letters in textField
    CGFloat duration = [_floatLabelAnimationDuration floatValue] / [textArray count];
    
    // Perform animation
    [[UIApplication sharedApplication] beginIgnoringInteractionEvents];
    [NSTimer scheduledTimerWithTimeInterval:duration target:self selector:@selector(animateClearingTextFieldWithArray:) userInfo:textArray repeats:YES];
}

- (void)centerFloatLabel
{
   [_floatLabel setCenter:CGPointMake(_xOrigin, _verticalPadding)];
}

- (void)updateRectForTextFieledGeneratedViaAutoLayout
{
    _verticalPadding = 0.5f * CGRectGetHeight([self frame]);
    _floatLabel.frame = CGRectMake(_xOrigin,
                                   _verticalPadding,
                                   CGRectGetWidth([_floatLabel frame]),
                                   CGRectGetHeight([_floatLabel frame]));
}

#pragma mark - UITextField (Override)
- (void)setPlaceholder:(NSString *)placeholder
{
    [super setPlaceholder:placeholder];
    
    if ([placeholder length]) {
        _floatLabel.text = placeholder;
    }
    
    [_floatLabel sizeToFit];
}

- (void)setTextAlignment:(NSTextAlignment)textAlignment
{
    [super setTextAlignment:textAlignment];

    switch (textAlignment) {
        case NSTextAlignmentRight: {
            _xOrigin = CGRectGetWidth([self frame]) - CGRectGetWidth([_floatLabel frame]) - _horizontalPadding;
        } break;
            
        case NSTextAlignmentCenter: {
            _xOrigin = CGRectGetWidth([self frame])/2.0f - CGRectGetWidth([_floatLabel frame])/2.0f;
        } break;
            
        default: // NSTextAlignmentLeft, NSTextAlignmentJustified, NSTextAlignmentNatural
            _xOrigin = _horizontalPadding;
            break;
    }
    
    [self centerFloatLabel];
}

- (CGRect)textRectForBounds:(CGRect)bounds
{
    return UIEdgeInsetsInsetRect([super textRectForBounds:bounds], [self floatLabelInsets]);
}

- (CGRect)editingRectForBounds:(CGRect)bounds
{
    return UIEdgeInsetsInsetRect([super editingRectForBounds:bounds], [self floatLabelInsets]);
}

#pragma mark - UIResponder (Override)
-(BOOL)becomeFirstResponder
{
    [super becomeFirstResponder];
 
    /*
     verticalPadding must be manually set if textField was initialized 
     using NSAutoLayout constraints
    */
     if (!_verticalPadding) {
        [self updateRectForTextFieledGeneratedViaAutoLayout];
    }
    
    _floatLabel.textColor = _floatLabelActiveColor;
    _storedText = [self text];

    return YES;
}

- (BOOL)resignFirstResponder
{
    if ([_floatLabel.text length]) {
        _floatLabel.textColor = _floatLabelPassiveColor;
    }
    
    [super resignFirstResponder];
    
    return YES;
}

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender
{
    if (action == @selector(paste:)) { // Toggle Pasting
        return ([_disablePasting boolValue]) ? NO : YES;
    } else if (action == @selector(copy:)) { // Toggle Copying
        return ([_disableCopying boolValue]) ? NO : YES;
    } else if (action == @selector(cut:)) { // Toggle Cutting
        return ([_disableCutting boolValue]) ? NO : YES;
    } else if (action == @selector(select:)) { // Toggle Select
        return ([_disableSelect boolValue]) ? NO : YES;
    } else if (action == @selector(selectAll:)) { // Toggle Select All
        return ([_disableSelectAll boolValue]) ? NO : YES;
    }
    
    return [super canPerformAction:action withSender:sender];
}

@end
