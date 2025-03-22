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

SsaDefinition getSsaDef(VariableAccess va) {
  exists(SsaDefinition ssaDef |
    ssaDef.getAUse(va.getTarget()) = va and
    result = ssaDef
  )
}

from
  PointerDereferenceExpr pde,
  VariableAccess vaPtr,
  EQExpr eq
where
  pde.getChild(0) = vaPtr and
  eq = ptrEqZero(vaPtr) and
  dominates(eq, vaPtr) and
  getSsaDef(eq.getChild(0)) = getSsaDef(vaPtr)
select vaPtr
