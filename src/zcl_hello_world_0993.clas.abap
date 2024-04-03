CLASS zcl_hello_world_0993 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

  INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_hello_world_0993 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

  out->write( 'Hello world' ).
  "Lupear tabla interna y eliminar un registro de ztdummy_0993 en cada iteración.
*  LOOP AT lt_dummy_0993 ASSIGNING FIELD-SYMBOL(<fs_dummy_0993>).
*  DELETE FROM ztdummy_0993 WHERE id = @<fs_dummy_0993>-id.
*  ENDLOOP.
*
*  "Nuevo registro 1
*  <fs_dummy_0993>-id       = '01'.
*  <fs_dummy_0993>-name     = 'Uriel'.
*  <fs_dummy_0993>-surrname = 'Gartzia'.
*  <fs_dummy_0993>-email    = 'ugartziasola@gmail.com'.
*
*  "INSERT <fs_dummy_0993> INTO TABLE lt_dummy_0993.
*  CLEAR  <fs_dummy_0993>.
*
*c
*
*  INSERT <fs_dummy_0993> INTO TABLE lt_dummy_0993.
*  CLEAR  <fs_dummy_0993>.
*
*  "Nuevo registro 3
*  <fs_dummy_0993>-id       = '03'.
*  <fs_dummy_0993>-name     = 'Marta'.
*  <fs_dummy_0993>-surrname = 'Burugorri'.
*  <fs_dummy_0993>-email    = 'martaburugorri@gmail.com'.
*
*  INSERT <fs_dummy_0993> INTO TABLE lt_dummy_0993.
*  CLEAR  <fs_dummy_0993>.
*
*  UNASSIGN <fs_dummy_0993>.

  ENDMETHOD.

ENDCLASS.
