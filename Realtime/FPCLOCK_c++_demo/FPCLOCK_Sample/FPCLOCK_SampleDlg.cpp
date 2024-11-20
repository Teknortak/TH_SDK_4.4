
// FPCLOCK_SampleDlg.cpp : implementation file
//

#include "stdafx.h"
#include "FPCLOCK_Sample.h"
#include "FPCLOCK_SampleDlg.h"
#include "afxdialogex.h"

#include "Define.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#endif

//extern LPCTSTR FormatErrorStr(int  dwStatus);
LPCSTR FormVerifyStr(int dwVerify, long dwEnrollNum);

// CAboutDlg dialog used for App About

class CAboutDlg : public CDialogEx
{
public:
	CAboutDlg();

// Dialog Data
	enum { IDD = IDD_ABOUTBOX };

	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support

// Implementation
protected:
	DECLARE_MESSAGE_MAP()
};

CAboutDlg::CAboutDlg() : CDialogEx(CAboutDlg::IDD)
{
}

void CAboutDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialogEx::DoDataExchange(pDX);
}

BEGIN_MESSAGE_MAP(CAboutDlg, CDialogEx)
END_MESSAGE_MAP()


// CFPCLOCK_SampleDlg dialog



CFPCLOCK_SampleDlg::CFPCLOCK_SampleDlg(CWnd* pParent /*=NULL*/)
	: CDialogEx(CFPCLOCK_SampleDlg::IDD, pParent)
	, m_strInfo(_T(""))
	, m_dwPortNum(7005)
	, m_bNetOpened(false)
	, m_dwListIndex(0)
{
	m_hIcon = AfxGetApp()->LoadIcon(IDR_MAINFRAME);
}

void CFPCLOCK_SampleDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialogEx::DoDataExchange(pDX);
	DDX_Control(pDX, IDC_FPCLOCKSVRCTRL1, m_ocxServerCtrl);
	DDX_Text(pDX, IDC_STATIC_INFO, m_strInfo);
	DDX_Control(pDX, IDC_LIST_REPORT, m_lstReport);
	DDX_Text(pDX, IDC_EDIT_PORT, m_dwPortNum);
	DDV_MinMaxUInt(pDX, m_dwPortNum, 0, 9999);
}

BEGIN_MESSAGE_MAP(CFPCLOCK_SampleDlg, CDialogEx)
	ON_WM_SYSCOMMAND()
	ON_WM_PAINT()
	ON_WM_QUERYDRAGICON()
	ON_BN_CLICKED(IDC_BTN_OPEN_NET, &CFPCLOCK_SampleDlg::OnBnClickedBtnOpenNet)
	ON_BN_CLICKED(IDC_BTN_CLOSE_NET, &CFPCLOCK_SampleDlg::OnBnClickedBtnCloseNet)
	ON_BN_CLICKED(IDC_BTN_CLEAR_LIST, &CFPCLOCK_SampleDlg::OnBnClickedBtnClearList)
	ON_WM_CLOSE()
END_MESSAGE_MAP()


// CFPCLOCK_SampleDlg message handlers

