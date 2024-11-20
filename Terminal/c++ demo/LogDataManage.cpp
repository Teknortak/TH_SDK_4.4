// LogDataManage.cpp : implementation file
//

#include "stdafx.h"
#include "OEMClient.h"
#include "LogDataManage.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CLogDataManage dialog


CLogDataManage::CLogDataManage(CWnd* pParent /*=NULL*/)
	: CDialog(CLogDataManage::IDD, pParent)
{
	//{{AFX_DATA_INIT(CLogDataManage)
	m_strInfo = _T("");
	m_parentwnd = pParent;
	m_pOCXObj = NULL;
	m_dwMechineID = 0;
	m_bReadMaskCheck = TRUE;
	//}}AFX_DATA_INIT
}


void CLogDataManage::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CLogDataManage)
	DDX_Control(pDX, IDC_LIST_REPORT, m_listCtrl);
	DDX_Text(pDX, IDC_STATIC_LOG_DATA_INFO, m_strInfo);
	DDX_Check(pDX, IDC_CHECK_READ_MASK, m_bReadMaskCheck);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CLogDataManage, CDialog)
	//{{AFX_MSG_MAP(CLogDataManage)
	ON_WM_CLOSE()
	ON_WM_SHOWWINDOW()
	ON_BN_CLICKED(IDC_BTN_RD_SLOG, OnBtnRdSlog)
	ON_BN_CLICKED(IDC_BTN_RD_ALL_SLOG, OnBtnRdAllSlog)
	ON_BN_CLICKED(IDC_BTN_EMPTY_SLOG, OnBtnEmptySlog)
	ON_BN_CLICKED(IDC_BTN_UDRD_SLOG, OnBtnUdrdSlog)
	ON_BN_CLICKED(IDC_BTN_UDRD_GLOG, OnBtnUdrdGlog)
	ON_BN_CLICKED(IDC_BTN_RD_GLOG, OnBtnRdGlog)
	ON_BN_CLICKED(IDC_BTN_EMPTY_GLOG, OnBtnEmptyGlog)
	ON_BN_CLICKED(IDC_BTN_RD_ALL_GLOG, OnBtnRdAllGlog)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CLogDataManage message handlers

void CLogDataManage::PostNcDestroy() 
{
	// TODO: Add your specialized code here and/or call the base class
	delete this;

	CDialog::PostNcDestroy();
}

void CLogDataManage::OnClose() 
{
	// TODO: Add your message handler code here and/or call default
	
	Reinit();

	CDialog::OnClose();
}

void CLogDataManage::OnShowWindow(BOOL bShow, UINT nStatus) 
{
	CDialog::OnShowWindow(bShow, nStatus);

	if (bShow)
	{
		m_pOCXObj = (CFp_clockctrl1*)::SendMessage(m_parentwnd->m_hWnd, WM_GET_OCXOBJ_MSG, 0, (LPARAM)&m_dwMechineID);
	
	}
	// TODO: Add your message handler code here
	
}

void CLogDataManage::OnOK() 
{
	// TODO: Add extra validation here
	Reinit();
	

	CDialog::OnOK();
}

