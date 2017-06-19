# SFWebServer
SFWebServer,simple routing HTTP Web Server



```
 SFWebServer *server = [SFWebServer startWithPort:55555];
    [server router:@"GET" path:@"/" handler:^SFWebServerRespone *(SFWebServerRequest *request) {
        NSString *index = [[NSBundle mainBundle] pathForResource:@"index" ofType:@"html"];
        SFWebServerRespone *response = [[SFWebServerRespone alloc]initWithFile:index];
        return response;
    }];
    
    [server router:@"GET" path:@"/show.do" handler:^SFWebServerRespone *(SFWebServerRequest *request) {
        SFWebServerRespone *response = [[SFWebServerRespone alloc]initWithHTML:@"success"];
        return response;
    }];
    
    [server router:@"GET" path:@"/file/test.zip" handler:^SFWebServerRespone *(SFWebServerRequest *request) {
        NSString *index = [[NSBundle mainBundle] pathForResource:@"test" ofType:@"zip"];
        SFWebServerRespone *response = [[SFWebServerRespone alloc]initWithDownFileName:index];
        return response;
    }];
    
    [server router:@"GET" extension:@".css" handler:^SFWebServerRespone *(SFWebServerRequest *request) {
        //        NSLog(@"request header:%@",request.headers);
        SFWebServerRespone *response = [[SFWebServerRespone alloc]initWithFileName:request.path];
        return response;
    }];
    
    [server router:@"GET" extension:@".png" handler:^SFWebServerRespone *(SFWebServerRequest *request) {
        //        NSLog(@"request header:%@",request.headers);
        SFWebServerRespone *response = [[SFWebServerRespone alloc]initWithFileName:request.path];
        return response;
    }];
    [server router:@"POST" path:@"recive.do" handler:^SFWebServerRespone *(SFWebServerRequest *request) {
        //        NSLog(@"request header:%@",request.headers);
        NSData *post = request.rawData;
        SFWebServerRespone *response = [[SFWebServerRespone alloc]initWithFileName:request.path];
        return response;
    }];

```
