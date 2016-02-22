//
//  AppDelegate.m
//  Shebang
//
//  Created by Ajay Madhusudan on 20/02/16.
//

#import "AppDelegate.h"

@implementation AppDelegate
@synthesize statusItem, statusMenu;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
    statusItem.title = @"#!";
    statusItem.menu = statusMenu;
}

@end
