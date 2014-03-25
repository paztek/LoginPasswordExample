//
//  LoginPasswordViewController.h
//  LoginScreenExample
//
//  Created by Matthieu Balmes on 25/03/2014.
//  Copyright (c) 2014 Paztek. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LoginPasswordViewControllerDelegate <NSObject>

- (void)authenticationSucceededWithdictionary:(NSDictionary *)profileDict;
- (void)authenticattionFailedWithError:(NSError *)error;

@end

@interface LoginPasswordViewController : UIViewController

@property (strong, nonatomic) id <LoginPasswordViewControllerDelegate> delegate;

@property (weak, nonatomic) IBOutlet UITextField *loginField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UIButton *submit;

- (IBAction)submitClicked:(id)sender;

@end
