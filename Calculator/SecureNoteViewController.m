//
//  SecureNoteViewController.m
//  Calculator
//
//  Created by Lizzy Nammour on 9/29/15.
//  Copyright (c) 2015 CIS195. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SecureNoteViewController.h"
#import "PasswordModel.h"

@interface SecureNoteViewController ()

@property(nonatomic, strong) NSString *secureNoteUpdated;

@property (weak, nonatomic) IBOutlet UILabel *display;

@property (weak, nonatomic) IBOutlet UITextView *textview;

@property(nonatomic) PasswordModel *passwordModel;


@end

@implementation SecureNoteViewController



- (void)viewDidLoad {
    self.passwordModel = [[PasswordModel alloc] init];
    [super viewDidLoad];
    self.textview.text = @"";
    self.secureNoteUpdated = @"";
    self.display.text = [self.passwordModel getSecretText];
}

- (IBAction)setButtonPressed:(id)sender {
    [self.passwordModel setSecretText:self.textview.text];
    self.display.text = [self.passwordModel getSecretText];
    
}

- (IBAction)backButtonPressed:(id)sender{
    
    // write your code to prepare popview
    [self.navigationController popViewControllerAnimated:YES];
}

@end