// SysInfo.cpp : implementation file
//

#include "stdafx.h"
#include "OEMClient.h"
#include "SysInfo.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

extern CWnd* g_parent;
/////////////////////////////////////////////////////////////////////////////
// SysInfo dialog


CSysInfo::CSysInfo(CWnd* pParent /*=NULL*/)
	: CDialog(CSysInfo::IDD, pParent)
{
	//{{AFX_DATA_INIT(CSysInfo)
	m_strSysInfo = _T("");
	m_parentwnd = pParent;
	m_pOCXObj = NULL;
	m_dwMachineID = 0;
	//}}AFX_DATA_INIT
	m_dwStatusValue = 0;
}


void CSysInfo::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CSysInfo)
	DDX_Text(pDX, IDC_STATIC_SYS_INFO, m_strSysInfo);
	//}}AFX_DATA_MAP
	DDX_Text(pDX, IDC_EDIT_VALUE, m_dwStatusValue);
	DDV_MinMaxInt(pDX, m_dwStatusValue, 0, 999999);
	DDX_Control(pDX, IDC_CMB_LIST, m_cmbIndexList);
}


BEGIN_MESSAGE_MAP(CSysInfo, CDialog)
	//{{AFX_MSG_MAP(CSysInfo)
	ON_BN_CLICKED(IDC_BTN_GET_DEV_TIME, OnBtnGetDevTime)
	ON_BN_CLICKED(IDC_BTN_PWR_OFF_DEV, OnBtnPwrOffDev)
	ON_BN_CLICKED(IDC_BTN_SET_DEV_TIME, OnBtnSetDevTime)
	ON_BN_CLICKED(IDC_BTN_PWR_ON_DEV, OnBtnPwrOnDev)
	ON_BN_CLICKED(IDC_BTN_DISABLE_DEV, OnBtnDisableDev)
	ON_WM_CLOSE()
	ON_WM_SHOWWINDOW()
	//}}AFX_MSG_MAP
	ON_BN_CLICKED(IDC_BTN_GET_DEVICE_INFO, &CSysInfo::OnBnClickedBtnGetDeviceInfo)
	ON_BN_CLICKED(IDC_BTN_SET_DEVICE_INFO, &CSysInfo::OnBnClickedBtnSetDeviceInfo)
	ON_BN_CLICKED(IDC_BTN_GET_DEVICE_STATUS, &CSysInfo::OnBnClickedBtnGetDeviceStatus)
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// SysInfo message handlers

void CSysInfo::OnBtnGetDevTime() 
{
	// TODO: Add your control notification handler code here
	//m_pOCXObj = (CFP_CLOCK*)::SendMessage(m_parentwnd->m_hWnd,WM_GET_OCXOBJ_MSG, 0, (LPARAM)&m_dwMechineID);
	BOOL bRet = FALSE;

	if(m_pOCXObj == NULL)
	{
		return;
	}
	bRet = m_pOCXObj->EnableDevice( m_dwMachineID, FALSE );
	if ( bRet )
	{
		m_strSysInfo = "Disable Device Success!";
	}
	else
	{
		m_strSysInfo = STR_NO_DEVICE;
		UpdateData(FALSE);

		return;
	}
	

	TTimeInfo tDevTimeInfo;
	m_pOCXObj->GetDeviceTime( m_dwMachineID, 
		&tDevTimeInfo.dwYear,
		&tDevTimeInfo.dwMonth, 
		&tDevTimeInfo.dwDay,
		&tDevTimeInfo.dwHour,
		&tDevTimeInfo.dwMinute,
		&tDevTimeInfo.dwDayOfWeek);

	if ( tDevTimeInfo.dwDayOfWeek == 0 )
	{
		tDevTimeInfo.dwDayOfWeek = 7;
	}

	CString strData;
	m_strSysInfo.Format(_T("Data= %d/%d/%d, %s Time= %d:%d"), 
		tDevTimeInfo.dwYear,
		tDevTimeInfo.dwMonth,
		tDevTimeInfo.dwDay, 
		FormWeekStr( tDevTimeInfo.dwDayOfWeek ), 
		tDevTimeInfo.dwHour,
		tDevTimeInfo.dwMinute);

	m_pOCXObj->EnableDevice( m_dwMachineID, TRUE );

	//m_strSysInfo = strData;

	UpdateData(FALSE);

	return;

	long value;
	m_pOCXObj->GetDeviceInfo( m_dwMachineID, 1, &value );
	
	TRACE("value %d\n", value);
}

void CSysInfo::OnBtnPwrOffDev() 
{
	// TODO: Add your control notification handler code here
	
	m_strSysInfo = "Working...";
	UpdateData(FALSE);		
	

	BOOL bRet = m_pOCXObj->PowerOffDevice( m_dwMachineID );
	if ( bRet )
	{
		m_strSysInfo = STR_SUCCESS;
		
	}
	else
	{
		//error
		long dwErrorValue;

		m_pOCXObj->GetLastError(&dwErrorValue);
		m_strSysInfo = ErrorStr(dwErrorValue);

	}

	UpdateData(FALSE);
}