void CLogDataManage::OnBtnRdSlog() 
{
	// TODO: Add your control notification handler code here
	//clear
	int i = 0;
	BOOL bRet;
	do 
	{
		bRet = m_listCtrl.DeleteColumn( i );

	} while (bRet);

	m_listCtrl.DeleteAllItems();

	m_vctSuperLogDat.clear();

	UpdateData();
	
	m_pOCXObj->SetReadMark( m_bReadMaskCheck );

	m_strInfo = "Working...";
	UpdateData(FALSE);
	
	bRet = m_pOCXObj->EnableDevice( m_dwMechineID, FALSE );
	if ( !bRet )
	{
		m_strInfo = STR_NO_DEVICE;
		UpdateData(FALSE);
		
		return;
	}

	//call before GetSuperLogData()
	bRet = m_pOCXObj->ReadSuperLogData(m_dwMechineID);
	if (!bRet)
	{
		long dwErrorValue;
		
		m_pOCXObj->GetLastError(&dwErrorValue);
		m_strInfo = ErrorStr(dwErrorValue);
		
		m_pOCXObj->EnableDevice( m_dwMechineID, TRUE );

		UpdateData(FALSE);
		return;
	}

	TSuperLogInfo tSLogInfo;

	do 
	{
		bRet = m_pOCXObj->GetSuperLogData(
			m_dwMechineID,
			&tSLogInfo.dwTMachineNumber,
			&tSLogInfo.dwSEnrollNumber,
			&tSLogInfo.dwSEMachineNumber,
			&tSLogInfo.dwGEnrollNumber,
			&tSLogInfo.dwGEMachineNumber,
			&tSLogInfo.dwManipulation,
			&tSLogInfo.dwFingerNumber, //Backup Number
			&tSLogInfo.dwYear,
			&tSLogInfo.dwMonth,
			&tSLogInfo.dwDay,
			&tSLogInfo.dwHour,
			&tSLogInfo.dwMinute
		);
	
		if (bRet)
		{
			m_vctSuperLogDat.push_back( tSLogInfo );
		}
	} while (bRet);



	m_listCtrl.InsertColumn(0, _T("   "), LVCFMT_CENTER, 40 );
	m_listCtrl.InsertColumn(1, _T("TMNo"), LVCFMT_CENTER, 50 );
	m_listCtrl.InsertColumn(2, _T("SEnlNo"), LVCFMT_CENTER, 100);
	m_listCtrl.InsertColumn(3, _T("SMNo"), LVCFMT_CENTER, 50);
	m_listCtrl.InsertColumn(4, _T("GEnlNo"), LVCFMT_CENTER, 100);
	m_listCtrl.InsertColumn(5, _T("GMNo"), LVCFMT_CENTER, 50);
	m_listCtrl.InsertColumn(6, _T("Manipulation"), LVCFMT_CENTER, 190);
	m_listCtrl.InsertColumn(7, _T("FpNo"), LVCFMT_CENTER, 40);
	m_listCtrl.InsertColumn(8, _T("DateTime"), LVCFMT_CENTER, 130);


	vector<TSuperLogInfo>::iterator iter = m_vctSuperLogDat.begin();

	TCHAR szIndex[20]={0};
	int nRow;
	CString strTemp;
	int nIndex;

	for (nIndex = 0; iter < m_vctSuperLogDat.end(); nIndex++)
	{
		
		_stprintf(szIndex, _T("%d"), nIndex + 1);
		nRow = m_listCtrl.InsertItem(nIndex, szIndex);

		strTemp.Format(_T("%d"), iter->dwTMachineNumber);
		m_listCtrl.SetItemText( nRow, 1, strTemp);

		strTemp.Format(_T("%08d"), iter->dwSEnrollNumber);
		m_listCtrl.SetItemText( nRow, 2, strTemp);

		strTemp.Format(_T("%d"), iter->dwSEMachineNumber);
		m_listCtrl.SetItemText( nRow, 3, strTemp);

		strTemp.Format(_T("%08d"), iter->dwGEnrollNumber);
		m_listCtrl.SetItemText( nRow, 4, strTemp);

		strTemp.Format(_T("%d"), iter->dwGEMachineNumber);
		m_listCtrl.SetItemText( nRow, 5, strTemp);

		strTemp.Format(_T("%d--%s"), iter->dwManipulation, FormManipulationStr(iter->dwManipulation));
		m_listCtrl.SetItemText( nRow, 6, strTemp);

		if ( iter->dwFingerNumber < 10)
		{
			strTemp.Format(_T("%d"), iter->dwFingerNumber);
		}
		else if ( iter->dwFingerNumber == 10 )
		{
			strTemp.Format(_T("%s"), ("Password"));
		}
		else
		{
			strTemp.Format(_T("%s"), _T("Card"));

		}

		m_listCtrl.SetItemText( nRow, 7, strTemp);

		strTemp.Format(
			_T("%d/%d/%d  %d:%d"), 
			iter->dwYear,
			iter->dwMonth,
			iter->dwDay, 				
			iter->dwHour, 
			iter->dwMinute);
		
		m_listCtrl.SetItemText( nRow, 8, strTemp);


		iter++;

	}

	strTemp.Format(_T("Total Read: %d"), nIndex);

	((CWnd*)GetDlgItem(IDC_STATIC_INFO))->SetWindowText( strTemp );

	m_strInfo = STR_SUCCESS;
	UpdateData(FALSE);

	m_pOCXObj->EnableDevice( m_dwMechineID, TRUE );

}

