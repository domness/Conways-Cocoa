//
//  GameController.m
//  Conways
//
//  Created by Dominic Wroblewski on 30/05/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "GameController.h"


@implementation GameController

- (IBAction)play:(id)sender
{
  grid = [[Grid alloc] initWithRows:5 andColumns:10];
  Cell * cell = [grid cellAtX:2 andY:4];
  cell.state = TRUE;

//  NSCollectionViewItem * item = [collectionView itemAtIndex:5];
//  NSView * view = [[CellView alloc] initWithFrame:[[item view] frame]];
//  [view changeColor:[NSColor blackColor]];
//  [item setView:view];

  cell = [grid cellAtX:2 andY:5];
  cell.state = TRUE;
  [grid printGrid];
}

- (void)dealloc
{
  [super dealloc];
}

@end
