//
//  AppDelegate.m
//  ShebangHelper
//
//  Created by Ajay Madhusudan on 06/10/16.
//

#import "AppDelegate.h"

@interface AppDelegate ()
@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate
- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    NSArray *pathComponents = [NSBundle mainBundle].bundlePath.pathComponents;
    pathComponents = [pathComponents
                      subarrayWithRange:NSMakeRange(0, pathComponents.count - 4)];
    
    [[NSWorkspace sharedWorkspace] launchApplication:[NSString pathWithComponents:pathComponents]];
    [NSApp terminate:nil];
    
}
@end
