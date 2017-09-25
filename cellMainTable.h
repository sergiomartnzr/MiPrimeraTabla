//
//  cellMainTable.h
//  Mi Primera Tabla
//
//  Created by Sergio Martinez on 9/23/17.
//  Copyright © 2017 Sergio Martinez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface cellMainTable : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imgUser;
@property (weak, nonatomic) IBOutlet UILabel *lbName;
@property (weak, nonatomic) IBOutlet UILabel *lbAge;
- (IBAction)btnSelectImage:(id)sender;

@end
