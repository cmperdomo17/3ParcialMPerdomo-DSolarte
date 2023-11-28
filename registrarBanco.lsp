(load "llenar.lsp")

; Structs

(defun structBanco()
 (defstruct Banco
  nit
  nombre
  num_empleados
  )
(setq ban (make-Banco))
)

llenarDatosBanco(ban)


