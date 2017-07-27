//
//  SBPreferencesWindowController.m
//  Shebang
//
//  Created by Ajay Madhusudan on 27/02/16.
//

#import <ServiceManagement/SMLoginItem.h>
#import "SBPreferencesWindowController.h"
#import "SBGlobals.h"
#import "SBUtils.h"

@interface SBPreferencesWindowController ()
@property (nonatomic, retain, readonly) NSString *shortcutUserDefaultsKey;
@property (nonatomic, retain, readonly) NSString *launchAtLoginUserDefaultsKey;
@end

@implementation SBPreferencesWindowController
@synthesize shortcutView, shortcutViewContainer;
@synthesize launchAtLoginButton;

- (instancetype)initWithWindowNibName:(NSString *)windowNibName
{
    self = [super initWithWindowNibName:windowNibName];
    
    if (self) {
        shortcutView = [[MASShortcutView alloc] init];
        shortcutView.associatedUserDefaultsKey = self.shortcutUserDefaultsKey;
        
        [[MASShortcutBinder sharedBinder]
         bindShortcutWithDefaultsKey:self.shortcutUserDefaultsKey
         toAction:^{
             [[NSNotificationCenter defaultCenter] postNotificationName:@"ShebangHotkey" object:self];
         }];
    }
    
    return self;
}

- (NSString *)shortcutUserDefaultsKey
{
    return @"GlobalHotkey";
}

- (NSString *)launchAtLoginUserDefaultsKey
{
    return @"LaunchAtLogin";
}

- (BOOL)launchAtLogin
{
    return [[NSUserDefaults standardUserDefaults] boolForKey:self.launchAtLoginUserDefaultsKey];
}

- (void)awakeFromNib
{
    shortcutView.frame = [SBUtils makeRectWithinRect:shortcutViewContainer.frame withBorder:0];
    [shortcutViewContainer addSubview:shortcutView];
    
    launchAtLoginButton.state = self.launchAtLogin ? NSOnState : NSOffState;
}

- (IBAction)toggleLaunchAtLogin:(id)sender
{
    BOOL launch = launchAtLoginButton.state == NSOnState;
    [[NSUserDefaults standardUserDefaults] setBool:launch forKey:self.launchAtLoginUserDefaultsKey];
    
    NSString *helperBundleIdentifier = @"com.ajaymt.ShebangHelper";
    BOOL success = SMLoginItemSetEnabled((__bridge CFStringRef)helperBundleIdentifier, launch);
    
    if (! success) NSLog(@"Error: Unable to activate launch at login");
}

@end
