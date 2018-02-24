#import "consumer-complaints.h"

#define λ(decl, expr) (^(decl) { return (expr); })

static id NSNullify(id _Nullable x) {
    return (x == nil || x == NSNull.null) ? NSNull.null : x;
}

NS_ASSUME_NONNULL_BEGIN

@interface QTConsumerComplaintElement (JSONConversion)
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
- (NSDictionary *)JSONDictionary;
@end

@interface QTGrant (JSONConversion)
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
- (NSDictionary *)JSONDictionary;
@end

@interface QTMetadata (JSONConversion)
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
- (NSDictionary *)JSONDictionary;
@end

@interface QTCustomFields (JSONConversion)
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
- (NSDictionary *)JSONDictionary;
@end

@interface QTTest (JSONConversion)
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
- (NSDictionary *)JSONDictionary;
@end

@interface QTJSONQuery (JSONConversion)
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
- (NSDictionary *)JSONDictionary;
@end

@interface QTGroup (JSONConversion)
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
- (NSDictionary *)JSONDictionary;
@end

@interface QTOrder (JSONConversion)
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
- (NSDictionary *)JSONDictionary;
@end

@interface QTSelect (JSONConversion)
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
- (NSDictionary *)JSONDictionary;
@end

@interface QTRenderTypeConfig (JSONConversion)
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
- (NSDictionary *)JSONDictionary;
@end

@interface QTVisible (JSONConversion)
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
- (NSDictionary *)JSONDictionary;
@end

@interface QTRichRendererConfigs (JSONConversion)
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
- (NSDictionary *)JSONDictionary;
@end

@interface QTFatRow (JSONConversion)
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
- (NSDictionary *)JSONDictionary;
@end

@interface QTColumn (JSONConversion)
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
- (NSDictionary *)JSONDictionary;
@end

@interface QTRow (JSONConversion)
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
- (NSDictionary *)JSONDictionary;
@end

@interface QTField (JSONConversion)
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
- (NSDictionary *)JSONDictionary;
@end

@interface QTStyles (JSONConversion)
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
- (NSDictionary *)JSONDictionary;
@end

@interface QTOwner (JSONConversion)
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
- (NSDictionary *)JSONDictionary;
@end

@interface QTRatings (JSONConversion)
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
- (NSDictionary *)JSONDictionary;
@end

@interface QTTableAuthor (JSONConversion)
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
- (NSDictionary *)JSONDictionary;
@end

@implementation QTDisplayType
+ (NSDictionary<NSString *, QTDisplayType *> *)values
{
    static NSDictionary<NSString *, QTDisplayType *> *values;
    return values = values ? values : @{
        @"fatrow": [[QTDisplayType alloc] initWithValue:@"fatrow"],
        @"table": [[QTDisplayType alloc] initWithValue:@"table"],
    };
}

+ (QTDisplayType *)fatrow { return QTDisplayType.values[@"fatrow"]; }
+ (QTDisplayType *)table { return QTDisplayType.values[@"table"]; }

+ (instancetype _Nullable)withValue:(NSString *)value
{
    return QTDisplayType.values[value];
}

- (instancetype)initWithValue:(NSString *)value
{
    if (self = [super init]) _value = value;
    return self;
}

- (NSUInteger)hash { return _value.hash; }
@end

@implementation QTConsumerComplaintFlag
+ (NSDictionary<NSString *, QTConsumerComplaintFlag *> *)values
{
    static NSDictionary<NSString *, QTConsumerComplaintFlag *> *values;
    return values = values ? values : @{
        @"default": [[QTConsumerComplaintFlag alloc] initWithValue:@"default"],
        @"restorable": [[QTConsumerComplaintFlag alloc] initWithValue:@"restorable"],
        @"restorePossibleForType": [[QTConsumerComplaintFlag alloc] initWithValue:@"restorePossibleForType"],
    };
}

+ (QTConsumerComplaintFlag *)flagDefault { return QTConsumerComplaintFlag.values[@"default"]; }
+ (QTConsumerComplaintFlag *)restorable { return QTConsumerComplaintFlag.values[@"restorable"]; }
+ (QTConsumerComplaintFlag *)restorePossibleForType { return QTConsumerComplaintFlag.values[@"restorePossibleForType"]; }

+ (instancetype _Nullable)withValue:(NSString *)value
{
    return QTConsumerComplaintFlag.values[value];
}

- (instancetype)initWithValue:(NSString *)value
{
    if (self = [super init]) _value = value;
    return self;
}

- (NSUInteger)hash { return _value.hash; }
@end

@implementation QTGrantFlag
+ (NSDictionary<NSString *, QTGrantFlag *> *)values
{
    static NSDictionary<NSString *, QTGrantFlag *> *values;
    return values = values ? values : @{
        @"public": [[QTGrantFlag alloc] initWithValue:@"public"],
    };
}

+ (QTGrantFlag *)public { return QTGrantFlag.values[@"public"]; }

+ (instancetype _Nullable)withValue:(NSString *)value
{
    return QTGrantFlag.values[value];
}

- (instancetype)initWithValue:(NSString *)value
{
    if (self = [super init]) _value = value;
    return self;
}

- (NSUInteger)hash { return _value.hash; }
@end

@implementation QTGrantType
+ (NSDictionary<NSString *, QTGrantType *> *)values
{
    static NSDictionary<NSString *, QTGrantType *> *values;
    return values = values ? values : @{
        @"viewer": [[QTGrantType alloc] initWithValue:@"viewer"],
    };
}

