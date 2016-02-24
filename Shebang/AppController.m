//
//  AppController.m
//  Shebang
//
//  Created by Ajay Madhusudan on 22/02/16.
//

#import "AppController.h"
#import "SBGlobals.h"
#import "SBUtils.h"

@implementation AppController
@synthesize shebangWindow, shebangTextField;

- (instancetype)init
{
    if (self = [super init]) {
        int panelX = ([NSScreen mainScreen].frame.size.width / 2) - 250;
        int panelY = [NSScreen mainScreen].frame.size.height / 3;
        NSRect frame = NSMakeRect(panelX, panelY, 500, 80);
        shebangWindow = [[SBFloatingWindow alloc] initWithContentRect:frame];
        
        shebangTextField = [[SBTextField alloc] initWithFrame:[SBUtils makeRectWithinRect:frame withBorder:15]];
        shebangTextField.controller = self;
        shebangTextField.controllerAction = @selector(handleEvent:);
        shebangTextField.font = [NSFont fontWithName:@"HelveticaNeue-Light" size:40];
        [shebangWindow.contentView addSubview:shebangTextField];
        
        [NSUserNotificationCenter defaultUserNotificationCenter].delegate = self;
    }
    
    return self;
}

- (BOOL)userNotificationCenter:(NSUserNotificationCenter *)center shouldPresentNotification:(NSUserNotification *)notification
{
    return YES;
}

- (void)performShellCommand:(NSString *)command
{
    NSString *shell = [NSProcessInfo processInfo].environment[@"SHELL"];
    [NSTask launchedTaskWithLaunchPath:shell arguments:@[@"-l", @"-i", @"-c", command]];
    
    NSUserNotification *notification = [NSUserNotification new];
    notification.title = shell;
    notification.subtitle = command;
    notification.hasActionButton = NO;
    
    [[NSUserNotificationCenter defaultUserNotificationCenter] deliverNotification:notification];
    [NSTimer scheduledTimerWithTimeInterval:2.0
                                     target:[NSUserNotificationCenter defaultUserNotificationCenter]
                                   selector:@selector(removeAllDeliveredNotifications)
                                   userInfo:NULL
                                    repeats:NO];
}

- (void)handleEvent:(id)sender
{
    NSString *text = shebangTextField.stringValue;
    [shebangWindow close];
    
    if ([sender isEqual:@(SBEventTypeReturn)])
        [self performShellCommand:text];
}

- (IBAction)openShebangWindow:(id)sender
{
    int panelX = ([NSScreen mainScreen].frame.size.width / 2) - (shebangWindow.frame.size.width / 2);
    int panelY = [NSScreen mainScreen].frame.size.height / 3;
    NSRect frame = NSMakeRect(panelX, panelY, shebangWindow.frame.size.width,
                              shebangWindow.frame.size.height);
    [shebangWindow setFrame:frame display:YES];
    
    [shebangWindow makeKeyAndOrderFront:self];
    [NSApp activateIgnoringOtherApps:YES];
}

@end