void CSysInfo::OnBtnSetDevTime() 
{
	BOOL bRet;

	if(!ToDisableDevice())
	{
		return;

	}

	bRet = m_pOCXObj->SetDeviceTime(m_dwMachineID);

	if ( bRet )
	{
		m_strSysInfo = STR_SUCCESS;

	}
	else
	{
		//error
		long dwErrorValue;

		m_pOCXObj->GetLastError(&dwErrorValue);
		m_strSysInfo = ErrorStr(dwErrorValue);

	}

	UpdateData(FALSE);

	m_pOCXObj->EnableDevice( m_dwMachineID, TRUE );

}


// 文档没有这个
void CSysInfo::OnBtnPwrOnDev() 
{
	// TODO: Add your control notification handler code here
	m_pOCXObj->PowerOnAllDevice();
}

void CSysInfo::OnBtnDisableDev() 
{

	m_strSysInfo = "Working...";
	UpdateData(FALSE);
	BOOL bStatus = ((CButton*)GetDlgItem(IDC_CHECK_DISABLE))->GetCheck();

	BOOL bRet = m_pOCXObj->EnableDevice( m_dwMachineID, bStatus );
	if (bRet)
	{
		if (bStatus)
		{
			m_strSysInfo = _T("Enable Device Success!");

			((CButton*)GetDlgItem(IDC_CHECK_DISABLE))->SetCheck(FALSE);
			((CButton*)GetDlgItem(IDC_BTN_DISABLE_DEV))->SetWindowText(_T("DisableDevice"));


		}
		else
		{
			m_strSysInfo = _T("Disable Device Success!");
			((CButton*)GetDlgItem(IDC_CHECK_DISABLE))->SetCheck(TRUE);

			((CButton*)GetDlgItem(IDC_BTN_DISABLE_DEV))->SetWindowText(_T("EnableDevice"));

		}

	} 
	else
	{
		//error
		long dwErrorValue;

		m_pOCXObj->GetLastError(&dwErrorValue);
		m_strSysInfo = ErrorStr(dwErrorValue);

	}

	UpdateData(FALSE);


}

void CSysInfo::OnClose() 
{
	// TODO: Add your message handler code here and/or call default
	m_parentwnd->ShowWindow(SW_SHOW);
//	CWnd * pwnd = GetParentOwner();

	CDialog::OnClose();
}

void CSysInfo::OnOK() 
{
	// TODO: Add extra validation here
	
	m_parentwnd->ShowWindow(SW_SHOW);

	CDialog::OnOK();
}

void CSysInfo::OnShowWindow(BOOL bShow, UINT nStatus) 
{
	CDialog::OnShowWindow(bShow, nStatus);
	
	// TODO: Add your message handler code here
	if (bShow)
	{
		m_pOCXObj = (CFp_clockctrl1*)::SendMessage(m_parentwnd->m_hWnd, WM_GET_OCXOBJ_MSG, 0, (LPARAM)&m_dwMachineID);

		m_cmbIndexList.SetCurSel(0);
	}
}

void CSysInfo::PostNcDestroy() 
{
	// TODO: Add your specialized code here and/or call the base class
	delete this;

	CDialog::PostNcDestroy();
}

LPCTSTR CSysInfo::FormWeekStr( int dwWeek )
{
	//CString strTemp;

	switch( dwWeek )
	{
	case 1:
		return _T("Monday");
		break;
	case 2:
		return _T("Tuesday");
		break;
	case 3:
		return _T("Wednesday");
		break;
	case 4:
		return _T("Thursday");
		break;
	case 5:
		return _T("Friday");
		break;
	case 6:
		return _T("Saturday");
		break;
	case 7:
		return _T("Sunday");
		break;
	}

	
	
	return _T("Not in weekend, XD!");

}


