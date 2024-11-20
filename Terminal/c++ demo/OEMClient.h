// COEMClient.h : main header file for the COEMClient application
//

#if !defined(AFX_OEMCLIENT_H__61BF6BA0_F60D_49A3_92D0_D96991CEF83F__INCLUDED_)
#define AFX_OEMCLIENT_H__61BF6BA0_F60D_49A3_92D0_D96991CEF83F__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#ifndef __AFXWIN_H__
	#error include 'stdafx.h' before including this file for PCH
#endif

#include "resource.h"		// main symbols

/////////////////////////////////////////////////////////////////////////////
// COEMClientApp:
// See COEMClient.cpp for the implementation of this class
//

class COEMClientApp : public CWinApp
{
public:
	COEMClientApp();

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(COEMClientApp)
	public:
	virtual BOOL InitInstance();
	//}}AFX_VIRTUAL

// Implementation

	//{{AFX_MSG(COEMClientApp)
		// NOTE - the ClassWizard will add and remove member functions here.
		//    DO NOT EDIT what you see in these blocks of generated code !
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};


/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_OEMCLIENT_H__61BF6BA0_F60D_49A3_92D0_D96991CEF83F__INCLUDED_)
