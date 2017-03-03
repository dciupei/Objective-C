//
//  ViewController.h
//  MineSweeper
//
//  Created by David Daniel Ciupei on 4/14/15.
//  Copyright (c) 2015 David Daniel Ciupei. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "MineField.h"

@interface ViewController : NSViewController

@property (weak) IBOutlet NSMatrix *minefieldMatrix;
@property (weak) IBOutlet NSTextField *scoreTextField;

- (IBAction)newGame:(id)sender;
- (IBAction)levelSelected:(NSPopUpButton *)sender;
- (IBAction)minefieldMatrixCellSelected:(NSMatrix *)sender;

@property (strong, nonatomic) MineField *mineField;

@property (strong, nonatomic) NSImage *bombImage;
@property (strong, nonatomic) NSImage *flagImage;
@property (assign, nonatomic) NSInteger levelIndex; // 0 => beginner, ..., 3 => expert

@property (weak) IBOutlet NSLayoutConstraint *matrixHeightContraint;

@property (weak) IBOutlet NSLayoutConstraint *matrixWidthContraint;

-(void)rightClicked:(NSMatrix*)sender;

@end

