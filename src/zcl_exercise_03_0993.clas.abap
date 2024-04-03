CLASS zcl_exercise_03_0993 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_exercise_03_0993 IMPLEMENTATION.

METHOD if_oo_adt_classrun~main.

*** 1 - Eleva 5 a las cuarta. El resultado muéstralo por consola indicado que 5 a la cuarta es X,
*** siendo X tu resultado.

DATA lv_result TYPE int4.

lv_result = 5 ** 4.

"out->write( '5 a la cuarta es ', lv_result ).

*** 2- haz un bucle sumando a una variable de valor 0 un 1 por cada interacción,
*** cuando esa variable llegue a 5 rompes el bucle.

DATA: lv_counter TYPE int4 VALUE 0.

    SELECT *
    FROM ztdummy_0993
    INTO TABLE @DATA(lt_dummy).

    LOOP AT lt_dummy INTO DATA(ls_dummy).

        IF lv_counter < 5.

            lv_counter = lv_counter + 1.

        ELSEIF lv_counter = 5.

            EXIT.

        ENDIF.

    ENDLOOP.

*** 3 - lee los registros de la tabla de BBDD y recorriendo el resultado,
*** indica cuál es el primer registro y cual es el último.




ENDMETHOD.

ENDCLASS.
