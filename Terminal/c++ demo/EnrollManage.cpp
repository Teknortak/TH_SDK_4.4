// EnrollManage.cpp : implementation file
//

#include "stdafx.h"
#include "OEMClient.h"
#include "EnrollManage.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CEnrollManage dialog
	CDaoDatabase db;				//数据库
	CDaoRecordset RecSet(&db);		//记录集

CEnrollManage::CEnrollManage(CWnd* pParent /*=NULL*/)
	: CDialog(CEnrollManage::IDD, pParent)
{
	//{{AFX_DATA_INIT(CEnrollManage)
	m_strCompanyName = _T("");
	m_strInfo = _T("");
	m_dwEnrollNum = 1;
	m_strEnrollName = _T("");
	m_parentwnd = pParent;
	m_pOCXObj = NULL;
	m_dwMechineID = 0;	
	m_dwCardNum = 0;
	//}}AFX_DATA_INIT
}


void CEnrollManage::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CEnrollManage)
	DDX_Control(pDX, IDC_LIST1, m_listBox);
	DDX_Control(pDX, IDC_CMB_BACKUPNUM, m_cmbBackupNum);
	DDX_Control(pDX, IDC_CMB_PRIVILEGE, m_cmbPrivilege);
	DDX_Control(pDX, IDC_CMB_EM, m_cmbEmList);
	DDX_Text(pDX, IDC_EDIT_COMPANY_NAME, m_strCompanyName);
	DDX_Text(pDX, IDC_STATIC_ENROLL_INFO, m_strInfo);
	DDX_Text(pDX, IDC_EDIT_ENROLL_NUM, m_dwEnrollNum);
	DDV_MinMaxLong(pDX, m_dwEnrollNum, 0, 99999999);
	DDX_Text(pDX, IDC_EDIT_ENROLL_NAME, m_strEnrollName);
	DDX_Text(pDX, IDC_EDIT_CARD_NUM, m_dwCardNum);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CEnrollManage, CDialog)
	//{{AFX_MSG_MAP(CEnrollManage)
	ON_BN_CLICKED(IDC_BTN_SET_NAME, OnBtnSetName)
	ON_BN_CLICKED(IDC_BTN_DEL_NAME, OnBtnDelName)
	ON_WM_CLOSE()
	ON_WM_SHOWWINDOW()
	ON_BN_CLICKED(IDC_BTN_SET_USR_NAME, OnBtnSetUsrName)
	ON_BN_CLICKED(IDC_BTN_GET_USR_NAME, OnBtnGetUsrName)
	ON_BN_CLICKED(IDC_BTN_RM_MANAGER, OnBtnRmManager)
	ON_BN_CLICKED(IDC_BTN_MDF_PRIVILEGE, OnBtnMdfPrivilege)
	ON_BN_CLICKED(IDC_BTN_CLEAR_ALL_DATA, OnBtnClearAllData)
	ON_BN_CLICKED(IDC_BTN_GET_ENROLL_DATA, OnBtnGetEnrollData)
	ON_BN_CLICKED(IDC_BTN_SET_ENROLL_DATA, OnBtnSetEnrollData)
	ON_BN_CLICKED(IDC_BTN_DEL_ENROLL_DATA, OnBtnDelEnrollData)
	ON_BN_CLICKED(IDC_BTN_UD_DOWNLOAD, OnBtnUdDownload)
	ON_BN_CLICKED(IDC_BTN_UD_UPLOAD, OnBtnUdUpload)
	ON_BN_CLICKED(IDC_BTN_EMPTY_ENROLL_DATA, OnBtnEmptyEnrollData)
	ON_BN_CLICKED(IDC_BTN_GET_ENROLL_INFO, OnBtnGetEnrollInfo)
	ON_BN_CLICKED(IDC_BTN_GET_ALL_ENROLL_DATA, OnBtnGetAllEnrollData)
	ON_BN_CLICKED(IDC_BTN_SET_ALL_ENROLL_DATA, OnBtnSetAllEnrollData)
	ON_BN_CLICKED(IDC_BTN_SEND_ALL_ENROLL_DATA, OnBtnSendAllEnrollData)
	ON_BN_CLICKED(IDC_BTN_DELETE_DB_DATA, OnBtnDeleteDbData)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CEnrollManage message handlers

void CEnrollManage::PostNcDestroy() 
{
	// TODO: Add your specialized code here and/or call the base class
	(void) SafeArrayUnaccessData(m_varOleData.parray);

	delete this;

	CDialog::PostNcDestroy();
}

void CEnrollManage::OnClose() 
{
	// TODO: Add your message handler code here and/or call default
	DoClean();
	
	
	CDialog::OnClose();
}

