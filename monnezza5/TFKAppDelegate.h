//
//  TFKAppDelegate.h
//  monnezza5
//
//  Created by Stefano Ballirano on 08/11/15.
//  Copyright (c) 2015 Stefano Ballirano. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface TFKAppDelegate : NSObject <NSApplicationDelegate, NSMenuDelegate>

@property (assign) IBOutlet NSWindow *window;
@property NSArray *runningApps;
@property (weak) IBOutlet NSColorWell *colorApp;
@property (weak) IBOutlet NSSlider *slider;
@property (weak) IBOutlet NSTableView *myTableView;
@property (weak) IBOutlet NSMenu *myMenu;
@property  NSWindow *myWindow;
- (IBAction)openWindow:(id)sender;

@end
