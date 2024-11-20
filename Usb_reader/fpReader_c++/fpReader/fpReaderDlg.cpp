
// fpReaderDlg.cpp : implementation file
//

#include "stdafx.h"
#include "fpReader.h"
#include "fpReaderDlg.h"
#include "afxdialogex.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#endif

CDaoDatabase db;                //Êý¾Ý¿â
CDaoRecordset RecSet(&db);        //¼ÇÂ¼¼¯

// CAboutDlg dialog used for App About

class CAboutDlg : public CDialogEx
{
public:
    CAboutDlg();

// Dialog Data
    enum { IDD = IDD_ABOUTBOX };

    protected:
    virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support

// Implementation
protected:
    DECLARE_MESSAGE_MAP()
public:
    afx_msg void OnClose();
    afx_msg void OnLButtonUp(UINT nFlags, CPoint point);
};

CAboutDlg::CAboutDlg() : CDialogEx(CAboutDlg::IDD)
{
    
}

void CAboutDlg::DoDataExchange(CDataExchange* pDX)
{
    CDialogEx::DoDataExchange(pDX);
}

BEGIN_MESSAGE_MAP(CAboutDlg, CDialogEx)
    ON_WM_CLOSE()
    ON_WM_LBUTTONUP()
END_MESSAGE_MAP()


// CfpReaderDlg dialog



CfpReaderDlg::CfpReaderDlg(CWnd* pParent /*=NULL*/)
    : CDialogEx(CfpReaderDlg::IDD, pParent)
    , m_message(_T(""))
    , m_nEnrollId(2)
    , m_nFPNum(0)
    , m_nPrivilege(0)
{
    m_hIcon = AfxGetApp()->LoadIcon(IDR_MAINFRAME);
   //_CrtDumpMemoryLeaks();
}

void CfpReaderDlg::DoDataExchange(CDataExchange* pDX)
{
    CDialogEx::DoDataExchange(pDX);
    DDX_Text(pDX, IDC_MESSAGE, m_message);
    DDX_Control(pDX, IDC_PICTURE, m_picCtrl);
    DDX_Text(pDX, IDC_EDIT_ID, m_nEnrollId);
    DDX_Text(pDX, IDC_EDIT_FP_NUM, m_nFPNum);
    DDX_Text(pDX, IDC_EDIT_PRIVILIGE, m_nPrivilege);
    DDX_Control(pDX, IDC_FPREADERCTRL1, m_fpCtrl);
    DDX_Control(pDX, IDC_FPREADERCTRL1, m_fpCtrl);
    DDX_Control(pDX, IDC_FPREADERCTRL1, m_fpCtrl);
}

BEGIN_MESSAGE_MAP(CfpReaderDlg, CDialogEx)
    ON_WM_SYSCOMMAND()
    ON_WM_PAINT()
    ON_WM_QUERYDRAGICON()    
    ON_BN_CLICKED(IDC_BTN_ENROLL_FP, &CfpReaderDlg::OnBnClickedBtnEnrollFp)
    ON_BN_CLICKED(IDC_BTN_DEL_ALL_DATA, &CfpReaderDlg::OnBnClickedBtnDelAllData)
    ON_BN_CLICKED(IDC_BTN_ENROLL_FP_STR, &CfpReaderDlg::OnBnClickedBtnEnrollFpStr)
    ON_WM_TIMER()
    ON_WM_DESTROY()
END_MESSAGE_MAP()


// CfpReaderDlg message handlers

