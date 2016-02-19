//
//  AppDelegate.h
//  Shebang
//
//  Created by Ajay Madhusudan on 20/02/16.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>
@property (nonatomic, retain) NSStatusItem *statusItem;
@property (nonatomic, retain) IBOutlet NSMenu *statusMenu;
@end

