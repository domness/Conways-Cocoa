//
//  Cell.m
//  Conways
//
//  Created by Dominic Wroblewski on 29/05/2011.
//  Copyright 2011 Dominic Wroblewski. All rights reserved.
//

#import "Cell.h"

@implementation Cell
@synthesize state;

- (Cell *) init
{
  state = FALSE;
  return self;
}

- (void)dealloc
{
  [super dealloc];
}

@end
