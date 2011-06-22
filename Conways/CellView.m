//
//  CellView.m
//  Conways
//
//  Created by Dominic Wroblewski on 30/05/2011.
//  Copyright 2011 Dominic Wroblewski. All rights reserved.
//

#import "CellView.h"

@implementation CellView
@synthesize myColor;

- (void)drawRect:(NSRect)rect
{
  [myColor set];
  NSRectFill([self bounds]);
}

- (void)changeColor:(NSColor*) aColor
{
  myColor = aColor;
}

@end