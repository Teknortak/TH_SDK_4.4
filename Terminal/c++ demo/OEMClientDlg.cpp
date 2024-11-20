// OEMClientDlg.cpp : implementation file
//

#include "stdafx.h"

#include "OEMClient.h"
#include "OEMClientDlg.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

CWnd* g_parent;

/////////////////////////////////////////////////////////////////////////////
// CAboutDlg dialog used for App About

class CAboutDlg : public CDialog
{
public:
	CAboutDlg();

// Dialog Data
	//{{AFX_DATA(CAboutDlg)
	enum { IDD = IDD_ABOUTBOX };
	//}}AFX_DATA

	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CAboutDlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	//{{AFX_MSG(CAboutDlg)
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

CAboutDlg::CAboutDlg() : CDialog(CAboutDlg::IDD)
{
	//{{AFX_DATA_INIT(CAboutDlg)
	//}}AFX_DATA_INIT
}

void CAboutDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CAboutDlg)
	//}}AFX_DATA_MAP
}

BEGIN_MESSAGE_MAP(CAboutDlg, CDialog)
	//{{AFX_MSG_MAP(CAboutDlg)
		// No message handlers
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// COEMClientDlg dialog

COEMClientDlg::COEMClientDlg(CWnd* pParent /*=NULL*/)
	: CDialog(COEMClientDlg::IDD, pParent),m_dwCurSelDev(0)
{
	//{{AFX_DATA_INIT(COEMClientDlg)
	m_IPPort = 5005;
	m_dwSerPort = 0;
	m_bDeviceOpened = FALSE;
	cSysInfoDlg = NULL;
	cDeviceSNDlg = NULL;
	m_dwTimeOutValue = 0;
	//}}AFX_DATA_INIT
	// Note that LoadIcon does not require a subsequent DestroyIcon in Win32
	m_hIcon = AfxGetApp()->LoadIcon(IDR_MAINFRAME);
}

void COEMClientDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(COEMClientDlg)
	DDX_Control(pDX, IDC_IPADDR, m_IPAddr);
	DDX_Control(pDX, IDC_CMB_COM_INDEX, m_cmbComPortIndex);
	DDX_Control(pDX, IDC_CMB_MECHINE_ID, m_cmbMechineID);
	DDX_Control(pDX, IDC_CMB_DEVICE_TYPE, m_cmbDeviceType);
	DDX_Text(pDX, IDC_EDIT_PORT, m_IPPort);
	DDV_MinMaxInt(pDX, m_IPPort, 1, 65535);
	DDX_Text(pDX, IDC_EDIT_SER_PORT, m_dwSerPort);
	DDX_Text(pDX, IDC_EDIT_TIMELIMIT, m_dwTimeOutValue);
	//}}AFX_DATA_MAP
	DDX_Control(pDX, IDC_FP_CLOCKCTRL, m_OCXControl);
}

BEGIN_MESSAGE_MAP(COEMClientDlg, CDialog)
	//{{AFX_MSG_MAP(COEMClientDlg)
	ON_WM_SYSCOMMAND()
	ON_WM_PAINT()
	ON_WM_QUERYDRAGICON()
	ON_BN_CLICKED(IDC_BUTTON1, OnBtnOpenDevice)
	ON_CBN_SELCHANGE(IDC_CMB_DEVICE_TYPE, OnSelchangeCmbDeviceType)
	ON_BN_CLICKED(IDC_BTN_SYS_INFO, OnBtnSysInfo)
	ON_WM_CLOSE()
	ON_MESSAGE(WM_GET_OCXOBJ_MSG, OnGetOCXObj)
	ON_BN_CLICKED(IDC_BTN_OPEN_DEV_SN_DLG, OnBtnOpenDevSnDlg)
	ON_BN_CLICKED(IDC_BTN_GET_BELL_INFO, OnBtnGetBellInfo)
	ON_BN_CLICKED(IDC_BTN_ENROLL_MGMT, OnBtnEnrollMgmt)
	ON_BN_CLICKED(IDC_BTN_LOG_MGMT, OnBtnLogMgmt)
	ON_BN_CLICKED(IDC_BTN_SET_PASSTIME, OnBtnSetPasstime)
	ON_BN_CLICKED(IDC_BTN_LOCK_CTRL, OnBtnLockCtrl)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// COEMClientDlg message handlers

