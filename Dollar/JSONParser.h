#import <Foundation/Foundation.h>

/** парсер для json ответа с сервиса*/
@interface JSONParser : NSObject

/** получает массив с курсами валют из строки */
-(NSMutableArray *) getMoneyArray : (NSString *) json;

@end