+ (QTGrantType *)viewer { return QTGrantType.values[@"viewer"]; }

+ (instancetype _Nullable)withValue:(NSString *)value
{
    return QTGrantType.values[value];
}

- (instancetype)initWithValue:(NSString *)value
{
    if (self = [super init]) _value = value;
    return self;
}

- (NSUInteger)hash { return _value.hash; }
@end

@implementation QTAvailableDisplayType
+ (NSDictionary<NSString *, QTAvailableDisplayType *> *)values
{
    static NSDictionary<NSString *, QTAvailableDisplayType *> *values;
    return values = values ? values : @{
        @"fatrow": [[QTAvailableDisplayType alloc] initWithValue:@"fatrow"],
        @"page": [[QTAvailableDisplayType alloc] initWithValue:@"page"],
        @"table": [[QTAvailableDisplayType alloc] initWithValue:@"table"],
    };
}

+ (QTAvailableDisplayType *)fatrow { return QTAvailableDisplayType.values[@"fatrow"]; }
+ (QTAvailableDisplayType *)page { return QTAvailableDisplayType.values[@"page"]; }
+ (QTAvailableDisplayType *)table { return QTAvailableDisplayType.values[@"table"]; }

+ (instancetype _Nullable)withValue:(NSString *)value
{
    return QTAvailableDisplayType.values[value];
}

- (instancetype)initWithValue:(NSString *)value
{
    if (self = [super init]) _value = value;
    return self;
}

- (NSUInteger)hash { return _value.hash; }
@end

@implementation QTRDFSubject
+ (NSDictionary<NSString *, QTRDFSubject *> *)values
{
    static NSDictionary<NSString *, QTRDFSubject *> *values;
    return values = values ? values : @{
        @"0": [[QTRDFSubject alloc] initWithValue:@"0"],
    };
}

+ (QTRDFSubject *)the0 { return QTRDFSubject.values[@"0"]; }

+ (instancetype _Nullable)withValue:(NSString *)value
{
    return QTRDFSubject.values[value];
}

- (instancetype)initWithValue:(NSString *)value
{
    if (self = [super init]) _value = value;
    return self;
}

- (NSUInteger)hash { return _value.hash; }
@end

@implementation QTFieldType
+ (NSDictionary<NSString *, QTFieldType *> *)values
{
    static NSDictionary<NSString *, QTFieldType *> *values;
    return values = values ? values : @{
        @"columnData": [[QTFieldType alloc] initWithValue:@"columnData"],
        @"columnLabel": [[QTFieldType alloc] initWithValue:@"columnLabel"],
    };
}

+ (QTFieldType *)columnData { return QTFieldType.values[@"columnData"]; }
+ (QTFieldType *)columnLabel { return QTFieldType.values[@"columnLabel"]; }

+ (instancetype _Nullable)withValue:(NSString *)value
{
    return QTFieldType.values[value];
}

- (instancetype)initWithValue:(NSString *)value
{
    if (self = [super init]) _value = value;
    return self;
}

- (NSUInteger)hash { return _value.hash; }
@end

@implementation QTWidth
+ (NSDictionary<NSString *, QTWidth *> *)values
{
    static NSDictionary<NSString *, QTWidth *> *values;
    return values = values ? values : @{
        @"27%": [[QTWidth alloc] initWithValue:@"27%"],
        @"30%": [[QTWidth alloc] initWithValue:@"30%"],
        @"31%": [[QTWidth alloc] initWithValue:@"31%"],
        @"33%": [[QTWidth alloc] initWithValue:@"33%"],
        @"40%": [[QTWidth alloc] initWithValue:@"40%"],
    };
}

+ (QTWidth *)the27 { return QTWidth.values[@"27%"]; }
+ (QTWidth *)the30 { return QTWidth.values[@"30%"]; }
+ (QTWidth *)the31 { return QTWidth.values[@"31%"]; }
+ (QTWidth *)the33 { return QTWidth.values[@"33%"]; }
+ (QTWidth *)the40 { return QTWidth.values[@"40%"]; }

+ (instancetype _Nullable)withValue:(NSString *)value
{
    return QTWidth.values[value];
}

- (instancetype)initWithValue:(NSString *)value
{
    if (self = [super init]) _value = value;
    return self;
}

- (NSUInteger)hash { return _value.hash; }
@end

@implementation QTModifyingViewUid
+ (NSDictionary<NSString *, QTModifyingViewUid *> *)values
{
    static NSDictionary<NSString *, QTModifyingViewUid *> *values;
    return values = values ? values : @{
        @"s6ew-h6mp": [[QTModifyingViewUid alloc] initWithValue:@"s6ew-h6mp"],
    };
}

+ (QTModifyingViewUid *)s6EwH6Mp { return QTModifyingViewUid.values[@"s6ew-h6mp"]; }

+ (instancetype _Nullable)withValue:(NSString *)value
{
    return QTModifyingViewUid.values[value];
}

- (instancetype)initWithValue:(NSString *)value
{
    if (self = [super init]) _value = value;
    return self;
}

- (NSUInteger)hash { return _value.hash; }
@end

@implementation QTOwnerFlag
+ (NSDictionary<NSString *, QTOwnerFlag *> *)values
{
    static NSDictionary<NSString *, QTOwnerFlag *> *values;
    return values = values ? values : @{
        @"organizationMember": [[QTOwnerFlag alloc] initWithValue:@"organizationMember"],
    };
}

+ (QTOwnerFlag *)organizationMember { return QTOwnerFlag.values[@"organizationMember"]; }

