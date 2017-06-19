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
    
    [server router:@"GET" path:@"/test.zip" handler:^SFWebServerRespone *(SFWebServerRequest *request) {
        NSString *index = [[NSBundle mainBundle] pathForResource:@"test" ofType:@"zip"];
        SFWebServerRespone *response = [[SFWebServerRespone alloc]initWithFile:index];
        return response;
    }];

```
