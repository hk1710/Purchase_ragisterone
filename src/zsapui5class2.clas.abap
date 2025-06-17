CLASS zsapui5class2 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZSAPUI5CLASS2 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    SELECT SINGLE
    a~material,
    a~plant,
    a~inspectionlotobjecttext,
    a~materialdocument,
    a~inspectionlotquantity,
    a~insplotqtytoblocked,
    a~inspectionlotsamplequantity,
    a~insplotselectionsupplier,
    b~suppliername


    FROM I_InspectionLot AS a
    LEFT JOIN i_supplier AS b ON a~Supplier = b~Supplier
    LEFT JOIN i_inspectioncharacteristic AS  c ON a~plant = c~inspectionspecificationplant
    WHERE a~InspectionLot = '010000000057'



    INTO @DATA(wa).


    out->write( wa ).
    """ item level """"""""""
    SELECT
     a~material,

     c~inspectioncharacteristic,
    c~inspspeclowerlimit,
    c~inspspecupperlimit,
    c~inspectionspecificationunit,
    c~inspectionmethod
     FROM I_InspectionLot AS a
      LEFT JOIN i_inspectioncharacteristic AS  c ON a~plant = c~inspectionspecificationplant
      WHERE  a~InspectionLot = '010000000057'
      INTO TABLE @DATA(item).
    out->write( item ).

    "" creat the xml """

*    DATA(lv_xml) = |<form>| &&
*                    |<Header>| &&
*                    |<Name of Material>{ wa-InspectionLotObjectText }</Name of Material>| &&
*                    |<materialcode>{ wa-Material }</materialcode>| &&
*                    |<imvoice_number>{ wa-MaterialDocument }</invoice_number>| &&
*                    |</Header>| &&
*                    |<lineitem>|.
*    LOOP AT item  INTO DATA(wa_item).
*      DATA(lv_xml_table) = |<item>| &&
*                           |<test_parameter>{ wa_item-Material }</test_parameter>| &&
*                           |<specification>{ wa_item-InspectionMethod }</specification>| &&
*                           |<Results>{ wa_item-InspectionCharacteristic }</results>|  &&
*                           |<method>{ wa_item-InspSpecLowerLimit }</method>| &&
*                           |</item>|.
*      CONCATENATE lv_xml lv_xml_table INTO lv_xml.
*
*    ENDLOOP.
*    CONCATENATE lv_xml '</lineitem>' '</form>' INTO lv_xml.
    DATA(lv_xml) = |<form>| &&
                   |<Header>| &&
                   |<Name of Material>{ wa-InspectionLotObjectText }</Name of Material>| &&
                   |<materialcode>{ wa-Material }</materialcode>| &&
                   |<invoice_number>{ wa-MaterialDocument }</invoice_number>| &&
                   |</Header>| &&
                   |<lineitem>|.

    LOOP AT item INTO DATA(wa_item).
      DATA(lv_xml_table) = |<item>| &&
                           |<test_parameter>{ wa_item-Material }</test_parameter>| &&
                           |<specification>{ wa_item-InspectionMethod }</specification>| &&
                           |<Results>{ wa_item-InspectionCharacteristic }</Results>| &&
                           |<method>{ wa_item-InspSpecLowerLimit }</method>| &&
                           |</item>|.

      CONCATENATE lv_xml lv_xml_table INTO lv_xml.
    ENDLOOP.

    lv_xml = lv_xml && |</lineitem>| && |</form>|.


    out->write( lv_xml ).


  ENDMETHOD.
ENDCLASS.
