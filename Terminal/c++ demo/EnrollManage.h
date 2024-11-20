#if !defined(AFX_ENROLLMANAGE_H__633035E5_B879_43CF_981E_376E98823FB2__INCLUDED_)
#define AFX_ENROLLMANAGE_H__633035E5_B879_43CF_981E_376E98823FB2__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// EnrollManage.h : header file
//

//#include <vector>




/////////////////////////////////////////////////////////////////////////////
// CEnrollManage dialog

class CEnrollManage : public CDialog
{
// Construction
public:
	CWnd* m_parentwnd;
	LONG m_dwMechineID;
	CFp_clockctrl1* m_pOCXObj;

	CEnrollManage(CWnd* pParent = NULL);   // standard constructor

// Dialog Data
	//{{AFX_DATA(CEnrollManage)
	enum { IDD = IDD_DLG_ENROLL_FRM };
	CListBox	m_listBox;
	CComboBox	m_cmbBackupNum;
	CComboBox	m_cmbPrivilege;
	CComboBox	m_cmbEmList;
	CString	m_strCompanyName;
	CString	m_strInfo;
	long	m_dwEnrollNum;
	CString	m_strEnrollName;
	long	m_dwCardNum;
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CEnrollManage)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	virtual void PostNcDestroy();
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(CEnrollManage)
	afx_msg void OnBtnSetName();
	afx_msg void OnBtnDelName();
	afx_msg void OnClose();
	
	void DoClean();
	
	afx_msg void OnShowWindow(BOOL bShow, UINT nStatus);
	virtual void OnOK();
	virtual BOOL OnInitDialog();
	afx_msg void OnBtnSetUsrName();
	afx_msg void OnBtnGetUsrName();
	afx_msg void OnBtnRmManager();
	afx_msg void OnBtnMdfPrivilege();
	afx_msg void OnBtnClearAllData();
	afx_msg void OnBtnGetEnrollData();
	afx_msg void OnBtnSetEnrollData();
	afx_msg void OnBtnDelEnrollData();
	afx_msg void OnBtnUdDownload();	
	afx_msg void OnBtnUdUpload();
	afx_msg void OnBtnEmptyEnrollData();
	afx_msg void OnBtnGetEnrollInfo();
	afx_msg void OnBtnGetAllEnrollData();
	afx_msg void OnBtnSetAllEnrollData();
	afx_msg void OnBtnSendAllEnrollData();
	afx_msg void OnBtnDeleteDbData();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()



public:
	int InitVariant();   

	COleVariant		m_varOleData;
	unsigned char *	m_buffer;   //PVOID

	CString			m_strDBPath;

	static void OpenFileOrSaveFileReturnPath(BOOL bOpenOrSave, CString* pCStringObject);

};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_ENROLLMANAGE_H__633035E5_B879_43CF_981E_376E98823FB2__INCLUDED_)
