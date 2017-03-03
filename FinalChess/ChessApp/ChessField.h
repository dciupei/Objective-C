//
//  MineField.h

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface ChessField : NSObject

@property (readonly, nonatomic) NSMutableArray *cells;  // grid of cells

-(instancetype)initWithWidth:(int)w Height:(int)h;
-(int)width;
-(int)height;
-(Cell*)cellAtRow:(int)r Col:(int)c;



@end
