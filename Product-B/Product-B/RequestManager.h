//
//  RequestManager.h
//  Product-A
//
//  Created by 林建 on 16/6/24.
//  Copyright © 2016年 林建. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, RequestType){
    RequestPOST,
    RequestGET
};

typedef void(^Finish)(NSData *data);
typedef void(^Error)(NSError *error);

@interface RequestManager : NSObject
@property (nonatomic, copy)Finish finish;
@property (nonatomic, copy)Error error;

+(void)requestWithUrlString:(NSString *)urlString parDic:(NSDictionary *)parDic requestType:(RequestType)requestType finish:(Finish)finish error:(Error)error;
@end
