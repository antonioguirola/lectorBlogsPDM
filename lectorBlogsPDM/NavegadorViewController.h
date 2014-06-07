//
//  NavegadorViewController.h
//  probandoiOS7
//
//  Created by Antonio Guirola on 20/05/14.
//  Copyright (c) 2014 Antonio Guirola. All rights reserved.
//

#import "Blog.h"


@interface NavegadorViewController : UIViewController

// navegador web
@property (weak, nonatomic) IBOutlet UIWebView *wvNavegador;

// blog a representar
@property (nonatomic, retain) Blog* objBlog;

@property (weak, nonatomic) IBOutlet UIButton *botonAtras;
@property (weak, nonatomic) IBOutlet UIButton *botonLista;

- (IBAction)cmdAtras:(id)sender;
- (IBAction)cmdCerrarNavegador:(id)sender;

@end