+ (instancetype _Nullable)withValue:(NSString *)value
{
    return QTOwnerFlag.values[value];
}

- (instancetype)initWithValue:(NSString *)value
{
    if (self = [super init]) _value = value;
    return self;
}

- (NSUInteger)hash { return _value.hash; }
@end

@implementation QTOwnerType
+ (NSDictionary<NSString *, QTOwnerType *> *)values
{
    static NSDictionary<NSString *, QTOwnerType *> *values;
    return values = values ? values : @{
        @"interactive": [[QTOwnerType alloc] initWithValue:@"interactive"],
    };
}

+ (QTOwnerType *)interactive { return QTOwnerType.values[@"interactive"]; }

+ (instancetype _Nullable)withValue:(NSString *)value
{
    return QTOwnerType.values[value];
}

- (instancetype)initWithValue:(NSString *)value
{
    if (self = [super init]) _value = value;
    return self;
}

- (NSUInteger)hash { return _value.hash; }
@end

@implementation QTProvenance
+ (NSDictionary<NSString *, QTProvenance *> *)values
{
    static NSDictionary<NSString *, QTProvenance *> *values;
    return values = values ? values : @{
        @"official": [[QTProvenance alloc] initWithValue:@"official"],
    };
}

+ (QTProvenance *)official { return QTProvenance.values[@"official"]; }

+ (instancetype _Nullable)withValue:(NSString *)value
{
    return QTProvenance.values[value];
}

- (instancetype)initWithValue:(NSString *)value
{
    if (self = [super init]) _value = value;
    return self;
}

- (NSUInteger)hash { return _value.hash; }
@end

@implementation QTPublicationStage
+ (NSDictionary<NSString *, QTPublicationStage *> *)values
{
    static NSDictionary<NSString *, QTPublicationStage *> *values;
    return values = values ? values : @{
        @"published": [[QTPublicationStage alloc] initWithValue:@"published"],
    };
}

+ (QTPublicationStage *)published { return QTPublicationStage.values[@"published"]; }

+ (instancetype _Nullable)withValue:(NSString *)value
{
    return QTPublicationStage.values[value];
}

- (instancetype)initWithValue:(NSString *)value
{
    if (self = [super init]) _value = value;
    return self;
}

- (NSUInteger)hash { return _value.hash; }
@end

@implementation QTRight
+ (NSDictionary<NSString *, QTRight *> *)values
{
    static NSDictionary<NSString *, QTRight *> *values;
    return values = values ? values : @{
        @"read": [[QTRight alloc] initWithValue:@"read"],
    };
}

+ (QTRight *)read { return QTRight.values[@"read"]; }

+ (instancetype _Nullable)withValue:(NSString *)value
{
    return QTRight.values[value];
}

- (instancetype)initWithValue:(NSString *)value
{
    if (self = [super init]) _value = value;
    return self;
}

- (NSUInteger)hash { return _value.hash; }
@end

@implementation QTRowsUpdatedBy
+ (NSDictionary<NSString *, QTRowsUpdatedBy *> *)values
{
    static NSDictionary<NSString *, QTRowsUpdatedBy *> *values;
    return values = values ? values : @{
        @"pjxg-ve4m": [[QTRowsUpdatedBy alloc] initWithValue:@"pjxg-ve4m"],
        @"54a3-qyun": [[QTRowsUpdatedBy alloc] initWithValue:@"54a3-qyun"],
        @"9e3m-2843": [[QTRowsUpdatedBy alloc] initWithValue:@"9e3m-2843"],
        @"vvca-fr6g": [[QTRowsUpdatedBy alloc] initWithValue:@"vvca-fr6g"],
    };
}

+ (QTRowsUpdatedBy *)pjxgVe4M { return QTRowsUpdatedBy.values[@"pjxg-ve4m"]; }
+ (QTRowsUpdatedBy *)the54A3Qyun { return QTRowsUpdatedBy.values[@"54a3-qyun"]; }
+ (QTRowsUpdatedBy *)the9E3M2843 { return QTRowsUpdatedBy.values[@"9e3m-2843"]; }
+ (QTRowsUpdatedBy *)vvcaFr6G { return QTRowsUpdatedBy.values[@"vvca-fr6g"]; }

+ (instancetype _Nullable)withValue:(NSString *)value
{
    return QTRowsUpdatedBy.values[value];
}

- (instancetype)initWithValue:(NSString *)value
{
    if (self = [super init]) _value = value;
    return self;
}

- (NSUInteger)hash { return _value.hash; }
@end

@implementation QTName
+ (NSDictionary<NSString *, QTName *> *)values
{
    static NSDictionary<NSString *, QTName *> *values;
    return values = values ? values : @{
        @"Dan Munz": [[QTName alloc] initWithValue:@"Dan Munz"],
        @"Doug Taylor": [[QTName alloc] initWithValue:@"Doug Taylor"],
        @"ming": [[QTName alloc] initWithValue:@"ming"],
        @"Shannon Files": [[QTName alloc] initWithValue:@"Shannon Files"],
    };
}

+ (QTName *)danMunz { return QTName.values[@"Dan Munz"]; }
+ (QTName *)dougTaylor { return QTName.values[@"Doug Taylor"]; }
+ (QTName *)ming { return QTName.values[@"ming"]; }
+ (QTName *)shannonFiles { return QTName.values[@"Shannon Files"]; }

+ (instancetype _Nullable)withValue:(NSString *)value
{
    return QTName.values[value];
}

- (instancetype)initWithValue:(NSString *)value
{
    if (self = [super init]) _value = value;
    return self;
}

