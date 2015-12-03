//
//  EventClass.m
//  Meetup
//
//  Created by Michael Moss on 11/10/15.
//  Copyright © 2015 Mike. All rights reserved.
//

#import "EventClass.h"

@implementation EventClass

-(instancetype)initWithUrl:(NSString *)url name:(NSString *)name rsvpCount:(NSString*)count description:(NSString*)info address:(NSString*)address
{
    self = [super init];
    if(self){
        self.url = [NSURL URLWithString:url];
        self.name = name;
        self.count = count;
        self.info = info;
        self.address = address;
    }
    return self;
}

+(void)retrieveMeetupsWithCompletion:(void(^)(NSArray *))complete{
    
    NSURL *url = [NSURL URLWithString:@"https://api.meetup.com/2/open_events.json?zip=60604&text=mobile&time=,1w&key=477d1928246a4e162252547b766d3c6d"];
    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSMutableArray *meetups = [[NSMutableArray alloc] init];
        NSDictionary *webData;
        
        webData = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        NSDictionary *result = [webData objectForKey:@"results"];
        for(NSDictionary *dictionary in result){
            NSDictionary *venue = [dictionary valueForKey:@"venue"];
        EventClass *event = [[EventClass alloc] initWithUrl:[dictionary valueForKey:@"event_url"] name:[dictionary valueForKey:@"name"] rsvpCount:[dictionary valueForKey:@"headcount"] description:[dictionary valueForKey:@"description"] address:[venue valueForKey:@"address_1"]];
            [meetups addObject:event];
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            complete(meetups);
        });
    }];
    [task resume];
}

@end
