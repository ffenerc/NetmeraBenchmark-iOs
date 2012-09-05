// Copyright 2011 StackMob, Inc
// 
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

#if DEBUG
#define SMLog(format, ...) {NSLog(format, ##__VA_ARGS__);}
#define StackMobDebug(format, ...) {NSLog([[NSString stringWithFormat:@"[%s, %@, %d] ", __PRETTY_FUNCTION__, [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__] stringByAppendingFormat:format, ##__VA_ARGS__]);}
#else
#define SMLog(format, ...)
#define StackMobDebug(format, ...)
#endif

#define STACKMOB_OAUTH_VERSION      OAuth2
#define STACKMOB_PUBLIC_KEY         @"f701c202-926d-4c47-bb7c-66f98df91933"
#define STACKMOB_PRIVATE_KEY        @"None"
#define STACKMOB_APP_NAME           @"fangara"
#define STACKMOB_UDID_SALT          @"828e4a5771d696176b1c6a3e0579858a"
#define STACKMOB_APP_DOMAIN         @"stackmob.com"
#define STACKMOB_APP_MOB            @"mob1"
#define STACKMOB_USER_OBJECT_NAME   @"user"
#define STACKMOB_API_VERSION        0
