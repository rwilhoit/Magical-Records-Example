//
//  AddViewController.h
//  Locations
//
//  Created by Raj Wilhoit on 7/26/13.
//  Copyright (c) 2013 UF.rajwilhoit. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddViewController : UIViewController {
    IBOutlet UITextField *nameField;
    IBOutlet UITextField *dateField;
}

@property (strong, nonatomic) IBOutlet UITextField *nameField;
@property (strong, nonatomic) IBOutlet UITextField *dateField;

@end
