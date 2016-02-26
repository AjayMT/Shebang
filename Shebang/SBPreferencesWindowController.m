//
//  SBPreferencesWindowController.m
//  Shebang
//
//  Created by Ajay Madhusudan on 27/02/16.
//

#import "SBPreferencesWindowController.h"
#import "SBGlobals.h"
#import "SBUtils.h"

@interface SBPreferencesWindowController ()
@property (nonatomic, retain) NSString *shortcutUserDefaultsKey;
@end

@implementation SBPreferencesWindowController
@synthesize shortcutView, shortcutUserDefaultsKey, shortcutViewContainer;

- (instancetype)initWithWindowNibName:(NSString *)windowNibName
{
    self = [super initWithWindowNibName:windowNibName];
    
    if (self) {
        shortcutUserDefaultsKey = @"GlobalHotkey";
        shortcutView = [[MASShortcutView alloc] init];
        shortcutView.associatedUserDefaultsKey = shortcutUserDefaultsKey;
        
        [[MASShortcutBinder sharedBinder]
         bindShortcutWithDefaultsKey:shortcutUserDefaultsKey
         toAction:^{
             [[NSNotificationCenter defaultCenter] postNotificationName:@"ShebangHotkey" object:self];
         }];
    }
    
    return self;
}

- (void)awakeFromNib
{
    shortcutView.frame = [SBUtils makeRectWithinRect:shortcutViewContainer.frame withBorder:0];
    [shortcutViewContainer addSubview:shortcutView];
}

@end
