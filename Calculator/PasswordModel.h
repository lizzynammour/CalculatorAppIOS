//
//  PasswordModel.h
//  Calculator
//
//  Created by Lizzy Nammour on 9/29/15.
//  Copyright (c) 2015 CIS195. All rights reserved.
//

#ifndef Calculator_PasswordModel_h
#define Calculator_PasswordModel_h

@interface PasswordModel : NSObject
- (void) setPassword:(NSString *)passwordString;

- (NSString *) getPassword;

- (NSString *) getSecretText;

- (void) setSecretText: (NSString *)secretString;


@end

#endif
