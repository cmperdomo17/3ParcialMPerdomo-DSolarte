;Integrantes:
;-Daniel Fernando Solarte Ortega
;-Carlos Mario Perdomo Ramos

; Función para buscar un banco por su nit
(defun buscarBanco(nit) 
    (setq encontrado 0);Bandera para verificar si se encontro el banco 1=true,0=false
    ;Recorrer el vector de bancos preguntando si el nit coincide
    (setq i 0)
    (loop
        (setq auxBanco (aref vectorBancos i))
        (if (eq (Banco-nit auxBanco) nit)
            ;Si coincide entonces la bandera se pone en true y se imprimen los datos del Banco y su cliente
            (progn 
                (setq encontrado 1)
                (format t"Nit del Banco: ~d~%" (Banco-nit auxBanco))
                (format t"Nombre del Banco: ~S~%" (Banco-nombre auxBanco))
                (format t"Numero de empleados del Banco: ~d~%" (Banco-num_empleados auxBanco))
                ;(loop for auxCliente in vectorClientes do
                ;    (if ())

                ;)    
            )
        )
        (setq i (+ i 1))
        (when (> i 1) (return ))
    )
    (if (eq encontrado 0) (format t"El banco con nit: ~d no se encuentra registrado~%" nit))
)

