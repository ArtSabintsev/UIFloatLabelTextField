//
//  ViewController.m
//  UIFloatLabelSampleApp
//
//  Created by Arthur Sabintsev on 3/13/14.
//  Copyright (c) 2014 Arthur Ariel Sabintsev. All rights reserved.
//

#import "ViewController.h"
#import "UIFloatLabelTextField.h"

@interface ViewController () <UITextFieldDelegate>

@end

@implementation ViewController

#pragma mark - View Lifecycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"UIFloatLabelTextField Example";
    
    [[UIFloatLabelTextField appearance] setBackgroundColor:[UIColor whiteColor]];
    
    UIFloatLabelTextField *firstNameTextField = [UIFloatLabelTextField new];
    [firstNameTextField setTranslatesAutoresizingMaskIntoConstraints:NO];
    firstNameTextField.floatLabelActiveColor = [UIColor orangeColor];
    firstNameTextField.placeholder = @"First Name";
    firstNameTextField.text = @"Arthur";
    firstNameTextField.delegate = self;
    [self.view addSubview:firstNameTextField];
    
    UIFloatLabelTextField *lastNameTextField = [UIFloatLabelTextField new];
    [lastNameTextField setTranslatesAutoresizingMaskIntoConstraints:NO];
    lastNameTextField.floatLabelActiveColor = [UIColor purpleColor];
    lastNameTextField.placeholder = @"Last Name";
    [self.view addSubview:lastNameTextField];
    
    UIFloatLabelTextField *twitterTextField = [UIFloatLabelTextField new];
    [twitterTextField setTranslatesAutoresizingMaskIntoConstraints:NO];
    twitterTextField.placeholder = @"Twitter Moniker";
    twitterTextField.dismissKeyboardWhenClearingTextField = @YES;
    twitterTextField.clearButtonMode = UITextFieldViewModeNever;
    [self.view addSubview:twitterTextField];

    // Horizontal
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[firstNameTextField]-10-|"
                                                                      options:NSLayoutFormatAlignAllBaseline
                                                                      metrics:nil
                                                                        views:NSDictionaryOfVariableBindings(firstNameTextField)]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[lastNameTextField]-10-|"
                                                                      options:NSLayoutFormatAlignAllBaseline
                                                                      metrics:nil
                                                                        views:NSDictionaryOfVariableBindings(lastNameTextField)]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[twitterTextField]-10-|"
                                                                      options:NSLayoutFormatAlignAllBaseline
                                                                      metrics:nil
                                                                        views:NSDictionaryOfVariableBindings(twitterTextField)]];

    // Vertical
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-80-[firstNameTextField(44)]-10-[lastNameTextField(44)]-10-[twitterTextField(44)]"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:NSDictionaryOfVariableBindings(firstNameTextField, lastNameTextField, twitterTextField)]];
    
}

#pragma mark - UIResponder
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    if(![touch.view isMemberOfClass:[UITextField class]]) {
        [touch.view endEditing:YES];
    }
}

@end
