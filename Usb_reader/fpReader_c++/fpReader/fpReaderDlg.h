
// fpReaderDlg.h : header file
//

#pragma once
#include "afxwin.h"
#include "fpreaderctrl1.h"

// CfpReaderDlg dialog
class CfpReaderDlg : public CDialogEx
{
// Construction
public:
	CfpReaderDlg(CWnd* pParent = NULL);	// standard constructor

// Dialog Data
	enum { IDD = IDD_FPREADER_DIALOG };

	protected:
	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV support

	CString m_strDBPath;
	CString m_strFPPicPath;  // finger picture
	CString m_strAppPath;
	UINT_PTR m_nWindowTimer;

// Implementation
protected:
	HICON m_hIcon;

	// Generated message map functions
	virtual BOOL OnInitDialog();
	afx_msg void OnSysCommand(UINT nID, LPARAM lParam);
	afx_msg void OnPaint();
	afx_msg HCURSOR OnQueryDragIcon();
	DECLARE_MESSAGE_MAP()
private:
	int InitVariant();
	COleVariant m_varOleData;
	unsigned char *	m_buffer;   //PVOID

public:
	
	afx_msg void OnBnClickedButton2();
	afx_msg void OnBnClickedBtnEnrollFp();

	BOOL CloseDevice( )
	{
		BOOL bRet;
		bRet = m_fpCtrl.OnoffLED(FALSE);  // set light
		if (bRet)
		{
			bRet = m_fpCtrl.DisConnectUsb();  // close		
		}

		return bRet;
	}

/*	afx_msg void OnBnClickedBtnCancel();*/
	afx_msg void OnBnClickedBtnDelAllData();
	afx_msg void OnBnClickedBtnEnrollFpStr();
	CString m_message;
	CStatic m_picCtrl;
	bool LoadPicture(CString& strPath);
	afx_msg void OnTimer(UINT_PTR nIDEvent);
	int InitViariant();

	
	PUCHAR	m_byteBuffer;   //PVOID
	afx_msg void OnDestroy();
	long m_nEnrollId;
	long m_nFPNum;
	long m_nPrivilege;

	CFpreaderctrl1 m_fpCtrl;
};
