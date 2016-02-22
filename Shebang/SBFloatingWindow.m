//
//  SBFloatingWindow.m
//  Shebang
//
//  Created by Ajay Madhusudan on 22/02/16.
//

#import "SBFloatingWindow.h"

@implementation SBFloatingWindow

- (instancetype)initWithContentRect:(NSRect)contentRect
{
    self = [super initWithContentRect:contentRect styleMask:NSBorderlessWindowMask backing:NSBackingStoreBuffered defer:NO];
    
    if (self) {
        self.alphaValue = 0.9;
        self.opaque = NO;
        self.level = NSStatusWindowLevel;
        self.movableByWindowBackground = YES;
        self.backgroundColor = [NSColor colorWithCalibratedWhite:0.1 alpha:1];
        self.hasShadow = YES;
        self.releasedWhenClosed = NO;
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(receiveNotification:)
                                                     name:NSWindowDidResignKeyNotification
                                                   object:self];
    }
    
    return self;
}

- (void)receiveNotification:(id)sender
{
    [self close];
}

- (BOOL)canBecomeKeyWindow { return YES; }

- (BOOL)canBecomeMainWindow { return YES; }

@end