BOOL CfpReaderDlg::OnInitDialog()
{
    CDialogEx::OnInitDialog();

    // Add "About..." menu item to system menu.

    // IDM_ABOUTBOX must be in the system command range.
    ASSERT((IDM_ABOUTBOX & 0xFFF0) == IDM_ABOUTBOX);
    ASSERT(IDM_ABOUTBOX < 0xF000);

    CMenu* pSysMenu = GetSystemMenu(FALSE);
    if (pSysMenu != NULL)
    {
        BOOL bNameValid;
        CString strAboutMenu;
        bNameValid = strAboutMenu.LoadString(IDS_ABOUTBOX);
        ASSERT(bNameValid);
        if (!strAboutMenu.IsEmpty())
        {
            pSysMenu->AppendMenu(MF_SEPARATOR);
            pSysMenu->AppendMenu(MF_STRING, IDM_ABOUTBOX, strAboutMenu);
        }
    }

    // Set the icon for this dialog.  The framework does this automatically
    //  when the application's main window is not a dialog
    SetIcon(m_hIcon, TRUE);            // Set big icon
    SetIcon(m_hIcon, FALSE);        // Set small icon

    // TODO: Add extra initialization here
    CString strPath;

    GetModuleFileName(NULL, strPath.GetBufferSetLength(MAX_PATH + 1), MAX_PATH);
    strPath.ReleaseBuffer();

    int nPos;
    nPos = strPath.ReverseFind(_T('\\'));
    m_strDBPath = strPath.Left(nPos);
    m_strDBPath = m_strDBPath + _T("\\datEnrollDat.mdb");
    m_strFPPicPath = strPath.Left(nPos) + _T("\\test.bmp");

    GetCurrentDirectory(1024, m_strAppPath.GetBuffer(1024));
    m_strAppPath.ReleaseBuffer();
    
    CWnd* picWind = (CWnd*)GetDlgItem(IDC_PICTURE);
    picWind->ModifyStyleEx(0, WS_EX_CLIENTEDGE);
    LoadPicture(m_strFPPicPath);

    return TRUE;  // return TRUE  unless you set the focus to a control
}

void CfpReaderDlg::OnSysCommand(UINT nID, LPARAM lParam)
{
    if ((nID & 0xFFF0) == IDM_ABOUTBOX)
    {
        CAboutDlg dlgAbout;
        dlgAbout.DoModal();
    }
    else
    {
        CDialogEx::OnSysCommand(nID, lParam);
    }
}

// If you add a minimize button to your dialog, you will need the code below
//  to draw the icon.  For MFC applications using the document/view model,
//  this is automatically done for you by the framework.

void CfpReaderDlg::OnPaint()
{
    if (IsIconic())
    {
        CPaintDC dc(this); // device context for painting

        SendMessage(WM_ICONERASEBKGND, reinterpret_cast<WPARAM>(dc.GetSafeHdc()), 0);

        // Center icon in client rectangle
        int cxIcon = GetSystemMetrics(SM_CXICON);
        int cyIcon = GetSystemMetrics(SM_CYICON);
        CRect rect;
        GetClientRect(&rect);
        int x = (rect.Width() - cxIcon + 1) / 2;
        int y = (rect.Height() - cyIcon + 1) / 2;

        // Draw the icon
        dc.DrawIcon(x, y, m_hIcon);
    }
    else
    {
        CDialogEx::OnPaint();
    }
}

// The system calls this function to obtain the cursor to display while the user drags
//  the minimized window.
HCURSOR CfpReaderDlg::OnQueryDragIcon()
{
    return static_cast<HCURSOR>(m_hIcon);
}


