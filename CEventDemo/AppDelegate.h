//
//  AppDelegate.h
//  CEventDemo
//
//  Created by roshan on 11/08/15.
//  Copyright (c) 2015 Pankanis Technologies. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <EventKit/EventKit.h>
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic) BOOL eventsAccessGranted;

@property (nonatomic,strong) EKEventStore *eventStore;

@property (nonatomic,strong) NSString *foo;
+(AppDelegate *)sharedInstance;
//-(void)foobar;
@end

