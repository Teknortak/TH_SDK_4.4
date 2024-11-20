#if !defined(AFX_BELLSETTING_H__3066499F_619A_4EDD_83D6_AEBDFA0C5D3B__INCLUDED_)
#define AFX_BELLSETTING_H__3066499F_619A_4EDD_83D6_AEBDFA0C5D3B__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// BellSetting.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// CBellSetting dialog

class CBellSetting : public CDialog
{
// Construction
public:
	LONG m_BellInfoData[6];
	long m_dwBellCount;
	CBellSetting(CWnd* pParent = NULL);   // standard constructor

// Dialog Data
	//{{AFX_DATA(CBellSetting)
	enum { IDD = IDD_DLG_BELL_INFO };
	CWnd* m_parentwnd;
	CFp_clockctrl1* m_pOCXObj;
	LONG m_dwMechineID;
	CString	m_strBellInfo;
	long	m_dwBellRingCount;

	BYTE	m_dwHourPoint1;
	BYTE	m_dwMinutePoint1;

	BYTE	m_dwHourPoint2;
	BYTE	m_dwMinutePoint2;

	BYTE	m_dwHourPoint3;
	BYTE	m_dwMinutePoint3;

	BYTE	m_dwHourPoint4;
	BYTE	m_dwMinutePoint4;

	BYTE	m_dwHourPoint5;
	BYTE	m_dwMinutePoint5;

	BYTE	m_dwHourPoint6;
	BYTE	m_dwMinutePoint6;

	BYTE	m_dwHourPoint7;
	BYTE	m_dwMinutePoint7;

	BYTE	m_dwHourPoint8;
	BYTE	m_dwMinutePoint8;


	//}}AFX_DATA

	void ResetValue();
	
// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CBellSetting)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	virtual void PostNcDestroy();
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(CBellSetting)
	afx_msg void OnBtnReadBellSetting();
	afx_msg void OnBtnWriteBellSetting();	
	afx_msg void OnShowWindow(BOOL bShow, UINT nStatus);
	afx_msg void OnClose();
	virtual void OnOK();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_BELLSETTING_H__3066499F_619A_4EDD_83D6_AEBDFA0C5D3B__INCLUDED_)
