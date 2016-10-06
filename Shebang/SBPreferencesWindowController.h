//
//  SBPreferencesWindowController.h
//  Shebang
//
//  Created by Ajay Madhusudan on 27/02/16.
//

#import <Cocoa/Cocoa.h>
#import <MASShortcut/Shortcut.h>

@interface SBPreferencesWindowController : NSWindowController
@property (nonatomic, retain) IBOutlet NSView *shortcutViewContainer;
@property (nonatomic, retain) IBOutlet NSButton *launchAtLoginButton;
@property (nonatomic, retain) MASShortcutView *shortcutView;
@property (nonatomic, readonly) BOOL launchAtLogin;

- (IBAction)toggleLaunchAtLogin:(id)sender;
@end
