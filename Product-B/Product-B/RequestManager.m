
//  RequestManager.m
//  Product-A
//
//  Created by 林建 on 16/6/24.
//  Copyright © 2016年 林建. All rights reserved.
//

#import "RequestManager.h"

@implementation RequestManager

+(void)requestWithUrlString:(NSString *)urlString parDic:(NSDictionary *)parDic requestType:(RequestType)requestType finish:(Finish)finish error:(Error)error{
    RequestManager *manager = [[RequestManager alloc]init];
    [manager requestWithUrlString:urlString parDic:parDic requestType:requestType finish:finish error:error];
}

-(void)requestWithUrlString:(NSString *)urlString parDic:(NSDictionary *)parDic requestType:(RequestType)requestType finish:(Finish)finish error:(Error)error{
    self.finish = finish;
    self.error = error;
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    if (requestType == RequestGET) {
        [manager POST:urlString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id _Nullable responseObject) {
            
            dispatch_async(dispatch_get_main_queue(), ^{
                self.finish(responseObject);
            });
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@" error");
        }];
    } else {
        
        [manager POST:urlString parameters:parDic progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id _Nullable responseObject) {
            dispatch_async(dispatch_get_main_queue(), ^{
                if (self.finish) {
                    
                    self.finish(responseObject);
                }
            });
            NSLog(@"responseObject NSData");
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            self.error(error);
            NSLog(@"error");
        }];
    }
}


@end
