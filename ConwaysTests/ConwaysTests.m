//
//  ConwaysTests.m
//  ConwaysTests
//
//  Created by Dominic Wroblewski on 28/05/2011.
//  Copyright 2011 Dominic Wroblewski. All rights reserved.
//

#import "ConwaysTests.h"

#define ROWS 5
#define COLUMNS 10

@implementation ConwaysTests

- (void)setUp
{
  grid = [[Grid alloc] initWithRows:ROWS andColumns:COLUMNS];
  [super setUp];
}

- (void)tearDown
{
  [grid release];
  [super tearDown];
}

- (void)testCellInitsAsDead
{
  Cell * cell = [[Cell alloc] init];
  STAssertFalse(cell.state, @"");
}

- (void)testCellShouldHaveNeigbours
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

- (void)testCellShouldOnlyHaveASpecificCellOnce
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

- (void)testCellShouldHaveAliveNeighbours
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

- (void)testCellShouldHaveANextState
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

- (void)testGridShouldContainAGridOfCells
{
  Cell * cell = [grid cellAtX:0 andY:0];
  STAssertFalse(cell.state, @"");
  [cell release];
}

- (void)testGridShouldHaveARowCount
{
  NSUInteger rows = ROWS;
  STAssertEquals(rows, [grid rowCount], @"");
}

- (void)testGridShouldHaveAColumnCount
{
  NSUInteger columns = COLUMNS;
  STAssertEquals(columns, [grid columnCount], @"");
}

- (void)testGridShouldHaveThreeNeighboursForCornerCells
{
  NSUInteger neighbours = 3;

  Cell * cell = [grid cellAtX:0 andY:0];
  STAssertEquals(neighbours, cell.neighboursCount, @"");

  cell = [grid cellAtX:0 andY:COLUMNS - 1];
  STAssertEquals(neighbours, cell.neighboursCount, @"");

  cell = [grid cellAtX:ROWS - 1 andY:COLUMNS - 1];
  STAssertEquals(neighbours, cell.neighboursCount, @"");

  cell = [grid cellAtX:ROWS - 1 andY:0];
  STAssertEquals(neighbours, cell.neighboursCount, @"");

  [cell release];
}

@end
