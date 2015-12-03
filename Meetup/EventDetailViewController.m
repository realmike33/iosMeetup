//
//  EventDetailViewController.m
//  Meetup
//
//  Created by Michael Moss on 11/10/15.
//  Copyright © 2015 Mike. All rights reserved.
//

#import "EventDetailViewController.h"

@interface EventDetailViewController ()
@property (weak, nonatomic) IBOutlet UITextView *eventName;
@property (weak, nonatomic) IBOutlet UITextView *rsvpCount;
@property (weak, nonatomic) IBOutlet UITextView *venueInfo;
@property (weak, nonatomic) IBOutlet UITextView *eventDesc;

@end

@implementation EventDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.eventName.text = [NSString stringWithFormat:@"%@ is hosting this event", self.selectedEvent.name];
    self.rsvpCount.text = [NSString stringWithFormat:@"%@ have signedup to this meetup!", self.selectedEvent.count];
    self.venueInfo.text = [NSString stringWithFormat:@"Address: %@", self.selectedEvent.address];
    self.eventDesc.text = self.selectedEvent.info;
}

#pragma mark - Navigation


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
