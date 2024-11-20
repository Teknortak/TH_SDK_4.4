#if !defined(AFX_LOGDATAMANAGE_H__DFF8A2D0_9AAB_42D8_B157_A1423A6E6B31__INCLUDED_)
#define AFX_LOGDATAMANAGE_H__DFF8A2D0_9AAB_42D8_B157_A1423A6E6B31__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// LogDataManage.h : header file
//
using namespace std;

/////////////////////////////////////////////////////////////////////////////
// CLogDataManage dialog

class CLogDataManage : public CDialog
{
// Construction
public:
	CLogDataManage(CWnd* pParent = NULL);   // standard constructor

	CWnd* m_parentwnd;
	CFp_clockctrl1* m_pOCXObj;
	LONG m_dwMechineID;

// Dialog Data
	//{{AFX_DATA(CLogDataManage)
	enum { IDD = IDD_DLG_LOG };
	CListCtrl	m_listCtrl;
	CString	m_strInfo;
	BOOL	m_bReadMaskCheck;
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CLogDataManage)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	virtual void PostNcDestroy();
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(CLogDataManage)
	afx_msg void OnClose();
	afx_msg void OnShowWindow(BOOL bShow, UINT nStatus);
	virtual void OnOK();	
	afx_msg void OnBtnRdSlog();
	afx_msg void OnBtnRdAllSlog();
	afx_msg void OnBtnEmptySlog();
	afx_msg void OnBtnUdrdSlog();
	afx_msg void OnBtnUdrdGlog();
	afx_msg void OnBtnRdGlog();
	afx_msg void OnBtnEmptyGlog();
	afx_msg void OnBtnRdAllGlog();
	virtual BOOL OnInitDialog();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()

public:
	vector <TGeneralLogInfo> m_vctGLogDat;
	vector <TSuperLogInfo> m_vctSuperLogDat;


	void Reinit();
	LPCTSTR FormVerifyStr(int dwWeek, vector<TGeneralLogInfo>::iterator iter);
	LPCTSTR FormManipulationStr(int dwIdetify);
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_LOGDATAMANAGE_H__DFF8A2D0_9AAB_42D8_B157_A1423A6E6B31__INCLUDED_)