void CLogDataManage::OnBtnRdAllSlog() 
{
	// TODO: Add your control notification handler code here
		//clear
	int i = 0;
	BOOL bRet;
	do 
	{
		bRet = m_listCtrl.DeleteColumn( i );

	} while (bRet);

	m_listCtrl.DeleteAllItems();

	m_vctSuperLogDat.clear();

	UpdateData();
	
	m_pOCXObj->SetReadMark( m_bReadMaskCheck );

	m_strInfo = "Working...";
	UpdateData(FALSE);
	
	bRet = m_pOCXObj->EnableDevice( m_dwMechineID, FALSE );
	if ( !bRet )
	{
		m_strInfo = STR_NO_DEVICE;
		UpdateData(FALSE);
		
		return;
	}

	//call before GetAllSLogData()
	bRet = m_pOCXObj->ReadAllSLogData(m_dwMechineID);
	if (!bRet)
	{
		long dwErrorValue;
		
		m_pOCXObj->GetLastError(&dwErrorValue);
		m_strInfo = ErrorStr(dwErrorValue);
		
		m_pOCXObj->EnableDevice( m_dwMechineID, TRUE );

		UpdateData(FALSE);
		return;
	}

	TSuperLogInfo tSLogInfo;

	do 
	{
		bRet = m_pOCXObj->GetAllSLogData(
			m_dwMechineID,
			&tSLogInfo.dwTMachineNumber,
			&tSLogInfo.dwSEnrollNumber,
			&tSLogInfo.dwSEMachineNumber,
			&tSLogInfo.dwGEnrollNumber,
			&tSLogInfo.dwGEMachineNumber,
			&tSLogInfo.dwManipulation,
			&tSLogInfo.dwFingerNumber, //Backup Number
			&tSLogInfo.dwYear,
			&tSLogInfo.dwMonth,
			&tSLogInfo.dwDay,
			&tSLogInfo.dwHour,
			&tSLogInfo.dwMinute
		);
	
		if (bRet)
		{
			m_vctSuperLogDat.push_back( tSLogInfo );
		}
	} while (bRet);



	m_listCtrl.InsertColumn(0, _T("   "), LVCFMT_CENTER, 40 );
	m_listCtrl.InsertColumn(1, _T("TMNo"), LVCFMT_CENTER, 50 );
	m_listCtrl.InsertColumn(2, _T("SEnlNo"), LVCFMT_CENTER, 100);
	m_listCtrl.InsertColumn(3, _T("SMNo"), LVCFMT_CENTER, 90);
	m_listCtrl.InsertColumn(4, _T("GEnlNo"), LVCFMT_CENTER, 100);
	m_listCtrl.InsertColumn(5, _T("GMNo"), LVCFMT_CENTER, 50);
	m_listCtrl.InsertColumn(6, _T("Manipulation"), LVCFMT_CENTER, 190);
	m_listCtrl.InsertColumn(7, _T("FpNo"), LVCFMT_CENTER, 40);
	m_listCtrl.InsertColumn(8, _T("DateTime"), LVCFMT_CENTER, 130);


	vector<TSuperLogInfo>::iterator iter = m_vctSuperLogDat.begin();

	TCHAR szIndex[20]={0};
	int nRow;
	CString strTemp;
	int nIndex = 0;

	for ( nIndex = 0; iter < m_vctSuperLogDat.end(); nIndex++)
	{
		
		_stprintf(szIndex, _T("%d"), nIndex + 1);
		nRow = m_listCtrl.InsertItem(nIndex, szIndex);

		strTemp.Format(_T("%d"), iter->dwTMachineNumber);
		m_listCtrl.SetItemText( nRow, 1, strTemp);

		strTemp.Format(_T("%08d"), iter->dwSEnrollNumber);
		m_listCtrl.SetItemText( nRow, 2, strTemp);

		strTemp.Format(_T("%d"), iter->dwSEMachineNumber);
		m_listCtrl.SetItemText( nRow, 3, strTemp);

		strTemp.Format(_T("%08d"), iter->dwGEnrollNumber);
		m_listCtrl.SetItemText( nRow, 4, strTemp);

		strTemp.Format(_T("%d"), iter->dwGEMachineNumber);
		m_listCtrl.SetItemText( nRow, 5, strTemp);

		strTemp.Format(_T("%d--%s"), iter->dwManipulation, FormManipulationStr(iter->dwManipulation));
		m_listCtrl.SetItemText( nRow, 6, strTemp);

		if ( iter->dwFingerNumber < 10)
		{
			strTemp.Format(_T("%d"), iter->dwFingerNumber);
		}
		else if ( iter->dwFingerNumber == 10 )
		{
			strTemp.Format(_T("%s"), _T("Password"));
		}
		else
		{
			strTemp.Format(_T("%s"), _T("Card"));

		}

		m_listCtrl.SetItemText( nRow, 7, strTemp);

		strTemp.Format(
			_T("%d/%d/%d  %d:%d"),
			iter->dwYear,
			iter->dwMonth,
			iter->dwDay, 				
			iter->dwHour, 
			iter->dwMinute);
		
		m_listCtrl.SetItemText( nRow, 8, strTemp);


		iter++;

	}

	strTemp.Format(_T("Total Read: %d"), nIndex);

	((CWnd*)GetDlgItem(IDC_STATIC_INFO))->SetWindowText( strTemp );

	m_strInfo = STR_SUCCESS;
	UpdateData(FALSE);

	m_pOCXObj->EnableDevice( m_dwMechineID, TRUE );
}

