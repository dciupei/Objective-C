//
//  ViewController.m
//  ChessApp
//
//  Created by Tyler Crabtree on 10/27/15.
//  Copyright (c) 2015 Tyler Crabtree. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController


int clickCounter = 0;
int pawnCounter = 0;
int knightCounter = 0;
int bishopCounter = 0;
int queenCounter = 0;
int kingCounter = 0;
int rookCounter = 0;

int turnCounter = 1;
NSInteger rowCounter = 0;
NSInteger colCounter = 0;

NSInteger check = 0;

int styleCounter = 1;


int freshGameCounter = 0;


-(void)backgroundImage{
    const int W = self.chessfield.width;
    const int H = self.chessfield.height;
    for (int r = 0; r < H; r++)
        for (int c = 0; c < W; c++) {
            NSButtonCell *bcell = [self.chessMatrix cellAtRow:r column:c];
            
            if ((c==0 && r == 0)){
                [bcell setBackgroundColor:[NSColor colorWithPatternImage:[NSImage imageNamed:@"light"]]];
                
            }
            if((c ==1 && r == 0)){
                [bcell setBackgroundColor:[NSColor colorWithPatternImage:[NSImage imageNamed:@"dark"]]];
                
            }
            if ((c ==2 && r == 0)){
                [bcell setBackgroundColor:[NSColor colorWithPatternImage:[NSImage imageNamed:@"light"]]];
                
            }
            if ((c ==3 && r == 0) ){
                [bcell setBackgroundColor:[NSColor colorWithPatternImage:[NSImage imageNamed:@"dark"]]];
                
            }
            if ((c ==4 && r == 0) ){
                [bcell setBackgroundColor:[NSColor colorWithPatternImage:[NSImage imageNamed:@"light"]]];
                
            }
            
            //PAWNS
            
            if(c==0 && r == 1){
                [bcell setBackgroundColor:[NSColor colorWithPatternImage:[NSImage imageNamed:@"dark"]]];
                
            }
            
            if(c==1 && r == 1){
                [bcell setBackgroundColor:[NSColor colorWithPatternImage:[NSImage imageNamed:@"light"]]];
                
            }
            if(c==2 && r == 1){
                [bcell setBackgroundColor:[NSColor colorWithPatternImage:[NSImage imageNamed:@"dark"]]];
                
            }
            if(c==3 && r == 1){
                [bcell setBackgroundColor:[NSColor colorWithPatternImage:[NSImage imageNamed:@"light"]]];
                
            }
            if(c==4 && r == 1){
                [bcell setBackgroundColor:[NSColor colorWithPatternImage:[NSImage imageNamed:@"dark"]]];
                
            }
            
            //White pieces
            
            if ((c ==0 && r == 6)){
                [bcell setBackgroundColor:[NSColor colorWithPatternImage:[NSImage imageNamed:@"light"]]];
                
            }
            if ((c ==1 && r == 6)){
                [bcell setBackgroundColor:[NSColor colorWithPatternImage:[NSImage imageNamed:@"dark"]]];
                
            }
            if ((c ==2 && r == 6)){
                [bcell setBackgroundColor:[NSColor colorWithPatternImage:[NSImage imageNamed:@"light"]]];
                
            }
            if ((c ==3 && r == 6) ){
                [bcell setBackgroundColor:[NSColor colorWithPatternImage:[NSImage imageNamed:@"dark"]]];
                
            }
            if ((c ==4 && r == 6) ){
                [bcell setBackgroundColor:[NSColor colorWithPatternImage:[NSImage imageNamed:@"light"]]];
                
            }
            
            if((c==0 && r == 5)|| (c==2 && r==5) || (c==4 && r==5)){
                [bcell setBackgroundColor:[NSColor colorWithPatternImage:[NSImage imageNamed:@"dark"]]];
                
            }
            
            if((c==1 && r ==5)||(c==3 && r==5)){
                [bcell setBackgroundColor:[NSColor colorWithPatternImage:[NSImage imageNamed:@"light"]]];
                
            }
            
            if((c==0 && r == 2) || (c==2 && r==2) || (c==4 && r ==2)){
                [bcell setBackgroundColor:[NSColor colorWithPatternImage:[NSImage imageNamed:@"light"]]];
                
            }
            if((c==1 && r == 2) || (c==3 && r==2)){
                [bcell setBackgroundColor:[NSColor colorWithPatternImage:[NSImage imageNamed:@"dark"]]];
                
            }
            if((c==0 && r == 3) || (c==2 && r==3) || (c==4 && r ==3)){
                [bcell setBackgroundColor:[NSColor colorWithPatternImage:[NSImage imageNamed:@"dark"]]];
                
            }
            if((c==1 && r == 3) || (c==3 && r==3)){
                [bcell setBackgroundColor:[NSColor colorWithPatternImage:[NSImage imageNamed:@"light"]]];
                
            }
            if((c==0 && r == 4) || (c==2 && r==4) || (c==4 && r ==4)){
                [bcell setBackgroundColor:[NSColor colorWithPatternImage:[NSImage imageNamed:@"light"]]];
                
            }
            if((c==1 && r == 4) || (c==3 && r==4)){
                [bcell setBackgroundColor:[NSColor colorWithPatternImage:[NSImage imageNamed:@"dark"]]];
                
            }
            
        };
    
}



