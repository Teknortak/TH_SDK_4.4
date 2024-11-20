// stdafx.h : include file for standard system include files,
//  or project specific include files that are used frequently, but
//      are changed infrequently
//

#if !defined(AFX_STDAFX_H__C86F1A91_5905_43A1_8170_BCF44C723503__INCLUDED_)
#define AFX_STDAFX_H__C86F1A91_5905_43A1_8170_BCF44C723503__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#define VC_EXTRALEAN		// Exclude rarely-used stuff from Windows headers

#include <afxwin.h>         // MFC core and standard components
#include <afxext.h>         // MFC extensions
#include <afxdisp.h>        // MFC Automation classes
#include <afxdtctl.h>		// MFC support for Internet Explorer 4 Common Controls
#ifndef _AFX_NO_AFXCMN_SUPPORT
#include <afxcmn.h>			// MFC support for Windows Common Controls
#endif // _AFX_NO_AFXCMN_SUPPORT

#include <afxsock.h>		// MFC socket extensions

#include <vector>
#include <afxdao.h>			//Access database
#include <comdef.h>			//_com_error


#include "define.h"

#include "SysInfo.h"
#include "DeviceSn.h"
#include "BellSetting.h"
#include "EnrollManage.h"
#include "LogDataManage.h"
#include "Doorctrl.h"
#include "SetPasstime.h"

//#import "C:\Program Files\Common Files\System\ado\msado15.dll" no_namespace rename ("EOF", "clEOF")
/*#import "C:\Program Files\Common Files\System\ado\msado15.dll" \
no_namespace rename("EOF","adoEOF") rename("BOF","adoBOF")*/



//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.



#endif // !defined(AFX_STDAFX_H__C86F1A91_5905_43A1_8170_BCF44C723503__INCLUDED_)