- (NSUInteger)hash { return _value.hash; }
@end

@implementation QTID
+ (NSDictionary<NSString *, QTID *> *)values
{
    static NSDictionary<NSString *, QTID *> *values;
    return values = values ? values : @{
        @"pjxg-ve4m": [[QTID alloc] initWithValue:@"pjxg-ve4m"],
        @"54a3-qyun": [[QTID alloc] initWithValue:@"54a3-qyun"],
        @"9e3m-2843": [[QTID alloc] initWithValue:@"9e3m-2843"],
        @"9eki-h2hn": [[QTID alloc] initWithValue:@"9eki-h2hn"],
    };
}

+ (QTID *)pjxgVe4M { return QTID.values[@"pjxg-ve4m"]; }
+ (QTID *)the54A3Qyun { return QTID.values[@"54a3-qyun"]; }
+ (QTID *)the9E3M2843 { return QTID.values[@"9e3m-2843"]; }
+ (QTID *)the9EkiH2Hn { return QTID.values[@"9eki-h2hn"]; }

+ (instancetype _Nullable)withValue:(NSString *)value
{
    return QTID.values[value];
}

- (instancetype)initWithValue:(NSString *)value
{
    if (self = [super init]) _value = value;
    return self;
}

- (NSUInteger)hash { return _value.hash; }
@end

@implementation QTViewType
+ (NSDictionary<NSString *, QTViewType *> *)values
{
    static NSDictionary<NSString *, QTViewType *> *values;
    return values = values ? values : @{
        @"tabular": [[QTViewType alloc] initWithValue:@"tabular"],
    };
}

+ (QTViewType *)tabular { return QTViewType.values[@"tabular"]; }

+ (instancetype _Nullable)withValue:(NSString *)value
{
    return QTViewType.values[value];
}

- (instancetype)initWithValue:(NSString *)value
{
    if (self = [super init]) _value = value;
    return self;
}

- (NSUInteger)hash { return _value.hash; }
@end

static id map(id collection, id (^f)(id value)) {
    id result = nil;
    if ([collection isKindOfClass:NSArray.class]) {
        result = [NSMutableArray arrayWithCapacity:[collection count]];
        for (id x in collection) [result addObject:f(x)];
    } else if ([collection isKindOfClass:NSDictionary.class]) {
        result = [NSMutableDictionary dictionaryWithCapacity:[collection count]];
        for (id key in collection) [result setObject:f([collection objectForKey:key]) forKey:key];
    }
    return result;
}

#pragma mark - JSON serialization

QTConsumerComplaints *_Nullable QTConsumerComplaintsFromData(NSData *data, NSError **error)
{
    @try {
        id json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:error];
        return *error ? nil : map(json, λ(id x, [QTConsumerComplaintElement fromJSONDictionary:x]));
    } @catch (NSException *exception) {
        *error = [NSError errorWithDomain:@"JSONSerialization" code:-1 userInfo:@{ @"exception": exception }];
        return nil;
    }
}

QTConsumerComplaints *_Nullable QTConsumerComplaintsFromJSON(NSString *json, NSStringEncoding encoding, NSError **error)
{
    return QTConsumerComplaintsFromData([json dataUsingEncoding:encoding], error);
}

NSData *_Nullable QTConsumerComplaintsToData(QTConsumerComplaints *consumerComplaints, NSError **error)
{
    @try {
        id json = map(consumerComplaints, λ(id x, [x JSONDictionary]));
        NSData *data = [NSJSONSerialization dataWithJSONObject:json options:kNilOptions error:error];
        return *error ? nil : data;
    } @catch (NSException *exception) {
        *error = [NSError errorWithDomain:@"JSONSerialization" code:-1 userInfo:@{ @"exception": exception }];
        return nil;
    }
}

NSString *_Nullable QTConsumerComplaintsToJSON(QTConsumerComplaints *consumerComplaints, NSStringEncoding encoding, NSError **error)
{
    NSData *data = QTConsumerComplaintsToData(consumerComplaints, error);
    return data ? [[NSString alloc] initWithData:data encoding:encoding] : nil;
}

@implementation QTConsumerComplaintElement
+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
        @"id": @"identifier",
        @"name": @"name",
        @"averageRating": @"averageRating",
        @"createdAt": @"createdAt",
        @"description": @"theDescription",
        @"displayType": @"displayType",
        @"downloadCount": @"downloadCount",
        @"hideFromCatalog": @"isHideFromCatalog",
        @"hideFromDataJson": @"isHideFromDataJSON",
        @"indexUpdatedAt": @"indexUpdatedAt",
        @"newBackend": @"isNewBackend",
        @"numberOfComments": @"numberOfComments",
        @"oid": @"oid",
        @"provenance": @"provenance",
        @"publicationAppendEnabled": @"isPublicationAppendEnabled",
        @"publicationDate": @"publicationDate",
        @"publicationGroup": @"publicationGroup",
        @"publicationStage": @"publicationStage",
        @"rowClass": @"rowClass",
        @"rowsUpdatedAt": @"rowsUpdatedAt",
        @"rowsUpdatedBy": @"rowsUpdatedBy",
        @"tableId": @"tableID",
        @"totalTimesRated": @"totalTimesRated",
        @"viewCount": @"viewCount",
        @"viewLastModified": @"viewLastModified",
        @"viewType": @"viewType",
        @"grants": @"grants",
        @"metadata": @"metadata",
        @"owner": @"owner",
        @"ratings": @"ratings",
        @"rights": @"rights",
        @"tableAuthor": @"tableAuthor",
        @"flags": @"flags",
        @"moderationStatus": @"moderationStatus",
        @"category": @"category",
        @"tags": @"tags",
        @"modifyingViewUid": @"modifyingViewUid",
    };
}