void CEnrollManage::OnShowWindow(BOOL bShow, UINT nStatus) 
{
	CDialog::OnShowWindow(bShow, nStatus);
	
	// TODO: Add your message handler code here
	if (bShow)
	{
		m_pOCXObj = (CFp_clockctrl1*)::SendMessage(m_parentwnd->m_hWnd, WM_GET_OCXOBJ_MSG, 0, (LPARAM)&m_dwMechineID);
	}
	
}

void CEnrollManage::OnOK() 
{
	// TODO: Add extra validation here
	DoClean();
		
	CDialog::OnOK();
}

BOOL CEnrollManage::OnInitDialog() 
{
	CDialog::OnInitDialog();
	
	// TODO: Add extra initialization here
	m_cmbEmList.SetCurSel(0);
	m_cmbPrivilege.SetCurSel(0);

	m_cmbBackupNum.SetCurSel(0);

	InitVariant();

	CString strPath;

	GetModuleFileName(NULL,strPath.GetBufferSetLength (MAX_PATH+1),MAX_PATH);
	strPath.ReleaseBuffer ();

	int nPos;
	nPos=strPath.ReverseFind ('\\');
	m_strDBPath=strPath.Left (nPos);
	
	m_strDBPath = m_strDBPath + "\\EnrollData.mdb";
	
	return TRUE;  // return TRUE unless you set the focus to a control
	              // EXCEPTION: OCX Property Pages should return FALSE
}

