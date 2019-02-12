//
//  ViewController.m
//  UnicodeHandle
//
//  Created by fengyi on 2019/2/12.
//  Copyright © 2019 fengyi. All rights reserved.
//

#import "ViewController.h"
#import "NSString+unicode.h"
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
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

@end
