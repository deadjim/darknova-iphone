#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface shipView : UIView /* Specify a superclass (eg: NSObject or NSView) */ {
	IBOutlet UITextView * label;
	IBOutlet UIImageView * shipImage;
	IBOutlet UILabel * shipName;
}


@end