BOOL COEMClientDlg::OnInitDialog()
{
	CDialog::OnInitDialog();

	// Add "About..." menu item to system menu.

	// IDM_ABOUTBOX must be in the system command range.
	ASSERT((IDM_ABOUTBOX & 0xFFF0) == IDM_ABOUTBOX);
	ASSERT(IDM_ABOUTBOX < 0xF000);

	CMenu* pSysMenu = GetSystemMenu(FALSE);
	if (pSysMenu != NULL)
	{
		CString strAboutMenu;
		strAboutMenu.LoadString(IDS_ABOUTBOX);
		if (!strAboutMenu.IsEmpty())
		{
			pSysMenu->AppendMenu(MF_SEPARATOR);
			pSysMenu->AppendMenu(MF_STRING, IDM_ABOUTBOX, strAboutMenu);
		}
	}

	// Set the icon for this dialog.  The framework does this automatically
	//  when the application's main window is not a dialog
	SetIcon(m_hIcon, TRUE);			// Set big icon
	SetIcon(m_hIcon, FALSE);		// Set small icon
	
	// TODO: Add extra initialization here
	
	m_cmbMechineID.SetCurSel(0);
	m_cmbDeviceType.SetCurSel(0);
	m_cmbComPortIndex.SetCurSel(0);

	m_IPAddr.SetAddress( 192, 168, 1, 17 );

	InitCtrlWindow();

	CreateChildWindow();

	return TRUE;  // return TRUE  unless you set the focus to a control
}

void COEMClientDlg::OnSysCommand(UINT nID, LPARAM lParam)
{
	if ((nID & 0xFFF0) == IDM_ABOUTBOX)
	{
		CAboutDlg dlgAbout;
		dlgAbout.DoModal();
	}
	else
	{
		CDialog::OnSysCommand(nID, lParam);
	}
}

// If you add a minimize button to your dialog, you will need the code below
//  to draw the icon.  For MFC applications using the document/view model,
//  this is automatically done for you by the framework.

void COEMClientDlg::OnPaint() 
{
	if (IsIconic())
	{
		CPaintDC dc(this); // device context for painting

		SendMessage(WM_ICONERASEBKGND, (WPARAM) dc.GetSafeHdc(), 0);

		// Center icon in client rectangle
		int cxIcon = GetSystemMetrics(SM_CXICON);
		int cyIcon = GetSystemMetrics(SM_CYICON);
		CRect rect;
		GetClientRect(&rect);
		int x = (rect.Width() - cxIcon + 1) / 2;
		int y = (rect.Height() - cyIcon + 1) / 2;

		// Draw the icon
		dc.DrawIcon(x, y, m_hIcon);
	}
	else
	{
		CDialog::OnPaint();
	}
}

// The system calls this to obtain the cursor to display while the user drags
//  the minimized window.
HCURSOR COEMClientDlg::OnQueryDragIcon()
{
	return (HCURSOR) m_hIcon;
}

void COEMClientDlg::OnBtnOpenDevice() 
{
	// TODO: Add your control notification handler code here
	m_dwMechineID = m_cmbMechineID.GetCurSel();
	
	m_dwMechineID++;

	if ( m_bDeviceOpened )
	{
		GetDlgItem(IDC_BTN_OPEN)->SetWindowText(_T("OPEN"));
		//m_OCXControl.EnableDevice( m_dwMechineID, TRUE );

		m_OCXControl.CloseCommPort();

		m_bDeviceOpened = FALSE;

		return;
	}

	UpdateData();  // get member datas from control objects.


	BOOL bRet = FALSE;
	
	switch( m_dwCurSelDev )
	{
	case DEVICE_COM:
		{
			m_OCXControl.SetCommPort( m_cmbComPortIndex.GetCurSel()+1 );
			m_OCXControl.SetBaudrate( 38400 ); 		
				
			bRet = m_OCXControl.OpenCommPort( m_dwMechineID );
			
		}
		break;
	case DEVICE_USB:
		{
			m_OCXControl.SetIsUSB( TRUE );
			bRet = m_OCXControl.OpenCommPort( m_dwMechineID );

		}
		break;
	case DEVICE_NET:
		{
			CString strAddr;
			m_IPAddr.GetWindowText( strAddr );
			BSTR bstrText = strAddr.AllocSysString();

			bRet = m_OCXControl.SetIPAddress( &bstrText, m_IPPort, 0);
			if( bRet )
			{
				
				bRet = m_OCXControl.OpenCommPort( m_dwMechineID );
// 				if ( bRet )
// 				{
// 					m_OCXControl.EnableDevice( m_dwMechineID, FALSE );
// 				}
	           
			}
			SysFreeString(bstrText);

		}
		break;
	case DEVICE_P2S:
		{
			m_OCXControl.SetServerPortandtick( m_dwSerPort, m_dwTimeOutValue);


			bRet = m_OCXControl.OpenCommPort( m_dwMechineID );

		}
		break;

	}

	if ( bRet )
	{
		GetDlgItem(IDC_BTN_OPEN)->SetWindowText(_T("CLOSE"));
		m_bDeviceOpened = TRUE;
	}
}

