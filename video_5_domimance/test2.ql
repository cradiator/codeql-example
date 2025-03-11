import cpp
import semmle.code.cpp.controlflow.Dominance


// EQExpr ptrEqZero(VariableAccess vaPtr) {
//   exists(EQExpr eq |
//     result = eq and
//     eq.getChild(0).(VariableAccess).getTarget()
//       = vaPtr.getTarget() and
//     eq.getChild(1).(Literal).getValue() = "0"
//   )
// }

// SsaDefinition getSsaDefinition(VariableAccess va) {
//   exists(SsaDefinition def |
//     result = def and
//     def.getAUse(va.getTarget()) = va
//   )
// }

// from
//   PointerDereferenceExpr pde,
//   VariableAccess vaPtr
// where
//   pde.getChild(0) = vaPtr and
//   not exists(EQExpr eq | 
//     eq = ptrEqZero(vaPtr) and
//     dominates(eq, pde) and
//     getSsaDefinition(eq.getLeftOperand()) = getSsaDefinition(vaPtr)
//   )
// select pde

from SsaDefinition ssa select ssa