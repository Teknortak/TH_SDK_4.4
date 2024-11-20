// DeviceSn.cpp : implementation file
//

#include "stdafx.h"
#include "OEMClient.h"
#include "DeviceSn.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CDeviceSn dialog


CDeviceSn::CDeviceSn(CWnd* pParent /*=NULL*/)
	: CDialog(CDeviceSn::IDD, pParent)
{
	//{{AFX_DATA_INIT(CDeviceSn)
	m_parentwnd = pParent;
	m_strInfo = _T("");
	m_dwBackupNum = 0;
	//}}AFX_DATA_INIT
}


void CDeviceSn::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CDeviceSn)
	DDX_Text(pDX, IDC_STATIC_INFO, m_strInfo);
	DDX_Text(pDX, IDC_EDIT_BACKUP_NUM, m_dwBackupNum);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CDeviceSn, CDialog)
	//{{AFX_MSG_MAP(CDeviceSn)
	ON_BN_CLICKED(IDC_BTN_BACKUP_NUM, OnBtnBackupNum)
	ON_BN_CLICKED(IDC_BTN_PRD_NUM, OnBtnPrdNum)
	ON_BN_CLICKED(IDC_BTN_SN, OnBtnSn)
	ON_WM_SHOWWINDOW()
	ON_WM_CLOSE()
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CDeviceSn message handlers

void CDeviceSn::OnBtnBackupNum() 
{
	// TODO: Add your control notification handler code here
	long dwBackupNum;

	m_strInfo = STR_WAITING;
	
	UpdateData(FALSE);
	
	BOOL bRet = m_pOCXObj->EnableDevice( m_dwMechineID, FALSE );
	if ( !bRet )
	{
		m_strInfo = STR_NO_DEVICE;
		UpdateData(FALSE);
		
		return;
	}

	dwBackupNum = m_pOCXObj->GetBackupNumber( m_dwMechineID );
	if ( dwBackupNum != 0 )
	{
		
		m_dwBackupNum = dwBackupNum;
		
		m_strInfo = STR_SUCCESS;

		UpdateData( FALSE );
	}
	else
	{
		//get error
	}

	m_pOCXObj->EnableDevice( m_dwMechineID, TRUE );


}

void CDeviceSn::OnBtnPrdNum() 
{
	// TODO: Add your control notification handler code here

	return;

	m_strInfo = STR_WAITING;
	
	UpdateData(FALSE);
	
	BOOL bRet = m_pOCXObj->EnableDevice( m_dwMechineID, FALSE );
	if ( !bRet )
	{
		m_strInfo = STR_NO_DEVICE;
		UpdateData(FALSE);
		
		return;
	}
	BSTR bstrChar;

	bRet = m_pOCXObj->GetProductCode( m_dwMechineID, &bstrChar);
	if (bRet)
	{
		m_strInfo = bstrChar;
		
		GetDlgItem(IDC_EDIT_PRD_CODE)->SetWindowText( m_strInfo );
		
		m_strInfo = STR_SUCCESS;
		
		UpdateData(FALSE);
	}
	else
	{
		//error
	}


	m_pOCXObj->EnableDevice( m_dwMechineID, TRUE );

}

void CDeviceSn::OnBtnSn() 
{
	// TODO: Add your control notification handler code here
	m_strInfo = STR_WAITING;

	UpdateData(FALSE);

	BOOL bRet = m_pOCXObj->EnableDevice( m_dwMechineID, FALSE );
	if ( !bRet )
	{
		m_strInfo = STR_NO_DEVICE;
		UpdateData(FALSE);
		
		return;
	}

	BSTR bstrChar;
	

	bRet = m_pOCXObj->GetSerialNumber( m_dwMechineID, &bstrChar  );

	if ( bRet )
	{
		m_strInfo = bstrChar;
		
		GetDlgItem(IDC_EDIT_SN)->SetWindowText( m_strInfo );
		
		m_strInfo = STR_SUCCESS;
		
		UpdateData(FALSE);
	}
	else
	{
		//error
		long dwErrorValue;
		
		m_pOCXObj->GetLastError(&dwErrorValue);
		m_strInfo = ErrorStr(dwErrorValue);
	}
	

	m_pOCXObj->EnableDevice( m_dwMechineID, TRUE );

}

void CDeviceSn::PostNcDestroy() 
{
	// TODO: Add your specialized code here and/or call the base class
	delete this;

	CDialog::PostNcDestroy();
}

void CDeviceSn::OnShowWindow(BOOL bShow, UINT nStatus) 
{
	CDialog::OnShowWindow(bShow, nStatus);
	
	// TODO: Add your message handler code here
	if (bShow)
	{
		m_pOCXObj = (CFp_clockctrl1*)::SendMessage(m_parentwnd->m_hWnd,WM_GET_OCXOBJ_MSG, 0, (LPARAM)&m_dwMechineID);
	}
}

void CDeviceSn::OnOK() 
{
	// TODO: Add extra validation here
	m_parentwnd->ShowWindow(SW_SHOW);

	CDialog::OnOK();
}

void CDeviceSn::OnClose() 
{
	// TODO: Add your message handler code here and/or call default
	m_parentwnd->ShowWindow(SW_SHOW);

	CDialog::OnClose();
}