void COEMClientDlg::OnSelchangeCmbDeviceType() 
{
	// TODO: Add your control notification handler code here
	m_dwCurSelDev = m_cmbDeviceType.GetCurSel();
	CString strInfo;
	m_cmbDeviceType.GetLBText( m_dwCurSelDev, strInfo);

	if ( strInfo.Compare(_T("COM")) == 0 )
	{
		m_cmbComPortIndex.EnableWindow(TRUE);

		InitCtrlWindow();
		
		
	}
	else if ( strInfo.Compare(_T("NET")) == 0 )
	{
		m_cmbComPortIndex.EnableWindow(FALSE);

		m_IPAddr.EnableWindow( TRUE );
		((CWnd*)GetDlgItem(IDC_EDIT_PORT))->EnableWindow( TRUE );
		((CWnd*)GetDlgItem(IDC_EDIT_PASSWORD))->EnableWindow( TRUE );		

		((CWnd*)GetDlgItem(IDC_EDIT_SER_PORT))->EnableWindow(FALSE);
		((CWnd*)GetDlgItem(IDC_EDIT_TIMELIMIT))->EnableWindow(FALSE);
	}
	else if ( strInfo.Compare(_T("USB")) == 0 )
	{
		//COM
		m_cmbComPortIndex.EnableWindow(FALSE);

		//IP
		m_IPAddr.EnableWindow(FALSE);
		((CWnd*)GetDlgItem(IDC_EDIT_PORT))->EnableWindow(FALSE);
		((CWnd*)GetDlgItem(IDC_EDIT_PASSWORD))->EnableWindow(FALSE);
		
		//P2S
		((CWnd*)GetDlgItem(IDC_EDIT_SER_PORT))->EnableWindow(FALSE);
		((CWnd*)GetDlgItem(IDC_EDIT_TIMELIMIT))->EnableWindow(FALSE);
	}
	else if ( strInfo.Compare(_T("P2S")) == 0 )
	{
		//COM
		m_cmbComPortIndex.EnableWindow(FALSE);

		//IP
		m_IPAddr.EnableWindow(FALSE);
		((CWnd*)GetDlgItem(IDC_EDIT_PORT))->EnableWindow(FALSE);
		((CWnd*)GetDlgItem(IDC_EDIT_PASSWORD))->EnableWindow(FALSE);
		
		//P2S
		((CWnd*)GetDlgItem(IDC_EDIT_SER_PORT))->EnableWindow(TRUE);
		((CWnd*)GetDlgItem(IDC_EDIT_TIMELIMIT))->EnableWindow(TRUE);
	}
}

//
// disable IP & P2S configuration window
//
void COEMClientDlg::InitCtrlWindow()
{
	m_IPAddr.EnableWindow(FALSE);
	((CWnd*)GetDlgItem(IDC_EDIT_PORT))->EnableWindow(FALSE);
	((CWnd*)GetDlgItem(IDC_EDIT_PASSWORD))->EnableWindow(FALSE);
	
	((CWnd*)GetDlgItem(IDC_EDIT_SER_PORT))->EnableWindow(FALSE);
	((CWnd*)GetDlgItem(IDC_EDIT_TIMELIMIT))->EnableWindow(FALSE);
}

void COEMClientDlg::OnBtnSysInfo() 
{
	// TODO: Add your control notification handler code here

	::ShowWindow(GetSafeHwnd(),SW_HIDE);
	//ShowWindow(SW_HIDE);


    cSysInfoDlg->ShowWindow(SW_SHOW);



	
}

