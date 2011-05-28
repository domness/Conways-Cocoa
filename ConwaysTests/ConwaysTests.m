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
    
  cell = [[Cell alloc] init];
}

- (void)tearDown
{
  [cell release];
  
  [super tearDown];
}

- (void)testCellInitsAsDead
{
  BOOL state = FALSE;
  STAssertEquals(state, cell.state, @"Cell state was not dead.");
}

@end
