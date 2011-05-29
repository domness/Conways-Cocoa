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
  STAssertFalse(cell.state, @"");
}

- (void)testShouldHaveNeigbours
{
  Cell * cell1 = [[Cell alloc] init];
  Cell * cell2 = [[Cell alloc] init];

  NSUInteger zero = 0;
  NSUInteger one = 1;

  STAssertEquals(zero, cell1.neighboursCount, @"");
  STAssertEquals(zero, cell2.neighboursCount, @"");

  [cell1 addNeighbour:cell2];

  STAssertEquals(one, cell1.neighboursCount, @"");
  STAssertEquals(one, cell2.neighboursCount, @"");
}

- (void)testShouldOnlyHaveASpecificCellOnce
{
  Cell * cell1 = [[Cell alloc] init];
  Cell * cell2 = [[Cell alloc] init];

  NSUInteger zero = 0;
  NSUInteger one = 1;

  STAssertEquals(zero, cell1.neighboursCount, @"");
  STAssertEquals(zero, cell2.neighboursCount, @"");

  [cell1 addNeighbour:cell2];
  [cell1 addNeighbour:cell2];

  STAssertEquals(one, cell1.neighboursCount, @"");
  STAssertEquals(one, cell2.neighboursCount, @"");
}

- (void)testShouldHaveAliveNeighbours
{
  Cell * cell1 = [[Cell alloc] init];
  Cell * cell2 = [[Cell alloc] init];
  Cell * cell3 = [[Cell alloc] init];

  NSUInteger zero = 0;
  NSUInteger one = 1;
  NSUInteger two = 2;

  [cell1 addNeighbour:cell2];
  STAssertEquals(zero, cell1.aliveNeighboursCount, @"");
  cell2.state = TRUE;
  STAssertEquals(one, cell1.aliveNeighboursCount, @"");
  cell3.state = TRUE;
  [cell1 addNeighbour:cell3];
  STAssertEquals(two, cell1.aliveNeighboursCount, @"");
}

- (void)testShouldHaveANextState
{
  Cell * cell1 = [[Cell alloc] init];
  STAssertFalse(cell1.state, @"");

  cell1.state = TRUE;
  STAssertTrue(cell1.state, @"");

  cell1.nextState = 0;
  STAssertTrue(cell1.state, @"");

  [cell1 iterate];
  STAssertFalse(cell1.state, @"");

  cell1.nextState = 1;
  STAssertFalse(cell1.state, @"");

  [cell1 iterate];
  STAssertTrue(cell1.state, @"");

  [cell1 iterate];
  STAssertTrue(cell1.state, @"");

  cell1.state = FALSE;
  STAssertFalse(cell1.state, @"");

  [cell1 iterate];
  STAssertFalse(cell1.state, @"");
}

@end