+ (instancetype)fromJSONDictionary:(NSDictionary *)dict
{
    return dict ? [[QTConsumerComplaintElement alloc] initWithJSONDictionary:dict] : nil;
}

- (instancetype)initWithJSONDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
        _displayType = [QTDisplayType withValue:(id)_displayType];
        _provenance = [QTProvenance withValue:(id)_provenance];
        _publicationStage = [QTPublicationStage withValue:(id)_publicationStage];
        _rowsUpdatedBy = [QTRowsUpdatedBy withValue:(id)_rowsUpdatedBy];
        _viewType = [QTViewType withValue:(id)_viewType];
        _grants = map(_grants, λ(id x, [QTGrant fromJSONDictionary:x]));
        _metadata = [QTMetadata fromJSONDictionary:(id)_metadata];
        _owner = [QTOwner fromJSONDictionary:(id)_owner];
        _ratings = [QTRatings fromJSONDictionary:(id)_ratings];
        _rights = map(_rights, λ(id x, [QTRight withValue:x]));
        _tableAuthor = [QTTableAuthor fromJSONDictionary:(id)_tableAuthor];
        _flags = map(_flags, λ(id x, [QTConsumerComplaintFlag withValue:x]));
        _modifyingViewUid = [QTModifyingViewUid withValue:(id)_modifyingViewUid];
    }
    return self;
}

- (void)setValue:(nullable id)value forKey:(NSString *)key
{
    [super setValue:value forKey:QTConsumerComplaintElement.properties[key]];
}

- (NSDictionary *)JSONDictionary
{
    id dict = [[self dictionaryWithValuesForKeys:QTConsumerComplaintElement.properties.allValues] mutableCopy];

    for (id jsonName in QTConsumerComplaintElement.properties) {
        id propertyName = QTConsumerComplaintElement.properties[jsonName];
        if (![jsonName isEqualToString:propertyName]) {
            dict[jsonName] = dict[propertyName];
            [dict removeObjectForKey:propertyName];
        }
    }

    [dict addEntriesFromDictionary:@{
        @"displayType": [_displayType value],
        @"hideFromCatalog": _isHideFromCatalog ? @YES : @NO,
        @"hideFromDataJson": _isHideFromDataJSON ? @YES : @NO,
        @"newBackend": _isNewBackend ? @YES : @NO,
        @"provenance": [_provenance value],
        @"publicationAppendEnabled": _isPublicationAppendEnabled ? @YES : @NO,
        @"publicationStage": [_publicationStage value],
        @"rowsUpdatedBy": [_rowsUpdatedBy value],
        @"viewType": [_viewType value],
        @"grants": map(_grants, λ(id x, [x JSONDictionary])),
        @"metadata": [_metadata JSONDictionary],
        @"owner": [_owner JSONDictionary],
        @"ratings": NSNullify([_ratings JSONDictionary]),
        @"rights": map(_rights, λ(id x, [x value])),
        @"tableAuthor": [_tableAuthor JSONDictionary],
        @"flags": NSNullify(map(_flags, λ(id x, [x value]))),
        @"modifyingViewUid": NSNullify([_modifyingViewUid value]),
    }];

    return dict;
}
@end

@implementation QTGrant
+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
        @"inherited": @"isInherited",
        @"type": @"type",
        @"flags": @"flags",
    };
}

+ (instancetype)fromJSONDictionary:(NSDictionary *)dict
{
    return dict ? [[QTGrant alloc] initWithJSONDictionary:dict] : nil;
}

- (instancetype)initWithJSONDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
        _type = [QTGrantType withValue:(id)_type];
        _flags = map(_flags, λ(id x, [QTGrantFlag withValue:x]));
    }
    return self;
}

- (void)setValue:(nullable id)value forKey:(NSString *)key
{
    [super setValue:value forKey:QTGrant.properties[key]];
}

- (NSDictionary *)JSONDictionary
{
    id dict = [[self dictionaryWithValuesForKeys:QTGrant.properties.allValues] mutableCopy];

    for (id jsonName in QTGrant.properties) {
        id propertyName = QTGrant.properties[jsonName];
        if (![jsonName isEqualToString:propertyName]) {
            dict[jsonName] = dict[propertyName];
            [dict removeObjectForKey:propertyName];
        }
    }

    [dict addEntriesFromDictionary:@{
        @"inherited": _isInherited ? @YES : @NO,
        @"type": [_type value],
        @"flags": map(_flags, λ(id x, [x value])),
    }];

    return dict;
}
@end

@implementation QTMetadata
+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
        @"jsonQuery": @"jsonQuery",
        @"rdfSubject": @"rdfSubject",
        @"rdfClass": @"rdfClass",
        @"rowIdentifier": @"rowIdentifier",
        @"availableDisplayTypes": @"availableDisplayTypes",
        @"rowLabel": @"rowLabel",
        @"renderTypeConfig": @"renderTypeConfig",
        @"richRendererConfigs": @"richRendererConfigs",
        @"custom_fields": @"customFields",
    };
}

+ (instancetype)fromJSONDictionary:(NSDictionary *)dict
{
    return dict ? [[QTMetadata alloc] initWithJSONDictionary:dict] : nil;
}

