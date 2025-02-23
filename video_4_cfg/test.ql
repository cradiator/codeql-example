import cpp

EQExpr ptrEqZero(VariableAccess vaPtr) {
  exists(EQExpr eq |
    result = eq and
    eq.getChild(0).(VariableAccess).getTarget()
      = vaPtr.getTarget() and
    eq.getChild(1).(Literal).getValue() = "0"
  )
}

from
  PointerDereferenceExpr pde,
  VariableAccess vaPtr,
  EQExpr eq
where
  pde.getChild(0) = vaPtr and
  eq = ptrEqZero(vaPtr) and
  not (eq.getAFalseSuccessor() = vaPtr.getAPredecessor*())
select vaPtr, eq