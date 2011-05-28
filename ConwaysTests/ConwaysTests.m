//
//  ConwaysTests.m
//  ConwaysTests
//
//  Created by Dominic Wroblewski on 28/05/2011.
//  Copyright 2011 Dominic Wroblewski. All rights reserved.
//

#import "ConwaysTests.h"


@implementation ConwaysTests

- (void)setUp
{
  [super setUp];
}

- (void)tearDown
{
  [super tearDown];
}

- (void)testCellInitsAsDead
{
  Cell * cell = [[Cell alloc] init];
  BOOL state = FALSE;
  STAssertEquals(state, cell.state, @"Cell state was not dead.");
}

- (void)testShouldHaveNeigbours
{
  Cell * cell1 = [[Cell alloc] init];
  Cell * cell2 = [[Cell alloc] init];

  NSUInteger zero = 0;
  NSUInteger one = 1;

  STAssertEquals(zero, cell1.neighbours_count, @"Cell1 had incorrect neighbours");
  STAssertEquals(zero, cell2.neighbours_count, @"Cell2 had incorrect neighbours");

  [cell1 addNeighbour:cell2];

  STAssertEquals(one, cell1.neighbours_count, @"Cell1 had incorrect neighbours");
  STAssertEquals(one, cell2.neighbours_count, @"Cell2 had incorrect neighbours");
}

@end