void CfpReaderDlg::OnBnClickedBtnEnrollFp()
{
    BOOL bRet;
    bRet = m_fpCtrl.ConnectUsb();
    if (!bRet)
    {
        m_message = _T("No Device");
        UpdateData(FALSE);
        return;
    }

    /*
    nVer = 0  1000
    nVer = 1  3000
    */
    long nVer;
    BSTR bstrVer;
    bRet = m_fpCtrl.GetVersion(&nVer, &bstrVer);
    if (!bRet)
    {
        m_message = _T("No Device");
        UpdateData(FALSE);
        return;
    }
    else
    {
        m_message = bstrVer;
        UpdateData(FALSE);
    }
    // Allocating and Releasing Memory for a BSTR
//    SysFreeString(bstrVer); 

    m_fpCtrl.OnoffLED(TRUE);    // power on indicator
    m_message = _T("press finger 1#");
    UpdateData(FALSE);

    BOOL bLoop = TRUE;
    do 
    {
        bRet = m_fpCtrl.DetectFinger();
        if (bRet)
        {
            bLoop = FALSE;
        }
        
    } while (bLoop);
    
    bRet = m_fpCtrl.GetImage((LPWSTR)m_strFPPicPath.GetString());
    if (!bRet)
    {
        m_message = _T("Get image fail");
        UpdateData(FALSE);

        bRet = CloseDevice();
        return;
    }

    LoadPicture(m_strFPPicPath);

    // 
    // 0 
    // 1 
    bRet = m_fpCtrl.GetTemplet(0);
    if (!bRet)
    {
        m_message = _T("Get Templet fail");
        UpdateData(FALSE);

        bRet = CloseDevice();
        return;
    }


    COleVariant oleVarData;  
    BYTE* bytePtr = NULL;
    InitVariant();

    /////////////////////////////check db, verify FPdata in DB or not//////////////////////////////////////////////
    // Open db
    db.Open(m_strDBPath);
    RecSet.Open(AFX_DAO_USE_DEFAULT_TYPE, _T("SELECT * FROM tblEnroll"), NULL);  
    int nFingerValue;
    int intArray[500] = { 0 };
    PINT intPtr = NULL;

    if (!RecSet.IsBOF() && !RecSet.IsEOF())
    {
        TRACE(_T("database count %d\n"), RecSet.GetRecordCount());

        RecSet.MoveFirst();
    }

    while (!RecSet.IsEOF())
    {     
        
        RecSet.GetFieldValue(_T("FingerNumber"), oleVarData);
        nFingerValue = oleVarData.intVal;       

        RecSet.GetFieldValue(_T("FPData"), oleVarData);
            
        if (oleVarData.vt == VT_EMPTY || oleVarData.vt == VT_NULL)
        {
            oleVarData.Clear();
            RecSet.MoveNext();
            continue;
        }
        TRACE(_T("number elements %d\n"), oleVarData.parray->rgsabound->cElements);
        if (0 != oleVarData.parray->rgsabound->cElements)
        {                
            bytePtr = (BYTE*)oleVarData.parray->pvData;
        }
        else
        {
            oleVarData.Clear();
            RecSet.MoveNext();
            continue;
        }
        
        if (nFingerValue < 10)
        {  
            intPtr = intArray;

            for (int i = 0; i < (FP_DATA_LENGHT / 4); i++)
            {
                *(intPtr + i) = *(bytePtr + i * 5 + 1);
                *(intPtr + i) = *(intPtr + i) * 256 + *(bytePtr + i * 5 + 2);
                *(intPtr + i) = *(intPtr + i) * 256 + *(bytePtr + i * 5 + 3);
                *(intPtr + i) = *(intPtr + i) * 256 + *(bytePtr + i * 5 + 4);
                if (0 == *(bytePtr + (i * 5)))
                {
                    *(intPtr + i) = ~*(intPtr + i) + 1;
                }

            }
#if 0
            CFile file;
            file.Open(_T("data_mode1.dat"), CFile::modeReadWrite | CFile::typeBinary | CFile::modeCreate);

            file.Write(intArray, sizeof(intArray));
            file.Close();

            //ZeroMemory(intArray, sizeof intArray);
#endif
            ZeroMemory(m_buffer, 1776);
            memcpy(m_buffer, (PVOID)intArray, FP_DATA_LENGHT);                    

            bRet = m_fpCtrl.VerifyFinger(&m_varOleData);
            if (bRet)   // already stored in DB
            {
                m_message = "FP DOUBLE";
                UpdateData(FALSE);
                CloseDevice();

                SafeArrayUnaccessData(m_varOleData.parray);
                /*SafeArrayDestroy(m_varOleData.parray);*/
                oleVarData.Clear();
                   
                RecSet.Close();
                db.Close();
                return;
            }
        }

        RecSet.MoveNext();

    } // while  

    SafeArrayUnaccessData(m_varOleData.parray);
    oleVarData.Clear();

    RecSet.Close();
    db.Close();
    
    m_message = _T("take off your finger");
    UpdateData(FALSE);
 
    // check finger left
    bLoop = TRUE;
    do
    {
        bRet = m_fpCtrl.DetectFinger();
        if (bRet == FALSE)
        {
            bLoop = FALSE;
        }
        
    } while (bLoop);

    m_message = _T("press finger 2 #");
    UpdateData(FALSE);

    // detect next press
    bLoop = TRUE;
    do
    {
        bRet = m_fpCtrl.DetectFinger();
        if (bRet == TRUE)
        {
            bLoop = FALSE;
        }
        
    } while (bLoop);

    bRet = m_fpCtrl.GetImage((LPWSTR)m_strFPPicPath.GetString());
    if (!bRet)
    {
        m_message = _T("Get image fail");
        UpdateData(FALSE);

        bRet = CloseDevice();
    }

    LoadPicture(m_strFPPicPath);

    bRet = m_fpCtrl.GetTemplet(1);
    if (!bRet)
    {
        m_message = _T("Get Templet fail");
        UpdateData(FALSE);

        bRet = CloseDevice();
    }
    
    if ( nVer == 1)
    {
        m_message = _T("take off your finger");
        UpdateData(FALSE);
        // check finger left
        bLoop = TRUE;
        do
        {
            bRet = m_fpCtrl.DetectFinger();
            if (bRet == FALSE)
            {
                bLoop = FALSE;
            }
            
        } while (bLoop);

        m_message = _T("press finger 3 #");
        UpdateData(FALSE);

        // detect next press
        bLoop = TRUE;
        do
        {
            bRet = m_fpCtrl.DetectFinger();
            if (bRet == TRUE)
            {
                bLoop = FALSE;
            }
            
        } while (bLoop);

        bRet = m_fpCtrl.GetImage((LPWSTR)m_strFPPicPath.GetString());
        if (!bRet)
        {
            m_message = _T("Get image fail");
            UpdateData(FALSE);

            bRet = CloseDevice();
        }

        LoadPicture(m_strFPPicPath);

        bRet = m_fpCtrl.GetTemplet(2);
        if (!bRet)
        {
            m_message = _T("Get Templet fail");
            UpdateData(FALSE);

            bRet = CloseDevice();
        }
    }  // ver = 1

    COleVariant varOleMergeChar;

    bRet = m_fpCtrl.GetMergeChar(varOleMergeChar);   // no need to free?
    if (!bRet)
    {
        m_message = _T("Merge Char error");
        UpdateData(FALSE);
        CloseDevice();
        return;
    }
    PINT ptrInt = NULL;
    if (varOleMergeChar.vt == (VT_ARRAY |VT_I4))
    {
        ptrInt = (PINT)varOleMergeChar.parray->pvData;
    }

    BYTE szByte[1800];
    LONG dwMachineID = 1;
    UpdateData(TRUE);  // retrieve data

    // Open db
    db.Open(m_strDBPath);
    RecSet.Open(AFX_DAO_USE_DEFAULT_TYPE, _T("SELECT * FROM tblEnroll"), NULL);

    RecSet.AddNew();

    oleVarData.vt = VT_I4;
    oleVarData.intVal = m_nEnrollId;
    //RecSet.SetFieldValue(_T("EnrollNumber"), m_nEnrollId);   // two kind of method, both can work
    RecSet.SetFieldValue(_T("EnrollNumber"), oleVarData);  

    oleVarData.intVal = 1;
    RecSet.SetFieldValue(_T("EMachineNumber"), dwMachineID);
//    RecSet.SetFieldValue(_T("EMachineNumber"), oleVarData);

    oleVarData.intVal = m_nFPNum;
    RecSet.SetFieldValue(_T("FingerNumber"), m_nFPNum);
   // RecSet.SetFieldValue(_T("FingerNumber"), oleVarData);

    oleVarData.intVal = m_nPrivilege;
    RecSet.SetFieldValue(_T("Privilige"), m_nPrivilege);
    //RecSet.SetFieldValue(_T("Privilige"), oleVarData);

    for (int i = 0; i < FP_DATA_LENGHT / 4; i++)
    {
        *(szByte + i * 5) = 1;
        if (*(ptrInt + i) < 0)
        {
            *(szByte + i * 5) = 0;
            int temp = *(ptrInt + i);
            temp = ~temp + 1; // 

            *(ptrInt + i) = abs(*(ptrInt + i));        

        }
        *(szByte + i * 5 + 1) = *(ptrInt + i) / (1 << 24);
        *(szByte + i * 5 + 2) = (*(ptrInt + i) / (1 << 16)) % 256;
        *(szByte + i * 5 + 3) = (*(ptrInt + i) / (1 << 8)) % 256;
        *(szByte + i * 5 + 4) = *(ptrInt + i) % 256;
    }
    
//     SafeArrayUnaccessData(varOleMergeChar.parray);
//     SafeArrayDestroy(varOleMergeChar.parray);
//     oleVarData.Clear();

    InitVariant();
    memcpy(m_buffer, szByte, 1776);
    RecSet.SetFieldValue(_T("FPData"), m_varOleData);
    
    SafeArrayUnaccessData(m_varOleData.parray);
//    SafeArrayDestroy(m_varOleData.parray);    

    RecSet.Update();
    RecSet.Close();
    db.Close();
    
    //delete[] szByte;
    m_message = _T("add FP data into DB....");
    UpdateData(FALSE);
    CloseDevice();
}


