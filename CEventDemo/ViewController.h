//
//  ViewController.h
//  CEventDemo
//
//  Created by roshan on 11/08/15.
//  Copyright (c) 2015 Pankanis Technologies. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <EventKitUI/EventKitUI.h>

@interface ViewController : UIViewController <EKEventEditViewDelegate>


- (IBAction)btnAddEventTapped:(id)sender;
@property (nonatomic) BOOL eventsAccessGranted;
- (IBAction)btnAddEventTappedNib:(id)sender;
+(void)pushView;
-(void)pushVC;
@end

