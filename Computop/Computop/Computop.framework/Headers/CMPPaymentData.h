//
//  CMPPaymentData.h
//  Computop
//
//  Created by Thomas Segkoulis on 09/09/16.
//  Copyright © 2016 Computop GmbH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CMPPaymentDataProtocol.h"

/**
 CMPPaymentData
 
 The CMPPaymentData class constitutes the model that contains all the, inserted by the User, Payment data.
 
 */
@interface CMPPaymentData : NSObject <CMPPaymentDataProtocol>

/**
 Amount in the smallest currency unit (e.g. EUR Cent according to Appendix I, page 453)
 Please contact the helpdesk, if you want to capture amounts < 100 (smallest currency unit).
 */
@property (nonatomic, strong) NSString *Amount;

/**
 Three characters DIN / ISO 4217 according to Appendix I, page 453
 For merchants in China (inland) only CNY is permitted; CNY is not permitted for cross-border merchants.
 */
@property (nonatomic, strong) NSString *Currency;

/**
 Transaction ID which should be unique for each payment. With Wirecard max. 32 characters are possible.
 */
@property (nonatomic, strong) NSString *transID;

/**
 Payment ID assigned by Paygate. For example for referencing in batch files.
 */
@property (nonatomic, strong) NSString *payID;

/**
 Unique reference number which appears on your printed card account or in the EPA-file (Electronic Payment Advice). Format must be mutually agreed beforehand with Computop. For EVO Payments International Customers: compulsory field for unique numbers.
 Optional with Sabadell: If RefNr is to be used as the OrderID, the first four characters must be numerical. Only numbers and letters are permitted.
 */
@property (nonatomic, strong) NSString *RefNr;

/**
 Description of purchased goods, unit prices etc.
 */
@property (nonatomic, strong) NSString *OrderDesc;

/**
 Optional: First name, compulsory field for fraud screening
 */
@property (nonatomic, strong) NSString *FirstName;

/**
 Optional: Surname or Company name, compulsory field for fraud screening
 */
@property (nonatomic, strong) NSString *LastName;

/**
 Optional: street name
 */
@property (nonatomic, strong) NSString *AddrStreet;

/**
 Optional: street number
 */
@property (nonatomic, strong) NSString *AddrStreetNr;

/**
 Optional: postcode
 */
@property (nonatomic, strong) NSString *AddrZip;

/**
 Optional: Town/city
 */
@property (nonatomic, strong) NSString *AddrCity;

/**
 Optional: Country code
 */
@property (nonatomic, strong) NSString *AddrCountryCode;

/**
 Optional: Abbreviation of the customer’s Federal State
 */
@property (nonatomic, strong) NSString *AddrState;

/**
 Complete URL which calls up Paygate if payment has been successful. This URL may not contain parameters: to pass parameters, please use the UserData parameter.
 */
@property (nonatomic, strong) NSString *URLSuccess;

/**
 Complete URL which calls up Paygate if payment has been unsuccessful. This URL may not contain parameters: to pass parameters, please use the UserData parameter.
 */
@property (nonatomic, strong) NSString *URLFailure;

/**
 Complete URL, which calls up Paygate in order to notify the shop. The URL may be requested only via port 443. It may not contain parameters. Use the UserData parameter instead.
 */
@property (nonatomic, strong) NSString *URLNotify;

/**
 Optional, only CAPN: telephone number of customer
 */
@property (nonatomic, strong) NSString *Phone;

/**
 Optional: controls how the PayPal page is displayed. Possible values are “Login” or “Billing”
 */
@property (nonatomic, strong) NSString *LandingPage;

/**
 E-mail address
 */
@property (nonatomic, strong) NSString *eMail;

/**
 Optional: ID of the shop
 */
@property (nonatomic, strong) NSString *ShopID;

/**
 Subject
 */
@property (nonatomic, strong) NSString *Subject;

@end
