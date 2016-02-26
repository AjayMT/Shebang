//
//  AppController.h
//  Shebang
//
//  Created by Ajay Madhusudan on 22/02/16.
//

#import <Foundation/Foundation.h>
#import "SBFloatingWindow.h"
#import "SBTextField.h"
#import "SBPreferencesWindowController.h"

@interface AppController : NSObject <NSUserNotificationCenterDelegate>
@property (nonatomic, retain) SBFloatingWindow *shebangWindow;
@property (nonatomic, retain) SBTextField *shebangTextField;
@property (nonatomic, retain) SBPreferencesWindowController *preferencesWindowController;

- (void)performShellCommand:(NSString *)command;
- (void)handleEvent:(id)sender;
- (void)handleHotkey:(id)sender;
- (IBAction)openShebangWindow:(id)sender;
- (IBAction)openPreferences:(id)sender;
@end
