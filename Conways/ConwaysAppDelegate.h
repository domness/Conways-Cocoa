//
//  ConwaysAppDelegate.h
//  Conways
//
//  Created by Dominic Wroblewski on 28/05/2011.
//  Copyright 2011 Dominic Wroblewski. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ConwaysAppDelegate : NSObject <NSApplicationDelegate> {
@private
  NSWindow *window;
}

@property (assign) IBOutlet NSWindow *window;

@end
