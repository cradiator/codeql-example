import cpp
import semmle.code.cpp.controlflow.IRGuards

from
    PointerDereferenceExpr pde
where
    not exists(GuardCondition gc, VariableAccess va |
        va.getParent*() = gc and
        gc.ensuresEq(va, 0, pde.getBasicBlock(), false) and
        pde.getAnOperand().(VariableAccess).getTarget() = va.getTarget() and
        va.getTarget().getName() = "p"
    )
select
    pde

// -------------------

// from
//     GuardCondition cond,
//     VariableAccess p_in_cond
// where
//     p_in_cond.getParent*() = cond
// select
//     cond, p_in_cond
// -----------------

// VariableAccess getVarAccessInDeref() {
//     exists(PointerDereferenceExpr pde, VariableAccess va |
//         pde.getAnOperand() = va and 
//         result = va
//     )
// }

// from
//     GuardCondition cond,
//     VariableAccess var_in_cond,
//     VariableAccess var_deref
// where
//     var_in_cond.getParent*() = cond and
//     var_deref = getVarAccessInDeref() and
//     var_in_cond.getTarget() = var_deref.getTarget() and
//     cond.ensuresEq(var_in_cond, 0, var_deref.getBasicBlock(), false)
// select
//     cond, var_deref
// ----------------------

// VariableAccess getVarAccessInDeref() {
//     exists(PointerDereferenceExpr pde, VariableAccess va |
//         pde.getAnOperand() = va and 
//         result = va
//     )
// }

// from
//     VariableAccess var_dref
// where
//     var_dref = getVarAccessInDeref() and
//     not exists(GuardCondition cond, VariableAccess var_in_cond |
//         var_in_cond.getParent*() = cond and
//         var_in_cond.getTarget() = var_dref.getTarget() and
//         cond.ensuresEq(var_in_cond, 0, var_dref.getBasicBlock(), false)
//     )
// select
//     var_dref
