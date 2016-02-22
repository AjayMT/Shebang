//
//  SBUtils.m
//  Shebang
//
//  Created by Ajay Madhusudan on 22/02/16.
//

#import "SBUtils.h"

@implementation SBUtils

+ (NSRect)makeRectWithinRect:(NSRect)rect withBorder:(int)border
{
    int width = rect.size.width - (border * 2);
    int height = rect.size.height - (border * 2);
    
    return NSMakeRect(border, border, width, height);
}

@end
