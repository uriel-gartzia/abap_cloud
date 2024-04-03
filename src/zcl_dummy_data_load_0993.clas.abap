CLASS zcl_dummy_data_load_0993 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_dummy_data_load_0993 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

*** 1. Eliminar todos los registros de la tabla

DELETE FROM ztdummy_0993.


*** 2. Insertar 3 registros en la tabla

DATA: lt_dummy_0993 TYPE STANDARD TABLE OF ztdummy_0993.

"Registro 1
APPEND INITIAL LINE TO lt_dummy_0993 ASSIGNING FIELD-SYMBOL(<lfs_dummy_0993>).

<lfs_dummy_0993>-id       = '01'.
<lfs_dummy_0993>-name     = 'Uriel'.
<lfs_dummy_0993>-surrname = 'Gartzia'.
<lfs_dummy_0993>-email    = 'ugartziasola@gmail.com'.

"Registro 2
APPEND INITIAL LINE TO lt_dummy_0993 ASSIGNING <lfs_dummy_0993>.

<lfs_dummy_0993>-id       = '02'.
<lfs_dummy_0993>-name     = 'Alejandro'.
<lfs_dummy_0993>-surrname = 'Martínez'.
<lfs_dummy_0993>-email    = 'amartinez@gmail.com'.

"Registro 3
APPEND INITIAL LINE TO lt_dummy_0993 ASSIGNING <lfs_dummy_0993>.

<lfs_dummy_0993>-id       = '03'.
<lfs_dummy_0993>-name     = 'Marta'.
<lfs_dummy_0993>-surrname = 'Burugorri'.
<lfs_dummy_0993>-email    = 'mburugorri@gmail.com'.

INSERT ztdummy_0993 FROM TABLE @lt_dummy_0993.


*** 3. Leer todos los registros de la tabla y mostrarlos por consola sin el mandante.

SELECT id, name, surrname, email
FROM ztdummy_0993
INTO TABLE @DATA(lt_out).


*** 4. Actualizar 2 registros modificando en uno el email y en otro el nombre

UPDATE ztdummy_0993
SET email = 'email@nuevo.com'
WHERE id = '01'.

UPDATE ztdummy_0993
SET name = 'Nombre nuevo'
WHERE id = '02'.


*** 5. Leer de la tabla solo los registros modificados

SELECT id, name, surrname, email
FROM ztdummy_0993
WHERE id   = '01'
AND   name = 'Nombre nuevo'
INTO TABLE @lt_out.


*** 6. Eliminar de la tabla el registro no modificado

DELETE FROM ztdummy_0993 WHERE id = '03'.


*** 7. Insertar un nuevo registro y actualizar otro al mismo tiempo

READ TABLE lt_dummy_0993 ASSIGNING <lfs_dummy_0993> INDEX 2.
<lfs_dummy_0993>-name = 'NombreModify'.
delete lt_dummy_0993  WHERE id ne '02'.
APPEND INITIAL LINE TO lt_dummy_0993 ASSIGNING <lfs_dummy_0993>.

<lfs_dummy_0993>-id       = '03'.
<lfs_dummy_0993>-name     = 'Pepito'.
<lfs_dummy_0993>-surrname = 'Burugorri'.
<lfs_dummy_0993>-email    = 'mburugorri@gmail.com'.

MODIFY ztdummy_0993 FROM TABLE @lt_dummy_0993.


*** 8. en la cadena de texto "Nueva cadena de texto para ejercicio." Me digas cuantas palabras hay

DATA: lv_text         TYPE string VALUE 'Nueva cadena de texto para ejercicio.',
      lv_space        TYPE string VALUE ' ',
      lv_word_counter TYPE c.


SPLIT lv_text AT space INTO TABLE DATA(lt_words).

lv_word_counter = lines( lt_words ).

*** 9. Longitud del string

DATA lv_char_counter TYPE int1.

lv_char_counter = STRLEN( lv_text ).


*** 10. Número de caracteres

CLEAR lv_char_counter.

CONDENSE lv_text NO-GAPS.

lv_char_counter = STRLEN( lv_text ).

out->write( lv_char_counter ).

*** 11. Restricción de caracteres especiales

CLEAR lv_char_counter.

DATA lv_string TYPE string VALUE ',,,,Nueva cadena de caractere*s con simbolos&%$ y números 1234.'.

FIND ALL OCCURRENCES OF PCRE '[A-Za-z]' IN lv_string
MATCH COUNT lv_char_counter.

out->write( lv_char_counter ).

CLEAR lv_char_counter.

REPLACE ALL OCCURRENCES OF REGEX '[^A-Za-z]' IN lv_string WITH ''.

lv_char_counter = STRLEN( lv_string ).

out->write( lv_char_counter ).








  ENDMETHOD.

ENDCLASS.


