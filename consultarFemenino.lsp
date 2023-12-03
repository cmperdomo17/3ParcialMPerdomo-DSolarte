;Integrantes:
;-Daniel Fernando Solarte Ortega
;-Carlos Mario Perdomo Ramos

; Funcion para consultar el número de clientes que son de género FEMENINO de un Banco específico.
(defun buscarMujeres(nit)
    (setq encontrado 0)
    (setq i 0)
    ; Comienza el primer bucle que recorre los bancos
    (loop
        ; Obtiene el banco actual
        (setf auxBanco (aref vectorBancos i))
        ; Verifica si el nit del banco actual coincide con el nit proporcionado
        (if (eq (Banco-nit auxBanco) nit)
            (progn 
                (setq encontrado 1)
                ; Verifica si el banco tiene clientes registrados
                (if (eq (aref (Banco-clientesBanco auxBanco) 0) nil)
                    ; Si el banco no tiene clientes, imprime un mensaje
                    (format t"El banco no tiene clientes registrados...~%")
                    ; Si el banco tiene clientes, comienza el segundo bucle que recorre los clientes
                    (progn
                        (setq numMujeres 0)
                        (setq j 0)
                        (loop
                            ; Obtiene el cliente actual
                            (setf auxCliente (aref (Banco-clientesBanco auxBanco) j))
                            ; Verifica si el género del cliente es femenino
                            (if (string-equal (Cliente-genero auxCliente) "femenino")
                                ; Si el género es femenino, incrementa el contador de mujeres
                                (setq numMujeres (+ numMujeres 1)))
                            ; Incrementa el contador de clientes
                            (setq j (+ j 1))
                            ; Si se han revisado todos los clientes, sale del bucle de clientes
                            (when (>= j (length (Banco-clientesBanco auxBanco))) (return))
                        )
                        ; Imprime el número de clientes femeninos
                        (format t"Numero de clientes FEMENINOS: ~d del Banco: ~S~%" numMujeres (Banco-nombre auxBanco))
                        ; Si no hay clientes femeninos, imprime un mensaje
                        (if (= numMujeres 0) 
                            (format t"No hay clientes FEMENINOS en el Banco: ~S, con NIT: ~d~%" (Banco-nombre auxBanco) nit))
                    )
                )
            )
        )
        (setq i (+ i 1))
        (when (>= i (length vectorBancos)) (return))
    )
    (if (eq encontrado 0) (format t"El banco con nit: ~d no se encuentra registrado~%" nit))
)