#ifndef PLJITSQL_H
#define PLJITSQL_H

#include "access/xact.h"
#include "commands/event_trigger.h"
#include "commands/trigger.h"
#include "executor/spi.h"
#include "utils/expandedrecord.h"
#include "utils/typcache.h"


typedef struct PLjitSQL_function
{
	char		*fn_signature;
	Oid			fn_oid;
} PLjitSQL_function;



/**********************************************************************
 * Function declarations
 **********************************************************************/
extern PLjitSQL_function *pljitsql_compile(FunctionCallInfo fcinfo, bool forValidator);
extern Datum pljitsql_exec_function(PLjitSQL_function *func, FunctionCallInfo fcinfo);
#endif	/* PLJITSQL_H */

