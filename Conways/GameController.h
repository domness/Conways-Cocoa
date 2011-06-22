//
//  GameController.h
//  Conways
//
//  Created by Dominic Wroblewski on 30/05/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Grid.h"
#import "Cell.h"
#import "CellView.h"

@interface GameController : NSViewController {

@private
  Grid * grid;
}

- (IBAction)play:(id)sender;

@end
