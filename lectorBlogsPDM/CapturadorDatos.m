//
//  CapturadorDatos.m
//  probandoiOS7
//
//  Created by Antonio Guirola on 27/03/14.
//  Copyright (c) 2014 Antonio Guirola. All rights reserved.
//

#import "CapturadorDatos.h"
#import "TFHpple.h"

@implementation CapturadorDatos

@synthesize query = _query;
@synthesize url = _url;
@synthesize aResultados = _aResultados;


// constructores

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.query = @"";
        self.url = @"";
    }
    return self;
}

- (instancetype)initWithUrl:(NSString*) sUrl andQuery:(NSString*) sQuery
{
    self = [super init];
    if (self) {
        self.query = sQuery;
        self.url = sUrl;
    }
    return self;
}


// métodos propios

-(NSArray*)parse {
    // 1
    NSURL *urlGeneral =[NSURL URLWithString: self.url];
    NSData *htmlData =[NSData dataWithContentsOfURL: urlGeneral];
    
    // 2
    
    TFHpple *parser =[TFHpple hppleWithHTMLData: htmlData];
    
    // 3
    
    NSString *sCadenaBusqueda = self.query;
    
    NSArray *aNodos =[parser searchWithXPathQuery:sCadenaBusqueda];
    
    return aNodos;
}

@end
