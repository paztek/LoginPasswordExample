//
//  AppDelegate.m
//  LoginScreenExample
//
//  Created by Matthieu Balmes on 25/03/2014.
//  Copyright (c) 2014 Paztek. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // We try to extract the profile from the user defaults
    NSDictionary *profileDict = [[NSUserDefaults standardUserDefaults] objectForKey:@"Profile"];
    
    if (profileDict) {
        // If the profile already exists (meaning that the user is already logged in), we instantiate a globally accessible Profile object
        self.profile = [[Profile alloc] init];
        self.profile.username = [profileDict objectForKey:@"username"];
        self.profile.email = [profileDict objectForKey:@"email"];
        self.profile.accessToken = [profileDict objectForKey:@"accessToken"];
    } else {
        // If not, we need to replace the initial view controller with the login / password view controller
        LoginPasswordViewController *controller = (LoginPasswordViewController *)[[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:@"LoginPassword"];
        self.window.rootViewController = controller;
        controller.delegate = self;
    }
    
    return YES;
}

- (void)authenticationSucceededWithdictionary:(NSDictionary *)profileDict
{
    // We instantiate the profile
    self.profile = [[Profile alloc] init];
    self.profile.username = [profileDict objectForKey:@"username"];
    self.profile.email = [profileDict objectForKey:@"email"];
    self.profile.accessToken = [profileDict objectForKey:@"accessToken"];
    
    // We persist it to the user defaults
    [self.profile saveToDefaults];
    
    // And then we replace the login /password view controller with the initial initial view controller
    UIViewController *controller = [[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:@"MainTabBar"];
    self.window.rootViewController = controller;
}

- (void)authenticattionFailedWithError:(NSError *)error
{
    // TODO Display a nice UIALertview explaining what went wrong.
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
