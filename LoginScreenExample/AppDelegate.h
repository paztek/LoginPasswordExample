//
//  AppDelegate.h
//  LoginScreenExample
//
//  Created by Matthieu Balmes on 25/03/2014.
//  Copyright (c) 2014 Paztek. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Profile.h"
#import "LoginPasswordViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate, LoginPasswordViewControllerDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) Profile *profile;

@end