void CEnrollManage::OnBtnSetName() 
{
	// TODO: Add your control notification handler code here
	UpdateData();
	
	if( m_strCompanyName.GetLength() == 0 )
	{
		m_strInfo = "Please Input Company Name!";
		UpdateData(FALSE);
		return;
	}
	m_strInfo = "Working...";
	UpdateData(FALSE);
	
	
	BOOL bRet = m_pOCXObj->EnableDevice( m_dwMechineID, FALSE );
	if ( !bRet )
	{
		m_strInfo = STR_NO_DEVICE;
		UpdateData(FALSE);
		
		return;
	}
	
	VARIANT varStr;
	varStr.vt = VT_BSTR;
	varStr.bstrVal = m_strCompanyName.AllocSysString();
	
	bRet = m_pOCXObj->SetCompanyName( 
		m_dwMechineID, 
		1,   //set
		&varStr
		);
	if (bRet)
	{
		m_strInfo = "Set Company Name OK";
		SysFreeString(varStr.bstrVal);
		
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

void CEnrollManage::OnBtnDelName() 
{
	// TODO: Add your control notification handler code here
	UpdateData();
	
	m_strInfo = "Working...";
	UpdateData(FALSE);
	
	BOOL bRet = m_pOCXObj->EnableDevice( m_dwMechineID, FALSE );
	if ( !bRet )
	{
		m_strInfo = STR_NO_DEVICE;
		UpdateData(FALSE);
		
		return;
	}
	
	VARIANT varStr;
	varStr.vt = VT_BSTR;
	//varStr.bstrVal = m_strCompanyName.AllocSysString();
	varStr.bstrVal = NULL;
	
	
	bRet = m_pOCXObj->SetCompanyName( 
		m_dwMechineID, 
		0,   //del
		&varStr
		);
	if (bRet)
	{
		m_strInfo = "Del Company Name OK";
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

void CEnrollManage::OnBtnSetUsrName() 
{
	// TODO: Add your control notification handler code here
	UpdateData();

	m_strInfo = "Working...";
	UpdateData(FALSE);
	
	BOOL bRet = m_pOCXObj->EnableDevice( m_dwMechineID, FALSE );
	if ( !bRet )
	{
		m_strInfo = STR_NO_DEVICE;
		UpdateData(FALSE);
		
		return;
	}

	int dwEnMachineID = m_cmbEmList.GetCurSel();
	dwEnMachineID++;

	VARIANT vrName;
	vrName.vt = VT_BSTR;
	if(m_strEnrollName.GetLength() != 0)
	{
		vrName.bstrVal = m_strEnrollName.AllocSysString();
	}
	else
	{
		vrName.bstrVal = NULL;
	}


	bRet = m_pOCXObj->SetUserName( 
		0,  //kind
		m_dwMechineID,
		m_dwEnrollNum,
		dwEnMachineID,
		&vrName
		);
	
	if (bRet)
	{
		m_strInfo = "SetUserName OK";

		if ( vrName.bstrVal )
		{
			SysFreeString(vrName.bstrVal);
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

void CEnrollManage::OnBtnGetUsrName() 
{
	// TODO: Add your control notification handler code here
	UpdateData();
	
	m_strInfo = "Working...";
	UpdateData(FALSE);
	
	BOOL bRet = m_pOCXObj->EnableDevice( m_dwMechineID, FALSE );
	if ( !bRet )
	{
		m_strInfo = STR_NO_DEVICE;
		UpdateData(FALSE);
		
		return;
	}
	
	int dwEnMachineID;
	dwEnMachineID = m_cmbEmList.GetCurSel();
	dwEnMachineID++;

	VARIANT vrName;
	
	bRet = m_pOCXObj->GetUserName( 
		0,  //kind
		m_dwMechineID,
		m_dwEnrollNum,
		dwEnMachineID,
		&vrName
		);
	
	if (bRet)
	{
		m_strInfo = STR_SUCCESS;

		m_strEnrollName = vrName.bstrVal;
	}
	else
	{
		//error
		long dwErrorValue;
		
		m_pOCXObj->GetLastError(&dwErrorValue);
		m_strInfo = ErrorStr(dwErrorValue);

		//return;
	}	
	

	UpdateData(FALSE);
	
	m_pOCXObj->EnableDevice( m_dwMechineID, TRUE );

}

void CEnrollManage::OnBtnRmManager() 
{
	// TODO: Add your control notification handler code here
	UpdateData();
	
	m_strInfo = "Working...";
	UpdateData(FALSE);
	
	BOOL bRet = m_pOCXObj->EnableDevice( m_dwMechineID, FALSE );
	if ( !bRet )
	{
		m_strInfo = STR_NO_DEVICE;
		UpdateData(FALSE);
		
		return;
	}
	bRet = m_pOCXObj->BenumbAllManager( m_dwMechineID );

	if (bRet)
	{
		m_strInfo = STR_SUCCESS;
	}
	else
	{
		//error
		long dwErrorValue;
		
		m_pOCXObj->GetLastError(&dwErrorValue);
		m_strInfo = ErrorStr(dwErrorValue);
		
		//return;
	}


	UpdateData(FALSE);

	m_pOCXObj->EnableDevice( m_dwMechineID, TRUE );


}

void CEnrollManage::OnBtnMdfPrivilege() 
{
	// TODO: Add your control notification handler code here
	UpdateData();
	
	m_strInfo = "Working...";
	UpdateData(FALSE);
	
	BOOL bRet = m_pOCXObj->EnableDevice( m_dwMechineID, FALSE );
	if ( !bRet )
	{
		m_strInfo = STR_NO_DEVICE;
		UpdateData(FALSE);
		
		return;
	}

	int dwEnMachineID;
	dwEnMachineID = m_cmbEmList.GetCurSel();
	dwEnMachineID++;

	int dwPrivilegeNum;
	dwPrivilegeNum = m_cmbPrivilege.GetCurSel();

	int dwBackupNum = m_cmbBackupNum.GetCurSel();	

	bRet = m_pOCXObj->ModifyPrivilege( 
		m_dwMechineID, 
		m_dwEnrollNum,
		dwEnMachineID,
		dwBackupNum,	//vFingerNumber
		dwPrivilegeNum
		);
	
	if (bRet)
	{
		m_strInfo = STR_SUCCESS;
	}
	else
	{
		//error
		long dwErrorValue;
				
		m_pOCXObj->GetLastError(&dwErrorValue);
		m_strInfo = ErrorStr(dwErrorValue);
		
		//return;
	}
	
	
	UpdateData(FALSE);
	
	m_pOCXObj->EnableDevice( m_dwMechineID, TRUE );
}



void CEnrollManage::OnBtnClearAllData() 
{
	// TODO: Add your control notification handler code here
	
	m_strInfo = "Working...";
	UpdateData(FALSE);
	
	int nRet = MessageBox(_T("Clear all data on the machine?!!"), _T("Warning"), MB_YESNO | MB_ICONEXCLAMATION);

	if (nRet != IDYES)
	{
		m_strInfo = _T("");
		UpdateData(FALSE);
		return;
	}

	BOOL bRet = m_pOCXObj->EnableDevice( m_dwMechineID, FALSE );
	if ( !bRet )
	{
		m_strInfo = STR_NO_DEVICE;
		UpdateData(FALSE);
		
		return;
	}

	bRet = m_pOCXObj->ClearKeeperData( m_dwMechineID );
	
	if (bRet)
	{
		m_strInfo = STR_SUCCESS;
	}
	else
	{
		//error
		m_strInfo = "error";
		//UpdateData(FALSE);
		
		//return;
	}
	
	
	UpdateData(FALSE);
	
	m_pOCXObj->EnableDevice( m_dwMechineID, TRUE );
}

//
void CEnrollManage::OnBtnGetEnrollData() 
{
	// TODO: Add your control notification handler code here
	UpdateData();

	m_listBox.ResetContent();

	m_strInfo = "Working...";
	UpdateData(FALSE);
	
	BOOL bRet = m_pOCXObj->EnableDevice( m_dwMechineID, FALSE );
	if ( !bRet )
	{
		m_strInfo = STR_NO_DEVICE;
		UpdateData(FALSE);
		
		return;
	}

	int dwEnMachineID;
	dwEnMachineID = m_cmbEmList.GetCurSel();
	dwEnMachineID++;

	int dwBackupNum = m_cmbBackupNum.GetCurSel();	

	long dwPrivilegeNum;
// 	dwPrivilegeNum = m_cmbPrivilege.GetCurSel();

	ULONG dwData[FP_DATA_LENGHT/4] = {0};

	VARIANT vrBufferPtr;
	vrBufferPtr.vt = VT_I4|VT_BYREF;
	vrBufferPtr.pintVal = (int*)dwData;

	long  ptrPasswordBuffer;
	CString strTemp;

	bRet = m_pOCXObj->GetEnrollData(
		m_dwMechineID,
		m_dwEnrollNum,
		dwEnMachineID,
		dwBackupNum,
		&dwPrivilegeNum,
		&vrBufferPtr,
		&ptrPasswordBuffer
		);

	if (bRet)
	{
		m_strInfo = _T("GetEnrollData OK");
		
		m_cmbPrivilege.SetCurSel( dwPrivilegeNum );

		if ( dwBackupNum == 10 )   //password num
		{
			//list add item
			strTemp.Format(_T("%d"), ptrPasswordBuffer);
			m_listBox.AddString(strTemp);
		}
		else if ( dwBackupNum == 11 )  //card data
		{
			//cardnumber
			m_dwCardNum = ptrPasswordBuffer;

			strTemp.Format(_T("%d"), ptrPasswordBuffer);
			m_listBox.AddString(strTemp);
			
			//list
		}
		else
		{
			for ( int i = 0; i < FP_DATA_LENGHT/4; i++ )
			{
				strTemp.Format(_T("%X"), dwData[i]);
				m_listBox.AddString(strTemp);	
			}
			
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

void CEnrollManage::OnBtnSetEnrollData() 
{
	// TODO: Add your control notification handler code here
	UpdateData();
	
	m_listBox.ResetContent();
	
	m_strInfo = "Working...";
	UpdateData(FALSE);
	
	BOOL bRet = m_pOCXObj->EnableDevice( m_dwMechineID, FALSE );
	if ( !bRet )
	{
		m_strInfo = STR_NO_DEVICE;
		UpdateData(FALSE);
		
		return;
	}
	
	int dwEnMachineID;
	dwEnMachineID = m_cmbEmList.GetCurSel();
	dwEnMachineID++;
	
	int dwBackupNum = m_cmbBackupNum.GetCurSel();	

	long dwPrivilegeNum;
	dwPrivilegeNum = m_cmbPrivilege.GetCurSel();
	
	ULONG dwData[FP_DATA_LENGHT/4] = {0};
	
	VARIANT vrBufferPtr;
	vrBufferPtr.vt = VT_I4|VT_BYREF;
	vrBufferPtr.pintVal = (int*)dwData;

	long  ptrPasswordBuffer = 0;
	CString strTemp;

	if (dwBackupNum == 11)  //card 
	{
		if (m_dwCardNum != 0)
		{
			ptrPasswordBuffer = m_dwCardNum;
		}
	}

	if ( dwBackupNum < 11 )
	{
		//not implement fp data set funcion
		return;
	}
	
	bRet = m_pOCXObj->SetEnrollData(
		m_dwMechineID,
		m_dwEnrollNum,
		dwEnMachineID,
		dwBackupNum,
		dwPrivilegeNum,
		&vrBufferPtr,
		ptrPasswordBuffer
		);
	
	if (bRet)
	{
		m_strInfo = "SetEnrollData OK";
		
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

void CEnrollManage::OnBtnDelEnrollData() 
{
	// TODO: Add your control notification handler code here
	UpdateData();

	m_strInfo = "Working...";
	UpdateData(FALSE);
	
	BOOL bRet = m_pOCXObj->EnableDevice( m_dwMechineID, FALSE );
	if ( !bRet )
	{
		m_strInfo = STR_NO_DEVICE;
		UpdateData(FALSE);
		
		return;
	}

	int dwEnMachineID;
	dwEnMachineID = m_cmbEmList.GetCurSel();
	dwEnMachineID++;
	
	int dwBackupNum = m_cmbBackupNum.GetCurSel();	

	bRet =m_pOCXObj->DeleteEnrollData( 
		m_dwMechineID, 
		m_dwEnrollNum,
		dwEnMachineID,
		dwBackupNum
		);
	
	if (bRet)
	{
		
		m_strInfo ="DeleteEnrollData OK";		
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


int CEnrollManage::InitVariant(  )
{	
	SAFEARRAYBOUND bounds[1]; 
	bounds[0].lLbound = 0; 
	bounds[0].cElements = FP_DATA_LENGHT; 
	
	
	m_varOleData.vt = VT_ARRAY | VT_UI1; 
	m_varOleData.parray = SafeArrayCreate(VT_UI1, 1, bounds); 
	if(!m_varOleData.parray) 
	{ 
		m_varOleData.vt = VT_EMPTY; 
		return E_OUTOFMEMORY; 
	} 	
	
	HRESULT hr = SafeArrayAccessData( 
		m_varOleData.parray, reinterpret_cast<void **>(&m_buffer)); 

	if(FAILED(hr)) 
		return hr; 
	//memcpy( buffer, m_SerialData, 256 ); 
	
	
	return S_OK;

}



void CEnrollManage::OnBtnUdDownload() 
{
	// TODO: Add your control notification handler code here
	CString strFilePath;

	OpenFileOrSaveFileReturnPath(TRUE, &strFilePath);
	
	m_strInfo = STR_WORKING;
	UpdateData(FALSE);

	m_pOCXObj->UsbEnrollDataStart();
	
	BOOL bRet = FALSE;
	
	COleVariant oleVarData;
	TUserID tUserIDData;
	
	VARIANT vr;
	VARIANT vrUserName;

	// Open db
	db.Open(m_strDBPath);
	RecSet.Open(AFX_DAO_USE_DEFAULT_TYPE, _T("SELECT * FROM tblEnroll"), NULL);	

	
	while(!RecSet.IsEOF())
	{
		RecSet.GetFieldValue(_T("EMachineNumber"), oleVarData);
		if (oleVarData.vt == VT_I4)
		{
			tUserIDData.dwEMachineNumber = oleVarData.intVal;
		}
		
		RecSet.GetFieldValue(_T("EnrollNumber"), oleVarData);
		if (oleVarData.vt == VT_I4)
		{
			tUserIDData.dwEnrollNumber = oleVarData.intVal;
		}
		
		RecSet.GetFieldValue(_T("FingerNumber"), oleVarData);
		if (oleVarData.vt == VT_I4)
		{
			tUserIDData.dwFingerNumber = oleVarData.intVal;
		}
		
		RecSet.GetFieldValue(_T("Privilige"), oleVarData);
		if (oleVarData.vt == VT_I4)
		{
			tUserIDData.dwPrivilege = oleVarData.intVal;
		}
		
		RecSet.GetFieldValue(_T("Password"), oleVarData);
		if (oleVarData.vt == VT_I4)
		{
			tUserIDData.dwPassword = oleVarData.intVal;
		}

		RecSet.GetFieldValue(_T("EnrollName"), oleVarData);
		if (oleVarData.vt == VT_BSTR)
		{
			bstr_t t = oleVarData.bstrVal;
			TRACE(_T("%d"), t.length());
			
			if(t.length()> 200)
			{
				MessageBox(_T("Enroll Name Error"));

				RecSet.Close();
				db.Close();
				return;
			}
			
			_tcscpy( tUserIDData.szUserName, (LPCTSTR)oleVarData.bstrVal);

			vrUserName.vt = VT_BSTR;
			vrUserName.bstrVal = (BSTR)tUserIDData.szUserName;

	
		}
		
		if(tUserIDData.dwFingerNumber < 10 )
		{
			RecSet.GetFieldValue(_T("FPData"), oleVarData);
			vr.vt = VT_I4|VT_BYREF;
			vr.pintVal = oleVarData.pintVal;
			
		}
		else
		{
			oleVarData.Clear();
		}

		
		bRet = m_pOCXObj->SetUsbEnrollData(
			tUserIDData.dwEnrollNumber,
			tUserIDData.dwFingerNumber,
			tUserIDData.dwPrivilege,
			&vr,
			tUserIDData.dwPrivilege,
			&vrUserName
			);

		if(bRet)
		{
			RecSet.MoveNext();
		}
		else
		{
			RecSet.Close();
			db.Close();
			
			//error
			long dwErrorValue;
			
			m_pOCXObj->GetLastError(&dwErrorValue);
			m_strInfo = ErrorStr(dwErrorValue);
			
			UpdateData(FALSE);
			return;
		}

	}// EOF

	//BSTR bstr = strFilePath.AllocSysString();
	
	CHAR* szChar = new CHAR[MAX_PATH+1];

	int  size = sizeof(szChar);
	ZeroMemory(szChar, MAX_PATH+1);

	size = ::WideCharToMultiByte(
		CP_ACP, NULL, 
		strFilePath, strFilePath.GetLength(),
		NULL, 0, 
		NULL, NULL);  //GET length

	::WideCharToMultiByte(
		CP_ACP, NULL, 
		strFilePath, strFilePath.GetLength(),
		szChar, MAX_PATH, 
		NULL, NULL);

	bRet = m_pOCXObj->EnrollDataSaveTOFile(strFilePath.GetBuffer());

	strFilePath.ReleaseBuffer();

	if (!bRet)
	{
		//error
		long dwErrorValue;
		
		m_pOCXObj->GetLastError(&dwErrorValue);
		m_strInfo = ErrorStr(dwErrorValue);
	}

	else
	{
		m_strInfo = _T("USBWriteAllEnrollDatatoFile OK");
	}

	UpdateData(FALSE);

	delete [] szChar;

	//
	RecSet.Close();
	db.Close();
}

void CEnrollManage::OnBtnUdUpload() 
{
	BOOL bRet;

	CString strFilePath;

	OpenFileOrSaveFileReturnPath(FALSE, &strFilePath);

	m_strInfo = STR_WORKING;
	UpdateData(FALSE);

	m_pOCXObj->UsbEnrollDataStart();

	bRet = m_pOCXObj->EnrollDataReadFromFile( strFilePath.GetBuffer() );
	if (bRet)
	{
		m_strInfo = _T("USB Read All Enroll Data From File OK!");
		
	} 
	else
	{
		//error
		long dwErrorValue;

		m_pOCXObj->GetLastError(&dwErrorValue);
		m_strInfo = ErrorStr(dwErrorValue);
	}

	UpdateData(FALSE);


	//save to DB?
	OnBtnGetAllEnrollData();



}

//CLEAR All finger data
void CEnrollManage::OnBtnEmptyEnrollData() 
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
	
	bRet = m_pOCXObj->EmptyEnrollData(m_dwMechineID);

	if (bRet)
	{
		m_strInfo = STR_SUCCESS;
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

void CEnrollManage::OnBtnGetEnrollInfo() 
{
	// TODO: Add your control notification handler code here
	m_listBox.ResetContent();

	m_strInfo = "Working...";
	UpdateData(FALSE);
	
	BOOL bRet = m_pOCXObj->EnableDevice( m_dwMechineID, FALSE );
	if ( !bRet )
	{
		m_strInfo = STR_NO_DEVICE;
		UpdateData(FALSE);
		
		return;
	}
	
	long dwEnrollNumber;
	long dwMachineNumber;
	long dwBackupNumber;
	long dwUserPrivilege;
	long dwAttendenceEnable;

	bRet = m_pOCXObj->ReadAllUserID(m_dwMechineID);
	
	if (bRet)
	{
		m_strInfo = "ReadAllUserID OK";
		UpdateData(FALSE);
	}
	else
	{
		//error
		long dwErrorValue;
		
		m_pOCXObj->GetLastError(&dwErrorValue);
		m_strInfo = ErrorStr(dwErrorValue);

		UpdateData(FALSE);
		m_pOCXObj->EnableDevice( m_dwMechineID, TRUE );
		return;
	}

	m_listBox.AddString(_T("No.       EnNo       EMNo        Fp       Priv    Enable"));
	CString strTemp;
	int i = 0;
	//BOOL bInsert = FALSE;
	do 
	{
		bRet = m_pOCXObj->GetAllUserID(
			m_dwMechineID,
			&dwEnrollNumber,
			&dwMachineNumber,
			&dwBackupNumber,
			&dwUserPrivilege,
			&dwAttendenceEnable);

		if (bRet)
		{
			//                 No.       EnNo       EMNo        Fp       Priv  Enable      
			strTemp.Format(_T("%03d      %08d       %02d          %02d       %02d     %d"), 
							i+1,
							dwEnrollNumber,
							dwMachineNumber,
							dwBackupNumber,
							dwUserPrivilege,
							dwAttendenceEnable);

			m_listBox.AddString(strTemp);
			i++;
		}
		else
		{
			m_listBox.SetCurSel( i );
		}
		
	} while (bRet);

	
	if ( i > 0 )
	{
		m_strInfo = "GetAllUserID OK";
		UpdateData(FALSE);


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

void CEnrollManage::OnBtnGetAllEnrollData() 
{
	COleVariant varStr;
	CString strDb;	

	// Open db
	db.Open(m_strDBPath);
	RecSet.Open(AFX_DAO_USE_DEFAULT_TYPE, _T("SELECT * FROM tblEnroll"),NULL);


#if 0   //test only
	RecSet.GetFieldValue("EnrollNumber",varStr);
	if (varStr.vt == VT_I4)
	{
		strDb.Format("%08d", varStr.iVal);
	}
	
	RecSet.MoveNext();
	
	RecSet.GetFieldValue("EnrollNumber",varStr);
	if (varStr.vt == VT_I4)
	{
		strDb.Format("%08d", varStr.iVal);
	}
	
	RecSet.Close();
	db.Close();
	
	return;
#endif
	
	

	m_listBox.ResetContent();
	
	m_strInfo = "Working...";
	UpdateData(FALSE);
	
	BOOL bRet = m_pOCXObj->EnableDevice( m_dwMechineID, FALSE );
	if ( !bRet )
	{
		m_strInfo = STR_NO_DEVICE;
		UpdateData(FALSE);
		
		return;
	}

	bRet = m_pOCXObj->ReadAllUserID( m_dwMechineID );
	if (bRet)
	{
		m_strInfo = "ReadAllUserID OK";
		UpdateData(FALSE);

	}
	else
	{
		//error
		long dwErrorValue;
		
		m_pOCXObj->GetLastError(&dwErrorValue);
		m_strInfo = ErrorStr(dwErrorValue);
		
		UpdateData(FALSE);

		m_pOCXObj->EnableDevice( m_dwMechineID, TRUE );

		return;
	}

	//----------for Get Enroll Data--------------
	long  dwPassword;

	ULONG dwData[FP_DATA_LENGHT/4] = {0};
	
	VARIANT vrBufferPtr;
	vrBufferPtr.vt = VT_I4|VT_BYREF;
	vrBufferPtr.pintVal = (int*)dwData;


	//-------------end------------

	TUserID tUserIDData;

	do 
	{
		bRet = m_pOCXObj->GetAllUserID(
			m_dwMechineID,
			&tUserIDData.dwEnrollNumber,
			&tUserIDData.dwEMachineNumber,
			&tUserIDData.dwFingerNumber,
			&tUserIDData.dwPrivilege,
			&tUserIDData.dwEnable);
		
		if (!bRet)
		{
			m_pOCXObj->EnableDevice( m_dwMechineID, TRUE );

			break;  //exit the do...loop
		}

		bRet = m_pOCXObj->GetEnrollData(m_dwMechineID,
			tUserIDData.dwEnrollNumber,
			tUserIDData.dwEMachineNumber,
			tUserIDData.dwFingerNumber,
			&tUserIDData.dwPrivilege,
			&vrBufferPtr,
			&dwPassword);
		if (!bRet)
		{
			long dwErrorValue;
			
			m_pOCXObj->GetLastError(&dwErrorValue);
			m_strInfo = ErrorStr(dwErrorValue);
			
			strDb.Format(_T("%s Continue?"), ErrorStr(dwErrorValue));

			dwErrorValue = MessageBox(strDb, _T("GetEnrollData"), MB_YESNO);

			if (dwErrorValue == IDYES)
			{
				bRet = TRUE;
			}
			else
			{
				m_pOCXObj->EnableDevice( m_dwMechineID, TRUE );

				return;
			}

		}
		else
		{
			RecSet.AddNew();
			RecSet.SetFieldValue(_T("EMachineNumber"), tUserIDData.dwEMachineNumber);
			RecSet.SetFieldValue(_T("EnrollNumber"), tUserIDData.dwEnrollNumber);
			RecSet.SetFieldValue(_T("FingerNumber"), tUserIDData.dwFingerNumber);
			RecSet.SetFieldValue(_T("Privilige"), tUserIDData.dwPrivilege);
			if (tUserIDData.dwFingerNumber == 10 ||
				tUserIDData.dwFingerNumber == 11)
			{
				RecSet.SetFieldValue(_T("Password"), dwPassword);
			}
			else
			{
				//store FPdata	
				
				memcpy( m_buffer, dwData, FP_DATA_LENGHT ); 
				
				try
				{
					RecSet.SetFieldValue(_T("FPData"), m_varOleData);
				}								
				catch (...)
				{
					RecSet.Close();
					db.Close();
					TRACE(_T("error\n "));
				}
				//RecSet.SetFieldValue("FPData", )
			}
			
			RecSet.Update();

		}


	} while (bRet);


	m_strInfo = "Saved all Enroll Data to database...";
	UpdateData(FALSE);
	
	m_pOCXObj->EnableDevice( m_dwMechineID, TRUE );


	//
	RecSet.Close();
	db.Close();

}

void CEnrollManage::OnBtnSetAllEnrollData() 
{
	CString strTemp;

	BOOL bRet = FALSE;

	COleVariant oleVarData;
	TUserID tUserIDData;

	VARIANT vr;

	// Open db
	db.Open(m_strDBPath);
	RecSet.Open(AFX_DAO_USE_DEFAULT_TYPE, _T("SELECT * FROM tblEnroll"), NULL);

	int nCount = RecSet.GetFieldCount();

	while(!RecSet.IsEOF())
	{
		RecSet.GetFieldValue(_T("EMachineNumber"), oleVarData);
		if (oleVarData.vt == VT_I4)
		{
			tUserIDData.dwEMachineNumber = oleVarData.intVal;
		}

		RecSet.GetFieldValue(_T("EnrollNumber"), oleVarData);
		if (oleVarData.vt == VT_I4)
		{
			tUserIDData.dwEnrollNumber = oleVarData.intVal;
		}

		RecSet.GetFieldValue(_T("FingerNumber"), oleVarData);
		if (oleVarData.vt == VT_I4)
		{
			tUserIDData.dwFingerNumber = oleVarData.intVal;
		}

		RecSet.GetFieldValue(_T("Privilige"), oleVarData);
		if (oleVarData.vt == VT_I4)
		{
			tUserIDData.dwPrivilege = oleVarData.intVal;
		}

		RecSet.GetFieldValue(_T("Password"), oleVarData);
		if (oleVarData.vt == VT_I4)
		{
			tUserIDData.dwPassword = oleVarData.intVal;
		}

		if(tUserIDData.dwFingerNumber < 10 )
		{
			RecSet.GetFieldValue(_T("FPData"), oleVarData);
			vr.vt = VT_I4|VT_BYREF;
			vr.pintVal = oleVarData.pintVal;

		}
		else
		{
			oleVarData.Clear();
		}
		

		bRet = m_pOCXObj->SetEnrollData(
			m_dwMechineID,
			tUserIDData.dwEnrollNumber,
			tUserIDData.dwEMachineNumber,
			tUserIDData.dwFingerNumber,
			tUserIDData.dwPrivilege,
			&vr,
			tUserIDData.dwPassword
			);

		if (!bRet)
		{
			long dwErrorValue;
			
			m_pOCXObj->GetLastError(&dwErrorValue);
			m_strInfo = ErrorStr(dwErrorValue);
			
			strTemp.Format(_T("%s Continue?"), ErrorStr(dwErrorValue));
			
			dwErrorValue = MessageBox(strTemp, _T("GetEnrollData"), MB_YESNO);
			if (dwErrorValue == IDYES)
			{
				bRet = TRUE;
			}
			else
			{
				m_pOCXObj->EnableDevice( m_dwMechineID, TRUE );
				
				return;
			}
		}

		RecSet.MoveNext();
	}

	m_strInfo = STR_SUCCESS;
	UpdateData(FALSE);

	//
	RecSet.Close();
	db.Close();
}

void CEnrollManage::OnBtnSendAllEnrollData() 
{
	// TODO: Add your control notification handler code here
	
}

void CEnrollManage::OnBtnDeleteDbData() 
{
	// TODO: Add your control notification handler code here
	BOOL bRet = MessageBox(_T("Delete All data in local DataBase?!!"), _T("Warning"), MB_YESNO | MB_ICONQUESTION);
	if (bRet == IDYES)
	{
		db.Open(m_strDBPath);
		
		db.Execute(_T("delete * from tblEnroll"));
		
		db.Close();
	}

}

void CEnrollManage::DoClean()
{
	m_parentwnd->ShowWindow(SW_SHOW);
	m_listBox.ResetContent();

}

//
//false -->save  true ---> open file
//
void CEnrollManage::OpenFileOrSaveFileReturnPath( BOOL bOpenOrSave, CString* pCStringObject)
{
	TCHAR* szFilter = _T("DAT Files (*.dat)|*.dat|All Files (*.*)|*.*||");

	CFileDialog dlg(bOpenOrSave, _T(".dat"), _T("data"), OFN_OVERWRITEPROMPT|OFN_EXPLORER/*|OFN_CREATEPROMPT*/ ,szFilter);
	if (dlg.DoModal() != IDOK)
	{
		return;
	}	
	
	*pCStringObject = dlg.GetPathName();
}
