// BellSetting.cpp : implementation file
//

#include "stdafx.h"
#include "OEMClient.h"
#include "BellSetting.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CBellSetting dialog


CBellSetting::CBellSetting(CWnd* pParent /*=NULL*/)
	: CDialog(CBellSetting::IDD, pParent)
{
	//{{AFX_DATA_INIT(CBellSetting)
	m_parentwnd = pParent;
	m_pOCXObj = NULL;
	m_dwMechineID = 0;
	m_strBellInfo = _T("");
	m_dwBellRingCount = 0;
	m_dwHourPoint1 = 0;
	m_dwMinutePoint1 = 0;
	m_dwBellCount = 0;
	m_dwHourPoint2 = 0;
	m_dwMinutePoint2 = 0;
	m_dwHourPoint3 = 0;
	m_dwMinutePoint3 = 0;
	m_dwHourPoint4 = 0;
	m_dwMinutePoint4 = 0;
	m_dwHourPoint5 = 0;
	m_dwMinutePoint5 = 0;

	m_dwHourPoint6 = 0;
	m_dwMinutePoint6 = 0;

	m_dwHourPoint7 = 0;
	m_dwMinutePoint7 = 0;

	m_dwMinutePoint8 = 0;	
	m_dwHourPoint8 = 0;
	//}}AFX_DATA_INIT
}


void CBellSetting::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CBellSetting)
	DDX_Text(pDX, IDC_STATIC_BELL_INFO, m_strBellInfo);
	DDX_Text(pDX, IDC_EDIT_CIRCLE_COUNT, m_dwBellRingCount);
	DDV_MinMaxLong(pDX, m_dwBellRingCount, 0, 100);
	DDX_Text(pDX, IDC_EDIT1_HOUR, m_dwHourPoint1);
	DDV_MinMaxLong(pDX, m_dwHourPoint1, 0, 24);
	DDX_Text(pDX, IDC_EDIT1_MINUTE, m_dwMinutePoint1);
	DDV_MinMaxLong(pDX, m_dwMinutePoint1, 0, 59);
	DDX_Text(pDX, IDC_EDIT2_HOUR, m_dwHourPoint2);
	DDV_MinMaxLong(pDX, m_dwHourPoint2, 0, 24);
	DDX_Text(pDX, IDC_EDIT2_MINUTE, m_dwMinutePoint2);
	DDV_MinMaxLong(pDX, m_dwMinutePoint2, 0, 59);
	DDX_Text(pDX, IDC_EDIT3_HOUR, m_dwHourPoint3);
	DDV_MinMaxLong(pDX, m_dwHourPoint3, 0, 24);
	DDX_Text(pDX, IDC_EDIT3_MINUTE, m_dwMinutePoint3);
	DDV_MinMaxLong(pDX, m_dwMinutePoint3, 0, 59);
	DDX_Text(pDX, IDC_EDIT4_HOUR, m_dwHourPoint4);
	DDV_MinMaxLong(pDX, m_dwHourPoint4, 0, 24);
	DDX_Text(pDX, IDC_EDIT4_MINUTE, m_dwMinutePoint4);
	DDV_MinMaxLong(pDX, m_dwMinutePoint4, 0, 59);
	DDX_Text(pDX, IDC_EDIT5_HOUR, m_dwHourPoint5);
	DDV_MinMaxLong(pDX, m_dwHourPoint5, 0, 24);
	DDX_Text(pDX, IDC_EDIT5_MINUTE, m_dwMinutePoint5);
	DDV_MinMaxLong(pDX, m_dwMinutePoint5, 0, 59);
	DDX_Text(pDX, IDC_EDIT6_HOUR, m_dwHourPoint6);
	DDV_MinMaxLong(pDX, m_dwHourPoint6, 0, 24);
	DDX_Text(pDX, IDC_EDIT6_MINUTE, m_dwMinutePoint6);
	DDV_MinMaxLong(pDX, m_dwMinutePoint6, 0, 59);
	DDX_Text(pDX, IDC_EDIT7_MINUTE, m_dwMinutePoint7);
	DDV_MinMaxLong(pDX, m_dwMinutePoint7, 0, 59);
	DDX_Text(pDX, IDC_EDIT8_MINUTE, m_dwMinutePoint8);
	DDV_MinMaxLong(pDX, m_dwMinutePoint8, 0, 59);
	DDX_Text(pDX, IDC_EDIT7_HOUR, m_dwHourPoint7);
	DDV_MinMaxLong(pDX, m_dwHourPoint7, 0, 24);
	DDX_Text(pDX, IDC_EDIT8_HOUR, m_dwHourPoint8);
	DDV_MinMaxLong(pDX, m_dwHourPoint8, 0, 24);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CBellSetting, CDialog)
	//{{AFX_MSG_MAP(CBellSetting)
	ON_BN_CLICKED(IDC_BTN_READ_BELL_SETTING, OnBtnReadBellSetting)
	ON_BN_CLICKED(IDC_BTN_WRITE_BELL_SETTING, OnBtnWriteBellSetting)
	ON_WM_SHOWWINDOW()
	ON_WM_CLOSE()
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CBellSetting message handlers

