//
//  AppController.h
//  Shebang
//
//  Created by Ajay Madhusudan on 22/02/16.
//

#import <Foundation/Foundation.h>
#import "SBFloatingWindow.h"
#import "SBTextField.h"

@interface AppController : NSObject <NSUserNotificationCenterDelegate>
@property (nonatomic, retain) SBFloatingWindow *shebangWindow;
@property (nonatomic, retain) SBTextField *shebangTextField;

- (void)performShellCommand:(NSString *)command;
- (void)handleEvent:(id)sender;
- (IBAction)openShebangWindow:(id)sender;
@end
