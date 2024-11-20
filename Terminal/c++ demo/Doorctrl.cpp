// Doorctrl.cpp : implementation file
//

#include "stdafx.h"
#include "OEMClient.h"
#include "Doorctrl.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif


/////////////////////////////////////////////////////////////////////////////
// CDoorctrl dialog


CDoorctrl::CDoorctrl(CWnd* pParent /*=NULL*/)
	: CDialog(CDoorctrl::IDD, pParent)
{
	//{{AFX_DATA_INIT(CDoorctrl)
	m_parentwnd = pParent;
	m_pOCXObj = NULL;
	m_dwMechineID = 0;
	m_strInfo = _T("");
	//}}AFX_DATA_INIT
}


void CDoorctrl::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CDoorctrl)
	DDX_Text(pDX, IDC_STATIC_INFO, m_strInfo);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CDoorctrl, CDialog)
	//{{AFX_MSG_MAP(CDoorctrl)
	ON_BN_CLICKED(IDC_BTN_GET_DOOR_STATUS, OnBtnGetDoorStatus)
	ON_WM_SHOWWINDOW()
	ON_WM_CLOSE()
	ON_BN_CLICKED(IDC_BTN_OPEN_DOOR, OnBtnOpenDoor)
	ON_BN_CLICKED(IDC_BTN_AUTO_RECOVER, OnBtnAutoRecover)
	ON_BN_CLICKED(IDC_BTN_REBOOT, OnBtnReboot)
	ON_BN_CLICKED(IDC_BTN_UNCOND_OPEN, OnBtnUncondOpen)
	ON_BN_CLICKED(IDC_BTN_UNCOND_CLOSE, OnBtnUncondClose)
	ON_BN_CLICKED(IDC_BTN_CANCEL_WARN, OnBtnCancelWarn)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CDoorctrl message handlers



void CDoorctrl::PostNcDestroy() 
{
	// TODO: Add your specialized code here and/or call the base class
	delete this;

	CDialog::PostNcDestroy();
}

void CDoorctrl::OnShowWindow(BOOL bShow, UINT nStatus) 
{
	CDialog::OnShowWindow(bShow, nStatus);
	
	// TODO: Add your message handler code here
	if (bShow)
	{
		m_pOCXObj = (CFp_clockctrl1*)::SendMessage(m_parentwnd->m_hWnd,WM_GET_OCXOBJ_MSG, 0, (LPARAM)&m_dwMechineID);
	}
}

void CDoorctrl::OnClose() 
{
	// TODO: Add your message handler code here and/or call default
	m_parentwnd->ShowWindow(SW_SHOW);

	m_strInfo = "";
	UpdateData(FALSE);

	CDialog::OnClose();
}


void CDoorctrl::OnBtnGetDoorStatus() 
{
	// TODO: Add your control notification handler code here
	m_strInfo = "Working...";
	UpdateData(FALSE);
	
	BOOL bRet = m_pOCXObj->EnableDevice( m_dwMechineID, FALSE );
	if ( !bRet )
	{
		m_strInfo = STR_NO_DEVICE;
		UpdateData(FALSE);
		
		return;
	}

	long dwStatus;

	bRet =m_pOCXObj->GetDoorStatus( m_dwMechineID, &dwStatus);

	if (bRet)
	{
		switch(dwStatus)
		{
		case FORCEOPEN:
			m_strInfo ="Uncond Door Open State!";
			break;

		case FORCECLOSE:
			m_strInfo = "Uncond Door Close State!";
			break;

		case SOFTWAREOPEN:
			m_strInfo = "Program Door Open State!";
			break;

		case RESTORETOAUTO:
			m_strInfo =  "Restore to AUTO !";
			break;

		case REBOOT_FPA_MACHINE:
			m_strInfo =  "Reboot FPA Machine!";
			break;

		case DEASSERT_ALARM:
			m_strInfo = "Door Warning Sound Cancel!";
			break;

		}
	}
	else
	{
		//error
		long dwErrorValue;

		m_pOCXObj->GetLastError(&dwErrorValue);
		m_strInfo = ErrorStr(dwErrorValue);

	}

	UpdateData(FALSE);

	m_pOCXObj->EnableDevice( m_dwMechineID, TRUE );

}


void CDoorctrl::OnBtnUncondOpen() 
{
	// TODO: Add your control notification handler code here
	m_strInfo = "Working...";
	UpdateData(FALSE);
	
	BOOL bRet = m_pOCXObj->EnableDevice( m_dwMechineID, FALSE );
	if ( !bRet )
	{
		m_strInfo = STR_NO_DEVICE;
		UpdateData(FALSE);
		
		return;
	}
	
	bRet =m_pOCXObj->SetDoorStatus( m_dwMechineID, FORCEOPEN);
	
	if (bRet)
	{
		
		m_strInfo ="Uncond Door Open CMD Send Success!";		
	}
	else
	{
		//error
		long dwErrorValue;
		
		m_pOCXObj->GetLastError(&dwErrorValue);
		m_strInfo = ErrorStr(dwErrorValue);
		
	}
	
	UpdateData(FALSE);
	
	m_pOCXObj->EnableDevice( m_dwMechineID, TRUE );
}

