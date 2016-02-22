//
//  SBFloatingWindow.h
//  Shebang
//
//  Created by Ajay Madhusudan on 22/02/16.
//

#import <Cocoa/Cocoa.h>

@interface SBFloatingWindow : NSWindow
- (instancetype)initWithContentRect:(NSRect)contentRect;
- (void)receiveNotification:(id)sender;
@end
