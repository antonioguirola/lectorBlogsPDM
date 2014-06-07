//
//  Blog.h
//  probandoiOS7
//
//  Created by Antonio Guirola on 20/05/14.
//  Copyright (c) 2014 Antonio Guirola. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Blog : NSObject

@property (nonatomic,retain) NSString* sURL;


-(instancetype) init;
-(instancetype) initWithUrl:(NSString*) sUrl;

@end
