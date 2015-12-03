//
//  EventClass.h
//  Meetup
//
//  Created by Michael Moss on 11/10/15.
//  Copyright © 2015 Mike. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EventClass : NSObject
@property NSURL *url;
@property NSString *name;
@property NSString *count;
@property NSString *info;
@property NSString *address;

-(instancetype)initWithUrl:(NSString *)url name:(NSString *)name rsvpCount:(NSString*)count description:(NSString*)info address:(NSString*)address;
+(void)retrieveMeetupsWithCompletion:(void(^)(NSArray *))complete;

@end
