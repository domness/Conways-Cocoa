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
  int nextState;
  NSMutableArray * neighbours;
@private
}

@property (nonatomic, assign) BOOL state;
@property (nonatomic, assign) int nextState;
@property (nonatomic, assign) NSMutableArray * neighbours;

- (Cell *)init;
- (NSUInteger)neighboursCount;
- (NSUInteger)aliveNeighboursCount;
- (void)addNeighbour:(Cell *)cell;
- (void)iterate;

@end
