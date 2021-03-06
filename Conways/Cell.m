//
//  Cell.m
//  Conways
//
//  Created by Dominic Wroblewski on 29/05/2011.
//  Copyright 2011 Dominic Wroblewski. All rights reserved.
//

#import "Cell.h"

@implementation Cell
@synthesize state, nextState, neighbours;

- (Cell *)init
{
  state = FALSE;
  neighbours = [[NSMutableArray alloc] init];
  return self;
}

- (NSUInteger)neighboursCount
{
  return [neighbours count];
}

- (NSUInteger)aliveNeighboursCount
{
  int alive = 0;
  for (Cell * n in neighbours)
  {
    if (n.state)
    {
      alive += 1;
    }
  }
  return alive;
}

- (void)addNeighbour:(Cell *)cell
{
  if(![neighbours containsObject:cell])
  {
    [neighbours addObject:cell];
    [[cell neighbours] addObject:self];
  }
}

- (void)copyState
{
  if (nextState == 1)
  {
    state = TRUE;
  }
  else
  {
    state = FALSE;
  }
}

- (void)iterate
{
  if (nextState != -1)
  {
    [self copyState];
    nextState = -1;
  }
}

- (void)dealloc
{
  [super dealloc];
}

@end