-(void)updateMinefieldMatrix {
    
    if(freshGameCounter == 0){
        const int W = self.chessfield.width;
        const int H = self.chessfield.height;
        for (int r = 0; r < H; r++)
            for (int c = 0; c < W; c++) {
                NSButtonCell *bcell = [self.chessMatrix cellAtRow:r column:c];
                
                if ((c==0 && r == 0)){
                    [bcell setBackgroundColor:[NSColor colorWithPatternImage:[NSImage imageNamed:@"light"]]];
                    self.br = [NSImage imageNamed:@"br"];
                    [bcell setImage:_br];
                    
                    
                }
                if((c ==1 && r == 0)){
                    [bcell setBackgroundColor:[NSColor colorWithPatternImage:[NSImage imageNamed:@"dark"]]];
                    self.bn = [NSImage imageNamed:@"bn"];
                    [bcell setImage:_bn];
                    
                }
                if ((c ==2 && r == 0)){
                    [bcell setBackgroundColor:[NSColor colorWithPatternImage:[NSImage imageNamed:@"light"]]];
                    
                    self.bb = [NSImage imageNamed:@"bb"];
                    [bcell setImage:_bb];
                    
                }
                if ((c ==3 && r == 0) ){
                    [bcell setBackgroundColor:[NSColor colorWithPatternImage:[NSImage imageNamed:@"dark"]]];
                    self.bq = [NSImage imageNamed:@"bq"];
                    [bcell setImage:_bq];
                }
                if ((c ==4 && r == 0) ){
                    [bcell setBackgroundColor:[NSColor colorWithPatternImage:[NSImage imageNamed:@"light"]]];
                    self.bk = [NSImage imageNamed:@"bk"];
                    [bcell setImage:_bk];
                    
                }
                
                //PAWNS
                
                if(c==0 && r == 1){
                    [bcell setBackgroundColor:[NSColor colorWithPatternImage:[NSImage imageNamed:@"dark"]]];
                    self.bp = [NSImage imageNamed:@"bp"];
                    [bcell setImage:_bp];
                }
                
                if(c==1 && r == 1){
                    [bcell setBackgroundColor:[NSColor colorWithPatternImage:[NSImage imageNamed:@"light"]]];
                    self.bp = [NSImage imageNamed:@"bp"];
                    [bcell setImage:_bp];
                }
                if(c==2 && r == 1){
                    [bcell setBackgroundColor:[NSColor colorWithPatternImage:[NSImage imageNamed:@"dark"]]];
                    self.bp = [NSImage imageNamed:@"bp"];
                    [bcell setImage:_bp];
                }
                if(c==3 && r == 1){
                    [bcell setBackgroundColor:[NSColor colorWithPatternImage:[NSImage imageNamed:@"light"]]];
                    self.bp = [NSImage imageNamed:@"bp"];
                    [bcell setImage:_bp];
                }
                if(c==4 && r == 1){
                    [bcell setBackgroundColor:[NSColor colorWithPatternImage:[NSImage imageNamed:@"dark"]]];
                    self.bp = [NSImage imageNamed:@"bp"];
                    [bcell setImage:_bp];
                }
                
                //White pieces
                
                if ((c ==0 && r == 6)){
                    [bcell setBackgroundColor:[NSColor colorWithPatternImage:[NSImage imageNamed:@"light"]]];
                    self.wk = [NSImage imageNamed:@"wk"];
                    [bcell setImage:_wk];
                }
                if ((c ==1 && r == 6)){
                    [bcell setBackgroundColor:[NSColor colorWithPatternImage:[NSImage imageNamed:@"dark"]]];
                    self.wq = [NSImage imageNamed:@"wq"];
                    [bcell setImage:_wq];
                }
                if ((c ==2 && r == 6)){
                    [bcell setBackgroundColor:[NSColor colorWithPatternImage:[NSImage imageNamed:@"light"]]];
                    self.wb = [NSImage imageNamed:@"wb"];
                    [bcell setImage:_wb];
                }
                if ((c ==3 && r == 6) ){
                    [bcell setBackgroundColor:[NSColor colorWithPatternImage:[NSImage imageNamed:@"dark"]]];
                    self.wn = [NSImage imageNamed:@"wn"];
                    [bcell setImage:_wn];
                }
                if ((c ==4 && r == 6) ){
                    [bcell setBackgroundColor:[NSColor colorWithPatternImage:[NSImage imageNamed:@"light"]]];
                    self.wr = [NSImage imageNamed:@"wr"];
                    [bcell setImage:_wr];
                }
                
                if((c==0 && r == 5)|| (c==2 && r==5) || (c==4 && r==5)){
                    [bcell setBackgroundColor:[NSColor colorWithPatternImage:[NSImage imageNamed:@"dark"]]];
                    self.wp = [NSImage imageNamed:@"wp"];
                    [bcell setImage:_wp];
                }
                
                if((c==1 && r ==5)||(c==3 && r==5)){
                    [bcell setBackgroundColor:[NSColor colorWithPatternImage:[NSImage imageNamed:@"light"]]];
                    self.wp = [NSImage imageNamed:@"wp"];
                    [bcell setImage:_wp];
                    
                }
                
                if((c==0 && r == 2) || (c==2 && r==2) || (c==4 && r ==2)){
                    bcell.image = nil;
                    [bcell setBackgroundColor:[NSColor colorWithPatternImage:[NSImage imageNamed:@"light"]]];
                    
                }
                if((c==1 && r == 2) || (c==3 && r==2)){
                    bcell.image = nil;
                    [bcell setBackgroundColor:[NSColor colorWithPatternImage:[NSImage imageNamed:@"dark"]]];
                    
                }
                if((c==0 && r == 3) || (c==2 && r==3) || (c==4 && r ==3)){
                    bcell.image = nil;
                    [bcell setBackgroundColor:[NSColor colorWithPatternImage:[NSImage imageNamed:@"dark"]]];
                    
                }
                if((c==1 && r == 3) || (c==3 && r==3)){
                    bcell.image = nil;
                    [bcell setBackgroundColor:[NSColor colorWithPatternImage:[NSImage imageNamed:@"light"]]];
                    
                }
                if((c==0 && r == 4) || (c==2 && r==4) || (c==4 && r ==4)){
                    bcell.image = nil;
                    [bcell setBackgroundColor:[NSColor colorWithPatternImage:[NSImage imageNamed:@"light"]]];
                    
                }
                if((c==1 && r == 4) || (c==3 && r==4)){
                    bcell.image = nil;
                    [bcell setBackgroundColor:[NSColor colorWithPatternImage:[NSImage imageNamed:@"dark"]]];
                    
                }
                
            };
        turnCounter = 1;
        freshGameCounter++;
    }
   
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setWantsLayer:YES];
    [self.view.layer setBackgroundColor:[[NSColor grayColor] CGColor]];
    
    self.chessfield = [[ChessField alloc] initWithWidth: 5 Height: 7];
    [self updateMinefieldMatrix]; // update minfield.
    
   
    [self.turnDisplay setEditable:YES];
    NSString *title = @"White Turn!";
    [self.turnDisplay setStringValue:title];
    [self.turnDisplay setEditable:NO];
    
    
    // Do any additional setup after loading the view.
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];
    
    // Update the view, if already loaded.
}

- (IBAction)freshGame:(id)sender {
    NSLog(@"New Game");
    turnCounter = 1;
    clickCounter = 0;
    pawnCounter = 0;
    knightCounter = 0;
    bishopCounter = 0;
    queenCounter = 0;
    kingCounter = 0;
    rookCounter = 0;
    freshGameCounter =0;
    
    [self.turnDisplay setEditable:YES];
    NSString *title2 = @"White Turn!";
    [self.turnDisplay setStringValue:title2];
    [self.turnDisplay setTextColor:[NSColor blackColor]];
    [self.turnDisplay setEditable:NO];
    
    [self updateMinefieldMatrix];
    
}



- (IBAction)help:(id)sender {
    NSLog(@"Help");
    
}



