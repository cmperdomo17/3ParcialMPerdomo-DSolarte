;Integrantes:
;-Daniel Fernando Solarte Ortega
;-Carlos Mario Perdomo Ramos

(defun registrarClientes(nit)
    (setq band 1);Bandera para las validaciones de los datos 1=true,0=false
    (setq encontrado 0);Bandera para verificar si se encontro el banco 1=true,0=false
    (setq i 0);Variable iteradora para el LOOP de buscar el banco

    ;Si el primer banco es null significa que NO se registraron los dos bancos
    (if (null (aref vectorBancos 0)) (progn (print "No hay bancos registrados"))
    (progn 

    ;Se busca el banco en el vector de bancos
    (loop
    (setf auxBanco (aref vectorBancos i))

    (if (eq (Banco-nit auxBanco) nit)
        ;Si se encuentra se piden los datos de los clientes de ese banco
        (progn
            (setq encontrado 1)
            (format t"==== Clientes Banco ~S ====~%" (Banco-nombre auxBanco))
            (setq j 0);Variable iteradora para el LOOP de agregar clientes al vector de clientes del banco
            (loop

                (format t"----Datos Cliente: ~d----~%" (+ j 1))

                (setq cliente (make-Cliente)) ;Estructura de cliente

                ;Ingresar Id del Cliente
                (loop
                    (print "Digite el id del cliente:")
                    (setf (Cliente-id cliente)(read))
                    (if (typep (Cliente-id cliente) 'integer) 
                        (setq band 1) ;Si el tipo de dato es entero entonces el loop termina
                        (progn (setq band 0) (format  t"Error! Ingrese un tipo de dato valido para el id...~%"))
                    )
                    (when (= band 1) (return ))
                )

                ;Ingresar Nombre del Cliente
                (loop
                    (print "Digite el nombre del cliente:")
                    (setf (Cliente-nombreCliente cliente)(read))
                    (if (typep (Cliente-nombreCliente cliente) 'number) 
                        (progn (setq band 0) (format  t"Error! Ingrese un tipo de dato valido para el nombre...~%"))
                        (setq band 1) ;Si el tipo de dato no es un numero entonces el loop termina
                    )
                    (when (= band 1) (return ))
                )

                ;Ingresar el Genero del Cliente
                (loop
                    (print "Digite el genero del cliente (FEMENINO, MASCULINO, NO_DEFINIDO):")
                    (setf (Cliente-genero cliente)(read))
                    (if (typep (Cliente-genero cliente) 'number) 
                        (progn (setq band 0) (format  t"Error! Ingrese un tipo de dato valido para el genero del cliente...~%"))
                        (progn 
                            (if (or (string= (Cliente-genero cliente) "FEMENINO") 
                                (string= (Cliente-genero cliente) "MASCULINO")
                                (string= (Cliente-genero cliente) "NO_DEFINIDO")
                                ) 
                                (setq band 1) ;Si el genero es FEMENINO, MASCULINO o NO DEFINIDO el loop termina
                                (progn (setq band 0) (format  t"Error! Ingrese un tipo de dato valido para el genero del cliente...~%"))
                            )
                        )
                    )
                    
                    (when (= band 1) (return ))
                )

                ;Registrar el cliente en el vector de clientes del banco
                (setf (aref (Banco-clientesBanco auxBanco) j) cliente)
                (setq j (+ j 1))
                (when (> j 2) (return ))

            );Finaliza el LOOP que agrega clientes a el vector de clientes del banco

        );Finaliza la parte verdadera del IF de la comparacion para buscar el banco

    );Finaliza el IF de la comparacion para buscar el banco
        (setq i (+ i 1))
        (when (> i 1) (return ))

    );Finaliza el LOOP para buscar el banco
    (if (= encontrado 0) (format t"El banco con nit: ~d no se encuentra registrado~%" nit))

    );Finaliza la parte falsa del IF de comprobar que hayan bancos
    
    );Finaliza el IF de comprobar que hayan bancos
    
)