// void CfpReaderDlg::OnBnClickedBtnCancel()
// {
//     // TODO: Add your control notification handler code here
// }


void CfpReaderDlg::OnBnClickedBtnDelAllData()
{
    // TODO: Add your control notification handler code here
    BOOL bRet = MessageBox(_T("Delete All data in local DataBase?!!"), _T("Warning"), MB_YESNO | MB_ICONQUESTION);
    if (bRet == IDYES)
    {
        db.Open(m_strDBPath);

        db.Execute(_T("delete * from tblEnroll"));

        db.Close();
    }
}


void CfpReaderDlg::OnBnClickedBtnEnrollFpStr()
{
    BOOL bRet;
    bRet = m_fpCtrl.ConnectUsb();
    if (!bRet)
    {
        m_message = _T("No Device");
        UpdateData(FALSE);
        return;
    }

    /*
    nVer = 0  1000Ëã·¨ ÐèÒª°´¶þ´ÎÖ¸ÎÆ
    nVer = 1  3000Ëã·¨ ÐèÒª°´Èý´ÎÖ¸ÎÆ
    */
    long nVer;
    BSTR bstrVer;
    bRet = m_fpCtrl.GetVersion(&nVer, &bstrVer);
    if (!bRet)
    {
        m_message = _T("No Device");
        UpdateData(FALSE);
        return;
    }
    else
    {
        m_message = bstrVer;
        UpdateData(FALSE);
    }
    SysFreeString(bstrVer);

    m_fpCtrl.OnoffLED(TRUE);    // power on indicator
    m_message = _T("press finger 1#");
    UpdateData(FALSE);

    BOOL bLoop = TRUE;
    do
    {
        bRet = m_fpCtrl.DetectFinger();
        if (bRet)
        {
            bLoop = FALSE;
        }

    } while (bLoop);

    bRet = m_fpCtrl.GetImage((LPWSTR)m_strFPPicPath.GetString());
    if (!bRet)
    {
        m_message = _T("Get image fail");
        UpdateData(FALSE);

        bRet = CloseDevice();
        return;
    }

    LoadPicture(m_strFPPicPath);

    bRet = m_fpCtrl.GetTemplet(0);
    if (!bRet)
    {
        m_message = _T("Get Templet fail");
        UpdateData(FALSE);

        bRet = CloseDevice();
        return;
    }

    COleVariant oleVarData;
    bstr_t bstrTemp;

    // Open db
    db.Open(m_strDBPath);
    RecSet.Open(AFX_DAO_USE_DEFAULT_TYPE, _T("SELECT * FROM tblEnroll"), NULL);

    if (RecSet.GetRecordCount() != 0)
    {
        int nFingerValue;

        do 
        {
            RecSet.GetFieldValue(_T("FingerNumber"), oleVarData);
            nFingerValue = oleVarData.intVal;

            RecSet.GetFieldValue(_T("FPData_Str"), oleVarData);
            bstrTemp = oleVarData.bstrVal;
            TRACE(_T("datalength: %d \n"), bstrTemp.length());
            if (bstrTemp.length() == 0)
            {
                RecSet.MoveNext();
                continue;
            }
            if (nFingerValue < 10)
            {
                bRet = m_fpCtrl.VerifyFingerWithstring(&oleVarData.bstrVal);
                if (bRet)
                {
                    m_message = "FP DOUBLE";
                    UpdateData(FALSE);
                    RecSet.Close();
                    db.Close();
                    CloseDevice();
                    return;
                }
            }
            
            RecSet.MoveNext();
        } while (!RecSet.IsEOF());
    }


    RecSet.Close();
    db.Close();
    // check finger left
    m_message = "take off you finger";
    UpdateData(FALSE);
    
    bLoop = TRUE;
    do
    {
        bRet = m_fpCtrl.DetectFinger();
        if (bRet == FALSE)
        {
            bLoop = FALSE;
        }

    } while (bLoop);

    m_message = "press finger 2 #";
    UpdateData(FALSE);
    bLoop = TRUE;
    do
    {
        bRet = m_fpCtrl.DetectFinger();
        if (bRet == TRUE)
        {
            bLoop = FALSE;
        }

    } while (bLoop);

    bRet = m_fpCtrl.GetImage((LPWSTR)m_strFPPicPath.GetString());
    if (!bRet)
    {
        m_message = _T("Get image fail");
        UpdateData(FALSE);

        bRet = CloseDevice();
        return;
    }

    LoadPicture(m_strFPPicPath);


    bRet = m_fpCtrl.GetTemplet(1);
    if (!bRet)
    {
        m_message = _T("Get Templet fail");
        UpdateData(FALSE);

        bRet = CloseDevice();
        return;
    }

    if (nVer == 1)
    {
        // check finger left
        m_message = "take off you finger";
        UpdateData(FALSE);

        bLoop = TRUE;
        do
        {
            bRet = m_fpCtrl.DetectFinger();
            if (bRet == FALSE)
            {
                bLoop = FALSE;
            }

        } while (bLoop);

        m_message = "press finger 3 #";
        UpdateData(FALSE);
        bLoop = TRUE;
        do
        {
            bRet = m_fpCtrl.DetectFinger();
            if (bRet == TRUE)
            {
                bLoop = FALSE;
            }

        } while (bLoop);

        bRet = m_fpCtrl.GetImage((LPWSTR)m_strFPPicPath.GetString());
        if (!bRet)
        {
            m_message = _T("Get image fail");
            UpdateData(FALSE);

            bRet = CloseDevice();
            return;
        }

        LoadPicture(m_strFPPicPath);

        bRet = m_fpCtrl.GetTemplet(2);
        if (!bRet)
        {
            m_message = _T("Get Templet fail");
            UpdateData(FALSE);

            bRet = CloseDevice();
            return;
        }        
    } // if (nVer == 1)

    bRet = m_fpCtrl.GetMergeCharWithstring(&bstrVer);
    if (!bRet)
    {
        m_message = _T("Get Merge Char error");
        UpdateData(FALSE);

        bRet = CloseDevice();
        return;
    }
    VARIANT vrDataTransfer;
    vrDataTransfer.vt = VT_I4;
    vrDataTransfer.intVal = 1;
    UpdateData(TRUE);
    // Open db
    db.Open(m_strDBPath);
    RecSet.Open(AFX_DAO_USE_DEFAULT_TYPE, _T("SELECT * FROM tblEnroll"), NULL);

    RecSet.AddNew();
    RecSet.SetFieldValue(_T("EMachineNumber"), vrDataTransfer);
    RecSet.SetFieldValue(_T("EnrollNumber"), m_nEnrollId);
    RecSet.SetFieldValue(_T("FingerNumber"), m_nFPNum);

    vrDataTransfer.vt = VT_BSTR;
    vrDataTransfer.bstrVal = bstrVer;
    RecSet.SetFieldValue(_T("FPData_Str"), vrDataTransfer);

    SysFreeString(bstrVer);

    RecSet.Update();

    RecSet.Close();
    db.Close();

    m_message = _T("complete....");
    UpdateData(FALSE);
}


