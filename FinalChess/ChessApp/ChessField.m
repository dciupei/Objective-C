



#import "ChessField.h"


@implementation ChessField

-(instancetype)initWithWidth:(int)w Height:(int)h {
    self = [super init];
    if (self != nil) {
        int r, c;
        _cells = [[NSMutableArray alloc] initWithCapacity: h];
        for (r = 0; r < h; r++) {
            NSMutableArray *row = [[NSMutableArray alloc] initWithCapacity: w];
            [_cells addObject: row];
            for (c = 0; c < w; c++) {
                [row addObject: [[Cell alloc] init]];
            }
        }
           }
    return self;
}

-(int)width {
    return (int) [[_cells objectAtIndex: 0] count];
}

-(int)height {
    return (int) [_cells count];
}

-(Cell*)cellAtRow:(int)r Col:(int)c {
    return [[_cells objectAtIndex: r] objectAtIndex: c];
}






@end
