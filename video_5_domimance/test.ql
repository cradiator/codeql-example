import cpp
import semmle.code.cpp.controlflow.Dominance

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
  VariableAccess vaPtr
where
  pde.getChild(0) = vaPtr and
  // eq.getAFalseSuccessor() = vaPtr.getAPredecessor*()
  not exists(EQExpr eq |
    eq = ptrEqZero(vaPtr) and
    dominates(eq, vaPtr)
  )
select vaPtr