//
//  ViewController.h
//  ChessApp
//
//  Created by Tyler Crabtree on 10/27/15.
//  Copyright (c) 2015 Tyler Crabtree. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "ChessField.h"


@interface ViewController : NSViewController

@property(strong, nonatomic) ChessField *chessfield;

@property (weak) IBOutlet NSMatrix *chessMatrix;
- (IBAction)freshGame:(id)sender;
- (IBAction)help:(id)sender;
- (IBAction)matrixClicked:(NSMatrix *)sender;

@property (weak) IBOutlet NSTextField *turnDisplay;

@property (strong, nonatomic) NSImage *bp;
@property (strong, nonatomic) NSImage *bk;
@property (strong, nonatomic) NSImage *bq;
@property (strong, nonatomic) NSImage *bn;
@property (strong, nonatomic) NSImage *bb;
@property (strong, nonatomic) NSImage *br;

@property (strong, nonatomic) NSImage *wp;
@property (strong, nonatomic) NSImage *wk;
@property (strong, nonatomic) NSImage *wq;
@property (strong, nonatomic) NSImage *wn;
@property (strong, nonatomic) NSImage *wb;
@property (strong, nonatomic) NSImage *wr;


@property (strong, nonatomic) NSImage *light;
@property (strong, nonatomic) NSImage *dark;





@end

