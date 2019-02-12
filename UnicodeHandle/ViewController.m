//
//  ViewController.m
//  UnicodeHandle
//
//  Created by fengyi on 2019/2/12.
//  Copyright © 2019 fengyi. All rights reserved.
//

#import "ViewController.h"
#import "NSString+unicode.h"
#import "NSView+Frame.h"

@interface ViewController()

@property (unsafe_unretained) IBOutlet NSTextView *leftView;
@property (unsafe_unretained) IBOutlet NSTextView *rightView;

@property (weak) IBOutlet NSScrollView *leftScrollView;
@property (weak) IBOutlet NSScrollView *rightScrollView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // 注册滑动监听通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector: @selector(boundsDidChangeNotification:) name: NSViewBoundsDidChangeNotification object:_leftScrollView.contentView];
    [_leftScrollView.contentView setPostsBoundsChangedNotifications:1];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector: @selector(boundsDidChangeNotification:) name: NSViewBoundsDidChangeNotification object:_rightScrollView.contentView];
    [_rightScrollView.contentView setPostsBoundsChangedNotifications:1];
}

- (void)boundsDidChangeNotification:(NSNotification *)notification
{
//    // 鼠标位置
//    NSPoint p = [NSEvent mouseLocation];

    // 在这里进行处理
    NSClipView *changedContentView = [notification object];
    NSPoint origin = [changedContentView documentVisibleRect].origin;
    if ([changedContentView isEqualTo:_leftScrollView.contentView])
    {
//        NSLog(@"CXHLog:A %f", origin.y);
        [_rightScrollView.contentView scrollToPoint:origin];
    }
//#warning 注意啦：这里有性能问题 相互调用
//    else if ([changedContentView isEqualTo:_rightScrollView.contentView])
//    {
//        NSLog(@"CXHLog:B %f", origin.y);
//        [_leftScrollView.contentView scrollToPoint:origin];
//    }

}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

- (IBAction)onGoBtn:(id)sender {
    
    NSMutableAttributedString *att = [[NSMutableAttributedString alloc] initWithAttributedString:_leftView.attributedString];
    [att replaceCharactersInRange:NSMakeRange(0, att.string.length) withString:[_leftView.textStorage.string unicodeString]];
    [_rightView.textStorage setAttributedString:att];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
