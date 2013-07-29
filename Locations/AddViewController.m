//
//  AddViewController.m
//  MagcalRecord Example
//
//  Created by Alexander Blunck on 4/13/13.
//  Copyright (c) 2013 Alexander Blunck. All rights reserved.
//

#import "AddViewController.h"
#import "Event.h"

@implementation AddViewController

@synthesize nameField;
@synthesize dateField;

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
    if (nameField.text.length > 0 & dateField.text.length > 0) {
        
        //Create new entity and set properties
        Event *newEvent = [Event MR_createEntity];
        newEvent.name = nameField.text;
        newEvent.date = dateField.text;
        
        //Save to persistant storage
        [[NSManagedObjectContext MR_defaultContext] saveToPersistentStoreAndWait];

        return YES;
    }

    [[[UIAlertView alloc] initWithTitle:@"Warning" message:@"Please fill out all fields" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
    
    return NO;
}
@end
