@Metadata.allowExtensions: true
@EndUserText.label: '###GENERATED Core Data Service Entity'
@AccessControl.authorizationCheck: #CHECK
define root view entity ZC_SAPUI5_TAB
  provider contract TRANSACTIONAL_QUERY
  as projection on ZR_SAPUI5_TAB
{
  key Id,
  key Name,
  Father,
  Mother
  
}
