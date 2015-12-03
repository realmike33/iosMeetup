//
//  ViewController.m
//  Meetup
//
//  Created by Michael Moss on 11/10/15.
//  Copyright © 2015 Mike. All rights reserved.
//

#import "ViewController.h"
#import "EventClass.h"
#import "EventDetailViewController.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property NSMutableArray *meetups;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.meetups = [[NSMutableArray alloc] init];
    [EventClass retrieveMeetupsWithCompletion:^(NSArray *meetups) {
        self.meetups = [meetups mutableCopy];
        [self.tableView reloadData];
    }];

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger) section{
        return self.meetups.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
        UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"cell"];
        EventClass *event = [self.meetups objectAtIndex:indexPath.row];
        cell.textLabel.text = event.name;
        cell.detailTextLabel.text = event.address;
        return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    EventDetailViewController *vc = [segue destinationViewController];
    NSIndexPath *path = [self.tableView indexPathForSelectedRow];
    vc.selectedEvent = self.meetups[path.row];
}

@end
