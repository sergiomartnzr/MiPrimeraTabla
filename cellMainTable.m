//
//  cellMainTable.m
//  Mi Primera Tabla
//
//  Created by Sergio Martinez on 9/23/17.
//  Copyright © 2017 Sergio Martinez. All rights reserved.
//

#import "cellMainTable.h"
#import "Home.h"

@implementation cellMainTable

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)btnSelectImage:(id)sender {
    
    NSLog(@"-------------btnSelectImagePressed");
    
    UIAlertController * alertController = [UIAlertController alertControllerWithTitle: @"Character data" message: @"Input Chanracter's name and age" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* galleryButton = [UIAlertAction actionWithTitle:@"Gallery" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        
        NSLog(@"you pressed gallery button");
    }];
    
    UIAlertAction* cameraButton = [UIAlertAction actionWithTitle:@"Camera" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
        
        NSLog(@"you pressed camera button");
    }];
    
    [alertController addAction:galleryButton];
    [alertController addAction:cameraButton];
    
    [self.window.rootViewController presentViewController:alertController animated:YES completion:nil];
}
@end
