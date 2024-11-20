// SetPasstime.cpp : implementation file
//

#include "stdafx.h"
#include "OEMClient.h"
#include "SetPasstime.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CSetPasstime dialog


CSetPasstime::CSetPasstime(CWnd* pParent /*=NULL*/)
	: CDialog(CSetPasstime::IDD, pParent)
{
	m_parentwnd = pParent;
	m_pOCXObj = NULL;
	m_dwMechineID = 0;
	//{{AFX_DATA_INIT(CSetPasstime)
	m_strInfo = _T("");
	m_dwStartTimeHour1 = 0;
	m_dwStartTimeHour2 = 0;
	m_dwStartTimeHour3 = 0;
	m_dwStartTimeHour4 = 0;
	m_dwStartTimeHour5 = 0;
	m_dwStartTimeMinute1 = 0;
	m_dwStartTimeMinute2 = 0;
	m_dwStartTimeMinute3 = 0;
	m_dwStartTimeMinute4 = 0;
	m_dwStartTimeMinute5 = 0;
	m_dwEndTimeHour1 = 0;
	m_dwEndTimeHour2 = 0;
	m_dwEndTimeHour3 = 0;
	m_dwEndTimeHour4 = 0;
	m_dwEndTimeHour5 = 0;
	m_dwEndTimeMinute1 = 0;
	m_dwEndTimeMinute2 = 0;
	m_dwEndTimeMinute3 = 0;
	m_dwEndTimeMinute4 = 0;
	m_dwEndTimeMinute5 = 0;
	m_dwSun = 0;
	m_dwMon = 0;
	m_dwTue = 0;
	m_dwWen = 0;
	m_dwThu = 0;
	m_dwFri = 0;
	m_dwSat = 0;
	m_dwGroupValue = 0;
	m_dwUserID = 1;
	m_dwWeekID = 0;
	m_dwGroupID = 0;
	//}}AFX_DATA_INIT
}


