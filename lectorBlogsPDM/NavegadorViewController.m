//
//  NavegadorViewController.m
//  probandoiOS7
//
//  Created by Antonio Guirola on 20/05/14.
//  Copyright (c) 2014 Antonio Guirola. All rights reserved.
//

#import "NavegadorViewController.h"

@interface NavegadorViewController ()

@end

@implementation NavegadorViewController

@synthesize objBlog;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // Cargamos la dirección a visitar
    //NSString *urlCompleta = @"http://programacionmovilesugr.blogspot.com.es/";
    NSString *urlCompleta = [[self objBlog] sURL];
    NSURL *url = [NSURL URLWithString:urlCompleta];
    NSURLRequest *peticion = [NSURLRequest requestWithURL:url];
    
    // cargamos la página:
    [[self wvNavegador] loadRequest:peticion];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)cmdAtras:(id)sender {
    // realizamos la acción "atrás" en el navegador web
    [self.wvNavegador goBack];
}

- (IBAction)cmdCerrarNavegador:(id)sender {
    // cerramos el navegador
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
