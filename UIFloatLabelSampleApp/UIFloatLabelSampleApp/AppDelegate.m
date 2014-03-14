//
//  AppDelegate.m
//  UIFloatLabelSampleApp
//
//  Created by Arthur Sabintsev on 3/13/14.
//  Copyright (c) 2014 Arthur Ariel Sabintsev. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    self.navController = [[UINavigationController alloc] initWithRootViewController:[ViewController new]];
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self.window setRootViewController:_navController];
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
