//
//  ResultViewController.h
//  IDCardDemo
//

#import <UIKit/UIKit.h>

@interface ResultViewController : UIViewController

@property (copy, nonatomic) NSString *resultString;
@property (copy, nonatomic) NSString *cropImagepath;
@property (copy, nonatomic) NSString *headImagepath;
@property (copy, nonatomic) NSString *originalImagepath;
@property (copy, nonatomic) NSString *typeName;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end
