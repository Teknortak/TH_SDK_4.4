#if !defined(AFX_SETPASSTIME_H__ADA0DE28_A862_4016_BEAD_7F3C774DE202__INCLUDED_)
#define AFX_SETPASSTIME_H__ADA0DE28_A862_4016_BEAD_7F3C774DE202__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// SetPasstime.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// CSetPasstime dialog

class CSetPasstime : public CDialog
{
// Construction
public:
	CSetPasstime(CWnd* pParent = NULL);   // standard constructor

	CWnd*		m_parentwnd;
	CFp_clockctrl1*	m_pOCXObj;
	int			m_dwMechineID;

// Dialog Data
	//{{AFX_DATA(CSetPasstime)
	enum { IDD = IDD_DLG_SET_PASSTIME };
	CComboBox	m_cmbLckGroupList;
	CComboBox	m_cmbWeeklist;
	CComboBox	m_cmbDayList;
	CString	m_strInfo;
	UINT	m_dwStartTimeHour1;
	UINT	m_dwStartTimeHour2;
	UINT	m_dwStartTimeHour3;
	UINT	m_dwStartTimeHour4;
	UINT	m_dwStartTimeHour5;
	int		m_dwStartTimeMinute1;
	int		m_dwStartTimeMinute2;
	int		m_dwStartTimeMinute3;
	int		m_dwStartTimeMinute4;
	int		m_dwStartTimeMinute5;
	int		m_dwEndTimeHour1;
	int		m_dwEndTimeHour2;
	int		m_dwEndTimeHour3;
	int		m_dwEndTimeHour4;
	int		m_dwEndTimeHour5;
	int		m_dwEndTimeMinute1;
	int		m_dwEndTimeMinute2;
	int		m_dwEndTimeMinute3;
	int		m_dwEndTimeMinute4;
	int		m_dwEndTimeMinute5;
	int		m_dwSun;
	int		m_dwMon;
	int		m_dwTue;
	int		m_dwWen;
	int		m_dwThu;
	int		m_dwFri;
	int		m_dwSat;
	int		m_dwGroupValue;
	int		m_dwUserID;
	int		m_dwWeekID;
	int		m_dwGroupID;
	COleDateTime	m_tStartTime;
	COleDateTime	m_tEndTime;
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CSetPasstime)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	virtual void PostNcDestroy();
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(CSetPasstime)
	virtual void OnOK();
	afx_msg void OnClose();
	afx_msg void OnShowWindow(BOOL bShow, UINT nStatus);
	afx_msg void OnBtnPasstimeRead();
	afx_msg void OnBtnPasstimeWrite();
	afx_msg void OnBtnWeekpasstimeRead();
	afx_msg void OnBtnWeekpasstimeWrite();
	afx_msg void OnBtnLockgroupRead();
	afx_msg void OnBtnLockgroupWrite();
	afx_msg void OnBtnGetUserctrl();
	afx_msg void OnBtnSetUserCtrl();
	afx_msg void OnBtnClearAllUctrl();
	afx_msg void OnBtnDelUserCtrl();
	virtual BOOL OnInitDialog();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_SETPASSTIME_H__ADA0DE28_A862_4016_BEAD_7F3C774DE202__INCLUDED_)
