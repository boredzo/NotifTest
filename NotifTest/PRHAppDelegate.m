//
//  PRHAppDelegate.m
//  NotifTest
//
//  Created by Peter Hosey on 2014-08-10.
//  Copyright (c) 2014 Peter Hosey. All rights reserved.
//

#import "PRHAppDelegate.h"

@interface PRHAppDelegate ()
- (IBAction)sendNotifications:(id)sender;

@end

@implementation PRHAppDelegate

- (void)awakeFromNib {
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notified) name:@"foo" object:nil];
	[[[NSWorkspace sharedWorkspace] notificationCenter] addObserver:self selector:@selector(notified) name:@"foo" object:nil];
	[[NSDistributedNotificationCenter defaultCenter] addObserver:self selector:@selector(notified) name:@"foo" object:nil];
}

- (void) notified {
	NSLog(@"Notified");
}

- (IBAction)sendNotifications:(id)sender {
	[[NSNotificationCenter defaultCenter] postNotificationName:@"foo" object:nil];
	NSLog(@"Sent via default local");
	[[[NSWorkspace sharedWorkspace] notificationCenter] postNotificationName:@"foo" object:nil];
	NSLog(@"Sent via NSWorkspace local");
	[[NSDistributedNotificationCenter defaultCenter] postNotificationName:@"foo" object:nil];
	NSLog(@"Sent via default distributed");
	NSLog(@"Done sending");
}

@end