void CSetPasstime::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CSetPasstime)
	DDX_Control(pDX, IDC_CMB_LCKGRP_DAY_LIST, m_cmbLckGroupList);
	DDX_Control(pDX, IDC_CMB_WEEK_LIST, m_cmbWeeklist);
	DDX_Control(pDX, IDC_CMB_DAY_LIST, m_cmbDayList);
	DDX_Text(pDX, IDC_STATIC_PASSTIME_INFO, m_strInfo);
	DDX_Text(pDX, IDC_EDIT_STARTTIME_HOUR1, m_dwStartTimeHour1);
	DDV_MinMaxUInt(pDX, m_dwStartTimeHour1, 0, 24);
	DDX_Text(pDX, IDC_EDIT_STARTTIME_HOUR2, m_dwStartTimeHour2);
	DDV_MinMaxUInt(pDX, m_dwStartTimeHour2, 0, 24);
	DDX_Text(pDX, IDC_EDIT_STARTTIME_HOUR3, m_dwStartTimeHour3);
	DDV_MinMaxUInt(pDX, m_dwStartTimeHour3, 0, 24);
	DDX_Text(pDX, IDC_EDIT_STARTTIME_HOUR4, m_dwStartTimeHour4);
	DDV_MinMaxUInt(pDX, m_dwStartTimeHour4, 0, 24);
	DDX_Text(pDX, IDC_EDIT_STARTTIME_HOUR5, m_dwStartTimeHour5);
	DDV_MinMaxUInt(pDX, m_dwStartTimeHour5, 0, 24);
	DDX_Text(pDX, IDC_EDIT_STARTTIME_MINUTE1, m_dwStartTimeMinute1);
	DDV_MinMaxInt(pDX, m_dwStartTimeMinute1, 0, 59);
	DDX_Text(pDX, IDC_EDIT_STARTTIME_MINUTE2, m_dwStartTimeMinute2);
	DDV_MinMaxInt(pDX, m_dwStartTimeMinute2, 0, 59);
	DDX_Text(pDX, IDC_EDIT_STARTTIME_MINUTE3, m_dwStartTimeMinute3);
	DDV_MinMaxInt(pDX, m_dwStartTimeMinute3, 0, 59);
	DDX_Text(pDX, IDC_EDIT_STARTTIME_MINUTE4, m_dwStartTimeMinute4);
	DDV_MinMaxInt(pDX, m_dwStartTimeMinute4, 0, 59);
	DDX_Text(pDX, IDC_EDIT_STARTTIME_MINUTE5, m_dwStartTimeMinute5);
	DDV_MinMaxInt(pDX, m_dwStartTimeMinute5, 0, 59);
	DDX_Text(pDX, IDC_EDIT_ENDTIME_HOUR1, m_dwEndTimeHour1);
	DDV_MinMaxInt(pDX, m_dwEndTimeHour1, 0, 24);
	DDX_Text(pDX, IDC_EDIT_ENDTIME_HOUR2, m_dwEndTimeHour2);
	DDV_MinMaxInt(pDX, m_dwEndTimeHour2, 0, 24);
	DDX_Text(pDX, IDC_EDIT_ENDTIME_HOUR3, m_dwEndTimeHour3);
	DDV_MinMaxInt(pDX, m_dwEndTimeHour3, 0, 24);
	DDX_Text(pDX, IDC_EDIT_ENDTIME_HOUR4, m_dwEndTimeHour4);
	DDV_MinMaxInt(pDX, m_dwEndTimeHour4, 0, 24);
	DDX_Text(pDX, IDC_EDIT_ENDTIME_HOUR5, m_dwEndTimeHour5);
	DDV_MinMaxInt(pDX, m_dwEndTimeHour5, 0, 24);
	DDX_Text(pDX, IDC_EDIT_ENDTIME_MINUTE1, m_dwEndTimeMinute1);
	DDV_MinMaxInt(pDX, m_dwEndTimeMinute1, 0, 59);
	DDX_Text(pDX, IDC_EDIT_ENDTIME_MINUTE2, m_dwEndTimeMinute2);
	DDV_MinMaxInt(pDX, m_dwEndTimeMinute2, 0, 59);
	DDX_Text(pDX, IDC_EDIT_ENDTIME_MINUTE3, m_dwEndTimeMinute3);
	DDV_MinMaxInt(pDX, m_dwEndTimeMinute3, 0, 59);
	DDX_Text(pDX, IDC_EDIT_ENDTIME_MINUTE4, m_dwEndTimeMinute4);
	DDV_MinMaxInt(pDX, m_dwEndTimeMinute4, 0, 59);
	DDX_Text(pDX, IDC_EDIT_ENDTIME_MINUTE5, m_dwEndTimeMinute5);
	DDV_MinMaxInt(pDX, m_dwEndTimeMinute5, 0, 59);
	DDX_Text(pDX, IDC_EDIT_SUN, m_dwSun);
	DDX_Text(pDX, IDC_EDIT_MON, m_dwMon);
	DDX_Text(pDX, IDC_EDIT_TUE, m_dwTue);
	DDX_Text(pDX, IDC_EDIT_WEN, m_dwWen);
	DDX_Text(pDX, IDC_EDIT_THU, m_dwThu);
	DDX_Text(pDX, IDC_EDIT_FRI, m_dwFri);
	DDX_Text(pDX, IDC_EDIT_SAT, m_dwSat);
	DDX_Text(pDX, IDC_EDIT_GROUP_VALUE, m_dwGroupValue);
	DDX_Text(pDX, IDC_EDIT_USER_ID, m_dwUserID);
	DDV_MinMaxInt(pDX, m_dwUserID, 0, 99999999);
	DDX_Text(pDX, IDC_EDIT_WEEK_ID, m_dwWeekID);
	DDV_MinMaxInt(pDX, m_dwWeekID, 0, 99);
	DDX_Text(pDX, IDC_EDIT_GROUP_ID, m_dwGroupID);
	DDV_MinMaxInt(pDX, m_dwGroupID, 0, 9999);
	DDX_DateTimeCtrl(pDX, IDC_DATETIMEPICKER_START, m_tStartTime);
	DDX_DateTimeCtrl(pDX, IDC_DATETIMEPICKER_END, m_tEndTime);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CSetPasstime, CDialog)
	//{{AFX_MSG_MAP(CSetPasstime)
	ON_WM_CLOSE()
	ON_WM_SHOWWINDOW()
	ON_BN_CLICKED(IDC_BTN_PASSTIME_READ, OnBtnPasstimeRead)
	ON_BN_CLICKED(IDC_BTN_PASSTIME_WRITE, OnBtnPasstimeWrite)
	ON_BN_CLICKED(IDC_BTN_WEEKPASSTIME_READ, OnBtnWeekpasstimeRead)
	ON_BN_CLICKED(IDC_BTN_WEEKPASSTIME_WRITE, OnBtnWeekpasstimeWrite)
	ON_BN_CLICKED(IDC_BTN_LOCKGROUP_READ, OnBtnLockgroupRead)
	ON_BN_CLICKED(IDC_BTN_LOCKGROUP_WRITE, OnBtnLockgroupWrite)
	ON_BN_CLICKED(IDC_BTN_GET_USERCTRL, OnBtnGetUserctrl)
	ON_BN_CLICKED(IDC_BTN_SET_USER_CTRL, OnBtnSetUserCtrl)
	ON_BN_CLICKED(IDC_BTN_CLEAR_ALL_UCTRL, OnBtnClearAllUctrl)
	ON_BN_CLICKED(IDC_BTN_DEL_USER_CTRL, OnBtnDelUserCtrl)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CSetPasstime message handlers

