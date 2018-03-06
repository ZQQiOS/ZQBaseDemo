//
//  IDCardOCR.h
//  IDCardOCR
//

#import <Foundation/Foundation.h>
#import "IDCardSlideLine.h"

@interface IDCardOCR : NSObject

/*
 Core initialization: before calling other methods, please make sure to call this method, otherwise, all other functions will fail!
 devcode: development code
 recogLanguage: the recognition language, “0”- Chinese character, the recognition result is in Chinese; “3”- English character, the recognition result is in English
 Return Value: “0” means success, others mean fail; with this return value, we can judge whether the license and initialization are succeed or not!
 */
-(int)InitIDCardWithDevcode:(NSString *)devcode recogLanguage:(int) recogLanguage;


/*
 Set up recognition template
 Parameter:  nMainID: document type code; nSubID: the default value is “0”; nSubIDCount: the default value is “1”;
 */
- (void)setIDCardIDWithMainID:(int)nMainID subID:(int)nSubID subIDCount:(int)nSubIDCount;

/*
 Add recognition template
 Parameter:  nMainID: document type code; nSubID: the default value is “0”; nsubIDCount: the default value is “1”.
 */
- (void)addIDCardIDWithMainID:(int)nMainID subID:(int)nSubID subIDCount:(int)nSubIDCount;

/*
 Set the recognition mode and document type
 Parameter:
 nMode: “0”- capture image and recognition, import image and recognition; 1- video stream recognition
 nType: document type
 */

-(void)setParameterWithMode:(int)nMode CardType:(int)nType;

/*
 Set up the threshold for judging image clarity, the default value is 80;
 Parameter: nValue: 0-255
 */
- (void)setPictureClearValueEx:(int)nValue;

/*
 Set up the method to detect lines, otherwise default detecting method will be applied.
 Parameters: nType: “0”- guide frame; “1”- automatic line detection
 */
- (void)setVideoStreamCropTypeExWithType:(int)nType;

/*
 Set up the region of interest
 Parameter: the distance of document image to the guide frame (top, bottom, left, right), detailed info please refer to Demo.
 Return Value: “0”- succeed; others- failed
 */
- (int) setROIWithLeft: (int)nLeft Top: (int)nTop Right: (int)nRight Bottom: (int)nBottom;

/*
 Set up the recognition type of Chinese second generation ID card
 Parameter: nType: “0” – both sides; “1” – obverse side; “2” – reverse side
 Return Value: “0”- succeed; others – failed
 */
-(int) SetDetectIDCardType:(int) nType;

/*
 Parameter: nRotateType: clockwise rotate; “0” – no rotate; “1” - 90 degree; “2” – 180 degree; “3” – 270 degree;
 Return Value: “0” – Succeed, other – Failed
 */
- (int)setRecogRotateType:(int)nRotateType;

/*
 Import image data to the memory
 Parameter: image data and image width & height
 Return Value: “0” – Succeed; others – failed
 */
- (int) newLoadImageWithBuffer:(UInt8 *)buffer Width:(int)width Height:(int)height;

/*
 Detect slide lines
 Return Value: SlideLine object, after succeed, the attribute “allLine” is the code for document type
 */
- (IDCardSlideLine *) newConfirmSlideLine;

/*
 After detecting the four sidelines, obtain related four points
 Return Value: NSDictionary object
 {
 key:value
 @"isSucceed":,NSNumber object
 @"point1":CGPoint,
 @"point2":CGPoint,
 @"point3":CGPoint,
 @"point4":CGPoint
 }
 isSucceed: NSNumber object, “1” – succeed; “-1” – failed
 Connect point1, point2, point3 & point4, draw the frame in anticlockwise direction
 */
- (NSDictionary *)obtainRealTimeFourConersID;

/*
 Detect light spot
 Return Value:
 0: there are light spots in the sensitive region;
 -1: core initialization failed;
 -2: there is no light spot in the sensitive region;
 -3: loading image data failed.
 */
- (int)detectLightspot;

/*
 Detect image clarity
 Return Value: “0” – Succeed; others – failed
 */
- (int) newCheckPicIsClear;

/*
 Rejecting interface
 Parameter: nCartType – document type; “isSet-YES” to set the rejecting type, “No” – default value
 Return Value: no meaning
 */
- (int)setIDCardRejectType:(int)nCartType isSet:(bool)isSet;

/*
 Acquire MRZ type
 Parameter: image data, image width, height and region of interested
 Return Value: “1” means 1034, “2” means 1036, “3” means 1033, in other words two & three lines MRZ
 */
- (int) GetAcquireMRZSignal:(UInt8 *)buffer Width:(int)width Height:(int)height Left:(int)left Right:(int)right Top:(int)top Bottom:(int)bottom RotateType:(int)rotatetype;

/*
 Load MRZ
 Parameter: image data and image width, height
 Return Value: “0” – Succeed; others – failed
 */
- (int) loadMRZImageWithBuffer:(UInt8 *)buffer Width:(int)width Height:(int)height;

/*
 Load image path
 Parameter: lpImageFileName: image path; “type” please upload “0”
 Return Value: “0” – Succeed, others – failed, “3” – no image
 */
-(int)LoadImageToMemoryWithFileName:(NSString *)lpImageFileName Type:(int)type;

/*
 Image pre-process interface
 Parameter: nProcessType: “0” – cancel all the operation, “1” – cutting, “2” – rotating, “3” – cutting + rotating, “4” – tilt correction, “5”- cutting + tilt correction, “6” – tilt correction + rotating, “7”- cutting + tilt correction + rotating
 nSetType: “0” – cancel operation, “1” – set up operation
 */
- (void)processImageWithProcessType:(int)nProcessType setType:(int)nSetType;

/*
 Save the cutting image
 Parameter: path: the path to save image
 Return Value: “0” – Succeed; other – failed
 */
- (int) saveImage:(NSString *)path;

/*
 Save the head image
 Parameter: path: the path to save image
 Return Value: “0” – Succeed, others – failed
 */
- (int) saveHeaderImage: (NSString *)path;

/*
 Automatically recognize both side of Chinese 2 generation ID card, call when needed
 Return Value: document type code
 */
- (int) autoRecogChineseID;

/*
 Recognize document
 Parameter: nMainID: document type code
 Return Value: document type code
 */
- (int) recogIDCardWithMainID: (int) nMainID;

/*GetFieldName*/
-(NSString *)GetFieldNameWithIndex:(int) nIndex;

/*GetRecogResult*/
-(NSString *)GetRecogResultWithIndex:(int) nIndex;

/*ReleaseCore*/
-(void)recogFree;

/*Get core version*/
-(NSString *)getCoreVersion;
@end
