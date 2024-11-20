#include "StdAfx.h"

LPSTR ErrorStr( long ErrorCode )
{
	switch(ErrorCode)
	{
	case 0:
		return "SUCCESS";
		break;
	case 1:
		return "ERR_COMPORT_ERROR";
		
		break;
	case 2:
		return "ERR_WRITE_FAIL";
		
		break;
	case 3:
		return "ERR_READ_FAIL";
		
		break;
	case 4:
		return "ERR_INVALID_PARAM";
		
		break;
	case 5:
		return "ERR_NON_CARRYOUT";
		
		break;
	case 6:
		return "ERR_LOG_END";
		
		break;
	case 7:
		return "ERR_MEMORY";
		
		break;
	case 8:
		return "ERR_MULTIUSER";
		
		break;
	}
	
	return "Not my fault. XD";
}