void CSetPasstime::OnOK() 
{
	// TODO: Add extra validation here
	m_parentwnd->ShowWindow(SW_SHOW);

	CDialog::OnOK();
}

void CSetPasstime::OnClose() 
{
	// TODO: Add your message handler code here and/or call default
	m_parentwnd->ShowWindow(SW_SHOW);

	m_cmbDayList.SetCurSel(0);
	m_cmbWeeklist.SetCurSel(0);
	
	m_cmbLckGroupList.SetCurSel(0);

	CDialog::OnClose();
}

void CSetPasstime::OnShowWindow(BOOL bShow, UINT nStatus) 
{
	CDialog::OnShowWindow(bShow, nStatus);
	
	// TODO: Add your message handler code here
	if (bShow)
	{
		m_pOCXObj = (CFp_clockctrl1*)::SendMessage(m_parentwnd->m_hWnd,WM_GET_OCXOBJ_MSG, 0, (LPARAM)&m_dwMechineID);
	}
}

void CSetPasstime::OnBtnPasstimeRead() 
{
	// TODO: Add your control notification handler code here
	UpdateData();

	m_strInfo = STR_WAITING;
	
	UpdateData(FALSE);
	
	BOOL bRet = m_pOCXObj->EnableDevice( m_dwMechineID, FALSE );
	if ( !bRet )
	{
		m_strInfo = STR_NO_DEVICE;
		UpdateData(FALSE);
		
		return;
	}

	int dwDayNum = m_cmbDayList.GetCurSel();
	dwDayNum++;  //start from 1

	LONG* ptrBur = new LONG[4*5];

	bRet = m_pOCXObj->GetDayPassTime(m_dwMechineID, dwDayNum,  ptrBur);
	if (bRet)
	{
		PTPassTime ptr = (PTPassTime) ptrBur;

		m_dwStartTimeHour1 = ptr->chStartHour;
		m_dwStartTimeMinute1 = ptr->chStartMinute;
		m_dwEndTimeHour1 = ptr->chEndHour;
		m_dwEndTimeMinute1 = ptr->chEndMinute;

		ptr++;

		m_dwStartTimeHour2 = ptr->chStartHour;
		m_dwStartTimeMinute2 = ptr->chStartMinute;
		m_dwEndTimeHour2 = ptr->chEndHour;
		m_dwEndTimeMinute2 = ptr->chEndMinute;
		
		ptr++;
		
		m_dwStartTimeHour3 = ptr->chStartHour;
		m_dwStartTimeMinute3 = ptr->chStartMinute;
		m_dwEndTimeHour3 = ptr->chEndHour;
		m_dwEndTimeMinute3 = ptr->chEndMinute;

		ptr++;
		
		m_dwStartTimeHour4 = ptr->chStartHour;
		m_dwStartTimeMinute4 = ptr->chStartMinute;
		m_dwEndTimeHour4 = ptr->chEndHour;
		m_dwEndTimeMinute4 = ptr->chEndMinute;

		ptr++;
		
		m_dwStartTimeHour5 = ptr->chStartHour;
		m_dwStartTimeMinute5 = ptr->chStartMinute;
		m_dwEndTimeHour5 = ptr->chEndHour;
		m_dwEndTimeMinute5 = ptr->chEndMinute;

		m_strInfo = STR_SUCCESS;

	}
	else
	{
		//get error info
		long dwErrorValue;
		
		m_pOCXObj->GetLastError(&dwErrorValue);
		m_strInfo = ErrorStr(dwErrorValue);

	}

	delete[] ptrBur;

	UpdateData(FALSE);

	m_pOCXObj->EnableDevice( m_dwMechineID, TRUE );
}