void CBellSetting::OnBtnReadBellSetting() 
{
	// TODO: Add your control notification handler code here
	m_strBellInfo = STR_WAITING;
	
	UpdateData(FALSE);

	BOOL bRet = m_pOCXObj->EnableDevice( m_dwMechineID, FALSE );
	if ( !bRet )
	{
		m_strBellInfo = STR_NO_DEVICE;
		UpdateData(FALSE);
		
		return;
	}
	
	bRet = m_pOCXObj->GetBellTime( m_dwMechineID, &m_dwBellRingCount, m_BellInfoData );
	if ( bRet )
	{
		//MoveMemory( m_pData, m_pData, sizeof tagBellInfo );

		pTBellInfo pInfo = (pTBellInfo)m_BellInfoData;
		
		//TCHAR szChar[10];

// 		GetDlgItem(IDC_EDIT1_HOUR)->SetWindowText( itoa(pInfo->chHour[0], szChar, 10 ) );
// 		GetDlgItem(IDC_EDIT2_HOUR)->SetWindowText( itoa(pInfo->chHour[1], szChar, 10 ) );
// 		GetDlgItem(IDC_EDIT3_HOUR)->SetWindowText( itoa(pInfo->chHour[2], szChar, 10 ) );
// 		GetDlgItem(IDC_EDIT4_HOUR)->SetWindowText( itoa(pInfo->chHour[3], szChar, 10 ) );
// 		GetDlgItem(IDC_EDIT5_HOUR)->SetWindowText( itoa(pInfo->chHour[4], szChar, 10 ) );
// 		GetDlgItem(IDC_EDIT6_HOUR)->SetWindowText( itoa(pInfo->chHour[5], szChar, 10 ) );
// 		GetDlgItem(IDC_EDIT7_HOUR)->SetWindowText( itoa(pInfo->chHour[6], szChar, 10 ) );
// 		GetDlgItem(IDC_EDIT8_HOUR)->SetWindowText( itoa(pInfo->chHour[7], szChar, 10 ) );
// 
// 		GetDlgItem(IDC_EDIT1_MINUTE)->SetWindowText( itoa(pInfo->chMinute[0], szChar, 10 ) );
// 		GetDlgItem(IDC_EDIT2_MINUTE)->SetWindowText( itoa(pInfo->chMinute[1], szChar, 10 ) );
// 		GetDlgItem(IDC_EDIT3_MINUTE)->SetWindowText( itoa(pInfo->chMinute[2], szChar, 10 ) );
// 		GetDlgItem(IDC_EDIT4_MINUTE)->SetWindowText( itoa(pInfo->chMinute[3], szChar, 10 ) );
// 		GetDlgItem(IDC_EDIT5_MINUTE)->SetWindowText( itoa(pInfo->chMinute[4], szChar, 10 ) );
// 		GetDlgItem(IDC_EDIT6_MINUTE)->SetWindowText( itoa(pInfo->chMinute[5], szChar, 10 ) );
// 		GetDlgItem(IDC_EDIT7_MINUTE)->SetWindowText( itoa(pInfo->chMinute[6], szChar, 10 ) );
// 		GetDlgItem(IDC_EDIT8_MINUTE)->SetWindowText( itoa(pInfo->chMinute[7], szChar, 10 ) );

		m_dwHourPoint1 = pInfo->chHour[0];
		m_dwHourPoint2 = pInfo->chHour[1];
		m_dwHourPoint3 = pInfo->chHour[2];
		m_dwHourPoint4 = pInfo->chHour[3];
		m_dwHourPoint5 = pInfo->chHour[4];
		m_dwHourPoint6 = pInfo->chHour[5];
		m_dwHourPoint7 = pInfo->chHour[6];
		m_dwHourPoint8 = pInfo->chHour[7];

		m_dwMinutePoint1 = pInfo->chMinute[0];
		m_dwMinutePoint2 = pInfo->chMinute[1];
		m_dwMinutePoint3 = pInfo->chMinute[2];
		m_dwMinutePoint4 = pInfo->chMinute[3];
		m_dwMinutePoint5 = pInfo->chMinute[4];
		m_dwMinutePoint6 = pInfo->chMinute[5];
		m_dwMinutePoint7 = pInfo->chMinute[6];
		m_dwMinutePoint8 = pInfo->chMinute[7];

		((CButton*)GetDlgItem(IDC_CHECK1))->SetCheck( pInfo->chValid[0] );
		((CButton*)GetDlgItem(IDC_CHECK2))->SetCheck( pInfo->chValid[1] );
		((CButton*)GetDlgItem(IDC_CHECK3))->SetCheck( pInfo->chValid[2] );
		((CButton*)GetDlgItem(IDC_CHECK4))->SetCheck( pInfo->chValid[3] );
		((CButton*)GetDlgItem(IDC_CHECK5))->SetCheck( pInfo->chValid[4] );
		((CButton*)GetDlgItem(IDC_CHECK6))->SetCheck( pInfo->chValid[5] );
		((CButton*)GetDlgItem(IDC_CHECK7))->SetCheck( pInfo->chValid[6] );
		((CButton*)GetDlgItem(IDC_CHECK8))->SetCheck( pInfo->chValid[7] );

		//GetDlgItem(IDC_EDIT_CIRCLE_COUNT)->SetWindowText( itoa(m_dwBellCount, szChar, 10 ) );


		m_pOCXObj->EnableDevice( m_dwMechineID, TRUE );

		m_strBellInfo = STR_SUCCESS;

		UpdateData(FALSE);
	}
	else
	{
		//get error code
	}

}

