#ifndef __DEFINE_H__
#define __DEFINE_H__

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000


typedef enum CURDEVICETYPE
{
	DEVICE_COM,
	DEVICE_NET,
	DEVICE_USB,
	DEVICE_P2S,

}CURDEVICETYPE;

typedef enum DOORSTATUS
{
	FORCEOPEN = 1,
	FORCECLOSE,
	SOFTWAREOPEN,
	RESTORETOAUTO,
	REBOOT_FPA_MACHINE, //Finger printer acquisition
	DEASSERT_ALARM
		
}DOORSTATUS;

typedef struct tagPassTime
{
	BYTE  chStartHour;
	BYTE  chStartMinute;

	BYTE  chEndHour;
	BYTE  chEndMinute;


}TPassTime, *PTPassTime;

typedef struct tagGeneralLogInfo
{
	long dwTMachineNumber;
	long dwEnrollNumber;
	long dwEMachineNumber;
	long dwVerifyMode;
	long dwYear;
	long dwMonth;
	long dwDay;
	long dwHour;
	long dwMinute;

	tagGeneralLogInfo()
	{
		dwTMachineNumber =
		dwEnrollNumber =
		dwEMachineNumber = 
		dwVerifyMode = 
		dwYear = 
		dwMonth = 
		dwDay = 
		dwHour =
		dwMinute = 0;		
	}
	
}TGeneralLogInfo,*PTGeneralLogInfo;


typedef struct tagSuperLogInfo
{
	long dwTMachineNumber;
	long dwSEnrollNumber;
	long dwSEMachineNumber;
	long dwGEnrollNumber;
	long dwGEMachineNumber;
	long dwFingerNumber;
	long dwManipulation;
	long dwYear;
	long dwMonth;
	long dwDay;
	long dwHour;
	long dwMinute;
	
	tagSuperLogInfo()
	{
		dwTMachineNumber =
		dwSEnrollNumber =
		dwSEMachineNumber = 
		dwGEnrollNumber =
		dwGEMachineNumber = 
		dwFingerNumber = 
		dwManipulation = 
		dwYear = 
		dwMonth = 
		dwDay = 
		dwHour =
		dwMinute = 0;		
	}
	
}TSuperLogInfo,*PTSuperLogInfo;


typedef struct tagUserID
{
	long dwEnrollNumber;
	long dwEMachineNumber;
	long dwFingerNumber;    //aka, backup number
	long dwPrivilege;
	long dwEnable;
	long dwPassword;
	
	TCHAR szUserName[200];

	tagUserID()
	{		
		dwEnrollNumber =
		dwEMachineNumber = 
		dwFingerNumber = 
		dwPrivilege = 
		dwEnable =
		dwPassword= 0;

		ZeroMemory(szUserName, sizeof(szUserName));
	}
	
}TUserID,*PTUserID;

#define WM_GET_OCXOBJ_MSG (WM_USER+1)


typedef struct tagTimeInfo 
{
	LONG dwYear;
	LONG dwMonth;
	LONG dwDay;
	LONG dwHour;
	LONG dwMinute;
	LONG dwDayOfWeek;
}TTimeInfo, *PTTimeInfo;

#define STR_NO_DEVICE _T("No Device...")
#define STR_WAITING _T("Waiting...")
#define STR_SUCCESS _T("Success...")
#define STR_WORKING _T("Working...")


// 电铃信息定义
typedef struct tagBellInfo
{
	BYTE chValid[8];

	BYTE chHour[8];
	BYTE chMinute[8];


}TBellInfo, *pTBellInfo;


#define  FP_DATA_LENGHT 1420    //BYTE

LPSTR ErrorStr( long ErrorCode );

#endif 
















