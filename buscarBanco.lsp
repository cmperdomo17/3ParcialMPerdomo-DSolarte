;Integrantes:
;-Daniel Fernando Solarte Ortega
;-Carlos Mario Perdomo Ramos

; Función para buscar un banco por su nit
(defun buscarBanco(nit) 
    (setq encontrado 0);Bandera para verificar si se encontro el banco 1=true,0=false
    ;Recorrer el vector de bancos preguntando si el nit coincide
    (setq i 0)
    (loop
        (setf auxBanco (aref vectorBancos i))

        (if (eq (Banco-nit auxBanco) nit)
            ;Si coincide entonces la bandera se pone en true y se imprimen los datos del Banco y sus clientes
            (progn 
                (setq encontrado 1)

                (format t"Nit del Banco: ~d~%" (Banco-nit auxBanco))
                (format t"Nombre del Banco: ~S~%" (Banco-nombre auxBanco))
                (format t"Numero de empleados del Banco: ~d~%" (Banco-num_empleados auxBanco))
                ;Si el primer cliente no tiene datos entonces no se han ingresado los clientes de ese banco
                
                (if (eq (aref (Banco-clientesBanco auxBanco) 0) nil)
                    (format t"El banco no tiene clientes registrados...~%")
                    (progn
                        (setq j 0)
                        (loop
                            (format t"~%")
                            (format t"----Datos Cliente: ~d----~%" (+ j 1))
                            (setf auxCliente (aref (Banco-clientesBanco auxBanco) j))
                            (format t"Id del cliente: ~d~%" (Cliente-id auxCliente))
                            (format t"Nombre del cliente: ~S~%" (Cliente-nombreCliente auxCliente))
                            (format t"Genero del cliente: ~d~%" (Cliente-genero auxCliente))
                            (format t"~%")
                            (setq j (+ j 1))
                            (when (> j 2) (return ))
                        )
                    )
                    
                )
            )
        )

        (setq i (+ i 1))
        (when (> i 1) (return ))
    )
    (if (eq encontrado 0) (format t"El banco con nit: ~d no se encuentra registrado~%" nit))
)

