//
//  CellView.h
//  Conways
//
//  Created by Dominic Wroblewski on 30/05/2011.
//  Copyright 2011 Dominic Wroblewski. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface CellView : NSView {
  NSColor * myColor; 
}

@property (nonatomic, retain) NSColor * myColor;

- (void)changeColor:(NSColor*)aColor;

@end