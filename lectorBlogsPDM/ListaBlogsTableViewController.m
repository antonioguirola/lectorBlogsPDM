//
//  ListaBlogsTableViewController.m
//  lectorBlogsPDM
//
//  Created by Antonio Guirola on 08/05/14.
//  Copyright (c) 2014 Antonio Guirola. All rights reserved.
//

#import "ListaBlogsTableViewController.h"
#import "CapturadorDatos.h"
#import "TFHpple.h"
#import "NavegadorViewController.h"
#import "Blog.h"

@interface ListaBlogsTableViewController ()

@end

@implementation ListaBlogsTableViewController

@synthesize aListaBlogs;
@synthesize sUrlSeleccionada;
@synthesize color1;
@synthesize color2;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        
        // obtenemos el listado de blogs en primer lugar
        [self setAListaBlogs:[self obtenerBlogs]];
        
        // iniciamos los colores de fondo para el pijama de la lista de blogs
        [self setColor1: [UIColor colorWithRed:173.0/255.0 green:216.0/255.0 blue:230.0/255.0 alpha:1.0]];
        [self setColor2: [UIColor colorWithRed:209.0/255.0 green:206.0/255.0 blue:214.0/255.0 alpha:1.0]];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    // Cargamos la lista de blogs
    self.aListaBlogs = [self obtenerBlogs];
    
    // Fijamos el color de fondo de la etiqueta de título:
    [self.labelCabecera setBackgroundColor:[self color2]];
}

-(NSArray*)obtenerBlogs
{
    CapturadorDatos *objCapturador = [[CapturadorDatos alloc]init];
    [objCapturador setUrl:@"http://programacionmovilesugr.blogspot.com.es/2014/03/lista-de-blogs.html"];
    [objCapturador setQuery:@"//div[@itemprop='blogPost']//li/a"];
    
    NSArray* aObjsParser = [objCapturador parse];
    
    // Extraemos únicamente las URLs de los blogs
    
    NSMutableArray *aUrlBlogs =[[NSMutableArray alloc] initWithCapacity: 0];
    
    for(TFHppleElement *element in aObjsParser){
        NSLog(@"Elemento encontrado: %@", [element objectForKey:@"href"]);
    
        [aUrlBlogs addObject:[element objectForKey:@"href"]];
    }
    
    for (NSString *sUrl in aUrlBlogs) {
        NSLog(@"URL = %@", sUrl);
    }
    
    NSArray* aResultado = [[NSArray alloc] initWithArray:aUrlBlogs];
    
    return aResultado;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [[self aListaBlogs] count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // obtenemos la clase de celda indicada en el storyboard
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"celdaURL" forIndexPath:indexPath];
    
    // Fijamos como texto de la misma el contenido del array de blogs
    NSString* sURL = [[self aListaBlogs] objectAtIndex:[indexPath row]];
    [[cell textLabel] setText: sURL];
    
    // en función de si se trata de una celda par o impar pintamos su fondo
    if ([indexPath row] % 2 == 0) {
        [cell setBackgroundColor:[self color1]];
    } else {
        [cell setBackgroundColor:[self color2]];
    }
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Extraemos la fila seleccionada
    NSIndexPath* indexPath = [self.tableView indexPathForSelectedRow];
    NSString* sURL = [[self aListaBlogs] objectAtIndex:[indexPath row]];
    
    // construimos un objeto Blog con la URL actual
    Blog* objBlog = [[Blog alloc] initWithUrl:sURL];
    
    // extraemos el controlador de la siguiente vista
    NavegadorViewController* nvc = [segue destinationViewController];
    
    // le enviamos el objeto
    [nvc setObjBlog:objBlog];
}


@end
