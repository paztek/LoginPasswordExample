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
    
    // We need to check if these values are nil otherwise the setting of the dictionary would crash
    if ([self.username isKindOfClass:[NSNull class]] == NO) {
        [profileDict setValue:self.username forKey:@"username"];
    }
    if ([self.email isKindOfClass:[NSNull class]] == NO) {
        [profileDict setValue:self.email forKey:@"email"];
    }
    if ([self.accessToken isKindOfClass:[NSNull class]]) {
        [profileDict setValue:self.accessToken forKey:@"accessToken"];
    }
    
    // Se save and extract the profile from the user defaults whoch is the most convenient way of storing permanent key / values.
    [[NSUserDefaults standardUserDefaults] setObject:profileDict forKey:@"Profile"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)reset
{
    self.username = nil;
    self.email = nil;
    self.accessToken = nil;
    
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"Profile"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

@end