- (IBAction)matrixClicked:(NSMatrix *)sender {
    
    
    const NSInteger row = sender.selectedRow;
    const NSInteger col = sender.selectedColumn;
    NSButtonCell *bcell = sender.selectedCell;
    NSLog(@"Matrix Clicked: r =%d, c=%d", (int) row, (int)col);
    const int W = self.chessfield.width;

   

    if(styleCounter == 1){
        
        if (turnCounter == 0){
            [self.turnDisplay setEditable:YES];
            NSString *title2 = @"Black Turn!";
            [self.turnDisplay setStringValue:title2];
            [self.turnDisplay setEditable:NO];
            
            while(true){
                
                NSMutableArray* cols = [[NSMutableArray alloc]initWithCapacity:64];
                NSMutableArray* rows = [[NSMutableArray alloc]initWithCapacity:64];
                
                
                
                ////////////////////////////////////// The Black Knight/////////////////////////////////////////////////////////////
                if(clickCounter == 1){
                    if (knightCounter == 1){
                        if((rowCounter == row ) & (colCounter == (col ))){
                            [self backgroundImage];
                            
                            self.bn = [NSImage imageNamed:@"bn"];
                            [bcell setImage:_bn];
                            
                            knightCounter = 0;
                            clickCounter = 0;
                            turnCounter = 0;
                            break;
                        }
                        
                        else{
                            if((((rowCounter == (row +2)) & (colCounter == (col))) | ((rowCounter == row) & (colCounter == (col +2))) |  ((rowCounter == row) & (colCounter == (col -2)))| ((rowCounter == row -2) & (colCounter == (col)))) & (![bcell.image isEqual:_bp]) & (![bcell.image isEqual:_bn]) & (![bcell.image isEqual:_bk]) & (![bcell.image isEqual:_bq]) & (![bcell.image isEqual:_bb]) & (![bcell.image isEqual:_br]) ) {
                                
                                if ( [bcell.image isEqual:_wk]){
                                    [self.turnDisplay setEditable:YES];
                                    NSString *title2 = @"Black Wins!";
                                    [self.turnDisplay setStringValue:title2];
                                    [self.turnDisplay setTextColor:[NSColor greenColor]];
                                    [self.turnDisplay setEditable:NO];
                                    turnCounter = 10;
                                    
                                }
                                
                                clickCounter = 0;
                                knightCounter = 0;
                                [self backgroundImage];
                                self.bn = [NSImage imageNamed:@"bn"];
                                [bcell setImage:_bn];
                                
                                [cols removeAllObjects];
                                [rows removeAllObjects];
                                
                                if(turnCounter != 10){
                                    turnCounter = 1;
                                }
                            }
                            break;
                            
                            
                        }
                    }
                }
                
                if(clickCounter == 0){
                    if ([bcell.image isEqual:_bn]){
                        bcell.image = nil;
                        
                        
                        [rows addObject:[NSNumber numberWithInteger:(row+2)]];
                        [rows addObject:[NSNumber numberWithInteger:(row-2)]];
                        [rows addObject:[NSNumber numberWithInteger:(row)]];
                        [rows addObject:[NSNumber numberWithInteger:(row)]];
                        [cols addObject:[NSNumber numberWithInteger:(col)]];
                        [cols addObject:[NSNumber numberWithInteger:(col)]];
                        [cols addObject:[NSNumber numberWithInteger:(col+2)]];
                        [cols addObject:[NSNumber numberWithInteger:(col-2)]];
                        
                        colCounter = col;
                        rowCounter = row;
                        for(int i = 0; i < cols.count; i++){
                            
                            
                            NSInteger r = [[rows objectAtIndex:i]integerValue];
                            NSInteger c = [[cols objectAtIndex:i]integerValue];
                            NSButtonCell *bcell1 = [self.chessMatrix cellAtRow:r column:c];
                            if (((![bcell1.image isEqual:_bp]) && (![bcell1.image isEqual:_bq]) && (![bcell1.image isEqual:_bn]) && (![bcell1.image isEqual:_bk]) && (![bcell1.image isEqual:_bb]) && (![bcell1.image isEqual:_br]))){
                                if (c < W){
                                    [bcell1 setBackgroundColor: [NSColor grayColor]];
                                }
                            }
                        }
                        knightCounter = 1;
                        clickCounter = 1;
                        
                        break;
                    }
                }
                
                
                ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                /////////////////////////////// The Black Pawn//////////////////////////////////////////////////////////////////////
                if(clickCounter == 1){
                    if (pawnCounter == 1){
                        if((rowCounter == row ) & (colCounter == (col ))){
                            [self backgroundImage];
                            self.bp = [NSImage imageNamed:@"bp"];
                            [bcell setImage:_bp];
                            pawnCounter = 0;
                            clickCounter = 0;
                            turnCounter = 0;
                            break;
                        }
                        
                        else{
                            
                            if((((rowCounter == (row)) & (colCounter == (col))) | ((rowCounter == (row)) & (colCounter == (col))) | ((rowCounter == row -1) & (colCounter == (col +1))) |  ((rowCounter == row-1) & (colCounter == (col -1)))| ((rowCounter == row) & (colCounter == (col)))) & (![bcell.image isEqual:_bp]) & (![bcell.image isEqual:_bn]) & (![bcell.image isEqual:_bk]) & (![bcell.image isEqual:_bq]) & (![bcell.image isEqual:_bb]) & (![bcell.image isEqual:_br]) ) {
                                NSLog(@" browsRowzzz=%d", (int) row);
                                clickCounter = 0;
                                pawnCounter = 0;
                                
                                if ( [bcell.image isEqual:_wk]){
                                    NSLog(@" goku=%d", (int) row);
                                    
                                    [self.turnDisplay setEditable:YES];
                                    NSString *title2 = @"Black Wins!";
                                    [self.turnDisplay setStringValue:title2];
                                    [self.turnDisplay setTextColor:[NSColor greenColor]];
                                    [self.turnDisplay setEditable:NO];
                                    turnCounter = 10;
                                    
                                }
                                
                                [self backgroundImage];
                                
                                
                                if(!(row == 8)){
                                    self.bp = [NSImage imageNamed:@"bp"];
                                    [bcell setImage:_bp];
                                    
                                }
                                
                                if(row == 6){
                                    self.bp = [NSImage imageNamed:@"bp"];
                                    [bcell setImage:_bq];
                                }
                                
                                
                                [cols removeAllObjects];
                                [rows removeAllObjects];
                                if(turnCounter != 10){
                                    turnCounter = 1;
                                }
                            }
                            break;
                            
                        }
                    }
                }
                
                if(clickCounter == 0){
                    if ([bcell.image isEqual:_bp]){
                        bcell.image = nil;
                        
                        
                        [rows addObject:[NSNumber numberWithInteger:(row+1)]];
                        [rows addObject:[NSNumber numberWithInteger:(row+1)]];
                        [cols addObject:[NSNumber numberWithInteger:(col+1)]];
                        [cols addObject:[NSNumber numberWithInteger:(col-1)]];
                        colCounter = col;
                        rowCounter = row;
                        for(int i = 0; i < cols.count; i++){
                            NSInteger r = [[rows objectAtIndex:i]integerValue];
                            NSInteger c = [[cols objectAtIndex:i]integerValue];
                            NSButtonCell *bcell1 = [self.chessMatrix cellAtRow:r column:c];
                            if (((![bcell1.image isEqual:_bp]) && (![bcell1.image isEqual:_bq]) && (![bcell1.image isEqual:_bn]) && (![bcell1.image isEqual:_bk]) && (![bcell1.image isEqual:_bb]) && (![bcell1.image isEqual:_br]))){
                                if (c < W){
                                    
                                    [bcell1 setBackgroundColor: [NSColor grayColor]];
                                }
                            }
                        }
                        
                        rowCounter = row;
                        pawnCounter = 1;
                        clickCounter = 1;
                        
                        break;
                    }
                }
                
                ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                /////////////////////////////// The Black Bishop//////////////////////////////////////////////////////////////////////
                
                if(clickCounter == 1){
                    if (bishopCounter == 1){
                        if (rowCounter == row && colCounter == col) {
                            [self backgroundImage];
                            self.bb = [NSImage imageNamed:@"bb"];
                            [bcell setImage:_bb];
                            turnCounter = 0;
                            bishopCounter = 0;
                            clickCounter = 0;
                            break;
                        }else{
                            if(((rowCounter == row-1) && (colCounter == (col-1))) ||((rowCounter == row-1) && (colCounter == (col+1))) || ((rowCounter == row-2) && (colCounter == (col))) || ((rowCounter == row+2) && (colCounter == (col))) || ((rowCounter == row + 1) && (colCounter == (col +1))) || (((rowCounter == row + 1) && (colCounter == (col -1))) && (![bcell.image isEqual:_wp]) && (![bcell.image isEqual:_wn]) & (![bcell.image isEqual:_wk]) && (![bcell.image isEqual:_wq]) && (![bcell.image isEqual:_wr]))) {
                                
                                if ( [bcell.image isEqual:_wk]){
                                    NSLog(@" goku=%d", (int) row);
                                    
                                    [self.turnDisplay setEditable:YES];
                                    NSString *title2 = @"Black Wins!";
                                    [self.turnDisplay setStringValue:title2];
                                    [self.turnDisplay setTextColor:[NSColor greenColor]];
                                    [self.turnDisplay setEditable:NO];
                                    turnCounter = 10;
                                    
                                }
                                
                                
                                
                                
                                
                                clickCounter = 0;
                                bishopCounter = 0;
                                [self backgroundImage];
                                self.bb = [NSImage imageNamed:@"bb"];
                                [bcell setImage:_bb];
                                [cols removeAllObjects];
                                [rows removeAllObjects];
                                if(turnCounter != 10){
                                    turnCounter = 1;
                                }
                                
                            }
                            break;
                        }
                    }
                }
                
                
                if(clickCounter == 0){
                    if ([bcell.image isEqual:_bb]){
                        bcell.image = nil;
                        [rows addObject:[NSNumber numberWithInteger:(row-1)]];
                        [rows addObject:[NSNumber numberWithInteger:(row-1)]];
                        [rows addObject:[NSNumber numberWithInteger:(row-2)]];
                        [rows addObject:[NSNumber numberWithInteger:(row+2)]];
                        [rows addObject:[NSNumber numberWithInteger:(row+1)]];
                        [rows addObject:[NSNumber numberWithInteger:(row+1)]];
                        [cols addObject:[NSNumber numberWithInteger:(col-1)]];
                        [cols addObject:[NSNumber numberWithInteger:(col+1)]];
                        [cols addObject:[NSNumber numberWithInteger:(col)]];
                        [cols addObject:[NSNumber numberWithInteger:(col)]];
                        [cols addObject:[NSNumber numberWithInteger:(col-1)]];
                        [cols addObject:[NSNumber numberWithInteger:(col+1)]];
                        colCounter = col;
                        rowCounter = row;
                        for(int i = 0; i < cols.count; i++){
                            NSInteger r = [[rows objectAtIndex:i]integerValue];
                            NSInteger c = [[cols objectAtIndex:i]integerValue];
                            NSButtonCell *bcell1 = [self.chessMatrix cellAtRow:r column:c];
                            if (((![bcell1.image isEqual:_br]) && (![bcell1.image isEqual:_bn]) && (![bcell1.image  isEqual:_bk]) && (![bcell1.image isEqual:_bq]) && (![bcell1.image isEqual:_bp]))){
                                if(c < W){
                                    [bcell1 setBackgroundColor: [NSColor grayColor]];
                                    
                                }
                            }
                        }
                        bishopCounter = 1;
                        clickCounter = 1;
                        
                        
                        break;
                    }
                }
                ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                /////////////////////////////// The Black Queen//////////////////////////////////////////////////////////////////////
                
                if(clickCounter == 1){
                    
                    
                    if (queenCounter == 1){
                        if (rowCounter == row && colCounter == col) {
                            [self backgroundImage];
                            self.bq = [NSImage imageNamed:@"bq"];
                            [bcell setImage:_bq];
                            turnCounter = 0;
                            queenCounter= 0;
                            clickCounter = 0;
                            break;
                        }else{
                            if(((rowCounter == (row)) && (colCounter == (col -2))) ||((rowCounter == (row)) && (colCounter == (col +2))) ||((rowCounter == (row-1)) && (colCounter == (col -1))) ||((rowCounter == (row-1)) && (colCounter == (col +1))) || (((rowCounter == (row+1)) && (colCounter == (col +1))) || (((rowCounter == (row+1)) && (colCounter == (col-1))) && (![bcell.image isEqual:_bp]) && (![bcell.image isEqual:_bn]) && (![bcell.image isEqual:_bk]) && (![bcell.image isEqual:_bb]) && (![bcell.image isEqual:_br])))) {
                                
                                if ( [bcell.image isEqual:_wk]){
                                    
                                    [self.turnDisplay setEditable:YES];
                                    NSString *title2 = @"Black Wins!";
                                    [self.turnDisplay setStringValue:title2];
                                    [self.turnDisplay setTextColor:[NSColor greenColor]];
                                    [self.turnDisplay setEditable:NO];
                                    turnCounter = 10;
                                    
                                }
                                
                                
                                clickCounter = 0;
                                queenCounter = 0;
                                [self backgroundImage];
                                self.bq = [NSImage imageNamed:@"bq"];
                                [bcell setImage:_bq];
                                [cols removeAllObjects];
                                [rows removeAllObjects];
                                if(turnCounter != 10){
                                    turnCounter = 1;
                                }
                            }
                            break;
                        }
                    }
                }
                
                if(clickCounter == 0){
                    if ([bcell.image isEqual:_bq]){
                        bcell.image = nil;
                        [rows addObject:[NSNumber numberWithInteger:(row-1)]];
                        [rows addObject:[NSNumber numberWithInteger:(row-1)]];
                        [rows addObject:[NSNumber numberWithInteger:(row+1)]];
                        [rows addObject:[NSNumber numberWithInteger:(row+1)]];
                        [rows addObject:[NSNumber numberWithInteger:(row)]];
                        [rows addObject:[NSNumber numberWithInteger:(row)]];
                        [cols addObject:[NSNumber numberWithInteger:(col+1)]];
                        [cols addObject:[NSNumber numberWithInteger:(col-1)]];
                        [cols addObject:[NSNumber numberWithInteger:(col+1)]];
                        [cols addObject:[NSNumber numberWithInteger:(col-1)]];
                        [cols addObject:[NSNumber numberWithInteger:(col+2)]];
                        [cols addObject:[NSNumber numberWithInteger:(col-2)]];
                        
                        rowCounter = row;
                        colCounter = col;
                        
                        for(int i = 0; i < cols.count; i++){
                            NSInteger r = [[rows objectAtIndex:i]integerValue];
                            NSInteger c = [[cols objectAtIndex:i]integerValue];
                            NSButtonCell *bcell1 = [self.chessMatrix cellAtRow:r column:c];
                            if (((![bcell1.image isEqual:_br]) && (![bcell1.image isEqual:_bn]) && (![bcell1.image  isEqual:_bk]) && (![bcell1.image isEqual:_bb]) && (![bcell1.image isEqual:_bp]))){
                                if(c < W){
                                    [bcell1 setBackgroundColor: [NSColor grayColor]];
                                    
                                }
                            }
                        }
                        
                        queenCounter = 1;
                        clickCounter = 1;
                        break;
                    }
                }
                
                
                
                ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                /////////////////////////////// The Black King//////////////////////////////////////////////////////////////////////
                
                
                
                if(clickCounter == 1){
                    if (kingCounter == 1){
                        if (rowCounter == row && colCounter == col) {
                            [self backgroundImage];
                            self.bk = [NSImage imageNamed:@"bk"];
                            [bcell setImage:_bk];
                            turnCounter = 0;
                            kingCounter= 0;
                            clickCounter = 0;
                            break;
                        }else{
                            
                            if((((rowCounter == (row)) && (colCounter == (col))) | ((rowCounter == (row +1)) && (colCounter == (col))) | ((rowCounter == row) & (colCounter == (col +1))) |  ((rowCounter == row) & (colCounter == (col -1)))| ((rowCounter == row -1) & (colCounter == (col)))) & (![bcell.image isEqual:_bp]) & (![bcell.image isEqual:_bn]) & (![bcell.image isEqual:_bk]) & (![bcell.image isEqual:_bq]) & (![bcell.image isEqual:_bb]) & (![bcell.image isEqual:_br]) ) {
                                clickCounter = 0;
                                kingCounter = 0;
                                //bcell.title = @"KI";
                                [self backgroundImage];
                                
                                if ( [bcell.image isEqual:_wk]){
                                    
                                    [self.turnDisplay setEditable:YES];
                                    NSString *title2 = @"Black Wins!";
                                    [self.turnDisplay setStringValue:title2];
                                    [self.turnDisplay setTextColor:[NSColor greenColor]];
                                    [self.turnDisplay setEditable:NO];
                                    turnCounter = 10;
                                    
                                }
                                
                                self.bk = [NSImage imageNamed:@"bk"];
                                [bcell setImage:_bk];
                                if(turnCounter != 10){
                                    turnCounter = 1;
                                }
                                break;
                                
                            }
                        }
                    }
                }
                
                if(clickCounter == 0){
                    if([bcell.image isEqual:_bk]){
                        bcell.image = nil;
                        
                        
                        [rows addObject:[NSNumber numberWithInteger:(row+1)]];
                        [rows addObject:[NSNumber numberWithInteger:(row)]];
                        [rows addObject:[NSNumber numberWithInteger:(row)]];
                        [rows addObject:[NSNumber numberWithInteger:(row-1)]];
                        
                        
                        [cols addObject:[NSNumber numberWithInteger:(col)]];
                        [cols addObject:[NSNumber numberWithInteger:(col-1)]];
                        [cols addObject:[NSNumber numberWithInteger:(col+1)]];
                        [cols addObject:[NSNumber numberWithInteger:(col)]];
                        
                        
                        
                        
                        colCounter = col;
                        rowCounter = row;
                        for(int i = 0; i < cols.count; i++){
                            NSInteger r = [[rows objectAtIndex:i]integerValue];
                            NSInteger c = [[cols objectAtIndex:i]integerValue];
                            NSButtonCell *bcell1 = [self.chessMatrix cellAtRow:r column:c];
                            if (((![bcell1.image isEqual:_bn]) && (![bcell1.image isEqual:_bq]) && (![bcell1.image isEqual:_bn]) && (![bcell1.image isEqual:_bp]) && (![bcell1.image isEqual:_bb]) && (![bcell1.image isEqual:_br]))){
                                if (c < W){
                                    
                                    [bcell1 setBackgroundColor: [NSColor grayColor]];
                                }
                            }
                        }
                        
                        
                        rowCounter =row;
                        colCounter = col;
                        kingCounter = 1;
                        clickCounter = 1;
                        break;
                    }
                }
                
                
                ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                /////////////////////////////// The Black Rook//////////////////////////////////////////////////////////////////////
                if(clickCounter == 1){
                    
                    if (rookCounter == 1){
                        if (rowCounter == row && colCounter == col) {
                            [self backgroundImage];
                            self.br = [NSImage imageNamed:@"br"];
                            [bcell setImage:_br];
                            turnCounter = 0;
                            rookCounter = 0;
                            clickCounter = 0;
                            break;
                        }else{
                            if(((rowCounter == (row)) && (colCounter == (col+2))) || ((rowCounter == (row)) && (colCounter == (col-4))) || ((rowCounter == (row)) && (colCounter == (col-2))) || ((rowCounter == (row -2)) && (colCounter == (col))) || (((rowCounter == (row +2)) && (colCounter == (col))) && (![bcell.image isEqual:_bp]) && (![bcell.image isEqual:_bn]) && (![bcell.image isEqual:_bk]) && (![bcell.image isEqual:_bq]) && (![bcell.image isEqual:_bb]))) {
                                clickCounter = 0;
                                rookCounter = 0;
                                if ( [bcell.image isEqual:_wk]){
                                    
                                    [self.turnDisplay setEditable:YES];
                                    NSString *title2 = @"Black Wins!";
                                    [self.turnDisplay setStringValue:title2];
                                    [self.turnDisplay setTextColor:[NSColor greenColor]];
                                    [self.turnDisplay setEditable:NO];
                                    turnCounter = 10;
                                    
                                }
                                [self backgroundImage];
                                self.br = [NSImage imageNamed:@"br"];
                                [bcell setImage:_br];
                                [cols removeAllObjects];
                                [rows removeAllObjects];
                                if(turnCounter != 10){
                                    turnCounter = 1;
                                }
                            }
                            break;
                        }
                    }
                }
                
                if(clickCounter == 0){
                    if([bcell.image isEqual:_br]){
                        bcell.image = nil;
                        
                        [rows addObject:[NSNumber numberWithInteger:(row+2)]];
                        [rows addObject:[NSNumber numberWithInteger:(row-2)]];
                        [rows addObject:[NSNumber numberWithInteger:(row)]];
                        [rows addObject:[NSNumber numberWithInteger:(row)]];
                        [rows addObject:[NSNumber numberWithInteger:(row)]];
                        [rows addObject:[NSNumber numberWithInteger:(row)]];
                        [cols addObject:[NSNumber numberWithInteger:(col)]];
                        [cols addObject:[NSNumber numberWithInteger:(col)]];
                        [cols addObject:[NSNumber numberWithInteger:(col+2)]];
                        [cols addObject:[NSNumber numberWithInteger:(col+4)]];
                        [cols addObject:[NSNumber numberWithInteger:(col-2)]];
                        [cols addObject:[NSNumber numberWithInteger:(col-4)]];
                        
                        
                        colCounter = col;
                        rowCounter = row;
                        for(int i = 0; i < cols.count; i++){
                            NSInteger r = [[rows objectAtIndex:i]integerValue];
                            NSInteger c = [[cols objectAtIndex:i]integerValue];
                            NSButtonCell *bcell1 = [self.chessMatrix cellAtRow:r column:c];
                            if (((![bcell1.image isEqual:_bq]) && (![bcell1.image isEqual:_bn]) && (![bcell1.image  isEqual:_bk]) && (![bcell1.image isEqual:_bb]) && (![bcell1.image isEqual:_bp]))){
                                if(c < W){
                                    
                                    [bcell1 setBackgroundColor: [NSColor grayColor]];
                                    
                                }
                            }
                        }
                        rookCounter = 1;
                        clickCounter = 1;
                        
                        break;
                    }
                }
                
                
                
                
                break;
            }
            
        }
        
        
        ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        /////////////////////////////// Whites Turn!!!//////////////////////////////////////////////////////////////////////
        
        if (turnCounter  == 1){
            [self.turnDisplay setEditable:YES];
            NSString *title2 = @"White Turn!";
            [self.turnDisplay setStringValue:title2];
            [self.turnDisplay setEditable:NO];
            
            while(true){
                
                
                NSMutableArray* cols = [[NSMutableArray alloc]initWithCapacity:64];
                NSMutableArray* rows = [[NSMutableArray alloc]initWithCapacity:64];
                
                
                
                ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                ////////////////////////////// Whites Knight!!!//////////////////////////////////////////////////////////////////////
                if(clickCounter == 1){
                    
                    if (knightCounter == 1){
                        if((rowCounter == row ) & (colCounter == (col ))){
                            [self backgroundImage];
                            
                            self.wn = [NSImage imageNamed:@"wn"];
                            [bcell setImage:_wn];
                            
                            knightCounter = 0;
                            clickCounter = 0;
                            turnCounter = 1;
                            break;
                        }
                        
                        else{
                            if((((rowCounter == (row +2)) & (colCounter == (col))) | ((rowCounter == row) & (colCounter == (col +2))) |  ((rowCounter == row) & (colCounter == (col -2)))| ((rowCounter == row -2) & (colCounter == (col)))) & (![bcell.image isEqual:_wp]) & (![bcell.image isEqual:_wn]) & (![bcell.image isEqual:_wk]) & (![bcell.image isEqual:_wq]) & (![bcell.image isEqual:_wb]) & (![bcell.image isEqual:_wr]) ) {
                                
                                if ( [bcell.image isEqual:_bk]){
                                    [self.turnDisplay setEditable:YES];
                                    NSString *title2 = @"White Wins!";
                                    [self.turnDisplay setStringValue:title2];
                                    [self.turnDisplay setTextColor:[NSColor greenColor]];
                                    [self.turnDisplay setEditable:NO];
                                    turnCounter = 10;
                                    
                                }
                                
                                clickCounter = 0;
                                knightCounter = 0;
                                [self backgroundImage];
                                self.wn = [NSImage imageNamed:@"wn"];
                                [bcell setImage:_wn];
                                
                                [cols removeAllObjects];
                                [rows removeAllObjects];
                                
                                if(turnCounter != 10){
                                    turnCounter = 0;
                                }                        }
                            break;
                            
                            
                        }
                    }
                }
                
                if(clickCounter == 0){
                    if ([bcell.image isEqual:_wn]){
                        bcell.image = nil;
                        
                        
                        [rows addObject:[NSNumber numberWithInteger:(row+2)]];
                        [rows addObject:[NSNumber numberWithInteger:(row-2)]];
                        [rows addObject:[NSNumber numberWithInteger:(row)]];
                        [rows addObject:[NSNumber numberWithInteger:(row)]];
                        [cols addObject:[NSNumber numberWithInteger:(col)]];
                        [cols addObject:[NSNumber numberWithInteger:(col)]];
                        [cols addObject:[NSNumber numberWithInteger:(col+2)]];
                        [cols addObject:[NSNumber numberWithInteger:(col-2)]];
                        
                        colCounter = col;
                        rowCounter = row;
                        for(int i = 0; i < cols.count; i++){
                            
                            
                            NSInteger r = [[rows objectAtIndex:i]integerValue];
                            NSInteger c = [[cols objectAtIndex:i]integerValue];
                            NSButtonCell *bcell1 = [self.chessMatrix cellAtRow:r column:c];
                            if (((![bcell1.image isEqual:_wp]) && (![bcell1.image isEqual:_wq]) && (![bcell1.image isEqual:_wn]) && (![bcell1.image isEqual:_wk]) && (![bcell1.image isEqual:_wb]) && (![bcell1.image isEqual:_wr]))){
                                if (c < W){
                                    [bcell1 setBackgroundColor: [NSColor grayColor]];
                                }
                            }
                        }
                        knightCounter = 1;
                        clickCounter = 1;
                        
                        break;
                    }
                }
                
                ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                ////////////////////////////// Whites Pawn!!!//////////////////////////////////////////////////////////////////////
                
                
                // pawn
                if(clickCounter == 1){
                    if (pawnCounter == 1){
                        
                        if((rowCounter == row -1) & (colCounter == (col ))){
                            [self backgroundImage];
                            
                            self.wp = [NSImage imageNamed:@"wp"];
                            [bcell setImage:_wp];
                            pawnCounter = 0;
                            clickCounter = 0;
                            turnCounter = 1;
                            break;
                        }else{
                            if(((rowCounter == row ) & (colCounter == (col +1))) | (((rowCounter == row ) & (colCounter == (col -1))) & (![bcell.image isEqual:_wp]) & (![bcell.image isEqual:_wn]) & (![bcell.image isEqual:_wk]) & (![bcell.image isEqual:_wq]) & (![bcell.image isEqual:_wb]) & (![bcell.image isEqual:_wr]))) {
                                
                                if ( [bcell.image isEqual:_bk]){
                                    [self.turnDisplay setEditable:YES];
                                    NSString *title2 = @"White Wins!";
                                    [self.turnDisplay setStringValue:title2];
                                    [self.turnDisplay setTextColor:[NSColor greenColor]];
                                    [self.turnDisplay setEditable:NO];
                                    turnCounter = 10;
                                    
                                }
                                
                                
                                
                                clickCounter = 0;
                                pawnCounter = 0;
                                [self backgroundImage];
                                
                                if(!(row == 0)){
                                    self.wp = [NSImage imageNamed:@"wp"];
                                    [bcell setImage:_wp];
                                    
                                }
                                
                                if(row == 0){
                                    self.wp = [NSImage imageNamed:@"wp"];
                                    [bcell setImage:_wq];
                                }
                       
                                if (turnCounter != 10){
                                    
                                    [self.turnDisplay setEditable:YES];
                                    NSString *title2 = @"Black Turn!";
                                    [self.turnDisplay setStringValue:title2];
                                    [self.turnDisplay setEditable:NO];
                                    turnCounter = 0;
                                }
                                
                            }
                            break;
                        }
                    }
                }
                
                
                if(clickCounter == 0){
                    if ([bcell.image isEqual:_wp]){
                        bcell.image = nil;
                        
                        
                        [rows addObject:[NSNumber numberWithInteger:(row-1)]];
                        [rows addObject:[NSNumber numberWithInteger:(row-1)]];
                        [cols addObject:[NSNumber numberWithInteger:(col+1)]];
                        [cols addObject:[NSNumber numberWithInteger:(col-1)]];
                        colCounter = col;
                        rowCounter = row;
                        for(int i = 0; i < cols.count; i++){
                            NSInteger r = [[rows objectAtIndex:i]integerValue];
                            NSInteger c = [[cols objectAtIndex:i]integerValue];
                            NSButtonCell *bcell1 = [self.chessMatrix cellAtRow:r column:c];
                            if (((![bcell1.image isEqual:_wp]) && (![bcell1.image isEqual:_wq]) && (![bcell1.image isEqual:_wn]) && (![bcell1.image isEqual:_wk]) && (![bcell1.image isEqual:_wb]) && (![bcell1.image isEqual:_wr]))){
                                if (c < W){
                                    
                                    [bcell1 setBackgroundColor: [NSColor grayColor]];
                                }
                            }
                        }
                        
                        rowCounter = row -1;
                        pawnCounter = 1;
                        clickCounter = 1;
                        
                        break;
                    }
                }
                
                ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                ////////////////////////////// Whites Bishop!!!//////////////////////////////////////////////////////////////////////
                
                
                
                
                if(clickCounter == 1){
                    
                    if (bishopCounter == 1){
                        if (rowCounter == row && colCounter == col) {
                            [self backgroundImage];
                            self.wb = [NSImage imageNamed:@"wb"];
                            [bcell setImage:_wb];
                            turnCounter = 1;
                            bishopCounter = 0;
                            clickCounter = 0;
                            break;
                        }else{
                            if(((rowCounter == row-1) && (colCounter == (col-1))) ||((rowCounter == row-1) && (colCounter == (col+1))) || ((rowCounter == row-2) && (colCounter == (col))) || ((rowCounter == row+2) && (colCounter == (col))) || ((rowCounter == row + 1) && (colCounter == (col +1))) || (((rowCounter == row + 1) && (colCounter == (col -1))) && (![bcell.image isEqual:_wp]) && (![bcell.image isEqual:_wn]) & (![bcell.image isEqual:_wk]) && (![bcell.image isEqual:_wq]) && (![bcell.image isEqual:_wr]))) {
                                
                                [self backgroundImage];

                                if ( [bcell.image isEqual:_bk]){
                                    [self.turnDisplay setEditable:YES];
                                    NSString *title2 = @"White Wins!";
                                    [self.turnDisplay setStringValue:title2];
                                    [self.turnDisplay setTextColor:[NSColor greenColor]];
                                    [self.turnDisplay setEditable:NO];
                                    turnCounter = 10;
                                    
                                }
                                self.wb = [NSImage imageNamed:@"wb"];
                                [bcell setImage:_wb];
                                
                                if(turnCounter != 10) {
                                    
                                    clickCounter = 0;
                                    bishopCounter = 0;
                                   
                                    
                                    [self.turnDisplay setEditable:YES];
                                    NSString *title2 = @"Black Turn!";
                                    [self.turnDisplay setStringValue:title2];
                                    [self.turnDisplay setEditable:NO];
                                    [cols removeAllObjects];
                                    [rows removeAllObjects];
                                    turnCounter = 0;
                                }
                            }
                            break;
                        }
                    }
                }
                
                
                if(clickCounter == 0){
                    if ([bcell.image isEqual:_wb]){
                        bcell.image = nil;
                        [rows addObject:[NSNumber numberWithInteger:(row-1)]];
                        [rows addObject:[NSNumber numberWithInteger:(row-1)]];
                        [rows addObject:[NSNumber numberWithInteger:(row-2)]];
                        [rows addObject:[NSNumber numberWithInteger:(row+2)]];
                        [rows addObject:[NSNumber numberWithInteger:(row+1)]];
                        [rows addObject:[NSNumber numberWithInteger:(row+1)]];
                        [cols addObject:[NSNumber numberWithInteger:(col-1)]];
                        [cols addObject:[NSNumber numberWithInteger:(col+1)]];
                        [cols addObject:[NSNumber numberWithInteger:(col)]];
                        [cols addObject:[NSNumber numberWithInteger:(col)]];
                        [cols addObject:[NSNumber numberWithInteger:(col-1)]];
                        [cols addObject:[NSNumber numberWithInteger:(col+1)]];
                        
                        colCounter = col;
                        rowCounter = row;
                        
                        for(int i = 0; i < cols.count; i++){
                            NSInteger r = [[rows objectAtIndex:i]integerValue];
                            NSInteger c = [[cols objectAtIndex:i]integerValue];
                            NSButtonCell *bcell1 = [self.chessMatrix cellAtRow:r column:c];
                            if (((![bcell1.image isEqual:_wr]) && (![bcell1.image isEqual:_wn]) && (![bcell1.image  isEqual:_wk]) && (![bcell1.image isEqual:_wq]) && (![bcell1.image isEqual:_wp]))){
                                if(c < W){
                                    [bcell1 setBackgroundColor: [NSColor grayColor]];
                                    
                                }
                            }
                        }
                        
                        bishopCounter = 1;
                        clickCounter = 1;
                        
                        
                        break;
                        
                    }
                }
                
                ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                ////////////////////////////// Whites Queen!!!//////////////////////////////////////////////////////////////////////
                if(clickCounter == 1){
                    
                    if (queenCounter == 1){
                        if (rowCounter == row && colCounter == col) {
                            [self backgroundImage];
                            self.wq = [NSImage imageNamed:@"wq"];
                            [bcell setImage:_wq];
                            turnCounter = 1;
                            queenCounter = 0;
                            clickCounter = 0;
                            break;
                        }else{
                            if(((rowCounter == (row)) && (colCounter == (col -2))) ||((rowCounter == (row)) && (colCounter == (col +2))) ||((rowCounter == (row-1)) && (colCounter == (col -1))) ||((rowCounter == (row-1)) && (colCounter == (col +1))) || (((rowCounter == (row+1)) && (colCounter == (col +1))) || (((rowCounter == (row+1)) && (colCounter == (col-1))) && (![bcell.image isEqual:_wp]) && (![bcell.image isEqual:_wn]) && (![bcell.image isEqual:_wk]) && (![bcell.image isEqual:_wb]) && (![bcell.image isEqual:_wr])))) {
                                
                                
                                
                                
                                if ( [bcell.image isEqual:_bk]){
                                    [self.turnDisplay setEditable:YES];
                                    NSString *title2 = @"White Wins!";
                                    [self.turnDisplay setStringValue:title2];
                                    [self.turnDisplay setTextColor:[NSColor greenColor]];
                                    [self.turnDisplay setEditable:NO];
                                    turnCounter = 10;
                                    
                                }
                                
                                
                                clickCounter = 0;
                                queenCounter = 0;
                                [self backgroundImage];
                                
                                
                                
                                
                                self.wq = [NSImage imageNamed:@"wq"];
                                [bcell setImage:_wq];
                                if (turnCounter != 10){
                                    
                                    [self.turnDisplay setEditable:YES];
                                    NSString *title2 = @"Black Turn!";
                                    [self.turnDisplay setStringValue:title2];
                                    [self.turnDisplay setEditable:NO];
                                    [cols removeAllObjects];
                                    [rows removeAllObjects];
                                    turnCounter = 0;
                                }
                            }
                            break;
                        }
                    }
                }
                
                if(clickCounter == 0){
                    if ([bcell.image isEqual:_wq]){
                        bcell.image = nil;
                        
                        [rows addObject:[NSNumber numberWithInteger:(row-1)]];
                        [rows addObject:[NSNumber numberWithInteger:(row-1)]];
                        [rows addObject:[NSNumber numberWithInteger:(row+1)]];
                        [rows addObject:[NSNumber numberWithInteger:(row+1)]];
                        [rows addObject:[NSNumber numberWithInteger:(row)]];
                        [rows addObject:[NSNumber numberWithInteger:(row)]];
                        [cols addObject:[NSNumber numberWithInteger:(col+1)]];
                        [cols addObject:[NSNumber numberWithInteger:(col-1)]];
                        [cols addObject:[NSNumber numberWithInteger:(col+1)]];
                        [cols addObject:[NSNumber numberWithInteger:(col-1)]];
                        [cols addObject:[NSNumber numberWithInteger:(col+2)]];
                        [cols addObject:[NSNumber numberWithInteger:(col-2)]];
                        
                        rowCounter = row;
                        colCounter = col;
                        
                        for(int i = 0; i < cols.count; i++){
                            NSInteger r = [[rows objectAtIndex:i]integerValue];
                            NSInteger c = [[cols objectAtIndex:i]integerValue];
                            NSButtonCell *bcell1 = [self.chessMatrix cellAtRow:r column:c];
                            if (((![bcell1.image isEqual:_wr]) && (![bcell1.image isEqual:_wn]) && (![bcell1.image  isEqual:_wk]) && (![bcell1.image isEqual:_wb]) && (![bcell1.image isEqual:_wp]))){
                                if(c < W){
                                    [bcell1 setBackgroundColor: [NSColor grayColor]];
                                    
                                }
                            }
                        }
                        
                        queenCounter = 1;
                        clickCounter = 1;
                        break;
                    }
                }
                
                
                
                
                
                
                ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                ////////////////////////////// Whites King!!!//////////////////////////////////////////////////////////////////////
                
                
                
                if(clickCounter == 1){
                    if (kingCounter == 1){
                        if (rowCounter == row && colCounter == col) {
                            [self backgroundImage];
                            self.wk = [NSImage imageNamed:@"wk"];
                            [bcell setImage:_wk];
                            turnCounter = 1;
                            kingCounter= 0;
                            clickCounter = 0;
                            break;
                        }else{
                            
                            if((((rowCounter == (row)) && (colCounter == (col))) | ((rowCounter == (row +1)) && (colCounter == (col))) | ((rowCounter == row) & (colCounter == (col +1))) |  ((rowCounter == row) & (colCounter == (col -1)))| ((rowCounter == row -1) & (colCounter == (col)))) & (![bcell.image isEqual:_wp]) & (![bcell.image isEqual:_wn]) & (![bcell.image isEqual:_wk]) & (![bcell.image isEqual:_wq]) & (![bcell.image isEqual:_wb]) & (![bcell.image isEqual:_wr]) ) {
                                clickCounter = 0;
                                kingCounter = 0;
                                [self backgroundImage];
                                
                                if ( [bcell.image isEqual:_bk]){
                                    
                                    [self.turnDisplay setEditable:YES];
                                    NSString *title2 = @"White Wins!";
                                    [self.turnDisplay setStringValue:title2];
                                    [self.turnDisplay setTextColor:[NSColor greenColor]];
                                    [self.turnDisplay setEditable:NO];
                                    turnCounter = 10;
                                    
                                }
                                
                                self.wk = [NSImage imageNamed:@"wk"];
                                [bcell setImage:_wk];
                                if(turnCounter != 10){
                                    turnCounter = 0;
                                }
                                break;
                                
                            }
                        }
                    }
                }
                
                if(clickCounter == 0){
                    //if ([bcell.title  isEqual: @"KI"]){
                    if([bcell.image isEqual:_wk]){
                        //bcell.title = @" ";
                        bcell.image = nil;
                        
                        
                        [rows addObject:[NSNumber numberWithInteger:(row+1)]];
                        [rows addObject:[NSNumber numberWithInteger:(row)]];
                        [rows addObject:[NSNumber numberWithInteger:(row)]];
                        [rows addObject:[NSNumber numberWithInteger:(row-1)]];
                        
                        
                        [cols addObject:[NSNumber numberWithInteger:(col)]];
                        [cols addObject:[NSNumber numberWithInteger:(col-1)]];
                        [cols addObject:[NSNumber numberWithInteger:(col+1)]];
                        [cols addObject:[NSNumber numberWithInteger:(col)]];
                        
                        
                        
                        
                        colCounter = col;
                        rowCounter = row;
                        for(int i = 0; i < cols.count; i++){
                            NSInteger r = [[rows objectAtIndex:i]integerValue];
                            NSInteger c = [[cols objectAtIndex:i]integerValue];
                            NSButtonCell *bcell1 = [self.chessMatrix cellAtRow:r column:c];
                            if (((![bcell1.image isEqual:_wn]) && (![bcell1.image isEqual:_wq]) && (![bcell1.image isEqual:_wn]) && (![bcell1.image isEqual:_wp]) && (![bcell1.image isEqual:_wb]) && (![bcell1.image isEqual:_wr]))){
                                if (c < W){
                                    
                                    [bcell1 setBackgroundColor: [NSColor grayColor]];
                                }
                            }
                        }
                        
                        
                        rowCounter =row;
                        colCounter = col;
                        kingCounter = 1;
                        clickCounter = 1;
                        break;
                    }
                }
                
                
                
                
                ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                ////////////////////////////// Whites Rook!!!//////////////////////////////////////////////////////////////////////
                
                
                if(clickCounter == 1){
                    
                    if (rookCounter == 1){
                        if (rowCounter == row && colCounter == col) {
                            [self backgroundImage];
                            self.wr = [NSImage imageNamed:@"wr"];
                            [bcell setImage:_wr];
                            turnCounter = 1;
                            rookCounter = 0;
                            clickCounter = 0;
                            break;
                        }else{
                            if(((rowCounter == (row)) && (colCounter == (col+4))) ||((rowCounter == (row)) && (colCounter == (col+2))) || ((rowCounter == (row)) && (colCounter == (col-4))) || ((rowCounter == (row)) && (colCounter == (col-2))) || ((rowCounter == (row -2)) && (colCounter == (col))) || (((rowCounter == (row +2)) && (colCounter == (col))) && (![bcell.image isEqual:_wp]) && (![bcell.image isEqual:_wn]) && (![bcell.image isEqual:_wk]) && (![bcell.image isEqual:_wq]) && (![bcell.image isEqual:_wb]) & (![bcell.image isEqual:_wr]))) {
                                clickCounter = 0;
                                rookCounter = 0;
                                
                                [self backgroundImage];
                                
                                
                                if([bcell.image isEqual:_bk]){
                                    [self.turnDisplay setEditable:YES];
                                    NSString *title2 = @"White wins!";
                                    [self.turnDisplay setStringValue:title2];
                                    [self.turnDisplay setTextColor:[NSColor greenColor]];
                                    [self.turnDisplay setEditable:NO];
                                    turnCounter = 3;
                                }
                                self.wr = [NSImage imageNamed:@"wr"];
                                [bcell setImage:_wr];
                                
                                if (turnCounter != 3) {
                                    [self.turnDisplay setEditable:YES];
                                    NSString *title2 = @"Black Turn!";
                                    [self.turnDisplay setStringValue:title2];
                                    [self.turnDisplay setEditable:NO];
                                    
                                    [cols removeAllObjects];
                                    [rows removeAllObjects];
                                    
                                    turnCounter = 0;
                                    
                                }
                                
                            }
                            break;
                            
                        }
                    }
                }
                
                
                if(clickCounter == 0){
                    if([bcell.image isEqual:_wr]){
                        bcell.image = nil;
                        
                        [rows addObject:[NSNumber numberWithInteger:(row+2)]];
                        [rows addObject:[NSNumber numberWithInteger:(row-2)]];
                        [rows addObject:[NSNumber numberWithInteger:(row)]];
                        [rows addObject:[NSNumber numberWithInteger:(row)]];
                        [rows addObject:[NSNumber numberWithInteger:(row)]];
                        [rows addObject:[NSNumber numberWithInteger:(row)]];
                        [cols addObject:[NSNumber numberWithInteger:(col)]];
                        [cols addObject:[NSNumber numberWithInteger:(col)]];
                        [cols addObject:[NSNumber numberWithInteger:(col+2)]];
                        [cols addObject:[NSNumber numberWithInteger:(col+4)]];
                        [cols addObject:[NSNumber numberWithInteger:(col-2)]];
                        [cols addObject:[NSNumber numberWithInteger:(col-4)]];
                        
                        colCounter = col;
                        rowCounter = row;
                        
                        for(int i = 0; i < cols.count; i++){
                            NSInteger r = [[rows objectAtIndex:i]integerValue];
                            NSInteger c = [[cols objectAtIndex:i]integerValue];
                            NSButtonCell *bcell1 = [self.chessMatrix cellAtRow:r column:c];
                            if (((![bcell1.image isEqual:_wq]) && (![bcell1.image isEqual:_wn]) && (![bcell1.image  isEqual:_wk]) && (![bcell1.image isEqual:_wb]) && (![bcell1.image isEqual:_wp]))){
                                if(c < W){
                                    [bcell1 setBackgroundColor: [NSColor grayColor]];
                                    
                                }
                            }
                        }
                        
                        rookCounter = 1;
                        clickCounter = 1;
                        
                        break;
                    }
                }
                
                break;
                
            }
            
        }
        
    }
}


@end
