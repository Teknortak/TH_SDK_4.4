
// FPCLOCK_SampleDlg.h : header file
//

#pragma once
#include "fpclocksvrctrl1.h"
#include "afxcmn.h"


// CFPCLOCK_SampleDlg dialog
class CFPCLOCK_SampleDlg : public CDialogEx
{
// Construction
public:
	CFPCLOCK_SampleDlg(CWnd* pParent = NULL);	// standard constructor

// Dialog Data
	enum { IDD = IDD_FPCLOCK_SAMPLE_DIALOG };

	protected:
	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV support


// Implementation
protected:
	HICON m_hIcon;

	// Generated message map functions
	virtual BOOL OnInitDialog();
	afx_msg void OnSysCommand(UINT nID, LPARAM lParam);
	afx_msg void OnPaint();
	afx_msg HCURSOR OnQueryDragIcon();
	DECLARE_MESSAGE_MAP()
public:
	CFpclocksvrctrl1 m_ocxServerCtrl;
	CString m_strInfo;
	CListCtrl m_lstReport;
	afx_msg void OnBnClickedBtnOpenNet();
	afx_msg void OnBnClickedBtnCloseNet();
	afx_msg void OnBnClickedBtnClearList();
	UINT m_dwPortNum;
	virtual BOOL OnCommand(WPARAM wParam, LPARAM lParam);
	bool m_bNetOpened;
	DECLARE_EVENTSINK_MAP()
	void OnReceiveGLogDataFpclocksvrctrl1(
		LPCTSTR astrDeviceIP,
		long anDevicePort,
		long vnDevicID,
		long anSEnrollNumber, 
		long anVerifyMode,
		long anInOutMode, 
		DATE anLogDate,
		long linkindex);

	CString strTemp;

	COleDateTime oleTime;


	int m_dwListIndex;
	afx_msg void OnClose();
};
