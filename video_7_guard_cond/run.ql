import cpp
import semmle.code.cpp.controlflow.IRGuards

from
    PointerDereferenceExpr pde
where
    not exists(GuardCondition gc, VariableAccess va |
        va.getTarget().getName() = "p" and
        va.getParent*() = gc and
        pde.getAnOperand().(VariableAccess).getTarget() = va.getTarget() and
        gc.ensuresEq(va, 0, pde.getBasicBlock(), false)
    )
select
    pde



