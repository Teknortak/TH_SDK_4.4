#if !defined(AFX_DEVICESN_H__2C4DED37_834F_47A2_9080_88F752B38C0A__INCLUDED_)
#define AFX_DEVICESN_H__2C4DED37_834F_47A2_9080_88F752B38C0A__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// DeviceSn.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// CDeviceSn dialog

class CDeviceSn : public CDialog
{
// Construction
public:
	CDeviceSn(CWnd* pParent = NULL);   // standard constructor

// Dialog Data
	//{{AFX_DATA(CDeviceSn)
	enum { IDD = IDD_DLG_DEV_SN };
	CWnd*		m_parentwnd;
	CFp_clockctrl1*	m_pOCXObj;
	int			m_dwMechineID;
	CString	m_strInfo;
	long	m_dwBackupNum;
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CDeviceSn)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	virtual void PostNcDestroy();
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(CDeviceSn)
	afx_msg void OnBtnBackupNum();
	afx_msg void OnBtnPrdNum();
	afx_msg void OnBtnSn();
	afx_msg void OnShowWindow(BOOL bShow, UINT nStatus);
	virtual void OnOK();
	afx_msg void OnClose();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_DEVICESN_H__2C4DED37_834F_47A2_9080_88F752B38C0A__INCLUDED_)
