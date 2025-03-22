import cpp
import semmle.code.cpp.controlflow.Dominance

from
    SsaDefinition def,
    StackVariable p
where
    p.getName() = "p"
select
    def, def.getAUse(p)