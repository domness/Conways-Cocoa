//
//  Cell.h
//  Conways
//
//  Created by Dominic Wroblewski on 29/05/2011.
//  Copyright 2011 Dominic Wroblewski. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Cell : NSObject {
  BOOL state;
  NSMutableArray * neighbours;
@private
}

@property (nonatomic, assign) BOOL state;
@property (nonatomic, assign) NSMutableArray * neighbours;

- (Cell *) init;
- (NSUInteger)neighbours_count;
- (void)addNeighbour:(Cell *)cell;

@end
