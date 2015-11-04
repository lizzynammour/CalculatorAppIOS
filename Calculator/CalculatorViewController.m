#import "CalculatorViewController.h"

#import "CalculatorModel.h"

#import "PasswordModel.h"

@interface CalculatorViewController ()

@property(nonatomic) CalculatorModel *calculatorModel;

@property(nonatomic) PasswordModel *passwordModel;

@property(nonatomic, strong) NSString *operandUpdated;

@property(nonatomic)BOOL decimalUsed;

@property(nonatomic, strong) NSString *password;

// Put any outlets you want here.
// Just control+click and drag them
// from the storyboard to here. See
// the provided demo code for examples.

//TODO:Drag an outlet to the UILabel here so you can access it via code.
@property (weak, nonatomic) IBOutlet UILabel *display;

@end

@implementation CalculatorViewController



- (void)viewDidLoad {
  [super viewDidLoad];
  
  // Initialize the CalculatorModel
  self.calculatorModel = [[CalculatorModel alloc] init];
  self.passwordModel = [[PasswordModel alloc] init];
  [self.navigationController setNavigationBarHidden:YES animated:YES];
  self.display.text = @"0";
  self.operandUpdated = @"";
  self.password = [self.passwordModel getPassword];
    
  // TODO: Any ViewController setup should go here.
}

/**
  * Put any actions you want here.
  * Just control+click and drag from a
  * UI element to here. You can connect
  * multiple UI elements to the same action.
  * For example, you might want all the number
  * buttons to be connected to the same action.
  * This is a sample action (not connected to anything)
  * You can see that the sender argument is actually the
  * UI element that was pressed. You can use this argument
  * to retrieve valuable information about the ui element.
  */

- (IBAction)numberButtonPressed:(id)sender {

  
  // Explicit cast to a UIButton because we know the sender
  // will always be a UIButton.
    UIButton *buttonPressed = (UIButton *)sender;
  // Print the text on the button to the console
       if([buttonPressed.titleLabel.text isEqual:@"."]) {
        if(!self.decimalUsed){
             self.operandUpdated = [self.operandUpdated  stringByAppendingString:buttonPressed.titleLabel.text];
            self.decimalUsed = true;
        }
        
    }
    else {
    self.operandUpdated = [self.operandUpdated  stringByAppendingString:buttonPressed.titleLabel.text];
    
    }
    self.display.text = self.operandUpdated;

    
    if ([self.operandUpdated isEqualToString:self.password]) {
        [self performSegueWithIdentifier:@"seguePassword" sender:self];
    }
   
   
  //TODO:Connect the rest of the number buttons to this method by cntrl+click and drag
}

- (IBAction)operatorButtonPressed:(id)sender {
    
     UIButton *buttonPressed = (UIButton *)sender;
  
  
    if(self.calculatorModel.isFirstOperand) {
        [self.calculatorModel setOperand1:[NSNumber numberWithFloat:([self.operandUpdated floatValue])]];
    }
    else {
        [self.calculatorModel setOperand2:[NSNumber numberWithFloat:([self.operandUpdated floatValue])]];
            }
    
    if(self.calculatorModel.isFirstOperator) {
        [self.calculatorModel setOperator:buttonPressed.titleLabel.text];
        
    }
    else {
      
        
        if([[[self.calculatorModel getOperand2] stringValue] isEqual:@"0"] && [[self.calculatorModel getOperator] isEqual:@"/"]) {
            NSLog(@"ERROR");
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error"
                                                                message:@"Divided by 0"
                                                               delegate:nil
                                                      cancelButtonTitle:@"Okay."
                                                      otherButtonTitles:nil, nil];
            [alertView show];
            [self.calculatorModel clear];
            self.decimalUsed = false;
            self.operandUpdated = @"";
            self.display.text = @"0";
        }
        else {
        [self.calculatorModel calculateResult];
        self.display.text = [[self.calculatorModel currentResult] stringValue];
        [self.calculatorModel setOperator:buttonPressed.titleLabel.text];
        }
        
        
    }
 
   
    self.operandUpdated = @"";
    self.decimalUsed = false;

    
}
- (IBAction)equalsButtonPressed:(id)sender {
       if ([self.calculatorModel getOperand1] == nil){
         [self.calculatorModel setOperand1:[NSNumber numberWithFloat:([self.operandUpdated floatValue])]];
    }
         else {
 
    [self.calculatorModel setOperand2:[NSNumber numberWithFloat:([self.operandUpdated floatValue])]];
   
       if([[[self.calculatorModel getOperand2] stringValue] isEqual:@"0"] && [[self.calculatorModel getOperator] isEqual:@"/"]) {
        NSLog(@"ERROR");
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error"
                                                            message:@"Divided by 0"
                                                           delegate:nil
                                                  cancelButtonTitle:@"Okay."
                                                  otherButtonTitles:nil, nil];
        [alertView show];
        [self.calculatorModel clear];
        self.decimalUsed = false;
        self.operandUpdated = @"";
        self.display.text = @"0";
    }
    else {
    [self.calculatorModel calculateResult];
    }
    }
    
    self.display.text = [[self.calculatorModel currentResult] stringValue];
    
}

-(IBAction)negateButtonPressed:(id)sender {
    if([self.calculatorModel getOperand1] == nil) {
        [self.calculatorModel setOperand1:[NSNumber numberWithFloat:([self.operandUpdated floatValue])]];
    }
    if(![self.calculatorModel isFirstOperator]) {
        NSLog(@"Yes");
        [self.calculatorModel setOperand2:[NSNumber numberWithFloat:([self.operandUpdated floatValue])]];
        [self.calculatorModel calculateResult];
    }
    [self.calculatorModel negateResult];
    
    
    self.display.text =  [[self.calculatorModel currentResult] stringValue];
}

-(IBAction)percentButtonPressed:(id)sender {
    if([self.calculatorModel getOperand1] == nil) {
        [self.calculatorModel setOperand1:[NSNumber numberWithFloat:([self.operandUpdated floatValue])]];
    }
    if(![self.calculatorModel isFirstOperator]) {
        NSLog(@"Yes");
        [self.calculatorModel setOperand2:[NSNumber numberWithFloat:([self.operandUpdated floatValue])]];
        [self.calculatorModel calculateResult];
    }
    [self.calculatorModel percentResult];
    
    
    self.display.text =  [[self.calculatorModel currentResult] stringValue];
}

- (IBAction) clearButtonPressed:(id)sender{
    [self.calculatorModel clear];
    self.decimalUsed = false;
    self.operandUpdated = @"";
    self.display.text = @"0";
}
//TODO: Create methods for the operator buttons and equals buttons.

@end
