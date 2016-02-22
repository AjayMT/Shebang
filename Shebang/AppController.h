//
//  AppController.h
//  Shebang
//
//  Created by Ajay Madhusudan on 22/02/16.
//

#import <Foundation/Foundation.h>
#import "SBFloatingWindow.h"

@interface AppController : NSObject
@property (nonatomic, retain) SBFloatingWindow *shebangWindow;

- (IBAction)openShebangWindow:(id)sender;
@end
