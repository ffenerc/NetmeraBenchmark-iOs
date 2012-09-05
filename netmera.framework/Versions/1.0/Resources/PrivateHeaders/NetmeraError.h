//
//  NetmeraGeoLocation.h
//  inomeraNetmera
//
//  Created by metin ogtem on 09.07.2012.
//  Copyright (c) 2012 Inomera ARGE. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NetmeraError : NSObject{
     enum ErrorCode {
		EC_IO_EXCEPTION,
		EC_REQUIRED_FIELD,
		EC_INVALID_REQUEST,
		EC_JSON_PUT_EXCEPTION,
		EC_JSON_GET_EXCEPTION,
		EC_NULL_EXCEPTION,
		EC_INVALID_DATA_TYPE,
		EC_INVALID_DATE_FORMAT,
		EC_INVALID_URL,
        EC_ALREADY_REGISTERED_EMAIL
     };
}


+ (NSError *) createIOError;
+ (NSError *) createREQUIRED_FIELDErrorWithString:(NSString *)requiredField;
+ (NSError *) createINVALID_REQUESTError;
+ (NSError *) createJSON_PUTErrorWithString:(NSString *)key value:(id)value;
+ (NSError *) createJSON_GETErrorWithString:(NSString *)key;
+ (NSError *) createNULLErrorWithString:(NSString *)key;
+ (NSError *) createINVALID_DATA_TYPEErrorWithString:(NSString *)dataTypeName;
+ (NSError *) createINVALID_DATE_FORMATError;
+ (NSError *) createINVALID_URLErrorWithString:(NSString *)urlString;
+ (NSError *) createALREADY_REGISTERED_EMAILError;
@end
