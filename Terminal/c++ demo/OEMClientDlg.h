// OEMClientDlg.h : header file
//
//{{AFX_INCLUDES()

#include "fp_clockctrl1.h"
//}}AFX_INCLUDES

#if !defined(AFX_OEMCLIENTDLG_H__AD80E019_7395_4FD6_A03B_601C26B7B8D0__INCLUDED_)
#define AFX_OEMCLIENTDLG_H__AD80E019_7395_4FD6_A03B_601C26B7B8D0__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

/////////////////////////////////////////////////////////////////////////////
// COEMClientDlg dialog

class COEMClientDlg : public CDialog
{
// Construction
public:
	COEMClientDlg(CWnd* pParent = NULL);	// standard constructor

// Dialog Data
	//{{AFX_DATA(COEMClientDlg)
	enum { IDD = IDD_OEMCLIENT_DIALOG };
	CIPAddressCtrl	m_IPAddr;
	CComboBox	m_cmbComPortIndex;
	CComboBox	m_cmbMechineID;
	CComboBox	m_cmbDeviceType;
	//CFP_CLOCK	m_OCXControl;
	int		m_IPPort;
	long	m_dwSerPort;
	long	m_dwTimeOutValue;
	//}}AFX_DATA

	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(COEMClientDlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	HICON m_hIcon;

	// Generated message map functions
	//{{AFX_MSG(COEMClientDlg)
	virtual BOOL OnInitDialog();
	afx_msg void OnSysCommand(UINT nID, LPARAM lParam);
	afx_msg void OnPaint();
	afx_msg HCURSOR OnQueryDragIcon();
	afx_msg void OnBtnOpenDevice();
	afx_msg void OnSelchangeCmbDeviceType();
	afx_msg void OnBtnSysInfo();
	afx_msg void OnClose();
	afx_msg LRESULT OnGetOCXObj(WPARAM wParam, LPARAM lParam);
	afx_msg void OnBtnOpenDevSnDlg();
	afx_msg void OnBtnGetBellInfo();
	afx_msg void OnBtnEnrollMgmt();
	afx_msg void OnBtnLogMgmt();
	afx_msg void OnBtnSetPasstime();
	afx_msg void OnBtnLockCtrl();
	virtual void OnOK();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()



private:
	int m_dwCurSelDev;

	BOOL m_bDeviceOpened;

	CSysInfo* cSysInfoDlg;

	CDeviceSn* cDeviceSNDlg;

	CBellSetting* cBellSettingDlg;

	CEnrollManage* cEnrollManageDlg;

	CLogDataManage* cLogDataManageDlg;

	CDoorctrl*      cDoorCtrlDlg;

	CSetPasstime*   cSetPassTimeDlg;

	int m_dwMechineID;
	
public:
	void InitCtrlWindow();

	void CreateChildWindow();
	CFp_clockctrl1 m_OCXControl;
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_OEMCLIENTDLG_H__AD80E019_7395_4FD6_A03B_601C26B7B8D0__INCLUDED_)