- (instancetype)initWithJSONDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
        _jsonQuery = [QTJSONQuery fromJSONDictionary:(id)_jsonQuery];
        _rdfSubject = [QTRDFSubject withValue:(id)_rdfSubject];
        _availableDisplayTypes = map(_availableDisplayTypes, λ(id x, [QTAvailableDisplayType withValue:x]));
        _renderTypeConfig = [QTRenderTypeConfig fromJSONDictionary:(id)_renderTypeConfig];
        _richRendererConfigs = [QTRichRendererConfigs fromJSONDictionary:(id)_richRendererConfigs];
        _customFields = [QTCustomFields fromJSONDictionary:(id)_customFields];
    }
    return self;
}

- (void)setValue:(nullable id)value forKey:(NSString *)key
{
    [super setValue:value forKey:QTMetadata.properties[key]];
}

- (NSDictionary *)JSONDictionary
{
    id dict = [[self dictionaryWithValuesForKeys:QTMetadata.properties.allValues] mutableCopy];

    for (id jsonName in QTMetadata.properties) {
        id propertyName = QTMetadata.properties[jsonName];
        if (![jsonName isEqualToString:propertyName]) {
            dict[jsonName] = dict[propertyName];
            [dict removeObjectForKey:propertyName];
        }
    }

    [dict addEntriesFromDictionary:@{
        @"jsonQuery": NSNullify([_jsonQuery JSONDictionary]),
        @"rdfSubject": NSNullify([_rdfSubject value]),
        @"availableDisplayTypes": map(_availableDisplayTypes, λ(id x, [x value])),
        @"renderTypeConfig": [_renderTypeConfig JSONDictionary],
        @"richRendererConfigs": NSNullify([_richRendererConfigs JSONDictionary]),
        @"custom_fields": NSNullify([_customFields JSONDictionary]),
    }];

    return dict;
}
@end

@implementation QTCustomFields
+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
        @"TEST": @"test",
    };
}

+ (instancetype)fromJSONDictionary:(NSDictionary *)dict
{
    return dict ? [[QTCustomFields alloc] initWithJSONDictionary:dict] : nil;
}

- (instancetype)initWithJSONDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
        _test = [QTTest fromJSONDictionary:(id)_test];
    }
    return self;
}

- (void)setValue:(nullable id)value forKey:(NSString *)key
{
    [super setValue:value forKey:QTCustomFields.properties[key]];
}

- (NSDictionary *)JSONDictionary
{
    id dict = [[self dictionaryWithValuesForKeys:QTCustomFields.properties.allValues] mutableCopy];

    for (id jsonName in QTCustomFields.properties) {
        id propertyName = QTCustomFields.properties[jsonName];
        if (![jsonName isEqualToString:propertyName]) {
            dict[jsonName] = dict[propertyName];
            [dict removeObjectForKey:propertyName];
        }
    }

    [dict addEntriesFromDictionary:@{
        @"TEST": [_test JSONDictionary],
    }];

    return dict;
}
@end

@implementation QTTest
+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
        @"CFPB1": @"cfpb1",
    };
}

+ (instancetype)fromJSONDictionary:(NSDictionary *)dict
{
    return dict ? [[QTTest alloc] initWithJSONDictionary:dict] : nil;
}

- (instancetype)initWithJSONDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

- (void)setValue:(nullable id)value forKey:(NSString *)key
{
    [super setValue:value forKey:QTTest.properties[key]];
}

- (NSDictionary *)JSONDictionary
{
    id dict = [[self dictionaryWithValuesForKeys:QTTest.properties.allValues] mutableCopy];

    for (id jsonName in QTTest.properties) {
        id propertyName = QTTest.properties[jsonName];
        if (![jsonName isEqualToString:propertyName]) {
            dict[jsonName] = dict[propertyName];
            [dict removeObjectForKey:propertyName];
        }
    }

    return dict;
}
@end

@implementation QTJSONQuery
+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
        @"order": @"order",
        @"select": @"select",
        @"group": @"group",
    };
}

+ (instancetype)fromJSONDictionary:(NSDictionary *)dict
{
    return dict ? [[QTJSONQuery alloc] initWithJSONDictionary:dict] : nil;
}

- (instancetype)initWithJSONDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
        _order = map(_order, λ(id x, [QTOrder fromJSONDictionary:x]));
        _select = map(_select, λ(id x, [QTSelect fromJSONDictionary:x]));
        _group = map(_group, λ(id x, [QTGroup fromJSONDictionary:x]));
    }
    return self;
}

- (NSDictionary *)JSONDictionary
{
    id dict = [[self dictionaryWithValuesForKeys:QTJSONQuery.properties.allValues] mutableCopy];

    [dict addEntriesFromDictionary:@{
        @"order": NSNullify(map(_order, λ(id x, [x JSONDictionary]))),
        @"select": NSNullify(map(_select, λ(id x, [x JSONDictionary]))),
        @"group": NSNullify(map(_group, λ(id x, [x JSONDictionary]))),
    }];

    return dict;
}
@end

@implementation QTGroup
+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
        @"columnFieldName": @"columnFieldName",
    };
}

+ (instancetype)fromJSONDictionary:(NSDictionary *)dict
{
    return dict ? [[QTGroup alloc] initWithJSONDictionary:dict] : nil;
}

- (instancetype)initWithJSONDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

- (NSDictionary *)JSONDictionary
{
    return [self dictionaryWithValuesForKeys:QTGroup.properties.allValues];
}
@end

@implementation QTOrder
+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
        @"ascending": @"isAscending",
        @"columnFieldName": @"columnFieldName",
    };
}

