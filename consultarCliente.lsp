;Integrantes:
;-Daniel Fernando Solarte Ortega
;-Carlos Mario Perdomo Ramos

; Función para buscar un cliente por su id en un banco por su nit
(defun buscarCliente(nit id)
    ;Bandera para verificar si se encontro el banco y el cliente
    ;0=No se encontro el banco
    ;1=Se encontro el banco pero no el cliente
    ;2=Se encontro el banco y el cliente  
    (setq encontrado 0)

    ;Recorrer el vector de bancos preguntando si el nit coincide
    (setq i 0)

    ;Si el primer banco es null significa que NO se registraron los dos bancos
    (if (null (aref vectorBancos 0)) (progn (print "No hay bancos registrados"))
    (progn 

    (loop
        (setf auxBanco (aref vectorBancos i))

        (if (eq (Banco-nit auxBanco) nit)
            ;Si coincide entonces la bandera se pone en 1 y se busca el cliente
            (progn 
                (setq encontrado 1)

                ;Si el primer cliente no tiene datos entonces no se han ingresado los clientes de ese banco
                (if (eq (aref (Banco-clientesBanco auxBanco) 0) nil)
                    (format t"El banco no tiene clientes registrados...~%")
                    (progn
                        (setq j 0)
                        (loop
                            ;Si el banco tiene clientes entonces se busca el cliente por su id
                            (setf auxCliente (aref (Banco-clientesBanco auxBanco) j))
                            (if (eq (Cliente-id auxCliente) id)
                                (progn
                                    ;Si se encuentra el cliente se imprimen sus datos
                                    (setq encontrado 2)
                                    (format t"~%")
                                    (format t"Id del cliente: ~d~%" (Cliente-id auxCliente))
                                    (format t"Nombre del cliente: ~S~%" (Cliente-nombreCliente auxCliente))
                                    (format t"Genero del cliente: ~d~%" (Cliente-genero auxCliente))
                                    (format t"~%")
                                )
                            ) 
                            (setq j (+ j 1))
                            (when (> j 2) (return ))
                        )
                    )
                    
                )
            )
        )

        (setq i (+ i 1))
        (when (> i 1) (return ))
    );Finaliza el LOOP para buscar el banco
    );Finaliza la parte falsa del IF de comprobar que hayan bancos
    );Finaliza el IF de comprobar que hayan bancos

    (case encontrado 
        (0 
            (format t"~%El banco con nit: ~d no se encuentra registrado~%" nit)
        )
        (1 
            (format t"El cliente con id: ~d no se encuentra registrado en el banco con nit: ~d~%" id nit)
        )
    )
)