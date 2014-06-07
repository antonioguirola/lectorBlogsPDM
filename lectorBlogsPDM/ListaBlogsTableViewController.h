//
//  ListaBlogsTableViewController.h
//  lectorBlogsPDM
//
//  Created by Antonio Guirola on 08/05/14.
//  Copyright (c) 2014 Antonio Guirola. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListaBlogsTableViewController : UITableViewController

@property (nonatomic,retain) NSArray* aListaBlogs;
@property (nonatomic,retain) NSString* sUrlSeleccionada;

@property (weak, nonatomic) IBOutlet UILabel *labelCabecera;

@property(nonatomic,retain) UIColor* color1;
@property(nonatomic,retain) UIColor* color2;


@end
