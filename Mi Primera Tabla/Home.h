//
//  ViewController.h
//  Mi Primera Tabla
//
//  Created by Sergio Martinez on 9/23/17.
//  Copyright © 2017 Sergio Martinez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Home : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate> {
}
@property (weak, nonatomic) IBOutlet UITableView *tbMain;
- (IBAction)btnAddPressed:(id)sender;

@end

