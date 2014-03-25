//
//  Profile.m
//  LoginScreenExample
//
//  Created by Matthieu Balmes on 25/03/2014.
//  Copyright (c) 2014 Paztek. All rights reserved.
//

#import "Profile.h"

@implementation Profile

- (void)saveToDefaults
{
    NSMutableDictionary *profileDict = [NSMutableDictionary dictionary];
    
    if ([self.username isKindOfClass:[NSNull class]] == NO) {
        [profileDict setValue:self.username forKey:@"username"];
    }
    if ([self.email isKindOfClass:[NSNull class]] == NO) {
        [profileDict setValue:self.email forKey:@"email"];
    }
    if ([self.accessToken isKindOfClass:[NSNull class]]) {
        [profileDict setValue:self.accessToken forKey:@"accessToken"];
    }
    
    [[NSUserDefaults standardUserDefaults] setObject:profileDict forKey:@"Profile"];
    
    [[NSUserDefaults standardUserDefaults] synchronize];
}

@end
