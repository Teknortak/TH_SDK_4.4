#if !defined(AFX_DOORCTRL_H__F8A1A9FE_99A5_4965_BEFC_734C352B434F__INCLUDED_)
#define AFX_DOORCTRL_H__F8A1A9FE_99A5_4965_BEFC_734C352B434F__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// Doorctrl.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// CDoorctrl dialog

class CDoorctrl : public CDialog
{
// Construction
public:
	CDoorctrl(CWnd* pParent = NULL);   // standard constructor
	CWnd*		m_parentwnd;
	CFp_clockctrl1*	m_pOCXObj;
	int			m_dwMechineID;

// Dialog Data
	//{{AFX_DATA(CDoorctrl)
	enum { IDD = IDD_DLG_LOCK_CTRL };
	CString	m_strInfo;
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CDoorctrl)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	virtual void PostNcDestroy();
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(CDoorctrl)
	afx_msg void OnBtnGetDoorStatus();
	afx_msg void OnShowWindow(BOOL bShow, UINT nStatus);
	afx_msg void OnClose();
	afx_msg void OnBtnOpenDoor();
	afx_msg void OnBtnAutoRecover();
	afx_msg void OnBtnReboot();
	afx_msg void OnBtnUncondOpen();
	afx_msg void OnBtnUncondClose();
	afx_msg void OnBtnCancelWarn();
	virtual BOOL OnInitDialog();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()

};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_DOORCTRL_H__F8A1A9FE_99A5_4965_BEFC_734C352B434F__INCLUDED_)
