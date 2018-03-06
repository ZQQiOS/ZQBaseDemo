//
//  ResultViewController.m
//  IDCardDemo
//

#import "ResultViewController.h"
#import "ViewController.h"
#import "Reachability.h"

@interface ResultViewController ()<UIAlertViewDelegate,NSURLConnectionDelegate, NSURLConnectionDataDelegate>

@end

@implementation ResultViewController

- (void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = [UIColor whiteColor];
    UIImage *image = [UIImage imageWithContentsOfFile:self.cropImagepath];
    self.imageView.image = image;
    self.textView.text = self.resultString;
    self.textView.layoutManager.allowsNonContiguousLayout = NO;
    
    UIButton *errorBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [errorBtn setTitle:NSLocalizedString(@"Error", nil) forState:UIControlStateNormal];
    [errorBtn sizeToFit];
    [errorBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [errorBtn addTarget:self action:@selector(onClickedErrorbtn) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightBarItem = [[UIBarButtonItem alloc] initWithCustomView:errorBtn];
    self.navigationItem.rightBarButtonItem = rightBarItem;
    
}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    
    if (kScreenHeight==812.0 || kScreenWidth==812.0) {
        self.imageView.frame = CGRectMake(kSafeLRX, kSafeTopHeight, kScreenWidth-2*kSafeLRX, 250);
        self.textView.frame = CGRectMake(kSafeLRX, kSafeTopHeight+250, kScreenWidth-2*kSafeLRX, kScreenHeight-kSafeTopHeight-250-kSafeBottomHeight-kSafeBY);
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)onClickedErrorbtn{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Notification", nil) message:NSLocalizedString(@"Up load image", nil) delegate:self cancelButtonTitle:NSLocalizedString(@"Cancle", nil) otherButtonTitles:NSLocalizedString(@"OK", nil), nil];
    alertView.alertViewStyle = UIAlertViewStylePlainTextInput;
    UITextField *alertField = [alertView textFieldAtIndex:0];
    alertField.placeholder = NSLocalizedString(@"Please input the reason", nil);
    [alertView show];
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex==1) {
        Reachability *reach = [Reachability reachabilityForInternetConnection];
        NetworkStatus netStatus = [reach currentReachabilityStatus];
        if (netStatus == NotReachable) {
            [[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Notification", nil) message:NSLocalizedString(@"Please link the network", nil) delegate:nil cancelButtonTitle:NSLocalizedString(@"OK", nil) otherButtonTitles:nil, nil] show];
            return;
        }
        NSDate *currentDate = [NSDate date];
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyyMMddHHmmss"];
        NSString *currentDateString = [dateFormatter stringFromDate:currentDate];
        NSString *fileName = [NSString stringWithFormat:@"iOS_IDCardDemo_%@_%@.jpg",self.typeName, currentDateString];
        UITextField *alertField = [alertView textFieldAtIndex:0];
        NSString *errorString = alertField.text;
        
        [self loadImageEx:fileName filePath:self.originalImagepath errorString:errorString];
    }
}

- (void)loadImageEx:(NSString *)fileName filePath:(NSString *)filePath errorString:(NSString *)errorString {
    
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    NSString *dataString = [data base64EncodedStringWithOptions:0];
    NSString*hString = [errorString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSString *parameter = [NSString stringWithFormat:@"{'fileName':'%@','txtcontent':'%@', 'imgBase64Str':'%@'}", fileName,hString,dataString];
    //NSLog(@"%@", parameter);
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]
                                    initWithURL:[NSURL
                                                 URLWithString:@"http://123.56.102.63/emailServer/servlet/BaseUploadFileTxtJson"]];
    
    [request setHTTPMethod:@"POST"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-type"];
    [request setHTTPBody:[parameter dataUsingEncoding:NSUTF8StringEncoding]];
    NSURLConnection *wtconnection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    [wtconnection start];
}

- (void) connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"%@", error);
}
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    //NSLog(@"%@", response);
}
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    NSString *result = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    BOOL isSuc = [result containsString:@"<h1>OK</h1>"];
    if (isSuc) {
        [[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Succeed", nil) message:nil delegate:nil cancelButtonTitle:NSLocalizedString(@"OK", nil) otherButtonTitles:nil, nil] show];
    }
    //NSLog(@"-%@-", result);
}
/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end

