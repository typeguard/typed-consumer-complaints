// To parse this JSON:
//
//   NSError *error;
//   QTConsumerComplaints *consumerComplaints = QTConsumerComplaintsFromJSON(json, NSUTF8Encoding, &error);

#import <Foundation/Foundation.h>

@class QTConsumerComplaint;
@class QTDisplayType;
@class QTConsumerComplaintFlag;
@class QTGrant;
@class QTGrantFlag;
@class QTGrantType;
@class QTMetadata;
@class QTAvailableDisplayType;
@class QTCustomFields;
@class QTTest;
@class QTJSONQuery;
@class QTOrder;
@class QTRenderTypeConfig;
@class QTVisible;
@class QTRichRendererConfigs;
@class QTFatRow;
@class QTColumn;
@class QTRow;
@class QTField;
@class QTFieldType;
@class QTStyles;
@class QTWidth;
@class QTModifyingViewUid;
@class QTOwner;
@class QTOwnerType;
@class QTProvenance;
@class QTPublicationStage;
@class QTRatings;
@class QTRight;
@class QTRowsUpdatedBy;
@class QTTableAuthor;
@class QTName;
@class QTID;
@class QTViewType;

NS_ASSUME_NONNULL_BEGIN

#pragma mark - Boxed enums

@interface QTDisplayType : NSObject
@property (nonatomic, readonly, copy) NSString *value;
+ (instancetype _Nullable)withValue:(NSString *)value;
+ (QTDisplayType *)fatrow;
+ (QTDisplayType *)table;
@end

@interface QTConsumerComplaintFlag : NSObject
@property (nonatomic, readonly, copy) NSString *value;
+ (instancetype _Nullable)withValue:(NSString *)value;
+ (QTConsumerComplaintFlag *)flagDefault;
+ (QTConsumerComplaintFlag *)restorable;
+ (QTConsumerComplaintFlag *)restorePossibleForType;
@end

@interface QTGrantFlag : NSObject
@property (nonatomic, readonly, copy) NSString *value;
+ (instancetype _Nullable)withValue:(NSString *)value;
+ (QTGrantFlag *)public;
@end

@interface QTGrantType : NSObject
@property (nonatomic, readonly, copy) NSString *value;
+ (instancetype _Nullable)withValue:(NSString *)value;
+ (QTGrantType *)viewer;
@end

@interface QTAvailableDisplayType : NSObject
@property (nonatomic, readonly, copy) NSString *value;
+ (instancetype _Nullable)withValue:(NSString *)value;
+ (QTAvailableDisplayType *)fatrow;
+ (QTAvailableDisplayType *)page;
+ (QTAvailableDisplayType *)table;
@end

@interface QTFieldType : NSObject
@property (nonatomic, readonly, copy) NSString *value;
+ (instancetype _Nullable)withValue:(NSString *)value;
+ (QTFieldType *)columnData;
+ (QTFieldType *)columnLabel;
@end

@interface QTWidth : NSObject
@property (nonatomic, readonly, copy) NSString *value;
+ (instancetype _Nullable)withValue:(NSString *)value;
+ (QTWidth *)the27;
+ (QTWidth *)the30;
+ (QTWidth *)the31;
+ (QTWidth *)the33;
+ (QTWidth *)the40;
@end

@interface QTModifyingViewUid : NSObject
@property (nonatomic, readonly, copy) NSString *value;
+ (instancetype _Nullable)withValue:(NSString *)value;
+ (QTModifyingViewUid *)s6EwH6Mp;
@end

@interface QTOwnerType : NSObject
@property (nonatomic, readonly, copy) NSString *value;
+ (instancetype _Nullable)withValue:(NSString *)value;
+ (QTOwnerType *)interactive;
@end

@interface QTProvenance : NSObject
@property (nonatomic, readonly, copy) NSString *value;
+ (instancetype _Nullable)withValue:(NSString *)value;
+ (QTProvenance *)official;
@end

@interface QTPublicationStage : NSObject
@property (nonatomic, readonly, copy) NSString *value;
+ (instancetype _Nullable)withValue:(NSString *)value;
+ (QTPublicationStage *)published;
@end