bool CfpReaderDlg::LoadPicture(CString& strPath)
{    
    HBITMAP hBmp = NULL;        
    hBmp = (HBITMAP)LoadImage(AfxGetInstanceHandle(), strPath, IMAGE_BITMAP, 0, 0, LR_LOADFROMFILE);
    if (hBmp)
    {
        m_picCtrl.SetBitmap(hBmp);
        return true;

    }
    return false;  // default is failure
    
}
int CfpReaderDlg::InitVariant()
{
    SAFEARRAYBOUND bounds[1];
    bounds[0].lLbound = 0;
    bounds[0].cElements = 1776;


    m_varOleData.vt = VT_ARRAY | VT_UI1;
    m_varOleData.parray = SafeArrayCreate(VT_VARIANT, 1, bounds);
    if (!m_varOleData.parray)
    {
        m_varOleData.vt = VT_EMPTY;
        return E_OUTOFMEMORY;
    }

    HRESULT hr = SafeArrayAccessData(
        m_varOleData.parray, reinterpret_cast<void **>(&m_buffer));

    if (FAILED(hr))
        return hr;


    return S_OK;

}

void CfpReaderDlg::OnTimer(UINT_PTR nIDEvent)
{
    // TODO: Add your message handler code here and/or call default

    CDialogEx::OnTimer(nIDEvent);
}





void CfpReaderDlg::OnDestroy()
{
    CDialogEx::OnDestroy();

    // TODO: Add your message handler code here
}


void CAboutDlg::OnClose()
{
    // TODO: Add your message handler code here and/or call default
    return;
    CDialogEx::OnClose();
}


void CAboutDlg::OnLButtonUp(UINT nFlags, CPoint point)
{
    // TODO: Add your message handler code here and/or call default
    EndDialog(NULL);
    //SendMessage(WM_CLOSE);
    CDialogEx::OnLButtonUp(nFlags, point);
}
