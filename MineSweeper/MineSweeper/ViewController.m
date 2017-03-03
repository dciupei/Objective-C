//
//  ViewController.m
//  MineSweeper
//
//  Created by David Daniel Ciupei on 4/14/15.
//  Copyright (c) 2015 David Daniel Ciupei. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

//
// Scan the minefield model, and update
// the minefieldMatrix view.
//
-(void)updateMinefieldMatrix {
    const int W = self.mineField.width;
    const int H = self.mineField.height;
    for (int r = 0; r < H; r++)
        for (int c = 0; c < W; c++) {
            Cell *cell = [self.mineField cellAtRow:r Col:c];
            NSButtonCell *bcell = [self.minefieldMatrix cellAtRow:r column:c];
            if (cell.marked) {
                cell.exposed = NO;
            }
            if (cell.exposed) {
                if (cell.numSurroundingMines == 0)
                    bcell.title = @"";
                else
                    bcell.title = [NSString stringWithFormat:@"%d", cell.numSurroundingMines];
                bcell.enabled = NO;
                bcell.state = NSOnState;
            } else if (cell.marked) {
                [bcell setImage: _flagImage];
            } else {
                    [bcell setImage: nil];
                    [bcell setType: NSTextCellType];
                    [bcell setTitle: @""];
                    bcell.enabled = YES;
                    bcell.state = NSOffState;

                }
         
        }
}

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
    
    self.bombImage = [NSImage imageNamed:@"bomb"];
    self.flagImage = [NSImage imageNamed:@"flag"];
    
    self.mineField = [[MineField alloc] initWithWidth:(int) self.minefieldMatrix.numberOfColumns
                                               Height:(int) self.minefieldMatrix.numberOfRows
                                                Mines:10];
    
    
    
    [self updateMinefieldMatrix];
    int score = [self.mineField unexposedCells];
    [self.scoreTextField setStringValue:[NSString stringWithFormat:@"%i",score]];

}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

- (IBAction)newGame:(id)sender {
    NSLog(@"newGame:");
    [self.mineField reset];
    [self updateMinefieldMatrix];
    int score = [self.mineField unexposedCells];
    // updates the score when new game is pressed
    [self.scoreTextField setStringValue:[NSString stringWithFormat:@"%i",score]];
}

- (IBAction)levelSelected:(NSPopUpButton *)sender {
    const NSInteger index = sender.indexOfSelectedItem;
    NSLog(@"levelSelected: %d", (int) index);
    const NSInteger level = sender.indexOfSelectedItem;
    if (level == self.levelIndex)
        return; // no change
    self.levelIndex = level; // else record change
    static struct {
        int width, height, numMines;
    } levels[4] = {
        {10, 10, 10}, // 0 : beginner
        {20, 15, 50}, // 1 : intermediate
        {25, 18, 90}, // 2 : advanced
        {30, 20, 150} // 3 : expert
    };
    const int w = levels[level].width; // determine new minefield configuration
    const int h = levels[level].height;
    const int m = levels[level].numMines;
    //
    // Update minefield matrix and record change in size.
    // Update AutoLayout size constraints on minefield matrix.
    //
    const CGSize matrixSize = self.minefieldMatrix.frame.size;
    [self.minefieldMatrix renewRows: h columns: w];
    [self.minefieldMatrix sizeToCells];
    const CGSize newMatrixSize = self.minefieldMatrix.frame.size;
    const CGSize deltaSize = CGSizeMake(newMatrixSize.width - matrixSize.width,
                                        newMatrixSize.height - matrixSize.height);
    self.matrixWidthContraint.constant = newMatrixSize.width;
    self.matrixHeightContraint.constant = newMatrixSize.height;
    //
    // Resize enclosing window according to size
    // of the minefield matrix.
    //
    NSRect windowFrame = self.view.window.frame;
    NSRect newWindowFrame = CGRectMake(windowFrame.origin.x,
                                       windowFrame.origin.y - deltaSize.height,
                                       windowFrame.size.width + deltaSize.width,
                                       windowFrame.size.height + deltaSize.height);
    [self.view.window setFrame:newWindowFrame display:YES animate:NO];
    //
    // Allocate a new minfield model and update the minefield
    // matrix cells.
    //
    self.mineField = [[MineField alloc] initWithWidth:w Height:h Mines:m];
    [self updateMinefieldMatrix];
    // updates the score when new level selected
     int score = [self.mineField unexposedCells];
    [self.scoreTextField setStringValue:[NSString stringWithFormat:@"%i",score]];

}

