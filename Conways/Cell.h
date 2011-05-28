//
//  Cell.h
//  Conways
//
//  Created by Dominic Wroblewski on 29/05/2011.
//  Copyright 2011 Dominic Wroblewski. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Cell : NSObject {
  BOOL state;
}

@property (nonatomic, assign) BOOL state;

- (Cell *) init;

@end
