//
//  Grid.h
//  Conways
//
//  Created by Dominic Wroblewski on 29/05/2011.
//  Copyright 2011 Dominic Wroblewski. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Grid : NSObject {
  NSMutableArray * map;
@private
  int ROWS;
  int COLUMNS;
}

- (Grid *)initWithRows:(int)rows andColumns:(int)columns;
- (Cell *)cellAtX:(int)x andY:(int)y;
- (NSUInteger)rowCount;
- (NSUInteger)columnCount;
- (void)evolve;
- (NSString *)getRow:(int)row;

@end
