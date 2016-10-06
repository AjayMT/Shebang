//
//  SBTextField.h
//  Shebang
//
//  Created by Ajay Madhusudan on 22/02/16.
//

#import <Cocoa/Cocoa.h>

@interface SBTextField : NSTextField
@property (nonatomic, retain) id controller;
@property (nonatomic) SEL controllerAction;

- (void)onClose;
@end