void CBellSetting::OnBtnWriteBellSetting() 
{
	// TODO: Add your control notification handler code here
	UpdateData(TRUE);

	m_strBellInfo = STR_WAITING;
	
	UpdateData(FALSE);
	
	pTBellInfo pInfo = (pTBellInfo)m_BellInfoData;
	
	//TCHAR szChar[10];

	{
		pInfo->chHour[0] = m_dwHourPoint1;
		pInfo->chHour[1] = m_dwHourPoint2;
		pInfo->chHour[2] = m_dwHourPoint3;
		pInfo->chHour[3] = m_dwHourPoint4;
		pInfo->chHour[4] = m_dwHourPoint5;
		pInfo->chHour[5] = m_dwHourPoint6;
		pInfo->chHour[6] = m_dwHourPoint7;
		pInfo->chHour[7] = m_dwHourPoint8;

		pInfo->chMinute[0] = m_dwMinutePoint1;
		pInfo->chMinute[1] = m_dwMinutePoint2;
		pInfo->chMinute[2] = m_dwMinutePoint3;
		pInfo->chMinute[3] = m_dwMinutePoint4;
		pInfo->chMinute[4] = m_dwMinutePoint5;
		pInfo->chMinute[5] = m_dwMinutePoint6;
		pInfo->chMinute[6] = m_dwMinutePoint7;
		pInfo->chMinute[7] = m_dwMinutePoint8;	

		pInfo->chValid[0]=((CButton*)GetDlgItem(IDC_CHECK1))->GetCheck( );
		pInfo->chValid[1]=((CButton*)GetDlgItem(IDC_CHECK2))->GetCheck( );
		pInfo->chValid[2]=((CButton*)GetDlgItem(IDC_CHECK3))->GetCheck( );
		pInfo->chValid[3]=((CButton*)GetDlgItem(IDC_CHECK4))->GetCheck( );
		pInfo->chValid[4]=((CButton*)GetDlgItem(IDC_CHECK5))->GetCheck( );
		pInfo->chValid[5]=((CButton*)GetDlgItem(IDC_CHECK6))->GetCheck( );
		pInfo->chValid[6]=((CButton*)GetDlgItem(IDC_CHECK7))->GetCheck( );
		pInfo->chValid[7]=((CButton*)GetDlgItem(IDC_CHECK8))->GetCheck( );		
		
	}


	BOOL bRet = m_pOCXObj->EnableDevice( m_dwMechineID, FALSE );
	if ( !bRet )
	{
		m_strBellInfo = STR_NO_DEVICE;
		UpdateData(FALSE);
		
		return;
	}

	bRet = m_pOCXObj->SetBellTime( m_dwMechineID, m_dwBellRingCount, m_BellInfoData );
	if (bRet)
	{
		m_strBellInfo = STR_SUCCESS;
		
	}
	else
	{
		//get error info
		long dwErrorValue;

		m_pOCXObj->GetLastError(&dwErrorValue);
		m_strBellInfo = ErrorStr(dwErrorValue);
	}

	m_pOCXObj->EnableDevice( m_dwMechineID, TRUE );

	UpdateData(FALSE);
}

