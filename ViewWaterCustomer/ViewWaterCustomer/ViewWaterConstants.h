//
//  ViewWaterConstants.h
//  ViewWaterCustomer
//
//  Created by Nitin Kumar Raghuwanshi on 3/13/17.
//  Copyright © 2017 Nitin Kumar Raghuwanshi. All rights reserved.
//
#import <UIKit/UIKit.h>
#ifndef ViewWaterConstants_h
#define ViewWaterConstants_h

#define DOCUMENTS_FOLDER    [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"]

//****************** ALERTS TITLE & MESSAGES DECLARATIONS **********************
#pragma mark - Alert Titles and Alert Messages Strings
//ALERT TITTLES
#define ALERT_TITTLE_APP_NAME           @"ViewWater"
#define ALERT_TITTLE_ERROR              @"Error"
#define ALERT_TITTLE_NETWORK_ERROR      @"NO NETWORK! NO LUCK!"

#pragma mark -Alert Messages Strings
//ALERT MESSAGES
#define ALERT_NETWORK_ERROR_MESSAGE           @"Internet connection not available, Please check your internet connection and try again."

#define ALERT_MAINSERVER_ERROR_MESSAGE  @"An unknown error has occured, please try again later or refresh the page."
//Unable to process your request at the moment!

//Login / Sign Up View
#define MOBILE_VALIDATION                   @"Enter Nickname."
#define OTP_VALIDATION                      @"Enter OTP."
#define INVALID_EMAIL_VALIDATION            @"Invalid email address."
#define MANDITORY_FIELDS_VALIDATION         @"All fields are mandatory."


//to do: delete
inline static UIAlertController* showAlertScreen(NSString *title,NSString* alertMessage){
//    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title
//                                                        message:alertMessage
//                                                       delegate:nil
//                                              cancelButtonTitle: @"OK"
//                                              otherButtonTitles:nil];
//    
//    [alertView show];
    
    
    
    
    UIAlertController * alert = [UIAlertController
                                 alertControllerWithTitle:title
                                 message:alertMessage
                                 preferredStyle:UIAlertControllerStyleAlert];
    
    
    
    UIAlertAction* okButton = [UIAlertAction
                               actionWithTitle:@"OK"
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction * action) {
                                   //Handle your yes please button action here
                               }];
    
    
    [alert addAction:okButton];
    
    
    return alert;
}
inline static UIColor* colorFromHexString(NSString *hexString)
{
    unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    [scanner setScanLocation:1]; // bypass '#' character
    [scanner scanHexInt:&rgbValue];
    return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:1.0];
}

#endif /* ViewWaterConstants_h */
