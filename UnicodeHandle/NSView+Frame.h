//
//  NSView+Frame.h
//  UnicodeHandle
//
//  Created by fengyi on 2019/2/12.
//  Copyright © 2019 fengyi. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface NSView (Frame)

@property(nonatomic,readwrite) CGFloat x,y,width,height;
@property(nonatomic,readwrite) CGSize size;
@property(nonatomic,readwrite) CGPoint origin;

@end
