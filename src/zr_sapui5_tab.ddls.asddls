@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@EndUserText.label: '###GENERATED Core Data Service Entity'
define root view entity ZR_SAPUI5_TAB
  as select from ZSAPUI5_TAB
{
  key id as Id,
  key name as Name,
  father as Father,
  mother as Mother
  
}