void CSetPasstime::OnBtnPasstimeWrite() 
{
	UpdateData();

	m_strInfo = STR_WAITING;
	
	UpdateData(FALSE);
	
	BOOL bRet = m_pOCXObj->EnableDevice( m_dwMechineID, FALSE );
	if ( !bRet )
	{
		m_strInfo = STR_NO_DEVICE;
		UpdateData(FALSE);
		
		return;
	}



	int dwDayNum = m_cmbDayList.GetCurSel();
	dwDayNum++;  //start from 1

	LONG* ptrBur = new LONG[4*5];

	PTPassTime ptr = (PTPassTime) ptrBur;
	
	ptr->chStartHour = m_dwStartTimeHour1;
	ptr->chStartMinute = m_dwStartTimeMinute1;
	ptr->chEndHour = m_dwEndTimeHour1;
	ptr->chEndMinute = m_dwEndTimeMinute1;
	
	ptr++;
	
	ptr->chStartHour = m_dwStartTimeHour2;
	ptr->chStartMinute = m_dwStartTimeMinute2;
	ptr->chEndHour = m_dwEndTimeHour2;
	ptr->chEndMinute = m_dwEndTimeMinute2;

	ptr++;
	
	ptr->chStartHour = m_dwStartTimeHour3;
	ptr->chStartMinute = m_dwStartTimeMinute3;
	ptr->chEndHour = m_dwEndTimeHour3;
	ptr->chEndMinute = m_dwEndTimeMinute3;
	
	ptr++;

	ptr->chStartHour = m_dwStartTimeHour4;
	ptr->chStartMinute = m_dwStartTimeMinute4;
	ptr->chEndHour = m_dwEndTimeHour4;
	ptr->chEndMinute = m_dwEndTimeMinute4;
	
	ptr++;
	
	ptr->chStartHour = m_dwStartTimeHour5;
	ptr->chStartMinute = m_dwStartTimeMinute5;
	ptr->chEndHour = m_dwEndTimeHour5;
	ptr->chEndMinute = m_dwEndTimeMinute5;

	bRet = m_pOCXObj->SetDayPassTime( m_dwMechineID, dwDayNum, ptrBur);

	if (bRet)
	{
		m_strInfo = STR_SUCCESS;
		
	}
	else
	{
		//get error info
		long dwErrorValue;
		
		m_pOCXObj->GetLastError(&dwErrorValue);
		m_strInfo = ErrorStr(dwErrorValue);
		
	}

	delete[] ptrBur;

	UpdateData(FALSE);

	m_pOCXObj->EnableDevice( m_dwMechineID, TRUE );


}

void CSetPasstime::OnBtnWeekpasstimeRead() 
{
	// TODO: Add your control notification handler code here

	UpdateData();

	m_strInfo = STR_WAITING;
	
	UpdateData(FALSE);
	
	BOOL bRet = m_pOCXObj->EnableDevice( m_dwMechineID, FALSE );
	if ( !bRet )
	{
		m_strInfo = STR_NO_DEVICE;
		UpdateData(FALSE);
		
		return;
	}

	int dwWeek = m_cmbWeeklist.GetCurSel();
	dwWeek++;
	
	LONG* ptrBuf = new LONG[10];
	ZeroMemory( ptrBuf, 10*4 );

	bRet = m_pOCXObj->GetWeekPassTime(m_dwMechineID, dwWeek, ptrBuf);
	if (bRet)
	{
		BYTE* ptr = (BYTE*)ptrBuf;
		m_dwSun = *ptr++;
		m_dwMon = *ptr++;
		m_dwTue = *ptr++;
		m_dwWen = *ptr++;
		m_dwThu = *ptr++;
		m_dwFri = *ptr++;
		m_dwSat = *ptr++;

		m_strInfo = STR_SUCCESS;

	}
	else
	{
		//get error info
		long dwErrorValue;
		
		m_pOCXObj->GetLastError(&dwErrorValue);
		m_strInfo = ErrorStr(dwErrorValue);
	}

	delete[] ptrBuf;

	UpdateData(FALSE);
	
	m_pOCXObj->EnableDevice( m_dwMechineID, TRUE );

}

