//
//  CapturadorDatos.h
//  lectorBlogsPDM
//
//  Created by Antonio Guirola on 27/03/14.
//  Copyright (c) 2014 Antonio Guirola. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CapturadorDatos : NSObject

@property(nonatomic, copy)NSString* query;
@property(nonatomic, copy)NSString* url;
@property(nonatomic, copy)NSArray* aResultados;

// declaración de métodos
- (instancetype)init;
- (instancetype)initWithUrl:(NSString*) sUrl andQuery:(NSString*) sQuery;

-(NSArray*)parse;

@end