void CLogDataManage::OnBtnEmptySlog() 
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
	
	bRet =m_pOCXObj->EmptySuperLogData( m_dwMechineID );
	
	if (bRet)
	{
		
		m_strInfo ="EmptySuperLogData OK";		
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

void CLogDataManage::OnBtnUdrdSlog() 
{
	// TODO: Add your control notification handler code here



}

void CLogDataManage::OnBtnUdrdGlog() 
{
	// clean
	int i = 0;
	BOOL bRet;
	do
	{
		bRet = m_listCtrl.DeleteColumn(i);

	} while (bRet);

	m_listCtrl.DeleteAllItems();


	UpdateData();

	//get file path
	CString strFilePath;

	CEnrollManage::OpenFileOrSaveFileReturnPath(TRUE, &strFilePath);

	bRet =m_pOCXObj->USBReadGeneralLogData(strFilePath.GetBuffer());
	if (!bRet)
	{
		long dwErrorValue;

		m_pOCXObj->GetLastError(&dwErrorValue);
		m_strInfo = ErrorStr(dwErrorValue);
		
		UpdateData(FALSE);
		return;
	}

	strFilePath.ReleaseBuffer();

	TGeneralLogInfo tGLogInfo;
	m_vctGLogDat.clear();

	do
	{
		bRet = m_pOCXObj->GetAllGLogData(
			m_dwMechineID,
			&tGLogInfo.dwTMachineNumber,
			&tGLogInfo.dwEnrollNumber,
			&tGLogInfo.dwEMachineNumber,
			&tGLogInfo.dwVerifyMode,
			&tGLogInfo.dwYear,
			&tGLogInfo.dwMonth,
			&tGLogInfo.dwDay,
			&tGLogInfo.dwHour,
			&tGLogInfo.dwMinute
			);

		if (bRet)
		{
			m_vctGLogDat.push_back(tGLogInfo);
		}
	} while (bRet);


	m_listCtrl.InsertColumn(0, _T("   "), LVCFMT_CENTER, 40);
	m_listCtrl.InsertColumn(1, _T("TMchNo"), LVCFMT_CENTER, 90);
	m_listCtrl.InsertColumn(2, _T("EnrollNo"), LVCFMT_CENTER, 100);
	m_listCtrl.InsertColumn(3, _T("EMchNo"), LVCFMT_CENTER, 90);
	m_listCtrl.InsertColumn(4, _T("InOut"), LVCFMT_CENTER, 50);
	m_listCtrl.InsertColumn(5, _T("VeriMode"), LVCFMT_CENTER, 130);
	m_listCtrl.InsertColumn(6, _T("DateTime"), LVCFMT_CENTER, 130);

	vector<TGeneralLogInfo>::iterator iter = m_vctGLogDat.begin();

	TCHAR szIndex[20] = { 0 };
	int nRow;
	CString strTemp;

	i = 0;

	for (i = 0; iter < m_vctGLogDat.end(); i++)
	{

		_stprintf(szIndex, _T("%d"), i + 1);
		nRow = m_listCtrl.InsertItem(i, szIndex);

		strTemp.Format(_T("%d"), iter->dwTMachineNumber);
		m_listCtrl.SetItemText(nRow, 1, strTemp);

		strTemp.Format(_T("%08d"), iter->dwEnrollNumber);
		m_listCtrl.SetItemText(nRow, 2, strTemp);

		strTemp.Format(_T("%d"), iter->dwEMachineNumber);
		m_listCtrl.SetItemText(nRow, 3, strTemp);

		strTemp.Format(_T("%d"), iter->dwVerifyMode / 8);
		m_listCtrl.SetItemText(nRow, 4, strTemp);


		strTemp.Format(_T("%d/%s"), iter->dwVerifyMode, FormVerifyStr(iter->dwVerifyMode, iter));

		m_listCtrl.SetItemText(nRow, 5, strTemp);

		strTemp.Format(
			_T("%d/%d/%d  %d:%d"),
			iter->dwYear,
			iter->dwMonth,
			iter->dwDay,
			iter->dwHour,
			iter->dwMinute);

		m_listCtrl.SetItemText(nRow, 6, strTemp);


		iter++;

	}

	strTemp.Format(_T("Total Read: %d"), i);

	((CWnd*)GetDlgItem(IDC_STATIC_INFO))->SetWindowText(strTemp);

	m_strInfo = STR_SUCCESS;
	UpdateData(FALSE);

	m_pOCXObj->EnableDevice(m_dwMechineID, TRUE);

}

//read attendance record
void CLogDataManage::OnBtnRdGlog() 
{
	// TODO: Add your control notification handler code here
	//clear
	int nIndex = 0;
	BOOL bRet;
	do 
	{
		bRet = m_listCtrl.DeleteColumn( nIndex );
		
	} while (bRet);

	m_listCtrl.DeleteAllItems();
	m_vctGLogDat.clear();

	UpdateData();
	
	m_pOCXObj->SetReadMark( m_bReadMaskCheck );

	m_strInfo = "Working...";
	UpdateData(FALSE);
	
	bRet = m_pOCXObj->EnableDevice( m_dwMechineID, FALSE );
	if ( !bRet )
	{
		m_strInfo = STR_NO_DEVICE;
		UpdateData(FALSE);
		
		return;
	}

	//call before GetGeneralLogData()
	bRet = m_pOCXObj->ReadGeneralLogData(m_dwMechineID);
	if (!bRet)
	{
		long dwErrorValue;
		
		m_pOCXObj->GetLastError(&dwErrorValue);
		m_strInfo = ErrorStr(dwErrorValue);
		
		m_pOCXObj->EnableDevice( m_dwMechineID, TRUE );

		UpdateData(FALSE);
		return;
	}

	TGeneralLogInfo tGLogInfo;

	do 
	{
		bRet = m_pOCXObj->GetGeneralLogData(
			m_dwMechineID,
			&tGLogInfo.dwTMachineNumber,
			&tGLogInfo.dwEnrollNumber,
			&tGLogInfo.dwEMachineNumber,
			&tGLogInfo.dwVerifyMode,
			&tGLogInfo.dwYear,
			&tGLogInfo.dwMonth,
			&tGLogInfo.dwDay,
			&tGLogInfo.dwHour,
			&tGLogInfo.dwMinute
		);
	
		if (bRet)
		{
			m_vctGLogDat.push_back( tGLogInfo );
		}
	} while (bRet);



	m_listCtrl.InsertColumn(0, _T("   "), LVCFMT_CENTER, 40 );
	m_listCtrl.InsertColumn(1, _T("TMchNo"), LVCFMT_CENTER, 90 );
	m_listCtrl.InsertColumn(2, _T("EnrollNo"), LVCFMT_CENTER, 100);
	m_listCtrl.InsertColumn(3, _T("EMchNo"), LVCFMT_CENTER, 90);
	m_listCtrl.InsertColumn(4, _T("InOut"), LVCFMT_CENTER, 50);
	m_listCtrl.InsertColumn(5, _T("VeriMode"), LVCFMT_CENTER, 130);
	m_listCtrl.InsertColumn(6, _T("DateTime"), LVCFMT_CENTER, 130);

	vector<TGeneralLogInfo>::iterator iter = m_vctGLogDat.begin();

	TCHAR szIndex[20]={0};
	int nRow;
	CString strTemp;
	int i = 0;

	for (i = 0;iter < m_vctGLogDat.end(); i++)
	{
		
		_stprintf(szIndex, _T("%d"), i+1);
		nRow = m_listCtrl.InsertItem(i, szIndex);

		strTemp.Format(_T("%d"), iter->dwTMachineNumber);
		m_listCtrl.SetItemText( nRow, 1, strTemp);

		strTemp.Format(_T("%08d"), iter->dwEnrollNumber);
		m_listCtrl.SetItemText( nRow, 2, strTemp);

		strTemp.Format(_T("%d"), iter->dwEMachineNumber);
		m_listCtrl.SetItemText( nRow, 3, strTemp);

		strTemp.Format(_T("%d"), iter->dwVerifyMode / 8);
 		m_listCtrl.SetItemText( nRow, 4, strTemp);

	
		strTemp.Format(_T("%d/%s"), iter->dwVerifyMode, FormVerifyStr(iter->dwVerifyMode, iter));
		
		m_listCtrl.SetItemText( nRow, 5, strTemp);

		strTemp.Format(
			_T("%d/%d/%d  %d:%d"),
			iter->dwYear,
			iter->dwMonth,
			iter->dwDay, 				
			iter->dwHour, 
			iter->dwMinute);

		m_listCtrl.SetItemText( nRow, 6, strTemp);

		iter++;

	}

	strTemp.Format(_T("Total Read: %d"), i);

	((CWnd*)GetDlgItem(IDC_STATIC_INFO))->SetWindowText( strTemp );

	m_strInfo = STR_SUCCESS;
	UpdateData(FALSE);

	m_pOCXObj->EnableDevice( m_dwMechineID, TRUE );


}

void CLogDataManage::OnBtnEmptyGlog() 
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
	
	bRet =m_pOCXObj->EmptyGeneralLogData( m_dwMechineID );
	
	if (bRet)
	{
		
		m_strInfo ="EmptyGeneralLogData OK";		
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

void CLogDataManage::OnBtnRdAllGlog() 
{
	// TODO: Add your control notification handler code here
	//clear
	int nIndex = 0;
	BOOL bRet;
	do 
	{
		bRet = m_listCtrl.DeleteColumn( nIndex );
		
	} while (bRet);

	m_listCtrl.DeleteAllItems();
	m_vctGLogDat.clear();

	UpdateData();
	
	//m_pOCXObj->SetReadMark( m_bReadMaskCheck );

	m_strInfo = "Working...";
	UpdateData(FALSE);
	
	bRet = m_pOCXObj->EnableDevice( m_dwMechineID, FALSE );
	if ( !bRet )
	{
		m_strInfo = STR_NO_DEVICE;
		UpdateData(FALSE);
		
		return;
	}

	//call before GetGeneralLogData()
	bRet = m_pOCXObj->ReadAllGLogData (m_dwMechineID);
	if (!bRet)
	{
		long dwErrorValue;
		
		m_pOCXObj->GetLastError(&dwErrorValue);
		m_strInfo = ErrorStr(dwErrorValue);
		
		m_pOCXObj->EnableDevice( m_dwMechineID, TRUE );

		UpdateData(FALSE);
		return;
	}

	TGeneralLogInfo tGLogInfo;

	do 
	{
		bRet = m_pOCXObj->GetAllGLogData(
			m_dwMechineID,
			&tGLogInfo.dwTMachineNumber,
			&tGLogInfo.dwEnrollNumber,
			&tGLogInfo.dwEMachineNumber,
			&tGLogInfo.dwVerifyMode,
			&tGLogInfo.dwYear,
			&tGLogInfo.dwMonth,
			&tGLogInfo.dwDay,
			&tGLogInfo.dwHour,
			&tGLogInfo.dwMinute
		);
	
		if (bRet)
		{
			m_vctGLogDat.push_back( tGLogInfo );
		}
	} while (bRet);



	m_listCtrl.InsertColumn(0, _T("   "), LVCFMT_CENTER, 40 );
	m_listCtrl.InsertColumn(1, _T("TMchNo"), LVCFMT_CENTER, 90 );
	m_listCtrl.InsertColumn(2, _T("EnrollNo"), LVCFMT_CENTER, 100);
	m_listCtrl.InsertColumn(3, _T("EMchNo"), LVCFMT_CENTER, 90);
	m_listCtrl.InsertColumn(4, _T("InOut"), LVCFMT_CENTER, 50);
	m_listCtrl.InsertColumn(5, _T("VeriMode"), LVCFMT_CENTER, 130);
	m_listCtrl.InsertColumn(6, _T("DateTime"), LVCFMT_CENTER, 130);

	vector<TGeneralLogInfo>::iterator iter = m_vctGLogDat.begin();

	TCHAR szIndex[20]={0};
	int nRow;
	CString strTemp;
	int i = 0;

	for (i = 0;iter < m_vctGLogDat.end(); i++)
	{
		
		_stprintf(szIndex, _T("%d"), i+1);
		nRow = m_listCtrl.InsertItem(i, szIndex);

		strTemp.Format(_T("%d"), iter->dwTMachineNumber);
		m_listCtrl.SetItemText( nRow, 1, strTemp);

		strTemp.Format(_T("%08d"), iter->dwEnrollNumber);
		m_listCtrl.SetItemText( nRow, 2, strTemp);

		strTemp.Format(_T("%d"), iter->dwEMachineNumber);
		m_listCtrl.SetItemText( nRow, 3, strTemp);

		strTemp.Format(_T("%d"), iter->dwVerifyMode / 8);
		m_listCtrl.SetItemText( nRow, 4, strTemp);
		
		
		strTemp.Format(_T("%d/%s"), iter->dwVerifyMode, FormVerifyStr(iter->dwVerifyMode, iter));
		
		m_listCtrl.SetItemText( nRow, 5, strTemp);
		
		strTemp.Format(
			_T("%d/%d/%d  %d:%d"),
			iter->dwYear,
			iter->dwMonth,
			iter->dwDay, 				
			iter->dwHour, 
			iter->dwMinute);
		
		m_listCtrl.SetItemText( nRow, 6, strTemp);


		iter++;

	}

	strTemp.Format(_T("Total Read: %d"), i);

	((CWnd*)GetDlgItem(IDC_STATIC_INFO))->SetWindowText( strTemp );

	m_strInfo = STR_SUCCESS;
	UpdateData(FALSE);

	m_pOCXObj->EnableDevice( m_dwMechineID, TRUE );

}

BOOL CLogDataManage::OnInitDialog() 
{
	CDialog::OnInitDialog();
	
	// TODO: Add extra initialization here
	DWORD dwStyle = m_listCtrl.GetExStyle();
	dwStyle |= LVS_EX_FULLROWSELECT;
	dwStyle |= LVS_EX_GRIDLINES;
	dwStyle &= ~LVS_EX_CHECKBOXES;

	m_listCtrl.SetExtendedStyle(dwStyle);

	return TRUE;  // return TRUE unless you set the focus to a control
	              // EXCEPTION: OCX Property Pages should return FALSE
}

void CLogDataManage::Reinit()
{

	m_parentwnd->ShowWindow(SW_SHOW);
	
	int nIndex = 0;
	BOOL bRet;
	do 
	{
		bRet = m_listCtrl.DeleteColumn( nIndex );
		
	} while (bRet);

	m_listCtrl.DeleteAllItems();

	((CWnd*)GetDlgItem(IDC_STATIC_INFO))->SetWindowText( _T("Total:"));

	m_strInfo = "";

	UpdateData(FALSE);    
}


//form information string 
LPCTSTR CLogDataManage::FormVerifyStr( int dwVerify, vector<TGeneralLogInfo>::iterator iter)
{
	//CString strTemp;
	int nAction = dwVerify % 8; 


	if (iter->dwEnrollNumber == 0 )   //
	{
		switch( nAction )
		{
		case 0:
			return _T("Closed");
			break;

		case 1:
			return _T("Opened");
			break;

		case 2:
			return _T("HandOpen");
			break;

		case 3:
			return _T("ProcOpen");
			break;

		case 4:
			return _T("ProcClose");
			break;

		case 5:
			return _T("IllegalOpen");
			break;

		case 6:
			return _T("IlleagalRemove");
			break;

		case 7:
			return _T("Alarm");
			break;

		case 8:
			return _T("--");
			break;
		}

	}
	else
	{
		switch( nAction )
		{
		case 0:
			return _T("Normal");
			break;

		case 1:
			return _T("f1");
			break;

		case 2:
			return _T("f2");
			break;

		case 3:
			return _T("f3");
			break;

		case 4:
			return _T("f4");
			break;

		case 5:
			return _T("in");
			break;

		case 6:
			return _T("out");
			break;

		case 7:
			return _T("--");
			break;
		}
	
	}	
	
	return _T("not my fault...");

	
}

LPCTSTR CLogDataManage::FormManipulationStr( int dwIdetify )
{
	switch( dwIdetify )
	{
	case 3:
		return _T("Enroll User");
		break;
		
	case 4:
		return _T("Enroll Manager");
		break;
		
	case 5:
		return _T("Delete Fp Data");
		break;
		
	case 6:
		return _T("Delete Password");
		break;
		
	case 7:
		return _T("Delete All LogData");
		break;
		
	case 8:
		return _T("Delete Card Data");
		break;
		
	case 9:
		return _T("Modify System Info");
		break;
		
	case 10:
		return _T("Modify System Time");
		break;

	case 11:
		return _T("Modify Log Setting");
		break;

	case 12:
		return _T("Modify Comm Setting");
		break;
		
	default:
		return _T("error");



	}
	
	return _T("not my fault...");
}

