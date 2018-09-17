//
//  WBUnreadResult.m
//  FakeWeibo
//
//  Created by 曹鹏 on 2018/9/17.
//  Copyright © 2018 曹鹏. All rights reserved.
//

#import "WBUnreadResult.h"

@implementation WBUnreadResult

- (int)messageCount{
    
    return _cmt + _mention_cmt + _mention_status;
}

- (int)totalCount{
    
    return _status + _follower + _cmt + _dm + _mention_status + _mention_cmt;
}

@end
