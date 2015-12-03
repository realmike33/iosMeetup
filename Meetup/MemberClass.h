//
//  MemberClass.h
//  Meetup
//
//  Created by Michael Moss on 11/10/15.
//  Copyright © 2015 Mike. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MemberClass : NSObject
@property NSString *name;
@property NSString *date;
@property NSString *comment;
@property NSString *info;

-(instancetype)initWithname:(NSString *)name dateOfComment:(NSString*)date commentFromUser:(NSString*)comment moreInfo:(NSString *)info;

@end
