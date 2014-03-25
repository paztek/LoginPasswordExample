//
//  LoginPasswordViewController.m
//  LoginScreenExample
//
//  Created by Matthieu Balmes on 25/03/2014.
//  Copyright (c) 2014 Paztek. All rights reserved.
//

#import "LoginPasswordViewController.h"

@interface LoginPasswordViewController ()

@end

@implementation LoginPasswordViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)submitClicked:(id)sender
{
    NSString *username = self.loginField.text;
    NSString *password = self.passwordField.text;
    
    // We add some basic pre-validation
    if (username.length > 0 && password.length > 0) {
        // We build the HTTP request
        NSURL *loginURL = [NSURL URLWithString:@"Your own login API endpoint"]; // In ou example, it it supposed to return a JSON representation of the profile
        NSMutableURLRequest *loginRequest = [NSMutableURLRequest requestWithURL:loginURL
                                                                    cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                                timeoutInterval:10.0f];
        [loginRequest setHTTPMethod:@"POST"];
        NSString *postString = [NSString stringWithFormat:@"username=%@&password=%@", username, password];
        [loginRequest setHTTPBody:[postString dataUsingEncoding:NSUTF8StringEncoding]];
        
        // We send the request synchronously (there is nothing to block anyway)
        NSURLResponse *response = nil;
        NSError *error = nil;
        NSData *data = [NSURLConnection sendSynchronousRequest:loginRequest
                                              returningResponse:&response
                                                          error:&error];
        
        // We handle occasional errors and parse the response
        if (error != nil) {
            // We notify the delegate that something went wrong
            [self.delegate authenticattionFailedWithError:error];
        } else {
            NSDictionary *profileDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
            if (error != nil) {
                // We notify the delegate that something went wrong
                [self.delegate authenticattionFailedWithError:error];
            } else {
                // We notify the delegate that everything worked accoridng to the plan !
                [self.delegate authenticationSucceededWithdictionary:profileDict];
            }
        }
    }
}

- (IBAction)hideKeyboardOnReturn:(id)sender
{
    [sender resignFirstResponder];
}

@end
