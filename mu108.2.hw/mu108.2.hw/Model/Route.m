//
//  Route.m
//  mu108.2.hw
//
//  Created by Pavel on 29.03.14.
//  Copyright (c) 2014 Pavel. All rights reserved.
//

#import "Route.h"
#import "Bus.h"
#import "PathPoint.h"


@implementation Route

@dynamic identifier;
@dynamic name;
@dynamic price;
@dynamic specification;
@dynamic buses;
@dynamic points;

+ (Route *)routeWithIdentifier:(int32_t)identifier inManagedObjectContext:(NSManagedObjectContext *)context error:(NSError **)error
{
    NSString *entity = NSStringFromClass(self); // вернет имя класса Route
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:entity];
    request.fetchLimit = 1;
    request.predicate = [NSPredicate predicateWithFormat:@"identifier = %d", identifier];
    return [[context executeFetchRequest:request error:error] lastObject];
}

+ (NSSet *)updatedRoutesWithArrayOfDictionaries:(NSArray *)dictionaries
                                      predicate:(NSPredicate *)predicate
                           managedObjectContext:(NSManagedObjectContext *)managedObjectContext
{
    NSError *error = nil;
    NSString *entity = NSStringFromClass(self);
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:entity];
    request.resultType = NSManagedObjectIDResultType; // нам не нужны все поля, только ObjectID
    request.predicate = predicate;
    NSArray *fetchedObjects = [managedObjectContext executeFetchRequest:request error:&error]; // получаем массив ObjectID всех сохраненных маршрутов
    
#ifdef DEBUG
    if (error) {
        NSLog(@"%@", error);
    }
#endif
    
    // по завершению обновления данных, тут будут содержаться маршруты, которые необходимо удалить
    NSMutableSet *unupdatedObjects = [NSMutableSet setWithArray:fetchedObjects];
    
    NSMutableSet *routes = [NSMutableSet set];
    for (NSDictionary *dictionary in dictionaries) {
        // пытаемся найти маршрут в уже сохраненных
        int32_t identifier = [dictionary[@"route_id"] intValue];
        Route *route = [self routeWithIdentifier:identifier inManagedObjectContext:managedObjectContext error:&error];
        if (route) {
            // этот маршрут удалять не надо
            [unupdatedObjects removeObject:route.objectID];
        } else if (error) {
            // переходим к следующему маршруту в случае ошибки
            continue;
        } else {
            // создаем новый маршрут
            route = [NSEntityDescription insertNewObjectForEntityForName:entity inManagedObjectContext:managedObjectContext];
            route.identifier = identifier;
        }
        
        // заполняем либо обновляем данные маршрута
        [route configureWithDictionary:dictionary managedObjectContext:managedObjectContext];
        [routes addObject:route];
    }
    
    // удаляем маршруты, которые не обновились
    for (NSManagedObjectID *objectID in unupdatedObjects) {
        [managedObjectContext deleteObject:[managedObjectContext objectWithID:objectID]];
    }
    
    return routes;
}

- (void)configureWithDictionary:(NSDictionary *)params managedObjectContext:(NSManagedObjectContext *)managedObjectContext
{
    self.name  = [params objectForKey:@"route_title"];
    self.price = @([[params objectForKey:@"route_price"] floatValue]);
    self.specification = [params objectForKey:@"route_description"];
    NSString* path = [params objectForKey:@"route_path"];
    NSData* jsonData = [path dataUsingEncoding:NSUTF8StringEncoding];
    NSError* error;
    NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
    NSMutableSet* points = [[NSMutableSet alloc] init];
    for (NSDictionary* element in jsonArray) {
        PathPoint* point = [NSEntityDescription insertNewObjectForEntityForName:@"PathPoint" inManagedObjectContext:managedObjectContext];
        point.x = @([[element objectForKey:@"x"] floatValue]);
        point.y= @([[element objectForKey:@"y"] floatValue]);
        point.z = @([[element objectForKey:@"z"] floatValue]);
        [points addObject:point];
    }
    self.points = [[NSSet alloc]initWithSet:points];
}

@end
