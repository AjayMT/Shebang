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
@property (nonatomic, retain) MASShortcutView *shortcutView;
@end
