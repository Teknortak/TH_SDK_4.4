
#ifndef _DEFINE_DATA_
#define  _DEFINE_DATA_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
//LPCTSTR FormatErrorStr(int  dwStatus);

typedef enum emError
{
	RUN_SUCCESS				= 1,
	RUNNER_NOSUPPORT		= 0,
	RUNERR_UNKNOWNERROR		= -1,
	RUNERR_NO_OPEN_COMM		= -2,
	RUNERR_WRITE_FAIL		= -3,
	RUNERR_READ_FAIL		= -4,
	RUNERR_INVALID_PARAM	= -5,
	RUNERR_NON_CARRYOUT		= -6,
	RUNERR_DATAARRAY_END	= -7,
	RUNERR_DATAARRAY_NONE	= -8,
	RUNERR_MEMORY			= -9,
	RUNERR_MIS_PASSWORD		= -10,
	RUNERR_MEMORYOVER		= -11,
	RUNERR_DATADOUBLE		= -12,

	RUNERR_MANAGEROVER		= -14,
	RUNERR_FPDATAVERSION	= -15

}emError;

LPCTSTR FormatErrorStr(int  dwStatus)
{
	switch (dwStatus)
	{
	case RUN_SUCCESS:
	{
		return _T("");

	}
		break;
	case RUNNER_NOSUPPORT:
	{
		return _T("");

	}
		break;
	case RUNERR_UNKNOWNERROR:
	{
		return _T("");

	}
		break;	
	case RUNERR_NO_OPEN_COMM:
	{
		return _T("No Open Comm");

	}

		break;	
	case RUNERR_WRITE_FAIL:
	{
		return _T("");

	}
		break;
	case RUNERR_READ_FAIL:
	{
		return _T("");

	}
		break;
	case RUNERR_INVALID_PARAM:
	{
		return _T("");

	}
		break;
	case RUNERR_NON_CARRYOUT:
	{
		return _T("");

	}
		break;
	case RUNERR_DATAARRAY_END:
	{
		return _T("");

	}
		break;
	case RUNERR_DATAARRAY_NONE:
	{
		return _T("");

	}
		break;
	case RUNERR_MEMORY:
	{
		return _T("");

	}
		break;
	case RUNERR_MIS_PASSWORD:
	{
		return _T("");

	}
		break;
	case RUNERR_MEMORYOVER:
	{
		return _T("");

	}
		break;
	case RUNERR_DATADOUBLE:
	{
		return _T("");

	}
		break;
	case RUNERR_FPDATAVERSION:
	{
		return _T("");

	}
		break;
	case RUNERR_MANAGEROVER:
	{
		return _T("");
	}
		break;
	default:
		break;
	}


	return _T("miss defined error");
}
#endif