+ (instancetype)fromJSONDictionary:(NSDictionary *)dict
{
    return dict ? [[QTOrder alloc] initWithJSONDictionary:dict] : nil;
}

- (instancetype)initWithJSONDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

- (void)setValue:(nullable id)value forKey:(NSString *)key
{
    [super setValue:value forKey:QTOrder.properties[key]];
}

- (NSDictionary *)JSONDictionary
{
    id dict = [[self dictionaryWithValuesForKeys:QTOrder.properties.allValues] mutableCopy];

    for (id jsonName in QTOrder.properties) {
        id propertyName = QTOrder.properties[jsonName];
        if (![jsonName isEqualToString:propertyName]) {
            dict[jsonName] = dict[propertyName];
            [dict removeObjectForKey:propertyName];
        }
    }

    [dict addEntriesFromDictionary:@{
        @"ascending": _isAscending ? @YES : @NO,
    }];

    return dict;
}
@end

@implementation QTSelect
+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
        @"columnFieldName": @"columnFieldName",
        @"aggregate": @"aggregate",
    };
}

+ (instancetype)fromJSONDictionary:(NSDictionary *)dict
{
    return dict ? [[QTSelect alloc] initWithJSONDictionary:dict] : nil;
}

- (instancetype)initWithJSONDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

- (NSDictionary *)JSONDictionary
{
    return [self dictionaryWithValuesForKeys:QTSelect.properties.allValues];
}
@end

@implementation QTRenderTypeConfig
+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
        @"visible": @"visible",
    };
}

+ (instancetype)fromJSONDictionary:(NSDictionary *)dict
{
    return dict ? [[QTRenderTypeConfig alloc] initWithJSONDictionary:dict] : nil;
}

- (instancetype)initWithJSONDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
        _visible = [QTVisible fromJSONDictionary:(id)_visible];
    }
    return self;
}

- (NSDictionary *)JSONDictionary
{
    id dict = [[self dictionaryWithValuesForKeys:QTRenderTypeConfig.properties.allValues] mutableCopy];

    [dict addEntriesFromDictionary:@{
        @"visible": [_visible JSONDictionary],
    }];

    return dict;
}
@end

@implementation QTVisible
+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
        @"table": @"table",
        @"fatrow": @"fatrow",
    };
}

+ (instancetype)fromJSONDictionary:(NSDictionary *)dict
{
    return dict ? [[QTVisible alloc] initWithJSONDictionary:dict] : nil;
}

- (instancetype)initWithJSONDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

- (NSDictionary *)JSONDictionary
{
    return [self dictionaryWithValuesForKeys:QTVisible.properties.allValues];
}
@end

@implementation QTRichRendererConfigs
+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
        @"fatRow": @"fatRow",
    };
}

+ (instancetype)fromJSONDictionary:(NSDictionary *)dict
{
    return dict ? [[QTRichRendererConfigs alloc] initWithJSONDictionary:dict] : nil;
}

- (instancetype)initWithJSONDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
        _fatRow = [QTFatRow fromJSONDictionary:(id)_fatRow];
    }
    return self;
}

- (NSDictionary *)JSONDictionary
{
    id dict = [[self dictionaryWithValuesForKeys:QTRichRendererConfigs.properties.allValues] mutableCopy];

    [dict addEntriesFromDictionary:@{
        @"fatRow": [_fatRow JSONDictionary],
    }];

    return dict;
}
@end

@implementation QTFatRow
+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
        @"columns": @"columns",
    };
}

+ (instancetype)fromJSONDictionary:(NSDictionary *)dict
{
    return dict ? [[QTFatRow alloc] initWithJSONDictionary:dict] : nil;
}

- (instancetype)initWithJSONDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
        _columns = map(_columns, λ(id x, [QTColumn fromJSONDictionary:x]));
    }
    return self;
}

- (NSDictionary *)JSONDictionary
{
    id dict = [[self dictionaryWithValuesForKeys:QTFatRow.properties.allValues] mutableCopy];

    [dict addEntriesFromDictionary:@{
        @"columns": map(_columns, λ(id x, [x JSONDictionary])),
    }];

    return dict;
}
@end

@implementation QTColumn
+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
        @"styles": @"styles",
        @"rows": @"rows",
    };
}

+ (instancetype)fromJSONDictionary:(NSDictionary *)dict
{
    return dict ? [[QTColumn alloc] initWithJSONDictionary:dict] : nil;
}

- (instancetype)initWithJSONDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
        _styles = [QTStyles fromJSONDictionary:(id)_styles];
        _rows = map(_rows, λ(id x, [QTRow fromJSONDictionary:x]));
    }
    return self;
}

- (NSDictionary *)JSONDictionary
{
    id dict = [[self dictionaryWithValuesForKeys:QTColumn.properties.allValues] mutableCopy];

    [dict addEntriesFromDictionary:@{
        @"styles": [_styles JSONDictionary],
        @"rows": map(_rows, λ(id x, [x JSONDictionary])),
    }];

    return dict;
}
@end

@implementation QTRow
+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
        @"fields": @"fields",
    };
}

+ (instancetype)fromJSONDictionary:(NSDictionary *)dict
{
    return dict ? [[QTRow alloc] initWithJSONDictionary:dict] : nil;
}

- (instancetype)initWithJSONDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
        _fields = map(_fields, λ(id x, [QTField fromJSONDictionary:x]));
    }
    return self;
}

- (NSDictionary *)JSONDictionary
{
    id dict = [[self dictionaryWithValuesForKeys:QTRow.properties.allValues] mutableCopy];

    [dict addEntriesFromDictionary:@{
        @"fields": map(_fields, λ(id x, [x JSONDictionary])),
    }];

    return dict;
}
@end