-(void)rightClicked:(NSMatrix*)sender {
    NSLog(@"rightClicked:");
    const int row = (int) sender.selectedRow;
    const int col = (int) sender.selectedColumn;
    NSButtonCell *bcell = sender.selectedCell;
    Cell *cell = [self.mineField cellAtRow:row Col:col];
    cell.marked = !cell.marked;
    if (cell.marked)
       // bcell.title = @"P";
        [bcell setImage: _flagImage];
    else
       // bcell.title = @"";
        [bcell setImage: nil];
        [bcell setType: NSTextCellType];
    [self.minefieldMatrix deselectSelectedCell];
}

- (IBAction)minefieldMatrixCellSelected:(NSMatrix *)sender {
    const int row = (int) sender.selectedRow;
    const int col = (int) sender.selectedColumn;
    NSLog(@"minefieldMatrixCellSelected: row=%d, col=%d", (int) row, (int)col);
    
    BOOL shiftKeyDown = ([[NSApp currentEvent] modifierFlags] &
                         (NSShiftKeyMask | NSAlphaShiftKeyMask)) !=0;
    
    
    //Cell *cell = [self.mineField cellAtRow:row Col:col];
    NSButtonCell *bcell = [self.minefieldMatrix cellAtRow:row column:col];
  
    if (shiftKeyDown) { // user is marking a mine
        [self rightClicked:sender];
        return;
    }
    
    const int v = [self.mineField exposeCellAtRow:row Col:col];
    
    
    if (v == -1) {
        // BOOM!
       
        //
        // this part will go through the cells and show the bomb and score when a bomb is hit
        // along with the count of each cell
        //
        const int W = self.mineField.width;
        const int H = self.mineField.height;
        for (int r = 0; r < H; r++)
            for (int c = 0; c < W; c++) {
                Cell *cell = [self.mineField cellAtRow:r Col:c];
                NSButtonCell *bcell = [self.minefieldMatrix cellAtRow:r column:c];
                if(cell.hasMine){
                    [bcell setImage:_bombImage];
                    
                }
                if (cell.numSurroundingMines == 0)
                    bcell.title = @"";
                else if(!cell.hasMine)
                    bcell.title = [NSString stringWithFormat:@"%d", cell.numSurroundingMines];
            }
        self.minefieldMatrix.enabled = NO;
        [self.scoreTextField setStringValue:[NSString stringWithFormat:@"%s","BOOM!"]];
        [bcell setImage:_bombImage];
    } else if (v == 0) { // multiple cell safely exposed
        [self updateMinefieldMatrix];
        //
        // this part will update the score along with expose the bombs if the player wins
        //
        int score = [self.mineField unexposedCells];
        if (score == 0){
            const int W = self.mineField.width;
            const int H = self.mineField.height;
            for (int r = 0; r < H; r++)
                for (int c = 0; c < W; c++) {
                    Cell *cell = [self.mineField cellAtRow:r Col:c];
                    NSButtonCell *bcell = [self.minefieldMatrix cellAtRow:r column:c];
                    if(cell.hasMine){
                        bcell.title = [NSString stringWithFormat:@""];
                        [bcell setImage:_bombImage];
                        
                    }
                }
            [self.scoreTextField setStringValue:[NSString stringWithFormat:@"%s","WINNER!"]];
            self.minefieldMatrix.enabled = NO;
        }else{
            [self.scoreTextField setStringValue:[NSString stringWithFormat:@"%i",score]];
        }
    } else if (1 <= v && v <= 8) { // a single cell safely exposed
        [self updateMinefieldMatrix]; // only need to update one bcell
        //
        // this part will update the score along with expose the bombs if the player wins
        //
        int score = [self.mineField unexposedCells];
        if (score == 0){
            const int W = self.mineField.width;
            const int H = self.mineField.height;
            for (int r = 0; r < H; r++)
                for (int c = 0; c < W; c++) {
                    Cell *cell = [self.mineField cellAtRow:r Col:c];
                    NSButtonCell *bcell = [self.minefieldMatrix cellAtRow:r column:c];
                    if(cell.hasMine){
                        bcell.title = [NSString stringWithFormat:@""];
                        [bcell setImage:_bombImage];
                        
                    }
                }
            [self.scoreTextField setStringValue:[NSString stringWithFormat:@"%s","WINNER!"]];
            self.minefieldMatrix.enabled = NO;
        }else{
            [self.scoreTextField setStringValue:[NSString stringWithFormat:@"%i",score]];
        }
    } else {
        NSLog(@"Exposed cell already exposed");
    }
    
}

@end
