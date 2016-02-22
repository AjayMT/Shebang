//
//  AppController.m
//  Shebang
//
//  Created by Ajay Madhusudan on 22/02/16.
//

#import "AppController.h"

@implementation AppController
@synthesize shebangWindow;

- (instancetype)init
{
    if (self = [super init]) {
        int panelX = ([NSScreen mainScreen].frame.size.width / 2) - 300;
        int panelY = [NSScreen mainScreen].frame.size.height / 3;
        NSRect frame = NSMakeRect(panelX, panelY, 600, 100);
        shebangWindow = [[SBFloatingWindow alloc] initWithContentRect:frame];
    }
    
    return self;
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