void CBellSetting::PostNcDestroy() 
{
	// TODO: Add your specialized code here and/or call the base class
	delete this;

	CDialog::PostNcDestroy();
}

void CBellSetting::OnShowWindow(BOOL bShow, UINT nStatus) 
{
	CDialog::OnShowWindow(bShow, nStatus);
	
	// TODO: Add your message handler code here
	if (bShow)
	{
		m_pOCXObj = (CFp_clockctrl1*)::SendMessage(m_parentwnd->m_hWnd, WM_GET_OCXOBJ_MSG, 0, (LPARAM)&m_dwMechineID);
	}
	else
	{
		//ResetValue();	

	}
}

void CBellSetting::OnClose() 
{
	// TODO: Add your message handler code here and/or call default
	ResetValue();

	m_parentwnd->ShowWindow(SW_SHOW);

	CDialog::OnClose();
}

void CBellSetting::OnOK() 
{
	// TODO: Add extra validation here
	ResetValue();

	m_parentwnd->ShowWindow(SW_SHOW);

	CDialog::OnOK();
}

void CBellSetting::ResetValue()
{
	ZeroMemory( m_BellInfoData, sizeof(TBellInfo));

	pTBellInfo pInfo = (pTBellInfo)m_BellInfoData;

	m_dwHourPoint1 = pInfo->chHour[0];
	m_dwHourPoint2 = pInfo->chHour[1];
	m_dwHourPoint3 = pInfo->chHour[2];
	m_dwHourPoint4 = pInfo->chHour[3];
	m_dwHourPoint5 = pInfo->chHour[4];
	m_dwHourPoint6 = pInfo->chHour[5];
	m_dwHourPoint7 = pInfo->chHour[6];
	m_dwHourPoint8 = pInfo->chHour[7];
	
	m_dwMinutePoint1 = pInfo->chMinute[0];
	m_dwMinutePoint2 = pInfo->chMinute[1];
	m_dwMinutePoint3 = pInfo->chMinute[2];
	m_dwMinutePoint4 = pInfo->chMinute[3];
	m_dwMinutePoint5 = pInfo->chMinute[4];
	m_dwMinutePoint6 = pInfo->chMinute[5];
	m_dwMinutePoint7 = pInfo->chMinute[6];
	m_dwMinutePoint8 = pInfo->chMinute[7];

	((CButton*)GetDlgItem(IDC_CHECK1))->SetCheck( 0 );
	((CButton*)GetDlgItem(IDC_CHECK2))->SetCheck( 0 );
	((CButton*)GetDlgItem(IDC_CHECK3))->SetCheck( 0 );
	((CButton*)GetDlgItem(IDC_CHECK4))->SetCheck( 0 );
	((CButton*)GetDlgItem(IDC_CHECK5))->SetCheck( 0 );
	((CButton*)GetDlgItem(IDC_CHECK6))->SetCheck( 0 );
	((CButton*)GetDlgItem(IDC_CHECK7))->SetCheck( 0 );
	((CButton*)GetDlgItem(IDC_CHECK8))->SetCheck( 0 );
	
	m_dwBellRingCount = 0;
	UpdateData(FALSE);
}