void CSetPasstime::OnBtnWeekpasstimeWrite() 
{
	
	UpdateData();
	
	m_strInfo = STR_WAITING;
	
	UpdateData(FALSE);
	
	BOOL bRet = m_pOCXObj->EnableDevice( m_dwMechineID, FALSE );
	if ( !bRet )
	{
		m_strInfo = STR_NO_DEVICE;
		UpdateData(FALSE);
		
		return;
	}

	int dwWeek = m_cmbWeeklist.GetCurSel();
	dwWeek++;
	
	LONG* ptrBuf = new LONG[10];

	BYTE* ptr = (BYTE*) ptrBuf;

	*ptr++ = m_dwSun;
	*ptr++ = m_dwMon;
	*ptr++ = m_dwTue;
	*ptr++ = m_dwWen;
	*ptr++ = m_dwThu;
	*ptr++ = m_dwFri;
	*ptr++ = m_dwSat;

	bRet = m_pOCXObj->SetWeekPassTime(m_dwMechineID, dwWeek, ptrBuf);

	if (bRet)
	{
		m_strInfo = STR_SUCCESS;
	}
	else
	{
		//get error info
		long dwErrorValue;
		
		m_pOCXObj->GetLastError(&dwErrorValue);
		m_strInfo = ErrorStr(dwErrorValue);
	}


	delete[] ptrBuf;
	
	UpdateData(FALSE);
	
	m_pOCXObj->EnableDevice( m_dwMechineID, TRUE );
}

void CSetPasstime::OnBtnLockgroupRead() 
{
	UpdateData();
	
	m_strInfo = STR_WAITING;
	
	UpdateData(FALSE);
	
	BOOL bRet = m_pOCXObj->EnableDevice( m_dwMechineID, FALSE );
	if ( !bRet )
	{
		m_strInfo = STR_NO_DEVICE;
		UpdateData(FALSE);
		
		return;
	}

	int dwNumber = m_cmbLckGroupList.GetCurSel();
	dwNumber++;

	long dwGroup;

	bRet = m_pOCXObj->GetLockGroup( m_dwMechineID, dwNumber, &dwGroup);
	if (bRet)
	{
		m_dwGroupValue = dwGroup;
		m_strInfo = STR_SUCCESS;

	}
	else
	{
		//get error info
		long dwErrorValue;
		
		m_pOCXObj->GetLastError(&dwErrorValue);
		m_strInfo = ErrorStr(dwErrorValue);
	}	

	
	UpdateData(FALSE);
	
	m_pOCXObj->EnableDevice( m_dwMechineID, TRUE );
}

void CSetPasstime::OnBtnLockgroupWrite() 
{
	UpdateData();
	
	m_strInfo = STR_WAITING;
	
	UpdateData(FALSE);
	
	BOOL bRet = m_pOCXObj->EnableDevice( m_dwMechineID, FALSE );
	if ( !bRet )
	{
		m_strInfo = STR_NO_DEVICE;
		UpdateData(FALSE);
		
		return;
	}

	int dwNumber = m_cmbLckGroupList.GetCurSel();
	dwNumber++;
	
	long dwGroup = m_dwGroupValue;

	bRet = m_pOCXObj->SetLockGroup(m_dwMechineID, dwNumber, dwGroup);
	if (bRet)
	{		
		m_strInfo = STR_SUCCESS;
		
	}
	else
	{
		//get error info
		long dwErrorValue;
		
		m_pOCXObj->GetLastError(&dwErrorValue);
		m_strInfo = ErrorStr(dwErrorValue);
	}

	
	UpdateData(FALSE);
	
	m_pOCXObj->EnableDevice(m_dwMechineID, TRUE);
}

void CSetPasstime::OnBtnGetUserctrl() 
{
	UpdateData();

	m_strInfo = STR_WAITING;
	
	UpdateData(FALSE);
	
	BOOL bRet = m_pOCXObj->EnableDevice( m_dwMechineID, FALSE );
	if ( !bRet )
	{
		m_strInfo = STR_NO_DEVICE;
		UpdateData(FALSE);
		
		return;
	}

	long dwSYear;
	long dwSMonth;
	long dwSDay;
	long dwEYear;
	long dwEMonth;
	long dwEDay;

	bRet = m_pOCXObj->GetUserCtrl(
		m_dwMechineID, 
		m_dwUserID, 
		(long*)&m_dwWeekID,
		(long*)&m_dwGroupID,
		&dwSYear,
		&dwSMonth,
		&dwSDay,
		&dwEYear,
		&dwEMonth,
		&dwEDay);

	if (bRet)
	{		
	
		m_tStartTime.SetDate(dwSYear, dwSMonth, dwSDay);
		m_tEndTime.SetDate(dwEYear, dwEMonth,dwEDay);

		m_strInfo = STR_SUCCESS;


	}
	else
	{
		//get error info
		long dwErrorValue;
		
		m_pOCXObj->GetLastError(&dwErrorValue);
		m_strInfo = ErrorStr(dwErrorValue);
	}
	
	UpdateData(FALSE);
	
	m_pOCXObj->EnableDevice(m_dwMechineID, TRUE);
	
}