void CSysInfo::OnBnClickedBtnGetDeviceInfo()
{
	// TODO: 在此添加控件通知处理程序代码
	UpdateData();

	BOOL bRet;

	if(!ToDisableDevice())
	{
		return;

	}

	int dwNumber = m_cmbIndexList.GetCurSel();
	dwNumber++;

	long dwRtValue;
	
	bRet = m_pOCXObj->GetDeviceInfo(m_dwMachineID, dwNumber, &dwRtValue);
	if (bRet)
	{
		switch(dwNumber)
		{
		case 1:
			{
				m_strSysInfo.Format(_T("(1) = ManagerCount = %d"), dwRtValue);
			}
			break;
		case 2:
			{
				m_strSysInfo.Format(_T("(2) = Devcie ID = %d"), dwRtValue);

			}
			break;
		case 3:
			{
				m_strSysInfo.Format(_T("(3) = Language = %d"), dwRtValue);

			}
			break;
		case 4:
			{
				m_strSysInfo.Format(_T("(4) = PowerOffTime = %d"), dwRtValue);

			}
			break;
		case 5:
			{
				m_strSysInfo.Format(_T("(5) = LockOperate = %d"), dwRtValue);

			}
			break;
		case 6:
			{
				m_strSysInfo.Format(_T("(6) = GlogWarning = %d"), dwRtValue);

			}
			break;
		case 7:
			{
				m_strSysInfo.Format(_T("(7) = SlogWarning = %d"), dwRtValue);

			}
			break;
		case 8:
			{
				m_strSysInfo.Format(_T("(8) = ReVerifyTime = %d"), dwRtValue);

			}
			break;
		case 9:
			{
				m_strSysInfo.Format(_T("(9) = Baudrate ID= %d"), dwRtValue);

			}
			break;
		case 10:
			{
				m_strSysInfo.Format(_T("(10) = DateSeperate = %d"), dwRtValue);

			}
			break;

		}//switch

		m_dwStatusValue = dwRtValue;
		
	} 
	else
	{
		//error
		long dwErrorValue;

		m_pOCXObj->GetLastError(&dwErrorValue);
		m_strSysInfo = ErrorStr(dwErrorValue);
	}

	UpdateData(FALSE);

	m_pOCXObj->EnableDevice( m_dwMachineID, TRUE );
}


void CSysInfo::OnBnClickedBtnSetDeviceInfo()
{
	// TODO: 在此添加控件通知处理程序代码
	UpdateData();

	BOOL bRet;

	if(!ToDisableDevice())
	{
		return;

	}

	int dwNumber = m_cmbIndexList.GetCurSel();
	dwNumber++;

	bRet = m_pOCXObj->SetDeviceInfo(m_dwMachineID, dwNumber, m_dwStatusValue);
	if (!bRet )
	{
		//error
		long dwErrorValue;

		m_pOCXObj->GetLastError(&dwErrorValue);
		m_strSysInfo = ErrorStr(dwErrorValue);
	}

	m_strSysInfo = STR_SUCCESS;

	UpdateData(FALSE);

	if (dwNumber == 2)
	{
		Sleep( 1000 );  //do delay
	}

	m_pOCXObj->EnableDevice(m_dwMachineID, TRUE);

}


void CSysInfo::OnBnClickedBtnGetDeviceStatus()
{
	// TODO: 在此添加控件通知处理程序代码
	UpdateData();

	if(!ToDisableDevice())
	{
		return;

	}

	BOOL bRet;

	int dwNumber = m_cmbIndexList.GetCurSel();
	dwNumber++;

	if ( dwNumber > 7 ) 
	{
		m_strSysInfo = _T("Invalid Parameter");

		UpdateData(FALSE);
		return;
	}

	long dwRtValue;

	bRet = m_pOCXObj->GetDeviceStatus(m_dwMachineID, dwNumber, &dwRtValue);
	if (bRet)
	{
		switch(dwNumber)
		{
		case 1:
			{
				m_strSysInfo.Format(_T("(1) Manager Count = %d"), dwRtValue);
			}
			break;
		case 2:
			{
				m_strSysInfo.Format(_T("(2) User Count = %d"), dwRtValue);

			}
			break;
		case 3:
			{
				m_strSysInfo.Format(_T("(3) FP Count = %d"), dwRtValue);

			}
			break;
		case 4:
			{
				m_strSysInfo.Format(_T("(4) Password Count = %d"), dwRtValue);

			}
			break;
		case 5:
			{
				m_strSysInfo.Format(_T("(5) SLog Count = %d"), dwRtValue);

			}
			break;
		case 6:
			{
				m_strSysInfo.Format(_T("(6) Glog Count = %d"), dwRtValue);

			}
			break;
// 		case 7:
// 			{
// 				m_strSysInfo.Format(_T("(6) Card Count = %d"), dwRtValue);
// 
// 			}
// 			break;

		default:
			{
				m_strSysInfo.Format(_T("(x) What Count = %d"), dwRtValue);

			}

			
		}

		m_dwStatusValue = dwRtValue;
	} 
	else
	{
		//error
		long dwErrorValue;

		m_pOCXObj->GetLastError(&dwErrorValue);
		m_strSysInfo = ErrorStr(dwErrorValue);
	}



	UpdateData(FALSE);
	m_pOCXObj->EnableDevice(m_dwMachineID, TRUE);

}

BOOL CSysInfo::ToDisableDevice()
{
	m_strSysInfo = "Working...";
	UpdateData(FALSE);

	BOOL bRet = m_pOCXObj->EnableDevice( m_dwMachineID, FALSE );
	if ( bRet )
	{
		m_strSysInfo = "Disable Device Success!";

		return TRUE;

	}
	else
	{
		m_strSysInfo = STR_NO_DEVICE;
		UpdateData(FALSE);

		return FALSE;
	}
}
