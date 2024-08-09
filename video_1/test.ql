import cpp

from 
	FunctionCall call, 
	Function func, 
	SizeofExprOperator sizeof,
	VariableAccess va
where 
	call.getTarget() = func and
	func.getName() = "malloc" and
	call.getArgument(0) = sizeof and
	sizeof.getExprOperand() = va and
  va.getTarget().getType() instanceof PointerType
select sizeof
