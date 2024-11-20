#if !defined(AFX_SYSINFO_H__1C0AE069_0563_4214_9B0C_EC8C646510D1__INCLUDED_)
#define AFX_SYSINFO_H__1C0AE069_0563_4214_9B0C_EC8C646510D1__INCLUDED_

#include "resource.h"
#include "fp_clockctrl1.h"

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// SysInfo.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// SysInfo dialog

class CSysInfo : public CDialog
{
// Construction
public:
	LPCTSTR FormWeekStr(int dwWeek);
	CSysInfo(CWnd* pParent = NULL);   // standard constructor

// Dialog Data
	//{{AFX_DATA(CSysInfo)
	enum { IDD = IDD_DLG_SYS_INFO };
	CString	m_strSysInfo;
	CWnd* m_parentwnd;
	CFp_clockctrl1* m_pOCXObj;
	LONG m_dwMachineID;

	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CSysInfo)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	virtual void PostNcDestroy();
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(CSysInfo)
	afx_msg void OnBtnGetDevTime();
	afx_msg void OnBtnPwrOffDev();
	afx_msg void OnBtnSetDevTime();
	afx_msg void OnBnClickedBtnGetDeviceInfo();
	afx_msg void OnBnClickedBtnSetDeviceInfo();
	afx_msg void OnBnClickedBtnGetDeviceStatus();
	afx_msg void OnBtnPwrOnDev();
	afx_msg void OnBtnDisableDev();
	afx_msg void OnClose();
	virtual void OnOK();
	afx_msg void OnShowWindow(BOOL bShow, UINT nStatus);
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
public:
	int m_dwStatusValue;
	CComboBox m_cmbIndexList;


	BOOL ToDisableDevice();
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_SYSINFO_H__1C0AE069_0563_4214_9B0C_EC8C646510D1__INCLUDED_)
