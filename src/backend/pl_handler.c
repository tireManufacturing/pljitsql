#include "postgres.h"

#include "access/htup_details.h"
#include "catalog/pg_proc.h"
#include "catalog/pg_type.h"
#include "funcapi.h"
#include "miscadmin.h"
#include "utils/builtins.h"
#include "utils/guc.h"
#include "utils/lsyscache.h"
#include "utils/syscache.h"
#include "utils/varlena.h"

#include "pljitsql.h"


PG_MODULE_MAGIC;

void
_PG_init(void)
{

}

PG_FUNCTION_INFO_V1(pljitsql_call_handler);

Datum
pljitsql_call_handler(PG_FUNCTION_ARGS)
{
	volatile Datum retval = (Datum) 0;
	PLjitSQL_function *func;

	/* compile */
	func = pljitsql_compile(fcinfo, false);

	/* run */
	PG_TRY();
	{
		retval = pljitsql_exec_function(func, fcinfo);
	}
	PG_FINALLY();
	{

	}
	PG_END_TRY();

	return retval;
}

PLjitSQL_function *
pljitsql_compile(FunctionCallInfo fcinfo, bool forValidator)
{
	/* call parser */

	return NULL;
}

Datum
pljitsql_exec_function(PLjitSQL_function *func, FunctionCallInfo fcinfo)
{
	/* call executor */

	int	rc = 0;

	return rc;
}