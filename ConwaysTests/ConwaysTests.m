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

  cell = [grid cellAtX:0 andY:COLUMNS-1];
  STAssertEquals(neighbours, cell.neighboursCount, @"");

  cell = [grid cellAtX:ROWS-1 andY:COLUMNS-1];
  STAssertEquals(neighbours, cell.neighboursCount, @"");

  cell = [grid cellAtX:ROWS-1 andY:0];
  STAssertEquals(neighbours, cell.neighboursCount, @"");

  [cell release];
}

- (void)testGridShouldHaveFiveNeighboursInFirstAndLastRowsExceptCorners
{
  NSUInteger neighbours = 5;
  for (int i = 1; i < COLUMNS - 1; i++)
  {
    Cell * cell = [grid cellAtX:0 andY:i];
    STAssertEquals(neighbours, cell.neighboursCount, @"");
    cell = [grid cellAtX:ROWS - 1 andY:i];
    STAssertEquals(neighbours, cell.neighboursCount, @"");
    [cell release];
  }
}

- (void)testGridShouldHaveFiveNeighboursInFirstAndLastColumnExceptCorners
{
  NSUInteger neighbours = 5;
  for (int i = 1; i < ROWS - 1; i++)
  {
    Cell * cell = [grid cellAtX:i andY:0];
    STAssertEquals(neighbours, cell.neighboursCount, @"");
    cell = [grid cellAtX:i andY:COLUMNS - 1];
    STAssertEquals(neighbours, cell.neighboursCount, @"");
    [cell release];
  }
}

- (void)testGridShouldHaveEightNeighboursWhenNotAlongEdges
{
  NSUInteger neighbours = 8;
  for (int x = 1; x < ROWS - 1; x++)
  {
    for (int y = 1; y < COLUMNS - 1; y++)
    {
      Cell * cell = [grid cellAtX:x andY:y];
      STAssertEquals(neighbours, cell.neighboursCount, @"");
      [cell release];
    }
  }
}

- (void)testGridCellsShouldDieWhenTheyAreUnderPopulated
{
  Cell * cell = [grid cellAtX:3 andY:3];
  STAssertFalse(cell.state, @"");
  cell.state = TRUE;
  [grid evolve];
  STAssertFalse(cell.state, @"");
}

- (void)testGridShouldHaveCellsThatAreReborn
{
  Cell * cell1 = [grid cellAtX:0 andY:0];
  cell1.state = TRUE;
  [cell1 release];
  Cell * cell2 = [grid cellAtX:1 andY:0];
  cell2.state = TRUE;
  [cell2 release];
  Cell * cell3 = [grid cellAtX:2 andY:0];
  cell3.state = TRUE;
  [cell3 release];

  Cell * testCell = [grid cellAtX:1 andY:1];
  testCell.state = FALSE;

  [grid evolve];
  STAssertTrue(testCell.state, @"");
  [testCell release];
}

- (void)testGridShouldHaveCellsThatAreOverPopulated
{
  Cell * cell1 = [grid cellAtX:0 andY:0];
  cell1.state = TRUE;
  [cell1 release];
  Cell * cell2 = [grid cellAtX:1 andY:0];
  cell2.state = TRUE;
  [cell2 release];
  Cell * cell3 = [grid cellAtX:2 andY:0];
  cell3.state = TRUE;
  [cell3 release];
  Cell * cell4 = [grid cellAtX:0 andY:1];
  cell4.state = TRUE;
  [cell4 release];

  Cell * testCell = [grid cellAtX:1 andY:1];
  testCell.state = TRUE;

  [grid evolve];
  STAssertFalse(testCell.state, @"");
  [testCell release];
}

- (void)testGridShouldBeAbleToPrintOutItsRows
{
  NSString * row = [grid getRow:1];
  STAssertEqualObjects(@"0000000000", row, @"");

  Cell * cell = [grid cellAtX:1 andY:2];
  cell.state = TRUE;
  row = [grid getRow:1];
  STAssertEqualObjects(@"0010000000", row, @"");

  cell = [grid cellAtX:1 andY:3];
  cell.state = TRUE;
  row = [grid getRow:1];
  STAssertEqualObjects(@"0011000000", row, @"");

  [cell release];
}

@end
