//
//  TFKAppDelegate.m
//  monnezza5
//
//  Created by Stefano Ballirano on 08/11/15.
//  Copyright (c) 2015 Stefano Ballirano. All rights reserved.
//

#import "TFKAppDelegate.h"

@implementation TFKAppDelegate

NSWindow *myWindow2;
NSInteger rigaSelezionata =0;
- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    self.runningApps = [NSMutableArray arrayWithArray:[[NSWorkspace sharedWorkspace] runningApplications]];
    NSInteger selez = [self.myTableView selectedRow];
    NSLog(@"%ld", (long)selez);
    [self.myTableView deselectRow:selez];
    
    
    
    
    
}


- (void)tableViewSelectionDidChange:(NSNotification *)aNotification{
    if ([self.myTableView selectedRow] == -1) {
        return;
    }
    rigaSelezionata = [self.myTableView selectedRow];
    
    [[self.runningApps objectAtIndex:rigaSelezionata] setValue:[[[self.runningApps objectAtIndex:rigaSelezionata] valueForKey:@"localizedName"] uppercaseString] forKey:@"localizedName"] ;

}

-(void) changeColor{
    [self.colorApp setColor:[NSColor greenColor]];
    
}


- (void) menuWillOpen:(NSMenu *)menu{
    if ([[menu title] isEqualToString:@"Show Fonts"]) {
        NSLog(@"%@", menu);
    }
    
    NSLog(@"%@", menu);
}
- (IBAction)openWindow:(id)sender {
    self.myWindow = nil;
   myWindow2 = [[NSWindow alloc] initWithContentRect:NSMakeRect(50, 50, 500, 200) styleMask:(NSTitledWindowMask | NSMiniaturizableWindowMask | NSResizableWindowMask | NSClosableWindowMask) backing:NSBackingStoreBuffered defer:NO];
    [myWindow2 setReleasedWhenClosed:NO];
    self.myWindow = myWindow2;
    [self.myWindow setDelegate:(id)self];
    NSButton *myButton = [[NSButton alloc] initWithFrame:NSMakeRect(100, 100, 130, 50)];
    [myButton setTitle:@"Green"];
    [myButton setButtonType:NSMomentaryLightButton];
    [myButton setBezelStyle:NSRoundedBezelStyle];
    [myButton setAction:@selector(changeColor)];
    [[self.myWindow contentView] addSubview:myButton];
    [self.myWindow makeKeyAndOrderFront:NSApp];
    

}

- (void)windowWillClose:(NSNotification *)notification{
    
        myWindow2 = nil;
}

- (void)windowWillMiniaturize:(NSNotification *)notification{
    
    NSLog(@"miniaturized");
}

- (void)windowDidDeminiaturize:(NSNotification *)notification{
    
    NSLog(@"deminiaturized");
}
@end