void CDoorctrl::OnBtnUncondClose() 
{
	// TODO: Add your control notification handler code here
	m_strInfo = "Working...";
	UpdateData(FALSE);
	
	BOOL bRet = m_pOCXObj->EnableDevice( m_dwMechineID, FALSE );
	if ( !bRet )
	{
		m_strInfo = STR_NO_DEVICE;
		UpdateData(FALSE);
		
		return;
	}
	
	bRet =m_pOCXObj->SetDoorStatus( m_dwMechineID, FORCECLOSE);
	
	if (bRet)
	{
		
		m_strInfo ="Uncond Door Close CMD Send Success!";		
	}
	else
	{
		//error
		long dwErrorValue;
		
		m_pOCXObj->GetLastError(&dwErrorValue);
		m_strInfo = ErrorStr(dwErrorValue);
		
	}
	
	UpdateData(FALSE);
	
	m_pOCXObj->EnableDevice( m_dwMechineID, TRUE );
}

void CDoorctrl::OnBtnOpenDoor() 
{
	// TODO: Add your control notification handler code here
	m_strInfo = "Working...";
	UpdateData(FALSE);
	
	BOOL bRet = m_pOCXObj->EnableDevice( m_dwMechineID, FALSE );
	if ( !bRet )
	{
		m_strInfo = STR_NO_DEVICE;
		UpdateData(FALSE);
		
		return;
	}
	
	bRet =m_pOCXObj->SetDoorStatus( m_dwMechineID, SOFTWAREOPEN);
	
	if (bRet)
	{
		
		m_strInfo ="Door Open Success!";		
	}
	else
	{
		//error
		long dwErrorValue;
		
		m_pOCXObj->GetLastError(&dwErrorValue);
		m_strInfo = ErrorStr(dwErrorValue);
		
	}
	
	UpdateData(FALSE);
	
	m_pOCXObj->EnableDevice( m_dwMechineID, TRUE );
}

void CDoorctrl::OnBtnAutoRecover() 
{
	// TODO: Add your control notification handler code here
	m_strInfo = "Working...";
	UpdateData(FALSE);
	
	BOOL bRet = m_pOCXObj->EnableDevice( m_dwMechineID, FALSE );
	if ( !bRet )
	{
		m_strInfo = STR_NO_DEVICE;
		UpdateData(FALSE);
		
		return;
	}
	
	bRet =m_pOCXObj->SetDoorStatus( m_dwMechineID, RESTORETOAUTO);
	
	if (bRet)
	{
	
			m_strInfo ="Auto CMD Send Success!";		
	}
	else
	{
		//error
		long dwErrorValue;
		
		m_pOCXObj->GetLastError(&dwErrorValue);
		m_strInfo = ErrorStr(dwErrorValue);
		
	}
	
	UpdateData(FALSE);
	
	m_pOCXObj->EnableDevice( m_dwMechineID, TRUE );
}

void CDoorctrl::OnBtnReboot() 
{
	// TODO: Add your control notification handler code here
	m_strInfo = "Working...";
	UpdateData(FALSE);
	
	BOOL bRet = m_pOCXObj->EnableDevice( m_dwMechineID, FALSE );
	if ( !bRet )
	{
		m_strInfo = STR_NO_DEVICE;
		UpdateData(FALSE);
		
		return;
	}
	
	bRet =m_pOCXObj->SetDoorStatus( m_dwMechineID, REBOOT_FPA_MACHINE);
	
	if (bRet)
	{
		
		m_strInfo ="Reboot CMD Send Success!";		
	}
	else
	{
		//error
		long dwErrorValue;
		
		m_pOCXObj->GetLastError(&dwErrorValue);
		m_strInfo = ErrorStr(dwErrorValue);
		
	}
	
	UpdateData(FALSE);
	
	m_pOCXObj->EnableDevice( m_dwMechineID, TRUE );
}


void CDoorctrl::OnBtnCancelWarn() 
{
	// TODO: Add your control notification handler code here
	m_strInfo = "Working...";
	UpdateData(FALSE);
	
	BOOL bRet = m_pOCXObj->EnableDevice( m_dwMechineID, FALSE );
	if ( !bRet )
	{
		m_strInfo = STR_NO_DEVICE;
		UpdateData(FALSE);
		
		return;
	}
	
	bRet =m_pOCXObj->SetDoorStatus( m_dwMechineID, DEASSERT_ALARM);
	
	if (bRet)
	{
		
		m_strInfo ="Uncond Door No Sound  CMD Send Success!";		
	}
	else
	{
		//error
		long dwErrorValue;
		
		m_pOCXObj->GetLastError(&dwErrorValue);
		m_strInfo = ErrorStr(dwErrorValue);
		
	}
	
	UpdateData(FALSE);
	
	m_pOCXObj->EnableDevice( m_dwMechineID, TRUE );
}

BOOL CDoorctrl::OnInitDialog() 
{
	CDialog::OnInitDialog();
	
	// TODO: Add extra initialization here
	
	return TRUE;  // return TRUE unless you set the focus to a control
	              // EXCEPTION: OCX Property Pages should return FALSE
}
