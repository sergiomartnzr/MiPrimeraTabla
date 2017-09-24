//
//  ViewController.m
//  Mi Primera Tabla
//
//  Created by Sergio Martinez on 9/23/17.
//  Copyright © 2017 Sergio Martinez. All rights reserved.
//

#import "Home.h"
#import "cellMainTable.h"

@interface Home ()
@property NSMutableArray *userNames;
@property NSMutableArray *userAges;
@property NSMutableArray *userImages;
@end

@implementation Home
/**********************************************************************************************/
#pragma mark - Initialization methods
/**********************************************************************************************/
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self initController];
}
//-------------------------------------------------------------------------------
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//-------------------------------------------------------------------------------
- (void)initController {
    self.userNames  = [[NSMutableArray alloc] initWithObjects: @"Tyrion Lannister", @"Daenerys Targaryen", @"Jon Snow", @"Arya Stark", @"Cersei Lannister", nil];
    
    self.userAges  = [[NSMutableArray alloc] initWithObjects: @"38 años", @"22 años", @"25 años", @"16 años", @"42 años", nil];
    
    self.userImages = [[NSMutableArray alloc] initWithObjects: @"tyrion.jpg", @"daenerys.jpg", @"jon.jpg", @"arya.jpg", @"cersei.jpg", nil];
}

/**********************************************************************************************/
#pragma mark - Table source and delegate methods
/**********************************************************************************************/
//Numero de secciones de la tabla
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
//-------------------------------------------------------------------------------
//Numero de elementos de la tabla
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.userNames.count;
}
//-------------------------------------------------------------------------------
//Ancho de cada renglon de la tabla
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 64;
}
//-------------------------------------------------------------------------------
//Inicializacion y manipulacion de la celda
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //Initialize cells
    cellMainTable *cell = (cellMainTable *)[tableView dequeueReusableCellWithIdentifier:@"cellMainTable"];
    
    if (cell == nil) {
        [tableView registerNib:[UINib nibWithNibName:@"cellMainTable" bundle:nil] forCellReuseIdentifier:@"cellMainTable"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"cellMainTable"];
    }
    //Fill cell with info from arrays
    cell.lbName.text       = self.userNames[indexPath.row];
    cell.lbAge.text        = self.userAges[indexPath.row];
    cell.imgUser.image      = [UIImage imageNamed:self.userImages[indexPath.row]];
    
    return cell;
}
//-------------------------------------------------------------------------------
//Al hacer click en una celda abre otra vista con detalles
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //Pending
}
/**********************************************************************************************/
#pragma mark - Action methods
/**********************************************************************************************/
- (IBAction)btnAddPressed:(id)sender {

    UIAlertController * alertController = [UIAlertController alertControllerWithTitle: @"Character data"
                                                                              message: @"Input Chanracter's name and age"
                                                                       preferredStyle:UIAlertControllerStyleAlert];
    [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"name";
        textField.textColor = [UIColor blueColor];
        textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        textField.borderStyle = UITextBorderStyleRoundedRect;
    }];
    [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"age";
        textField.textColor = [UIColor blueColor];
        textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        textField.borderStyle = UITextBorderStyleRoundedRect;
    }];
    [alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        NSArray * textfields = alertController.textFields;
        UITextField * nameField = textfields[0];
        UITextField * ageFiled = textfields[1];
        NSLog(@"------------------%@:----------------------%@",nameField.text,ageFiled.text);
        
        [self.userNames addObject:nameField.text];
        [self.userAges addObject:ageFiled.text];
        [self.userImages addObject:@"jon.jpg"];
        
        [self.tbMain reloadData];

    }]];
    [self presentViewController:alertController animated:YES completion:nil];
    
    
}

@end
