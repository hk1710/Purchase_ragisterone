CLASS zsapui5class1 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
    CLASS-DATA : accsess TYPE string.
    CLASS-DATA : xml_file TYPE string.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZSAPUI5CLASS1 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA(lv_doc) = '1500000033'.

    SELECT SINGLE
    a~accountingdocument,
    a~companycode,
    a~housebank,
    a~clearingdocfiscalyear,
    a~clearingjournalentryfiscalyear

    FROM I_OperationalAcctgDocItem AS a

    WHERE a~AccountingDocument = @lv_doc  AND a~HouseBankAccount IS NOT INITIAL

    INTO @DATA(wa).
    out->write( wa ).

    "" now write down item level""
    SELECT
    a~accountingdocument,
    a~companycode,
    a~housebank

    FROM I_OperationalAcctgDocItem AS a

    WHERE a~AccountingDocument = @lv_doc AND a~AccountingDocumentType = 'KZ'

    INTO  TABLE @DATA(item).

    out->write( item ).










  ENDMETHOD.
ENDCLASS.
