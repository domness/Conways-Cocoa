//
//  Cell.m
//  Conways
//
//  Created by Dominic Wroblewski on 29/05/2011.
//  Copyright 2011 Dominic Wroblewski. All rights reserved.
//

#import "Cell.h"

@implementation Cell
@synthesize state, neighbours;

- (Cell *) init
{
  state = FALSE;
  neighbours = [[NSMutableArray alloc] init];
  return self;
}

- (NSUInteger)neighbours_count
{
  return [neighbours count];
}

- (void)addNeighbour:(Cell *)cell
{
  if(![neighbours containsObject:cell])
  {
    [neighbours addObject:cell];
    [[cell neighbours] addObject:self];
  }
}

- (void)dealloc
{
  [super dealloc];
}

@end