void COEMClientDlg::CreateChildWindow()
{
	cSysInfoDlg = new CSysInfo((CWnd*)this);
	if (cSysInfoDlg)
	{
		cSysInfoDlg->Create( IDD_DLG_SYS_INFO, (CWnd*)this );
		//cSysInfoDlg->ShowWindow(SW_NORMAL);
	}

	cDeviceSNDlg = new CDeviceSn( this );
	if( cDeviceSNDlg )
	{
		cDeviceSNDlg->Create( IDD_DLG_DEV_SN, (CWnd*)this );
	}

	cBellSettingDlg = new CBellSetting(this);
	if (cBellSettingDlg)
	{
		cBellSettingDlg->Create( IDD_DLG_BELL_INFO, (CWnd*)this );
	}

	cEnrollManageDlg = new CEnrollManage(this);
	if (cEnrollManageDlg)
	{
		cEnrollManageDlg->Create( IDD_DLG_ENROLL_FRM, (CWnd*)this );

	}

	cLogDataManageDlg = new CLogDataManage(this);
	if (cLogDataManageDlg)
	{
		cLogDataManageDlg->Create( IDD_DLG_LOG, (CWnd*)this );
		
	}

	cDoorCtrlDlg = new CDoorctrl(this);
	if (cDoorCtrlDlg)
	{
		cDoorCtrlDlg->Create( IDD_DLG_LOCK_CTRL, (CWnd*)this );
		
	}

	cSetPassTimeDlg = new CSetPasstime(this);
	if (cSetPassTimeDlg)
	{
		cSetPassTimeDlg->Create( IDD_DLG_SET_PASSTIME, (CWnd*)this );
		
	}
}

void COEMClientDlg::OnClose() 
{
	// TODO: Add your message handler code here and/or call default
// 	if ( cSysInfoDlg )
// 	{
// 		cSysInfoDlg->DestroyWindow();
// 		delete cSysInfoDlg;
// 		cSysInfoDlg = NULL;
// 	}
	if (m_bDeviceOpened)
	{
		m_OCXControl.CloseCommPort();
	}

	CDialog::OnClose();
}

LRESULT COEMClientDlg::OnGetOCXObj( WPARAM wParam, LPARAM lParam )
{
	int* p = (int*)lParam;

	*p = m_dwMechineID;

	return (LRESULT)&m_OCXControl;
}

void COEMClientDlg::OnBtnOpenDevSnDlg() 
{
	// TODO: Add your control notification handler code here
	::ShowWindow(GetSafeHwnd(),SW_HIDE);
	
    cDeviceSNDlg->ShowWindow(SW_SHOW);
}

void COEMClientDlg::OnBtnGetBellInfo() 
{
	// TODO: Add your control notification handler code here
	::ShowWindow(GetSafeHwnd(),SW_HIDE);
	
    cBellSettingDlg->ShowWindow(SW_SHOW);
}

void COEMClientDlg::OnBtnEnrollMgmt() 
{
	// TODO: Add your control notification handler code here
	::ShowWindow(GetSafeHwnd(),SW_HIDE);
	
    cEnrollManageDlg->ShowWindow(SW_SHOW);
}

void COEMClientDlg::OnBtnLogMgmt() 
{
	// TODO: Add your control notification handler code here
	::ShowWindow(GetSafeHwnd(),SW_HIDE);
	
    cLogDataManageDlg->ShowWindow(SW_SHOW);
}

void COEMClientDlg::OnBtnSetPasstime() 
{
	// TODO: Add your control notification handler code here
	::ShowWindow(GetSafeHwnd(),SW_HIDE);
	
    cSetPassTimeDlg->ShowWindow(SW_SHOW);
}

void COEMClientDlg::OnBtnLockCtrl() 
{
	// TODO: Add your control notification handler code here
	::ShowWindow(GetSafeHwnd(),SW_HIDE);
	
    cDoorCtrlDlg->ShowWindow(SW_SHOW);
}

void COEMClientDlg::OnOK() 
{
	// TODO: Add extra validation here
	if (m_bDeviceOpened)
	{
		m_OCXControl.CloseCommPort();
	}

	CDialog::OnOK();
}