void CSetPasstime::OnBtnSetUserCtrl() 
{
	UpdateData();
	
	m_strInfo = STR_WAITING;
	
	UpdateData(FALSE);
	
	BOOL bRet = m_pOCXObj->EnableDevice( m_dwMechineID, FALSE );
	if ( !bRet )
	{
		m_strInfo = STR_NO_DEVICE;
		UpdateData(FALSE);
		
		return;
	}

	bRet = m_pOCXObj->SetUserCtrl(
		m_dwMechineID, 
		m_dwUserID,
		m_dwWeekID,
		m_dwGroupID,
		m_tStartTime.GetYear(),
		m_tStartTime.GetMonth(),
		m_tStartTime.GetDay(),
		m_tEndTime.GetYear(),
		m_tEndTime.GetMonth(),
		m_tEndTime.GetDay()
		);
	if (bRet)
	{
		m_strInfo = "SetUserctrl OK";
	}
	else
	{
		//get error info
		long dwErrorValue;
		
		m_pOCXObj->GetLastError(&dwErrorValue);
		m_strInfo = ErrorStr(dwErrorValue);
	}

	UpdateData(FALSE);

	m_pOCXObj->EnableDevice(m_dwMechineID, TRUE);

}

void CSetPasstime::OnBtnClearAllUctrl() 
{
	UpdateData();
	
	m_strInfo = STR_WAITING;
	
	UpdateData(FALSE);
	
	BOOL bRet = m_pOCXObj->EnableDevice( m_dwMechineID, FALSE );
	if ( !bRet )
	{
		m_strInfo = STR_NO_DEVICE;
		UpdateData(FALSE);
		
		return;
	}

	bRet = m_pOCXObj->ClearUserCtrl(m_dwMechineID);
	if (bRet)
	{
		m_strInfo = "ClearUserCtrl OK";
	}
	else
	{
		//get error info
		long dwErrorValue;
		
		m_pOCXObj->GetLastError(&dwErrorValue);
		m_strInfo = ErrorStr(dwErrorValue);
	}

	UpdateData(FALSE);

	m_pOCXObj->EnableDevice(m_dwMechineID, TRUE);

}

//delete one user
void CSetPasstime::OnBtnDelUserCtrl() 
{
	UpdateData();
	
	m_strInfo = STR_WAITING;
	
	UpdateData(FALSE);
	
	BOOL bRet = m_pOCXObj->EnableDevice( m_dwMechineID, FALSE );
	if ( !bRet )
	{
		m_strInfo = STR_NO_DEVICE;
		UpdateData(FALSE);
		
		return;
	}
	
	bRet = m_pOCXObj->DeleteUserCtrl(m_dwMechineID, m_dwUserID);
	if (bRet)
	{
		m_strInfo = "DeleteUserCtrl OK";
	}
	else
	{
		//get error info
		long dwErrorValue;
		
		m_pOCXObj->GetLastError(&dwErrorValue);
		m_strInfo = ErrorStr(dwErrorValue);
	}
	
	UpdateData(FALSE);
	
	m_pOCXObj->EnableDevice(m_dwMechineID, TRUE);
	
}

BOOL CSetPasstime::OnInitDialog() 
{
	CDialog::OnInitDialog();
	
	// TODO: Add extra initialization here
	SYSTEMTIME sysTime;

	GetSystemTime(&sysTime);

	m_tStartTime.SetDateTime(sysTime.wYear,sysTime.wMonth,sysTime.wDay, sysTime.wHour, sysTime.wMinute, 0);
	m_tEndTime.SetDateTime(sysTime.wYear,sysTime.wMonth,sysTime.wDay, sysTime.wHour, sysTime.wMinute, 0);

	m_cmbDayList.SetCurSel(0);
	m_cmbWeeklist.SetCurSel(0);
	
	m_cmbLckGroupList.SetCurSel(0);

	UpdateData(FALSE);

	return TRUE;  // return TRUE unless you set the focus to a control
	              // EXCEPTION: OCX Property Pages should return FALSE
}

void CSetPasstime::PostNcDestroy() 
{
	// TODO: Add your specialized code here and/or call the base class
	delete this;

	CDialog::PostNcDestroy();
}