@implementation QTField
+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
        @"tableColumnId": @"tableColumnID",
        @"type": @"type",
    };
}

+ (instancetype)fromJSONDictionary:(NSDictionary *)dict
{
    return dict ? [[QTField alloc] initWithJSONDictionary:dict] : nil;
}

- (instancetype)initWithJSONDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
        _type = [QTFieldType withValue:(id)_type];
    }
    return self;
}

- (void)setValue:(nullable id)value forKey:(NSString *)key
{
    [super setValue:value forKey:QTField.properties[key]];
}

- (NSDictionary *)JSONDictionary
{
    id dict = [[self dictionaryWithValuesForKeys:QTField.properties.allValues] mutableCopy];

    for (id jsonName in QTField.properties) {
        id propertyName = QTField.properties[jsonName];
        if (![jsonName isEqualToString:propertyName]) {
            dict[jsonName] = dict[propertyName];
            [dict removeObjectForKey:propertyName];
        }
    }

    [dict addEntriesFromDictionary:@{
        @"type": [_type value],
    }];

    return dict;
}
@end

@implementation QTStyles
+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
        @"width": @"width",
    };
}

+ (instancetype)fromJSONDictionary:(NSDictionary *)dict
{
    return dict ? [[QTStyles alloc] initWithJSONDictionary:dict] : nil;
}

- (instancetype)initWithJSONDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
        _width = [QTWidth withValue:(id)_width];
    }
    return self;
}

- (NSDictionary *)JSONDictionary
{
    id dict = [[self dictionaryWithValuesForKeys:QTStyles.properties.allValues] mutableCopy];

    [dict addEntriesFromDictionary:@{
        @"width": [_width value],
    }];

    return dict;
}
@end

@implementation QTOwner
+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
        @"id": @"identifier",
        @"displayName": @"displayName",
        @"screenName": @"screenName",
        @"type": @"type",
        @"flags": @"flags",
        @"profileImageUrlLarge": @"profileImageURLLarge",
        @"profileImageUrlMedium": @"profileImageURLMedium",
        @"profileImageUrlSmall": @"profileImageURLSmall",
    };
}

+ (instancetype)fromJSONDictionary:(NSDictionary *)dict
{
    return dict ? [[QTOwner alloc] initWithJSONDictionary:dict] : nil;
}

- (instancetype)initWithJSONDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
        _type = [QTOwnerType withValue:(id)_type];
        _flags = map(_flags, λ(id x, [QTOwnerFlag withValue:x]));
    }
    return self;
}

- (void)setValue:(nullable id)value forKey:(NSString *)key
{
    [super setValue:value forKey:QTOwner.properties[key]];
}

- (NSDictionary *)JSONDictionary
{
    id dict = [[self dictionaryWithValuesForKeys:QTOwner.properties.allValues] mutableCopy];

    for (id jsonName in QTOwner.properties) {
        id propertyName = QTOwner.properties[jsonName];
        if (![jsonName isEqualToString:propertyName]) {
            dict[jsonName] = dict[propertyName];
            [dict removeObjectForKey:propertyName];
        }
    }

    [dict addEntriesFromDictionary:@{
        @"type": [_type value],
        @"flags": NSNullify(map(_flags, λ(id x, [x value]))),
    }];

    return dict;
}
@end

@implementation QTRatings
+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
        @"rating": @"rating",
    };
}

+ (instancetype)fromJSONDictionary:(NSDictionary *)dict
{
    return dict ? [[QTRatings alloc] initWithJSONDictionary:dict] : nil;
}

- (instancetype)initWithJSONDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

- (NSDictionary *)JSONDictionary
{
    return [self dictionaryWithValuesForKeys:QTRatings.properties.allValues];
}
@end

@implementation QTTableAuthor
+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
        @"id": @"identifier",
        @"displayName": @"displayName",
        @"screenName": @"screenName",
        @"type": @"type",
        @"flags": @"flags",
    };
}

+ (instancetype)fromJSONDictionary:(NSDictionary *)dict
{
    return dict ? [[QTTableAuthor alloc] initWithJSONDictionary:dict] : nil;
}

- (instancetype)initWithJSONDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
        _identifier = [QTID withValue:(id)_identifier];
        _displayName = [QTName withValue:(id)_displayName];
        _screenName = [QTName withValue:(id)_screenName];
        _type = [QTOwnerType withValue:(id)_type];
        _flags = map(_flags, λ(id x, [QTOwnerFlag withValue:x]));
    }
    return self;
}

- (void)setValue:(nullable id)value forKey:(NSString *)key
{
    [super setValue:value forKey:QTTableAuthor.properties[key]];
}

- (NSDictionary *)JSONDictionary
{
    id dict = [[self dictionaryWithValuesForKeys:QTTableAuthor.properties.allValues] mutableCopy];

    for (id jsonName in QTTableAuthor.properties) {
        id propertyName = QTTableAuthor.properties[jsonName];
        if (![jsonName isEqualToString:propertyName]) {
            dict[jsonName] = dict[propertyName];
            [dict removeObjectForKey:propertyName];
        }
    }

    [dict addEntriesFromDictionary:@{
        @"id": [_identifier value],
        @"displayName": [_displayName value],
        @"screenName": [_screenName value],
        @"type": [_type value],
        @"flags": NSNullify(map(_flags, λ(id x, [x value]))),
    }];

    return dict;
}
@end

NS_ASSUME_NONNULL_END