@interface QTRight : NSObject
@property (nonatomic, readonly, copy) NSString *value;
+ (instancetype _Nullable)withValue:(NSString *)value;
+ (QTRight *)read;
@end

@interface QTRowsUpdatedBy : NSObject
@property (nonatomic, readonly, copy) NSString *value;
+ (instancetype _Nullable)withValue:(NSString *)value;
+ (QTRowsUpdatedBy *)pjxgVe4M;
+ (QTRowsUpdatedBy *)the54A3Qyun;
+ (QTRowsUpdatedBy *)the9E3M2843;
+ (QTRowsUpdatedBy *)vvcaFr6G;
@end

@interface QTName : NSObject
@property (nonatomic, readonly, copy) NSString *value;
+ (instancetype _Nullable)withValue:(NSString *)value;
+ (QTName *)danMunz;
+ (QTName *)dougTaylor;
+ (QTName *)ming;
+ (QTName *)shannonFiles;
@end

@interface QTID : NSObject
@property (nonatomic, readonly, copy) NSString *value;
+ (instancetype _Nullable)withValue:(NSString *)value;
+ (QTID *)pjxgVe4M;
+ (QTID *)the54A3Qyun;
+ (QTID *)the9E3M2843;
+ (QTID *)the9EkiH2Hn;
@end

@interface QTViewType : NSObject
@property (nonatomic, readonly, copy) NSString *value;
+ (instancetype _Nullable)withValue:(NSString *)value;
+ (QTViewType *)tabular;
@end

typedef NSArray<QTConsumerComplaint *> QTConsumerComplaints;

#pragma mark - Top-level marshaling functions

QTConsumerComplaints *_Nullable QTConsumerComplaintsFromData(NSData *data, NSError **error);
QTConsumerComplaints *_Nullable QTConsumerComplaintsFromJSON(NSString *json, NSStringEncoding encoding, NSError **error);
NSData               *_Nullable QTConsumerComplaintsToData(QTConsumerComplaints *consumerComplaints, NSError **error);
NSString             *_Nullable QTConsumerComplaintsToJSON(QTConsumerComplaints *consumerComplaints, NSStringEncoding encoding, NSError **error);

#pragma mark - Object interfaces

@interface QTConsumerComplaint : NSObject
@property (nonatomic, copy)             NSString *identifier;
@property (nonatomic, copy)             NSString *name;
@property (nonatomic, assign)           NSInteger averageRating;
@property (nonatomic, assign)           NSInteger createdAt;
@property (nonatomic, copy)             NSString *theDescription;
@property (nonatomic, assign)           QTDisplayType *displayType;
@property (nonatomic, assign)           NSInteger downloadCount;
@property (nonatomic, assign)           BOOL isHideFromCatalog;
@property (nonatomic, assign)           BOOL isHideFromDataJSON;
@property (nonatomic, nullable, strong) NSNumber *indexUpdatedAt;
@property (nonatomic, assign)           BOOL isNewBackend;
@property (nonatomic, assign)           NSInteger numberOfComments;
@property (nonatomic, assign)           NSInteger oid;
@property (nonatomic, assign)           QTProvenance *provenance;
@property (nonatomic, assign)           BOOL isPublicationAppendEnabled;
@property (nonatomic, assign)           NSInteger publicationDate;
@property (nonatomic, assign)           NSInteger publicationGroup;
@property (nonatomic, assign)           QTPublicationStage *publicationStage;
@property (nonatomic, nullable, copy)   NSString *rowClass;
@property (nonatomic, assign)           NSInteger rowsUpdatedAt;
@property (nonatomic, assign)           QTRowsUpdatedBy *rowsUpdatedBy;
@property (nonatomic, assign)           NSInteger tableID;
@property (nonatomic, assign)           NSInteger totalTimesRated;
@property (nonatomic, assign)           NSInteger viewCount;
@property (nonatomic, assign)           NSInteger viewLastModified;
@property (nonatomic, assign)           QTViewType *viewType;
@property (nonatomic, copy)             NSArray<QTGrant *> *grants;
@property (nonatomic, strong)           QTMetadata *metadata;
@property (nonatomic, strong)           QTOwner *owner;
@property (nonatomic, nullable, strong) QTRatings *ratings;
@property (nonatomic, copy)             NSArray<QTRight *> *rights;
@property (nonatomic, strong)           QTTableAuthor *tableAuthor;
@property (nonatomic, nullable, copy)   NSArray<QTConsumerComplaintFlag *> *flags;
@property (nonatomic, nullable, strong) NSNumber *moderationStatus;
@property (nonatomic, nullable, copy)   NSString *category;
@property (nonatomic, nullable, copy)   NSArray<NSString *> *tags;
@property (nonatomic, nullable, assign) QTModifyingViewUid *modifyingViewUid;
@end

