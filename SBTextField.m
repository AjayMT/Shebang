//
//  SBTextField.m
//  Shebang
//
//  Created by Ajay Madhusudan on 22/02/16.
//

#import "SBTextField.h"
#import "SBGlobals.h"

@implementation SBTextField
@synthesize controller, controllerAction;

- (instancetype)initWithFrame:(NSRect)frameRect
{
    self = [super initWithFrame:frameRect];
    
    if (self) {
        self.cell.lineBreakMode = NSLineBreakByTruncatingHead;
        self.drawsBackground = YES;
        self.bordered = NO;
        self.bezeled = NO;
        self.backgroundColor = [NSColor colorWithCalibratedWhite:0 alpha:0];
        self.textColor = [NSColor whiteColor];
        self.focusRingType = NSFocusRingTypeNone;
        self.font = [NSFont fontWithName:@"Helvetica-Light" size:56];
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(onClose)
                                                     name:NSWindowDidResignKeyNotification
                                                   object:self.window];
    }
    
    return self;
}

- (void)onClose
{
    self.stringValue = @"";
}

- (BOOL)becomeFirstResponder
{
    BOOL success = [super becomeFirstResponder];
    
    if (success)
        [(NSTextView *)self.currentEditor setInsertionPointColor:[NSColor whiteColor]];
    
    return success;
}

- (void)textDidEndEditing:(NSNotification *)notification
{
    [controller performSelector:controllerAction withObject:@(SBEventTypeReturn)];
}

- (void)cancelOperation:(id)sender
{
    [controller performSelector:controllerAction withObject:@(SBEventTypeCancel)];
}

- (void)drawRect:(NSRect)dirtyRect {
    [self.backgroundColor set];
    
    [super drawRect:dirtyRect];
}

@end
