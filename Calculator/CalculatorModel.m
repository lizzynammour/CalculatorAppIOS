#import "CalculatorModel.h"
#import <math.h>

@interface CalculatorModel ()

//TODO: Any private properties or methods should be declared here.

// Declare operand1.
@property(nonatomic, strong) NSNumber *operand1;

//TODO: Declare operand2 and something to hold the operator.
@property(nonatomic, strong) NSNumber *operand2;

@property(nonatomic, strong) NSString *operator;

@end

@implementation CalculatorModel

- (instancetype)init {
  self = [super init];
  if (self) {
    //TODO: Any setup you need should go here.
      
      self.operand1 = 0;
      self.operand2 = 0;
      self.isFirstOperand = true;
      self.isFirstOperator = true;
      
     
  }
  return self;
}

- (NSNumber *)currentResult {
  return self.operand1;
}
-(void)setOperand1:(NSNumber *)operand1 {
    _operand1 = operand1;
    if(self.isFirstOperand) {
        self.isFirstOperand = false;
    }
    
}

-(void)setOperand2:(NSNumber *)operand2 {
    _operand2 = operand2;
}

-(void) setOperator:(NSString *)operatorString {
    _operator = operatorString;
    if(self.isFirstOperator) {
      
        self.isFirstOperator = false;
    }
}

- (void)clear {
    self.operand1 = 0;
    self.operand2 = 0;
    self.operator = @"";
    self.isFirstOperand = true;
    self.isFirstOperator = true;
}
-(NSNumber *) getOperand1 {
    return self.operand1;
}

-(NSNumber *) getOperand2 {
    return self.operand2;
}

-(NSString *) getOperator {
    return self.operator;
}

// The result should be calculated when the user presses equals or selects another operator.
- (void)calculateResult {
    
    if ([self.operator isEqual:@"+"]) {
        self.operand1 = [NSNumber numberWithFloat:([self.operand1 floatValue] + [self.operand2 floatValue])];
    }
    else if ([self.operator isEqual:@"-"]){
        self.operand1 = [NSNumber numberWithFloat:([self.operand1 floatValue] - [self.operand2 floatValue])];
    }
    else if ([self.operator isEqual:@"X"]){
        self.operand1 = [NSNumber numberWithFloat:([self.operand1 floatValue] * [self.operand2 floatValue])];
    }
    else if ([self.operator isEqual:@"/"]){
            self.operand1 = [NSNumber numberWithFloat:([self.operand1 floatValue] / [self.operand2 floatValue])];
    }
    else if ([self.operator isEqual:@"%"]){
        self.operand1 = [NSNumber numberWithFloat:fmodf([self.operand1 floatValue],[self.operand2 floatValue])];
    }
    self.isFirstOperator = true;
  //TODO: logic for calculating the result based on the operator and assigning it to operand1.
}

- (void) negateResult {
    self.operand1 = [NSNumber numberWithFloat:([self.operand1 floatValue]) * -1];
    
    
}

- (void) percentResult {
     self.operand1 = [NSNumber numberWithFloat:([self.operand1 floatValue]) / 100];
}

@end
