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
        int panelX = ([NSScreen mainScreen].frame.size.width / 2) - 300;
        int panelY = [NSScreen mainScreen].frame.size.height / 3;
        NSRect frame = NSMakeRect(panelX, panelY, 600, 100);
        shebangWindow = [[SBFloatingWindow alloc] initWithContentRect:frame];
        
        shebangTextField = [[SBTextField alloc] initWithFrame:[SBUtils makeRectWithinRect:frame withBorder:15]];
        shebangTextField.controller = self;
        shebangTextField.controllerAction = @selector(handleEvent:);
        [shebangWindow.contentView addSubview:shebangTextField];
    }
    
    return self;
}

- (void)performShellCommand:(NSString *)command
{
    NSString *shell = [NSProcessInfo processInfo].environment[@"SHELL"];
    NSTask *task = [NSTask launchedTaskWithLaunchPath:shell arguments:@[@"-l", @"-i", @"-c", command]];
    [task waitUntilExit];
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
    int panelX = ([NSScreen mainScreen].frame.size.width / 2) - 300;
    int panelY = [NSScreen mainScreen].frame.size.height / 3;
    NSRect frame = NSMakeRect(panelX, panelY, 600, 100);
    [shebangWindow setFrame:frame display:YES];
    
    [shebangWindow makeKeyAndOrderFront:self];
    [NSApp activateIgnoringOtherApps:YES];
}

@end
