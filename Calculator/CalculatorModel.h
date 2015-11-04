#import <Foundation/Foundation.h>

@interface CalculatorModel : NSObject

// declare any public methods or properties here.
- (void) setOperand1:(NSNumber *)operand1;

- (void) setOperand2:(NSNumber *)operand1;

- (void) setOperator:(NSString *)operatorString;

- (NSNumber *) getOperand1;

- (NSNumber *) getOperand2;

- (NSString *) getOperator;

- (void)calculateResult;

- (void) negateResult;

-(void) percentResult;

- (void)clear;

@property BOOL isFirstOperand;

@property BOOL isFirstOperator;

// Used to get the current result.
- (NSNumber *)currentResult;

@end
