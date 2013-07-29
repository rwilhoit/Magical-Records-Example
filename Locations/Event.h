//
//  Event.h
//  Locations
//
//  Created by Raj Wilhoit on 7/25/13.
//  Copyright (c) 2013 UF.rajwilhoit. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Event : NSManagedObject

@property (nonatomic, retain) NSString * date;
@property (nonatomic, retain) NSString * name;

@end
