//
//  ViewController.m
//  CEventDemo
//
//  Created by roshan on 11/08/15.
//  Copyright (c) 2015 Pankanis Technologies. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "EventViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//Below method is Storyboard button event
-(IBAction)btnAddEventTapped:(id)sender
{
    
    EKEventEditViewController *editVC = [[EKEventEditViewController alloc]init];
    
    AppDelegate *app = [AppDelegate sharedInstance];
    editVC.eventStore = app.eventStore;
    editVC.editViewDelegate=self;
    [self presentViewController:editVC animated:YES completion:nil];
}

#pragma EKEvent Delegate Methods
-(void)eventEditViewController:(EKEventEditViewController *)controller didCompleteWithAction:(EKEventEditViewAction)action

{
    if (action == EKEventEditViewActionSaved)
    {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"Event has been saved" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
    else
    
    {
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];

}

-(IBAction)btnAddEventTappedNib:(id)sender {

    EKEventEditViewController *editEventVC = [[EKEventEditViewController alloc]init];

    AppDelegate *app = [AppDelegate sharedInstance];
    editEventVC.eventStore = app.eventStore;
    editEventVC.editViewDelegate=self;
    [self presentViewController:editEventVC animated:YES completion:nil];
}
@end