@interface QTGrant : NSObject
@property (nonatomic, assign) BOOL isInherited;
@property (nonatomic, assign) QTGrantType *type;
@property (nonatomic, copy)   NSArray<QTGrantFlag *> *flags;
@end

@interface QTMetadata : NSObject
@property (nonatomic, nullable, strong) QTJSONQuery *jsonQuery;
@property (nonatomic, nullable, copy)   NSString *rdfSubject;
@property (nonatomic, nullable, copy)   NSString *rdfClass;
@property (nonatomic, nullable, copy)   NSString *rowIdentifier;
@property (nonatomic, copy)             NSArray<QTAvailableDisplayType *> *availableDisplayTypes;
@property (nonatomic, nullable, copy)   NSString *rowLabel;
@property (nonatomic, strong)           QTRenderTypeConfig *renderTypeConfig;
@property (nonatomic, nullable, strong) QTRichRendererConfigs *richRendererConfigs;
@property (nonatomic, nullable, strong) QTCustomFields *customFields;
@end

@interface QTCustomFields : NSObject
@property (nonatomic, strong) QTTest *test;
@end

@interface QTTest : NSObject
@property (nonatomic, copy) NSString *cfpb1;
@end

@interface QTJSONQuery : NSObject
@property (nonatomic, copy) NSArray<QTOrder *> *order;
@end

@interface QTOrder : NSObject
@property (nonatomic, assign) BOOL isAscending;
@property (nonatomic, copy)   NSString *columnFieldName;
@end

@interface QTRenderTypeConfig : NSObject
@property (nonatomic, strong) QTVisible *visible;
@end

@interface QTVisible : NSObject
@property (nonatomic, nullable, strong) NSNumber *table;
@property (nonatomic, nullable, strong) NSNumber *fatrow;
@end

@interface QTRichRendererConfigs : NSObject
@property (nonatomic, strong) QTFatRow *fatRow;
@end

@interface QTFatRow : NSObject
@property (nonatomic, copy) NSArray<QTColumn *> *columns;
@end

@interface QTColumn : NSObject
@property (nonatomic, strong) QTStyles *styles;
@property (nonatomic, copy)   NSArray<QTRow *> *rows;
@end

@interface QTRow : NSObject
@property (nonatomic, copy) NSArray<QTField *> *fields;
@end

@interface QTField : NSObject
@property (nonatomic, assign) NSInteger tableColumnID;
@property (nonatomic, assign) QTFieldType *type;
@end

@interface QTStyles : NSObject
@property (nonatomic, assign) QTWidth *width;
@end

@interface QTOwner : NSObject
@property (nonatomic, copy)           NSString *identifier;
@property (nonatomic, copy)           NSString *displayName;
@property (nonatomic, copy)           NSString *screenName;
@property (nonatomic, assign)         QTOwnerType *type;
@property (nonatomic, nullable, copy) NSString *profileImageURLLarge;
@property (nonatomic, nullable, copy) NSString *profileImageURLMedium;
@property (nonatomic, nullable, copy) NSString *profileImageURLSmall;
@end

@interface QTRatings : NSObject
@property (nonatomic, assign) NSInteger rating;
@end

@interface QTTableAuthor : NSObject
@property (nonatomic, assign) QTID *identifier;
@property (nonatomic, assign) QTName *displayName;
@property (nonatomic, assign) QTName *screenName;
@property (nonatomic, assign) QTOwnerType *type;
@end

NS_ASSUME_NONNULL_END