BOOL CFPCLOCK_SampleDlg::OnInitDialog()
{
	CDialogEx::OnInitDialog();

	// Add "About..." menu item to system menu.

	// IDM_ABOUTBOX must be in the system command range.
	ASSERT((IDM_ABOUTBOX & 0xFFF0) == IDM_ABOUTBOX);
	ASSERT(IDM_ABOUTBOX < 0xF000);

	CMenu* pSysMenu = GetSystemMenu(FALSE);
	if (pSysMenu != NULL)
	{
		BOOL bNameValid;
		CString strAboutMenu;
		bNameValid = strAboutMenu.LoadString(IDS_ABOUTBOX);
		ASSERT(bNameValid);
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
	((CWnd*)GetDlgItem(IDC_BTN_CLOSE_NET))->EnableWindow(FALSE);

	DWORD dwStyle = m_lstReport.GetExStyle();
	dwStyle |= LVS_EX_FULLROWSELECT;
	dwStyle |= LVS_EX_GRIDLINES;
	dwStyle &= ~LVS_EX_CHECKBOXES;
	m_lstReport.SetExtendedStyle(dwStyle);

	m_lstReport.InsertColumn(0, _T(""), LVCFMT_LEFT, 40);
	m_lstReport.InsertColumn(1, _T("EnrollNo"), LVCFMT_LEFT, 100 );
	m_lstReport.InsertColumn(2, _T("VerifyMode"), LVCFMT_LEFT, 100);
	m_lstReport.InsertColumn(3, _T("InOut"), LVCFMT_LEFT, 60);
	m_lstReport.InsertColumn(4, _T("DateTime"), LVCFMT_LEFT, 140);
	m_lstReport.InsertColumn(5, _T("IP"), LVCFMT_LEFT, 130);
	m_lstReport.InsertColumn(6, _T("Port"), LVCFMT_LEFT, 60);
	m_lstReport.InsertColumn(7, _T("DevID"), LVCFMT_LEFT, 60);
	m_lstReport.InsertColumn(8, _T("SerialNo"), LVCFMT_LEFT, 60);


	return TRUE;  // return TRUE  unless you set the focus to a control
}

void CFPCLOCK_SampleDlg::OnSysCommand(UINT nID, LPARAM lParam)
{
	if ((nID & 0xFFF0) == IDM_ABOUTBOX)
	{
		CAboutDlg dlgAbout;
		dlgAbout.DoModal();
	}
	else
	{
		CDialogEx::OnSysCommand(nID, lParam);
	}
}

// If you add a minimize button to your dialog, you will need the code below
//  to draw the icon.  For MFC applications using the document/view model,
//  this is automatically done for you by the framework.

void CFPCLOCK_SampleDlg::OnPaint()
{
	if (IsIconic())
	{
		CPaintDC dc(this); // device context for painting

		SendMessage(WM_ICONERASEBKGND, reinterpret_cast<WPARAM>(dc.GetSafeHdc()), 0);

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
		CDialogEx::OnPaint();
	}
}

// The system calls this function to obtain the cursor to display while the user drags
//  the minimized window.
HCURSOR CFPCLOCK_SampleDlg::OnQueryDragIcon()
{
	return static_cast<HCURSOR>(m_hIcon);
}



void CFPCLOCK_SampleDlg::OnBnClickedBtnOpenNet()
{
	UpdateData();

	BOOL bRet;

	bRet = m_ocxServerCtrl.OpenNetwork(m_dwPortNum);
	if (bRet == RUN_SUCCESS)
	{
		((CWnd*)GetDlgItem(IDC_BTN_CLOSE_NET))->EnableWindow(TRUE);

		//((CWnd*)GetDlgItem(IDC_BTN_CLEAR_LIST))->EnableWindow(TRUE);

		((CWnd*)GetDlgItem(IDC_BTN_OPEN_NET))->EnableWindow(FALSE);

		m_bNetOpened = TRUE;
	} 
	else
	{
		m_strInfo = FormatErrorStr(bRet);

	}

	UpdateData(FALSE);
}


void CFPCLOCK_SampleDlg::OnBnClickedBtnCloseNet()
{
	// TODO: Add your control notification handler code here
	if (m_bNetOpened)
	{
		m_ocxServerCtrl.CloseNetwork(m_dwPortNum);
		m_bNetOpened = FALSE;

		((CWnd*)GetDlgItem(IDC_BTN_OPEN_NET))->EnableWindow(TRUE);
		((CWnd*)GetDlgItem(IDC_BTN_CLOSE_NET))->EnableWindow(FALSE);
		//((CWnd*)GetDlgItem(IDC_BTN_CLEAR_LIST))->EnableWindow(FALSE);

		m_dwListIndex = 0;

	}

}


void CFPCLOCK_SampleDlg::OnBnClickedBtnClearList()
{
	// TODO: Add your control notification handler code here
	m_lstReport.DeleteAllItems();
	m_dwListIndex = 0;

}


BOOL CFPCLOCK_SampleDlg::OnCommand(WPARAM wParam, LPARAM lParam)
{
	// TODO: Add your specialized code here and/or call the base class

	TRACE(_T("WPARAM %08x LPARAM %08x\n"), wParam, lParam);

	
	return CDialogEx::OnCommand(wParam, lParam);
}
BEGIN_EVENTSINK_MAP(CFPCLOCK_SampleDlg, CDialogEx)
	ON_EVENT(CFPCLOCK_SampleDlg, IDC_FPCLOCKSVRCTRL1, 1, CFPCLOCK_SampleDlg::OnReceiveGLogDataFpclocksvrctrl1, VTS_BSTR VTS_I4 VTS_I4 VTS_I4 VTS_I4 VTS_I4 VTS_DATE VTS_I4)
END_EVENTSINK_MAP()


void CFPCLOCK_SampleDlg::OnReceiveGLogDataFpclocksvrctrl1(
	LPCTSTR astrDeviceIP, 
	long anDevicePort,
	long vnDeviceID,
	long anSEnrollNumber,
	long anVerifyMode, 
	long anInOutMode,
	DATE anLogDate,
	long linkindex)
{
	// TODO: Add your message handler code here

	TRACE(_T("%d\n"), m_dwListIndex);

	m_lstReport.SetFocus();

	strTemp.Format(_T("%d"), m_dwListIndex+1);
	int nRow = m_lstReport.InsertItem(m_dwListIndex, strTemp);

	strTemp.Format(_T("%08d"), anSEnrollNumber);
	m_lstReport.SetItemText(nRow, 1, strTemp);

	strTemp.Format(_T("%S"), FormVerifyStr( anVerifyMode, anSEnrollNumber));
	m_lstReport.SetItemText(nRow, 2, strTemp);

	if (anInOutMode == 1)  //LOG_IOMODE_OUT
	{
		strTemp = _T("OUT");
	}
	else if (0 == anInOutMode )  //LOG_IOMODE_IN
	{
		strTemp = _T("IN");

	}
	else 
		/*
		LOG_IOMODE_OVER_IN = 2
		LOG_IOMODE_OVER_OUT = 3
		*/
	{
		strTemp = _T("--");
	}

	m_lstReport.SetItemText(nRow, 3, strTemp);

	oleTime = anLogDate;
	strTemp.Format(_T("%d/%d/%d %d:%d:%d"),
		oleTime.GetYear(),
		oleTime.GetMonth(),
		oleTime.GetDay(),
		oleTime.GetHour(),
		oleTime.GetMinute(),
		oleTime.GetSecond());
	m_lstReport.SetItemText(nRow, 4, strTemp);


	m_lstReport.SetItemText(nRow, 5, astrDeviceIP);


	strTemp.Format(_T("%04d"), anDevicePort);
	m_lstReport.SetItemText(nRow, 6, strTemp);

	strTemp.Format(_T("%d"), vnDeviceID);
	m_lstReport.SetItemText(nRow, 7, strTemp);

	strTemp.Format(_T("%d"), linkindex);
	m_lstReport.SetItemText(nRow, 8, strTemp);

	m_lstReport.EnsureVisible(m_dwListIndex, FALSE);
	//m_lstReport.SetItemState(m_dwListIndex, 0, LVIS_SELECTED);
	//m_lstReport.SetFocus();

	m_dwListIndex++;

	long dwResult = 1;

	m_ocxServerCtrl.SendResultandTime(linkindex, vnDeviceID, anSEnrollNumber, dwResult);

}


//form information string 
LPCSTR FormVerifyStr(int dwVerify, long dwEnrollNum)
{
	//CString strTemp;
	int nAction = dwVerify % 8;


	if (dwEnrollNum == 0)   //
	{
		switch (nAction)
		{
		case 0:
			return "Closed";
			break;

		case 1:
			return "Opened";
			break;

		case 2:
			return "HandOpen";
			break;

		case 3:
			return "ProcOpen";
			break;

		case 4:
			return "ProcClose";
			break;

		case 5:
			return "IllegalOpen";
			break;

		case 6:
			return "IlleagalRemove";
			break;

		case 7:
			return "Alarm";
			break;

		case 8:
			return "--";
			break;
		}

	}
	else
	{
		switch (nAction)
		{
		case 0:
			return "Normal";
			break;

		case 1:
			return "f1";
			break;

		case 2:
			return "f2";
			break;

		case 3:
			return "f3";
			break;

		case 4:
			return "f4";
			break;

		case 5:
			return "in";
			break;

		case 6:
			return "out";
			break;

		case 7:
			return "--";
			break;
		}

	}

	return "not my fault...";


}

void CFPCLOCK_SampleDlg::OnClose()
{
	// TODO: Add your message handler code here and/or call default
	if (m_bNetOpened)
	{
		m_ocxServerCtrl.CloseNetwork(m_dwPortNum);
	}
	CDialogEx::OnClose();
}
