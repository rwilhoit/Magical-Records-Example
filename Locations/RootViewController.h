#import <CoreLocation/CoreLocation.h>
#import <UIKit/UIKit.h>

@interface RootViewController : UITableViewController

- (IBAction)addButtonSelected:(id)sender;
- (IBAction)deleteButtonSelected:(id)sender;

@property (strong, nonatomic) IBOutlet UIBarButtonItem *addContentButton;

@end