//
//  PasswordViewController.m
//  Calculator
//
//  Created by Lizzy Nammour on 9/29/15.
//  Copyright (c) 2015 CIS195. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PasswordViewController.h"
#import "PasswordModel.h"

@interface PasswordViewController ()

@property(nonatomic, strong) NSString *passwordUpdated;

@property (weak, nonatomic) IBOutlet UILabel *display;
@property(nonatomic) PasswordModel *passwordModel;

@property (weak, nonatomic) IBOutlet UILabel *current;

@end

@implementation PasswordViewController


- (void)viewDidLoad {
    self.passwordModel = [[PasswordModel alloc] init];
    [super viewDidLoad];
    self.display.text = @"0";
    self.passwordUpdated = @"";
    self.current.text = [self.passwordModel getPassword];
}




- (IBAction)numberButtonPressed:(id)sender {
    
    
    // Explicit cast to a UIButton because we know the sender
    // will always be a UIButton.
    UIButton *buttonPressed = (UIButton *)sender;
    // Print the text on the button to the console
 
     self.passwordUpdated = [self.passwordUpdated  stringByAppendingString:buttonPressed.titleLabel.text];
    NSLog(buttonPressed.titleLabel.text);
    
     NSLog(self.display.text);
    self.display.text = self.passwordUpdated;
    NSLog(self.display.text);
    
    //TODO:Connect the rest of the number buttons to this method by cntrl+click and drag
}


- (IBAction)setButtonPressed:(id)sender {
    
    
    // Explicit cast to a UIButton because we know the sender
    // will always be a UIButton.
    UIButton *buttonPressed = (UIButton *)sender;
    // Print the text on the button to the console
    
   
    [self.passwordModel setPassword:self.passwordUpdated];
     self.current.text = [self.passwordModel getPassword];
    
    //TODO:Connect the rest of the number buttons to this method by cntrl+click and drag
}

- (IBAction) clearButtonPressed:(id)sender{
self.passwordUpdated =@"";
    self.display.text = @"0";
}

- (IBAction)backButtonPressed:(id)sender{

    // write your code to prepare popview
    [self.navigationController popViewControllerAnimated:YES];
}

@end
