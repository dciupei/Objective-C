//
//  MyMatrix.m
//  MineSweeper
//
//  Created by David Daniel Ciupei on 4/21/15.
//  Copyright (c) 2015 David Daniel Ciupei. All rights reserved.
//

#import "MyMatrix.h"
#import "ViewController.h"

@implementation MyMatrix

-(void)rightMouseDown:(NSEvent *)theEvent {
    NSPoint pt = [self convertPoint:theEvent.locationInWindow
                           fromView:nil];
    NSInteger r, c;
    [self getRow:&r column:&c forPoint:pt];
    NSButtonCell *bcell = [self cellAtRow:r column:c];
    if (bcell.enabled) {
        [self selectCellAtRow:r column:c];
        [self.target rightClicked:self];
    }
}

//- (void)drawRect:(NSRect)dirtyRect {
//    [super drawRect:dirtyRect];
//    
//    // Drawing code here.
//}

@end
