//
//  MemberClass.m
//  Meetup
//
//  Created by Michael Moss on 11/10/15.
//  Copyright © 2015 Mike. All rights reserved.
//

#import "MemberClass.h"

@implementation MemberClass


-(instancetype)initWithname:(NSString *)name dateOfComment:(NSString*)date commentFromUser:(NSString*)comment moreInfo:(NSString *)info
{
    self = [super init];
    if(self){
        self.name = name;
        self.date = date;
        self.comment = comment;
        self.info = info;
    }
    return self;
}



@end
