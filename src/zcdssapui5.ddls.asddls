
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ZCDSSAPUI5'
@Search.searchable: true
@UI.headerInfo :{ typeName: 'Zsap ui5'}

define view entity ZCDSSAPUI5 as select from I_OperationalAcctgDocItem
{
   @Search.defaultSearchElement: true
   @UI.selectionField: [{ position: 1  }]
   @UI.lineItem: [{ position: 1 ,label: 'Suppliernumber' }]  
   
   key AccountingDocument,
   
   @Search.defaultSearchElement: true
   @UI.selectionField: [{ position: 2  }]
   @UI.lineItem: [{ position: 2 , label: 'Fiscal year'}]
   
   key FiscalYear,
   @Search.defaultSearchElement: true
   @UI.selectionField: [{ position: 3 }]
   @UI.lineItem: [{ position: 3 ,label: 'Companycode' }]
   
   key companycode
   
}
