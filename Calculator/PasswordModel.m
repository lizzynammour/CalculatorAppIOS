//
//  PasswordModel.m
//  Calculator
//
//  Created by Lizzy Nammour on 9/29/15.
//  Copyright (c) 2015 CIS195. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PasswordModel.h"

@interface PasswordModel ()
@property(nonatomic, strong) NSString *password;

@property(nonatomic, strong) NSString *secretText;



@end


@implementation PasswordModel

- (instancetype)init {
    self = [super init];
    if (self) {
        //TODO: Any setup you need should go here.
        NSUserDefaults *defaults= [NSUserDefaults standardUserDefaults];
        if([defaults stringForKey:@"password"] != nil) {
             self.password =  (NSString *)[defaults stringForKey:@"password"];
        }
        else {
            self.password = @"0000";
        }
        
        if([defaults stringForKey:@"secretText"] != nil) {
            self.secretText =  (NSString *) [defaults stringForKey:@"secretText"];
        }
        else {
            self.secretText = @"";
        }
        
    }
    return self;
}




- (NSString *) getPassword{
    return self.password;
    
}

- (NSString *) getSecretText{
    return self.secretText;
    
}

- (void) setPassword:(NSString *)passwordString {
    _password = passwordString;
    NSUserDefaults *defaults= [NSUserDefaults standardUserDefaults];
    [defaults setObject:passwordString forKey:@"password"];
    
    
}

- (void) setSecretText: (NSString *)secretString{
    _secretText = secretString;
    NSUserDefaults *defaults= [NSUserDefaults standardUserDefaults];
    [defaults setObject: secretString forKey:@"secretText"];
    
}

@end