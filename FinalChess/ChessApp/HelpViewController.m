//
//  HelpViewController.m
//  ChessApp
//
//  Created by David Ciupei on 11/10/15.
//  Copyright © 2015 Tyler Crabtree. All rights reserved.
//

#import "HelpViewController.h"

@interface HelpViewController ()

@end

@implementation HelpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setWantsLayer:YES];
    [self.view.layer setBackgroundColor:[[NSColor grayColor] CGColor]];
    
    [self.helper setEditable:YES];
    [self.helper setStringValue:@" Welcome to Chess Champs!\nChess Champs is a new fun way to play chess with an alternate moveset.\n\n Rules:  \n Goal: Capture the king! Have any piece land on the opposing color's king.\n Pawns: Move one space to the forward diagonal.\n If a pawn reaches the other side the pawn turns into a queen! \n Knights: Jump two spaces forward or to the side.\n Bishops: Move diagonally one space, or jump two spaces forward or backwards.\n Rooks: Jump two or four spaces to the side, or jump two spaces forward.\n Kings: Move one space forward or to the side. \n Queens: Move diagonally in any direction, or jump two spaces to the side."];

    [self.helper setEditable:NO];

    
}

@end
