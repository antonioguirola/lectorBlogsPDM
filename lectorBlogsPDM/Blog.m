//
//  Blog.m
//  lectorBlogsPDM
//
//  Created by Antonio Guirola on 20/05/14.
//  Copyright (c) 2014 Antonio Guirola. All rights reserved.
//

#import "Blog.h"

@implementation Blog

@synthesize sURL;

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setSURL:@""];
    }
    return self;
}

- (instancetype)initWithUrl:(NSString*) _sUrl
{
    self = [super init];
    if (self) {
        [self setSURL:_sUrl];
    }
    return self;
}

@end
