//
//  Grid.m
//  Conways
//
//  Created by Dominic Wroblewski on 29/05/2011.
//  Copyright 2011 Dominic Wroblewski. All rights reserved.
//

#import "Grid.h"

@implementation Grid

- (Grid *)initWithRows:(int)rows andColumns:(int)columns
{
  map = [[NSMutableArray alloc] initWithCapacity:rows];
  for (int x = 0; x < rows; x++)
  {
    NSMutableArray * col = [[NSMutableArray alloc] initWithCapacity:columns];
    [map insertObject:col atIndex:x];
    for (int y = 0; y < columns; y++)
    {
      Cell * cell = [[Cell alloc] init];
      [[map objectAtIndex:x] insertObject:cell atIndex:y];
      if (x > 0)
      {
        [cell addNeighbour:[[map objectAtIndex:x-1] objectAtIndex:y]];
        if (y <= columns-2)
        {
          [cell addNeighbour:[[map objectAtIndex:x-1] objectAtIndex:y+1]];
        }
      }
      if (y > 0)
      {
        [cell addNeighbour:[[map objectAtIndex:x] objectAtIndex:y-1]];
        if (x > 0)
        {
          [cell addNeighbour:[[map objectAtIndex:x-1] objectAtIndex:y-1]];
        }
      }
    }
  }
  return self;
}

- (Cell *)cellAtX:(int)x andY:(int)y
{
  return [[map objectAtIndex:x] objectAtIndex:y];
}

- (NSUInteger)rowCount
{
  return [map count];
}

- (NSUInteger)columnCount
{
  return [[map objectAtIndex:0] count];
}

- (void)dealloc
{
  [super dealloc];
}

@end
