VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "Comdlg32.ocx"
Object = "{67397AA1-7FB1-11D0-B148-00A0C922E820}#6.0#0"; "msadodc.ocx"
Begin VB.Form frmEnroll 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Manage Enroll Data"
   ClientHeight    =   9975
   ClientLeft      =   3075
   ClientTop       =   1530
   ClientWidth     =   8310
   Icon            =   "frmEnroll.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   9975
   ScaleWidth      =   8310
   StartUpPosition =   2  '屏幕中心
   Begin MSAdodcLib.Adodc datEnroll 
      Height          =   495
      Left            =   360
      Top             =   8760
      Width           =   1815
      _ExtentX        =   3201
      _ExtentY        =   873
      ConnectMode     =   0
      CursorLocation  =   3
      IsolationLevel  =   -1
      ConnectionTimeout=   15
      CommandTimeout  =   30
      CursorType      =   3
      LockType        =   3
      CommandType     =   8
      CursorOptions   =   0
      CacheSize       =   50
      MaxRecords      =   0
      BOFAction       =   0
      EOFAction       =   0
      ConnectStringType=   1
      Appearance      =   1
      BackColor       =   -2147483643
      ForeColor       =   -2147483640
      Orientation     =   0
      Enabled         =   -1
      Connect         =   ""
      OLEDBString     =   ""
      OLEDBFile       =   ""
      DataSourceName  =   ""
      OtherAttributes =   ""
      UserName        =   ""
      Password        =   ""
      RecordSource    =   ""
      Caption         =   "0/0"
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      _Version        =   393216
   End
   Begin VB.CommandButton BenumbAllManager 
      Caption         =   "BenumbAllManager"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   12
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   5040
      TabIndex        =   37
      Top             =   8760
      Width           =   3015
   End
   Begin VB.CommandButton cmdUdiskDownload 
      Caption         =   "U disk Download"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   450
      Left            =   5040
      TabIndex        =   36
      Top             =   8280
      Width           =   3000
   End
   Begin VB.TextBox txtCardNumber 
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   405
      Left            =   2400
      TabIndex        =   35
      Top             =   1608
      Width           =   1215
   End
   Begin VB.CommandButton cmdDeleteCompany 
      Caption         =   "Delete Company Name"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   450
      Left            =   5085
      TabIndex        =   33
      Top             =   5400
      Width           =   3012
   End
   Begin VB.CommandButton cmdSetCompany 
      Caption         =   "Set Company Name"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   450
      Left            =   5085
      TabIndex        =   32
      Top             =   4920
      Width           =   3012
   End
   Begin VB.CommandButton cmdSendAllEnrollData 
      Caption         =   "Send All Enroll Data"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   450
      Left            =   5085
      TabIndex        =   31
      Top             =   3360
      Width           =   3000
   End
   Begin VB.CommandButton cmdGetName 
      Caption         =   "Get Name Data"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   450
      Left            =   5085
      TabIndex        =   30
      ToolTipText     =   "Get All Enroll Data From Device And Save To DataBase"
      Top             =   3960
      Width           =   3012
   End
   Begin VB.CommandButton cmdSetName 
      Caption         =   "Set Name Data"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   450
      Left            =   5085
      TabIndex        =   29
      ToolTipText     =   "Load All Enroll Data From DataBase And Set To Device"
      Top             =   4440
      Width           =   3012
   End
   Begin VB.CommandButton cmdModifyPrivilege 
      Caption         =   "ModifyPrivilege"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   450
      Left            =   5085
      TabIndex        =   28
      Top             =   6360
      Width           =   3000
   End
   Begin VB.CommandButton cmdUdiskUpload 
      Caption         =   "U disk Upload"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   450
      Left            =   5040
      TabIndex        =   27
      Top             =   7800
      Width           =   3000
   End
   Begin VB.CommandButton cmdSetAllEnrollData 
      Caption         =   "Set All Enroll Data"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   450
      Left            =   5040
      TabIndex        =   26
      ToolTipText     =   "Load All Enroll Data From DataBase And Set To Device"
      Top             =   2880
      Width           =   3000
   End
   Begin VB.CommandButton cmdGetAllEnrollData 
      Caption         =   "Get All Enroll Data"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   450
      Left            =   5085
      TabIndex        =   25
      ToolTipText     =   "Get All Enroll Data From Device And Save To DataBase"
      Top             =   2400
      Width           =   3000
   End
   Begin VB.CommandButton cmdGetEnrollData 
      Caption         =   "Get Enroll Data"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   450
      Left            =   5085
      TabIndex        =   24
      ToolTipText     =   "Get EnrollData From Device"
      Top             =   960
      Width           =   3000
   End
   Begin VB.CommandButton cmdClearData 
      Caption         =   "Clear All Data(E,GL,SL) "
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   450
      Left            =   5085
      TabIndex        =   23
      ToolTipText     =   "Clear EnrollData and LogDat Into Device"
      Top             =   7320
      Width           =   3000
   End
   Begin VB.CommandButton cmdExit 
      Caption         =   "Exit"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   450
      Left            =   5085
      TabIndex        =   22
      Top             =   9240
      Width           =   3000
   End
   Begin VB.CommandButton cmdGetEnrollInfo 
      Caption         =   "Get Enroll Info"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   450
      Left            =   5085
      TabIndex        =   21
      ToolTipText     =   "Get All Enrolled User Info From Device"
      Top             =   5880
      Width           =   3000
   End
   Begin VB.CommandButton cmdDeleteEnrollData 
      Caption         =   "Delete Enroll Data"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   450
      Left            =   5085
      TabIndex        =   20
      ToolTipText     =   "Delete Enroll Data Into Device"
      Top             =   1920
      Width           =   3000
   End
   Begin VB.CommandButton cmdSetEnrollData 
      Caption         =   "Set Enroll Data"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   450
      Left            =   5085
      TabIndex        =   19
      ToolTipText     =   "Set EnrollData To Device"
      Top             =   1440
      Width           =   3000
   End
   Begin VB.CommandButton cmdEmptyEnrollData 
      Caption         =   "Empty Enroll Data"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   450
      Left            =   5085
      TabIndex        =   18
      Top             =   6840
      Width           =   3000
   End
   Begin VB.TextBox txtName 
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   405
      Left            =   1320
      MaxLength       =   16
      TabIndex        =   16
      Top             =   3600
      Width           =   2310
   End
   Begin VB.ComboBox cmbConvType 
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   405
      ItemData        =   "frmEnroll.frx":0442
      Left            =   2160
      List            =   "frmEnroll.frx":0452
      TabIndex        =   15
      Text            =   "None"
      Top             =   4800
      Width           =   1455
   End
   Begin VB.CheckBox chkEnable 
      Caption         =   "Disable User"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   285
      Left            =   465
      TabIndex        =   13
      Top             =   4320
      Width           =   1680
   End
   Begin VB.CommandButton cmdDel 
      Caption         =   "Delete DB"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   564
      Left            =   2415
      TabIndex        =   11
      ToolTipText     =   "Delete All Saved Data From DataBase"
      Top             =   8715
      Width           =   1245
   End
   Begin VB.ComboBox cmbEMachineNumber 
      BeginProperty DataFormat 
         Type            =   1
         Format          =   "0"
         HaveTrueFalseNull=   0
         FirstDayOfWeek  =   0
         FirstWeekOfYear =   0
         LCID            =   2052
         SubFormatType   =   1
      EndProperty
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   405
      ItemData        =   "frmEnroll.frx":046D
      Left            =   2400
      List            =   "frmEnroll.frx":048C
      TabIndex        =   9
      Text            =   "cmbEMachineNumber"
      Top             =   2160
      Width           =   1215
   End
   Begin VB.ComboBox cmbPrivilege 
      BeginProperty DataFormat 
         Type            =   1
         Format          =   "0"
         HaveTrueFalseNull=   0
         FirstDayOfWeek  =   0
         FirstWeekOfYear =   0
         LCID            =   2052
         SubFormatType   =   1
      EndProperty
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   405
      ItemData        =   "frmEnroll.frx":04AB
      Left            =   2400
      List            =   "frmEnroll.frx":04BB
      TabIndex        =   7
      Text            =   "cmbPrivilege"
      Top             =   3120
      Width           =   1215
   End
   Begin VB.ListBox lstEnrollData 
      Height          =   2760
      Left            =   240
      TabIndex        =   4
      Top             =   5760
      Width           =   4740
   End
   Begin VB.TextBox txtEnrollNumber 
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   405
      Left            =   2400
      MaxLength       =   8
      TabIndex        =   2
      Top             =   1065
      Width           =   1215
   End
   Begin VB.ComboBox cmbBackupNumber 
      BeginProperty DataFormat 
         Type            =   1
         Format          =   "0"
         HaveTrueFalseNull=   0
         FirstDayOfWeek  =   0
         FirstWeekOfYear =   0
         LCID            =   2052
         SubFormatType   =   1
      EndProperty
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   405
      ItemData        =   "frmEnroll.frx":04CB
      Left            =   2400
      List            =   "frmEnroll.frx":04F6
      TabIndex        =   0
      Text            =   "cmbBackupNumber"
      Top             =   2640
      Width           =   1215
   End
   Begin MSComDlg.CommonDialog dlgOpen 
      Left            =   0
      Top             =   0
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.Label lblCardNum 
      Caption         =   "Card Number :"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   372
      Left            =   480
      TabIndex        =   34
      Top             =   1680
      Width           =   1692
   End
   Begin VB.Label lbName 
      AutoSize        =   -1  'True
      Caption         =   "Name :"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   288
      Left            =   600
      TabIndex        =   17
      Top             =   3672
      Width           =   660
   End
   Begin VB.Label Label3 
      Caption         =   "ConvType"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   252
      Left            =   480
      TabIndex        =   14
      Top             =   4800
      Width           =   972
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "Total : "
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   288
      Left            =   2268
      TabIndex        =   12
      Top             =   5388
      Width           =   636
   End
   Begin VB.Label lblEMachineNumber 
      AutoSize        =   -1  'True
      Caption         =   "EMachine Number :"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   288
      Left            =   468
      TabIndex        =   10
      Top             =   2160
      Width           =   1836
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Privilege :"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   285
      Left            =   465
      TabIndex        =   8
      Top             =   3135
      Width           =   870
   End
   Begin VB.Label lblMessage 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Message"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   14.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   435
      Left            =   360
      TabIndex        =   6
      Top             =   360
      Width           =   7875
   End
   Begin VB.Label lblEnrollData 
      AutoSize        =   -1  'True
      Caption         =   "Enrolled Data :"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   288
      Left            =   468
      TabIndex        =   5
      Top             =   5376
      Width           =   1356
   End
   Begin VB.Label lblBackupNumber 
      AutoSize        =   -1  'True
      Caption         =   "Backup Number :"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   288
      Left            =   468
      TabIndex        =   3
      Top             =   2700
      Width           =   1620
   End
   Begin VB.Label lblEnrollNum 
      AutoSize        =   -1  'True
      Caption         =   "Enroll Number :"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   285
      Index           =   0
      Left            =   465
      TabIndex        =   1
      Top             =   1125
      Width           =   1440
   End
End
Attribute VB_Name = "frmEnroll"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Const DATASIZE = 1420 / 4
Const NAMESIZE = 54
Public gGetState As Boolean
Dim glngEnrollData As Variant
Dim gTemplngEnrollData(DATASIZE) As Long
Dim glngEnrollPData As Long
Dim gbytEnrollData(DATASIZE * 5) As Byte
Dim mMachineNumber As Long
Dim mDeviceKind As Long
Dim mDeviceVer As Long
Dim mConvKind As Long
Dim glngUserName As Variant
Dim gTempEnrollName(NAMESIZE) As Long

Dim glngEnrollDataString As String
Dim glngUserNameString As String


Private Sub BenumbAllManager_Click()
 Dim vRet As Boolean
    Dim vErrorCode As Long
    
    lblMessage.Caption = "Working..."
    DoEvents
    
    vRet = frmMain.FP_CLOCK1.EnableDevice(mMachineNumber, False)
    If vRet = False Then
        lblMessage.Caption = gstrNoDevice
        Exit Sub
    End If
   
    vRet = frmMain.FP_CLOCK1.BenumbAllManager(mMachineNumber)
    If vRet = True Then
        lblMessage.Caption = "Success!"
    Else
        frmMain.FP_CLOCK1.GetLastError vErrorCode
        lblMessage.Caption = ErrorPrint(vErrorCode)
    End If
    
    frmMain.FP_CLOCK1.EnableDevice mMachineNumber, True
End Sub

Private Sub chkEnable_Click()
 Dim vEnrollNumber As Long
 Dim vRet As Boolean
 Dim vFingerNumber As Long
 Dim bflag As Boolean
 Dim vErrorCode As Long
 
  
   vEnrollNumber = Val(txtEnrollNumber.Text)
    vFingerNumber = cmbBackupNumber.Text
 
If chkEnable.Value = 1 Then
bflag = True
Else
bflag = False
End If
   
 vRet = frmMain.FP_CLOCK1.EnableDevice(mMachineNumber, False)
    If vRet = False Then
        lblMessage.Caption = gstrNoDevice
        Exit Sub
    End If

    vRet = frmMain.FP_CLOCK1.EnableUser(mMachineNumber, vEnrollNumber, mMachineNumber, vFingerNumber, bflag)
    If vRet = True Then
        lblMessage.Caption = "enable user OK"
    Else
        frmMain.FP_CLOCK1.GetLastError vErrorCode
        lblMessage.Caption = ErrorPrint(vErrorCode)
    End If
    
    frmMain.FP_CLOCK1.EnableDevice mMachineNumber, True
End Sub

Private Sub cmdClearData_Click()
    Dim vRet As Boolean
    Dim vErrorCode As Long
    
    lblMessage.Caption = "Working..."
    DoEvents
    
    vRet = frmMain.FP_CLOCK1.EnableDevice(mMachineNumber, False)
    If vRet = False Then
        lblMessage.Caption = gstrNoDevice
        Exit Sub
    End If
   
    vRet = frmMain.FP_CLOCK1.ClearKeeperData(mMachineNumber)
    If vRet = True Then
        lblMessage.Caption = "Success!"
    Else
        frmMain.FP_CLOCK1.GetLastError vErrorCode
        lblMessage.Caption = ErrorPrint(vErrorCode)
    End If
    
    frmMain.FP_CLOCK1.EnableDevice mMachineNumber, True
End Sub

Private Sub cmdDel_Click()
 datEnroll.Recordset.ActiveConnection.Execute "delete * from tblEnroll"
 
End Sub

Private Sub cmdDeleteEnrollData_Click()
    Dim vEnrollNumber As Long
    Dim vEMachineNumber As Long
    Dim vFingerNumber As Long
    Dim vRet As Boolean
    Dim vErrorCode As Long
    
    lblMessage.Caption = "Working..."
    DoEvents
    
    vRet = frmMain.FP_CLOCK1.EnableDevice(mMachineNumber, False)
    If vRet = False Then
        lblMessage.Caption = gstrNoDevice
        Exit Sub
    End If
    
    vEnrollNumber = Val(txtEnrollNumber.Text)
    vEMachineNumber = cmbEMachineNumber.Text
    vFingerNumber = cmbBackupNumber.Text
    
    vRet = frmMain.FP_CLOCK1.DeleteEnrollData(mMachineNumber, vEnrollNumber, vEMachineNumber, vFingerNumber)
    If vRet = True Then
        lblMessage.Caption = "DeleteEnrollData OK"
    Else
        frmMain.FP_CLOCK1.GetLastError vErrorCode
        lblMessage.Caption = ErrorPrint(vErrorCode)
    End If
    
    frmMain.FP_CLOCK1.EnableDevice mMachineNumber, True
End Sub

Private Sub cmdEmptyEnrollData_Click()
    Dim vRet As Boolean
    Dim vErrorCode As Long
    
    lblMessage.Caption = "Working..."
    DoEvents
    
    vRet = frmMain.FP_CLOCK1.EnableDevice(mMachineNumber, False)
    If vRet = False Then
        lblMessage.Caption = gstrNoDevice
        Exit Sub
    End If
   
    vRet = frmMain.FP_CLOCK1.EmptyEnrollData(mMachineNumber)
    If vRet = True Then
        lblMessage.Caption = "Success!"
    Else
        frmMain.FP_CLOCK1.GetLastError vErrorCode
        lblMessage.Caption = ErrorPrint(vErrorCode)
    End If
    
    frmMain.FP_CLOCK1.EnableDevice mMachineNumber, True
End Sub



Private Sub cmdExit_Click()
    Unload Me
    frmMain.Visible = True
End Sub

Private Sub cmdGetAllEnrollData_Click()
    Dim vEnrollNumber As Long
    Dim vEMachineNumber As Long
    Dim vFingerNumber As Long
    Dim vPrivilege As Long
    Dim vEnable As Long
    Dim vFlag As Boolean
    Dim vRet As Long
    Dim vErrorCode As Long
    Dim vStr As String
    Dim i As Long
    Dim vTitle As String
    
    lstEnrollData.Clear
    vTitle = frmEnroll.Caption
    Label2.Caption = ""
    lblMessage.Caption = "Working..."
    DoEvents
    
    vRet = frmMain.FP_CLOCK1.EnableDevice(mMachineNumber, False)
    If vRet = False Then
        lblMessage.Caption = gstrNoDevice
        Exit Sub
    End If

    vRet = frmMain.FP_CLOCK1.ReadAllUserID(mMachineNumber)
    If vRet = True Then
        lblMessage.Caption = "ReadAllUserID OK"
    Else
        frmMain.FP_CLOCK1.GetLastError vErrorCode
        lblMessage.Caption = ErrorPrint(vErrorCode)
        frmMain.FP_CLOCK1.EnableDevice mMachineNumber, True
        Exit Sub
    End If
    
'---- Get Enroll data and save into database -------------
    MousePointer = vbHourglass
    vFlag = False
    With datEnroll
        gGetState = True
        .RecordSource = "select * from " & "tblEnroll"
        .Refresh
        Do
            vRet = frmMain.FP_CLOCK1.GetAllUserID(mMachineNumber, _
                                                 vEnrollNumber, _
                                                 vEMachineNumber, _
                                                 vFingerNumber, _
                                                 vPrivilege, _
                                                 vEnable)
            If vRet <> True Then Exit Do
            vFlag = True
EEE:
            vRet = frmMain.FP_CLOCK1.GetEnrollData(mMachineNumber, _
                                                  vEnrollNumber, _
                                                  vEMachineNumber, _
                                                  vFingerNumber, _
                                                  vPrivilege, _
                                                  glngEnrollData, _
                                                  glngEnrollPData)
           
            If vRet <> True Then
                vFlag = False
                vStr = "GetEnrollData"
                frmMain.FP_CLOCK1.GetLastError vErrorCode
                vRet = MsgBox(ErrorPrint(vErrorCode) & ": Continue ?", vbYesNoCancel, "GetEnrollData")
                If vRet = vbYes Then
                    GoTo EEE
                ElseIf vRet = vbCancel Then
                    MousePointer = vbDefault
                    frmMain.FP_CLOCK1.EnableDevice mMachineNumber, True
                    gGetState = False
                    Exit Sub
                End If
            End If
            
            With .Recordset
'                .FindFirst "[EnrollNumber]=" & CStr(vEnrollNumber)
'                If Not .NoMatch Then
'                    .FindFirst "[EMachineNumber]=" & CStr(vEMachineNumber)
'                    If Not .NoMatch Then
'                        .FindFirst "[FingerNumber]=" & CStr(vFingerNumber)
'                        If Not .NoMatch Then
'                            lblMessage.Caption = "Double ID"
'                            GoTo FFF
'                        End If
'                    End If
'                End If
                
                .AddNew
                !EMachineNumber = vEMachineNumber
                !EnrollNumber = vEnrollNumber
                !FingerNumber = vFingerNumber
                !Privilige = vPrivilege
                
                If vFingerNumber = 10 Then
                    !Password = glngEnrollPData
                ElseIf vFingerNumber = 11 Then
                    !Password = glngEnrollPData
                Else
                    For i = 0 To DATASIZE - 1
                        gbytEnrollData(i * 5) = 1
                        If glngEnrollData(i) < 0 Then
                            gbytEnrollData(i * 5) = 0
                            glngEnrollData(i) = Abs(glngEnrollData(i))
                        End If
                        gbytEnrollData(i * 5 + 1) = (glngEnrollData(i) \ 256 \ 256 \ 256)
                        gbytEnrollData(i * 5 + 2) = (glngEnrollData(i) \ 256 \ 256) Mod 256
                        gbytEnrollData(i * 5 + 3) = (glngEnrollData(i) \ 256) Mod 256
                        gbytEnrollData(i * 5 + 4) = glngEnrollData(i) Mod 256
                    Next
                    !FPdata = gbytEnrollData
                End If
                .Update
FFF:
            End With
            
            lblMessage.Caption = Format(vEMachineNumber, "00#") & "-" & Format(vEnrollNumber, "0000#") & "-" & vFingerNumber
            frmEnroll.Caption = Format(vEnrollNumber, "0000#")
            txtEnrollNumber.Text = vEnrollNumber
            cmbBackupNumber.Text = vFingerNumber
            cmbEMachineNumber.Text = vEMachineNumber
            cmbPrivilege.Text = vPrivilege
            DoEvents
        Loop
        gGetState = False
        If .Recordset.RecordCount > 1 Then .Recordset.MoveLast
    End With
    vTitle = frmEnroll.Caption
    MousePointer = vbDefault
    
    If vFlag = True Then
        lblMessage.Caption = "GetAllUserID OK"
    Else
        lblMessage.Caption = vStr & ":" & ErrorPrint(vErrorCode)
    End If
    
    DoEvents
    frmMain.FP_CLOCK1.EnableDevice mMachineNumber, True
End Sub


Private Sub cmdGetEnrollData_Click()
    Dim vEnrollNumber As Long
    Dim vEMachineNumber As Long
    Dim vFingerNumber As Long
    Dim vPrivilege As Long
    Dim vRet As Boolean
    Dim vErrorCode As Long
    Dim i As Long
    Dim cardnumber As Double
    
    lstEnrollData.Clear
    Label2.Caption = ""
    lstEnrollData.Clear
    lblMessage.Caption = "Working..."
    DoEvents
    
    vRet = frmMain.FP_CLOCK1.EnableDevice(mMachineNumber, False)
    If vRet = False Then
        lblMessage.Caption = gstrNoDevice
        Exit Sub
    End If
    
    vEnrollNumber = Val(txtEnrollNumber.Text)
    vFingerNumber = cmbBackupNumber.Text
    vEMachineNumber = cmbEMachineNumber.Text
    
    vRet = frmMain.FP_CLOCK1.GetEnrollData(mMachineNumber, _
                                          vEnrollNumber, _
                                          vEMachineNumber, _
                                          vFingerNumber, _
                                          vPrivilege, _
                                          glngEnrollData, _
                                          glngEnrollPData)
   If vRet = True Then
        cmbPrivilege.ListIndex = vPrivilege
        lblMessage.Caption = "GetEnrollData OK"
        If vFingerNumber = 10 Then
            lstEnrollData.AddItem (CStr(glngEnrollPData))
        ElseIf vFingerNumber = 11 Then
            txtCardNumber.Text = (CStr(glngEnrollPData))
            If glngEnrollPData < 0 Then
            cardnumber = glngEnrollPData + 4294967296#
            Else
            cardnumber = glngEnrollPData
            End If
            lstEnrollData.AddItem (CStr(cardnumber))
        Else
            For i = 0 To DATASIZE - 1
                lstEnrollData.AddItem (glngEnrollDataString)
            Next
        End If
    Else
        frmMain.FP_CLOCK1.GetLastError vErrorCode
        lblMessage.Caption = ErrorPrint(vErrorCode)
    End If
    
    frmMain.FP_CLOCK1.EnableDevice mMachineNumber, True
End Sub
Private Sub cmdGetEnrollInfo_Click()
    Dim vEMachineNumber As Long
    Dim vEnrollNumber As Long
    Dim vFingerNumber As Long
    Dim vPrivilege As Long
    Dim vEnable As Long
    Dim vRet As Long
    Dim vFlag As Boolean
    Dim vErrorCode As Long
    Dim i As Long
    
    lblEnrollData = "User IDs"
    lstEnrollData.Clear
    lblMessage.Caption = "Working..."
    DoEvents
    
    vRet = frmMain.FP_CLOCK1.EnableDevice(mMachineNumber, False)
    If vRet = False Then
        lblMessage.Caption = gstrNoDevice
        Exit Sub
    End If
    
    vRet = frmMain.FP_CLOCK1.ReadAllUserID(mMachineNumber)
    If vRet = True Then
        lblMessage.Caption = "ReadAllUserID OK"
    Else
        frmMain.FP_CLOCK1.GetLastError vErrorCode
        lblMessage.Caption = ErrorPrint(vErrorCode)
        frmMain.FP_CLOCK1.EnableDevice mMachineNumber, True
        Exit Sub
    End If
    
'------ Show all enroll information ----------
    vFlag = False
    i = 0
    lstEnrollData.AddItem ("No.     EnNo    EMNo    Fp      Priv  Enable")
    Do
        vRet = frmMain.FP_CLOCK1.GetAllUserID(mMachineNumber, _
                                             vEnrollNumber, _
                                             vEMachineNumber, _
                                             vFingerNumber, _
                                             vPrivilege, _
                                             vEnable)
        If vRet <> True Then Exit Do
        vFlag = True
        lstEnrollData.AddItem (Format(i, "00#") & "    " & _
                               Format(vEnrollNumber, "0000#") & "     " & _
                               Format(vEMachineNumber, "00#") & "       " & _
                               Format(vFingerNumber, "0#") & "       " & _
                               CStr(vPrivilege) & "        " & _
                               CStr(vEnable))

        i = i + 1
        Label2.Caption = "Total : " & i
    Loop
    
    If vFlag = True Then
        lblMessage.Caption = "GetAllUserID OK"
    Else
        lblMessage.Caption = ErrorPrint(vErrorCode)
    End If
    
    frmMain.FP_CLOCK1.EnableDevice mMachineNumber, True
End Sub

Private Sub cmdGetName_Click()
    Dim vEnrollNumber As Long
    Dim vEMachineNumber As Long
    Dim vRet As Boolean
    Dim vErrorCode As Long
    Dim i As Long
    Dim vName As String
    
    Dim temp As String
    
    lblMessage.Caption = "Working..."
    DoEvents
    
    vRet = frmMain.FP_CLOCK1.EnableDevice(mMachineNumber, False)
    If vRet = False Then
        lblMessage.Caption = gstrNoDevice
        Exit Sub
    End If
    
    vEnrollNumber = Val(txtEnrollNumber.Text)
    vEMachineNumber = cmbEMachineNumber.Text
    
    vRet = frmMain.FP_CLOCK1.GetUserName(mDeviceKind, _
                                        mMachineNumber, _
                                        vEnrollNumber, _
                                        vEMachineNumber, _
                                        glngUserName)
    If vRet = True Then
        'FontForFK1.SetTextBitmap mDeviceKind, vName, glngUserName 'SmackBio
        txtName.Text = glngUserName 'vName 'SmackBio
        lblMessage.Caption = "GetUserName OK"
    Else
        frmMain.FP_CLOCK1.GetLastError vErrorCode
        lblMessage.Caption = ErrorPrint(vErrorCode)
    End If
    
    frmMain.FP_CLOCK1.EnableDevice mMachineNumber, True
End Sub



Private Sub cmdModifyPrivilege_Click()
    Dim vEnrollNumber As Long
    Dim vFingerNumber As Long
    Dim vEMachineNumber As Long
    Dim vMachinePrivilege As Long
    Dim vRet As Boolean
    Dim vErrorCode As Long
    
    lblMessage.Caption = "Working..."
    DoEvents
    
    vEnrollNumber = Val(txtEnrollNumber.Text)
    vEMachineNumber = cmbEMachineNumber.ListIndex + 1
    vFingerNumber = cmbBackupNumber.ListIndex
    vMachinePrivilege = cmbPrivilege.ListIndex
    
    vRet = frmMain.FP_CLOCK1.EnableDevice(mMachineNumber, False)
    If vRet = False Then
        lblMessage.Caption = gstrNoDevice
        Exit Sub
    End If
    
    vRet = frmMain.FP_CLOCK1.ModifyPrivilege(mMachineNumber, _
                                            vEnrollNumber, _
                                            vEMachineNumber, _
                                            vFingerNumber, _
                                            vMachinePrivilege)
    If vRet = True Then
        lblMessage.Caption = "Success!"
    Else
        frmMain.FP_CLOCK1.GetLastError vErrorCode
        lblMessage.Caption = ErrorPrint(vErrorCode)
    End If
    
    frmMain.FP_CLOCK1.EnableDevice mMachineNumber, True
End Sub

Private Sub cmdSendAllEnrollData_Click()
    Dim vEnrollNumber As Long
    Dim vEMachineNumber As Long
    Dim vFingerNumber As Long
    Dim vPrivilege As Long
    Dim vEnable As Long
    Dim vFlag As Boolean
    Dim vRet As Long
    Dim vErrorCode As Long
    Dim vStr As String
    Dim vByte() As Byte
    Dim i As Long
    Dim vTitle As String
    Dim vConvResult As Long
    
    lstEnrollData.Clear
    vTitle = frmEnroll.Caption
    lblMessage.Caption = "Working..."
    DoEvents
    
    vRet = frmMain.FP_CLOCK1.EnableDevice(mMachineNumber, False)
    If vRet = False Then
        lblMessage.Caption = gstrNoDevice
        Exit Sub
    End If
    
    vFlag = False
    gGetState = True
    MousePointer = vbHourglass
    With datEnroll
        .RecordSource = "select * from " & "tblEnroll"
        .Refresh
         
         With .Recordset
             If .RecordCount = 0 Then GoTo EEE
            .MoveLast
            .MoveFirst
            Do While .EOF = False
                vEMachineNumber = !EMachineNumber
                vEnrollNumber = !EnrollNumber
                vFingerNumber = !FingerNumber
                vPrivilege = !Privilige
                glngEnrollPData = !Password
                If vFingerNumber < 10 Then
                    vStr = !FPdata
                    vByte = vStr
                    For i = 0 To DATASIZE - 1
                        glngEnrollData(i) = vByte(i * 5 + 1)
                        glngEnrollData(i) = glngEnrollData(i) * 256 + vByte(i * 5 + 2)
                        glngEnrollData(i) = glngEnrollData(i) * 256 + vByte(i * 5 + 3)
                        glngEnrollData(i) = glngEnrollData(i) * 256 + vByte(i * 5 + 4)
                        If vByte(i * 5) = 0 Then
                            glngEnrollData(i) = 0 - glngEnrollData(i)
                        End If
                    Next
                End If
FFF:
                '- DATA Conv ------------------------------------------------------------
                'vConvResult = FkCnv4001.FkConvGeneral(vEnrollNumber, _
                '                           mMachineNumber, _
                '                           vFingerNumber, _
                '                           glngEnrollData, _
                '                           glngEnrollData, _
                '                           mConvKind)
                '
                'If vConvResult <> 0 Then
                '    vFlag = False
                '    vStr = "Conv Error"
                '    vRet = MsgBox(vStr & ": Continue ?", vbYesNoCancel, "ConvShToArm")
                '    If vRet = vbYes Then GoTo LLL
                '    If vRet = vbCancel Then GoTo EEE
                'End If
                '-------------------------------------------------------------
            
                vRet = frmMain.FP_CLOCK1.SetEnrollData(mMachineNumber, _
                                                      vEnrollNumber, _
                                                      vEMachineNumber, _
                                                      vFingerNumber + 20, _
                                                      vPrivilege, _
                                                      glngEnrollData, _
                                                      glngEnrollPData)
                If vRet <> True Then
                    vFlag = False
                    vStr = "SetEnrollData"
                    frmMain.FP_CLOCK1.GetLastError vErrorCode
                    vRet = MsgBox(ErrorPrint(vErrorCode) & ": Continue ?", vbYesNoCancel, "SetEnrollData")
                    If vRet = vbYes Then GoTo FFF
                    If vRet = vbCancel Then GoTo EEE
                End If

LLL:
                lblMessage.Caption = "EMachine = " & Format(vEMachineNumber, "00#") & ", ID = " & Format(vEnrollNumber, "000#") & ", FpNo = " & vFingerNumber _
                                    & ", Count = " & (.AbsolutePosition + 1)
                
                frmEnroll.Caption = (.AbsolutePosition + 1)
                DoEvents
                .MoveNext
            Loop
        End With
EEE:
    End With
    vTitle = frmEnroll.Caption
    MousePointer = vbDefault
    gGetState = False
    
    lblMessage.Caption = "SetAllUserData OK"
    DoEvents
    
    frmMain.FP_CLOCK1.EnableDevice mMachineNumber, True
End Sub

Private Sub cmdSetAllEnrollData_Click()
    Dim vEnrollNumber As Long
    Dim vEMachineNumber As Long
    Dim vFingerNumber As Long
    Dim vPrivilege As Long
    Dim vEnable As Long
    Dim vFlag As Boolean
    Dim vRet As Long
    Dim vErrorCode As Long
    Dim vStr As String
    Dim vByte() As Byte
    Dim i As Long
    Dim vTitle As String
    Dim vConvResult As Long
    
    lstEnrollData.Clear
    vTitle = frmEnroll.Caption
    lblMessage.Caption = "Working..."
    DoEvents
    
    vRet = frmMain.FP_CLOCK1.EnableDevice(mMachineNumber, False)
    If vRet = False Then
        lblMessage.Caption = gstrNoDevice
        Exit Sub
    End If
    
    vFlag = False
    gGetState = True
    MousePointer = vbHourglass
    With datEnroll
        .RecordSource = "select * from " & "tblEnroll"
        .Refresh
         
         With .Recordset
             If .RecordCount = 0 Then GoTo EEE
            .MoveLast
            .MoveFirst
            Do While .EOF = False
                vEMachineNumber = !EMachineNumber
                vEnrollNumber = !EnrollNumber
                vFingerNumber = !FingerNumber
                vPrivilege = !Privilige
                glngEnrollPData = !Password
                If vFingerNumber < 10 Then
                    vStr = !FPdata
                    vByte = vStr
                    For i = 0 To DATASIZE - 1
                        glngEnrollData(i) = vByte(i * 5 + 1)
                        glngEnrollData(i) = glngEnrollData(i) * 256 + vByte(i * 5 + 2)
                        glngEnrollData(i) = glngEnrollData(i) * 256 + vByte(i * 5 + 3)
                        glngEnrollData(i) = glngEnrollData(i) * 256 + vByte(i * 5 + 4)
                        If vByte(i * 5) = 0 Then
                            glngEnrollData(i) = 0 - glngEnrollData(i)
                        End If
                    Next
                End If
FFF:
                '- DATA Conv ---------------------------------------------
                'vConvResult = FkCnv4001.FkConvGeneral(vEnrollNumber, _
                '                           mMachineNumber, _
                '                           vFingerNumber, _
                '                           glngEnrollData, _
                '                           glngEnrollData, _
                '                           mConvKind)
                '
                'If vConvResult <> 0 Then
                '    vFlag = False
                '    vStr = "Conv Error"
                '    vRet = MsgBox(vStr & ": Continue ?", vbYesNoCancel, "ConvShToArm")
                '    If vRet = vbYes Then GoTo LLL
                '    If vRet = vbCancel Then GoTo EEE
                'End If
                '-------------------------------------------------------------
            
                vRet = frmMain.FP_CLOCK1.SetEnrollData(mMachineNumber, _
                                                      vEnrollNumber, _
                                                      vEMachineNumber, _
                                                      vFingerNumber, _
                                                      vPrivilege, _
                                                      glngEnrollData, _
                                                      glngEnrollPData)
                If vRet <> True Then
                    vFlag = False
                    vStr = "SetEnrollData"
                    frmMain.FP_CLOCK1.GetLastError vErrorCode
                    vRet = MsgBox(ErrorPrint(vErrorCode) & ": Continue ?", vbYesNoCancel, "SetEnrollData")
                    If vRet = vbYes Then GoTo FFF
                    If vRet = vbCancel Then GoTo EEE
                End If

LLL:
                lblMessage.Caption = "EMachine = " & Format(vEMachineNumber, "00#") & ", ID = " & Format(vEnrollNumber, "000#") & ", FpNo = " & vFingerNumber _
                                    & ", Count = " & (.AbsolutePosition + 1)
                
                frmEnroll.Caption = (.AbsolutePosition + 1)
                DoEvents
                .MoveNext
            Loop
        End With
EEE:
    End With
    vTitle = frmEnroll.Caption
    MousePointer = vbDefault
    gGetState = False
    
    lblMessage.Caption = "SetAllUserData OK"
    DoEvents
    
    frmMain.FP_CLOCK1.EnableDevice mMachineNumber, True
End Sub



Private Sub cmdSetCompany_Click()
    Dim vEMachineNumber As Long
    Dim vRet As Boolean
    Dim vErrorCode As Long
    
    lblMessage.Caption = "Working..."
    DoEvents
    
    vRet = frmMain.FP_CLOCK1.EnableDevice(mMachineNumber, False)
    If vRet = False Then
        lblMessage.Caption = gstrNoDevice
        Exit Sub
    End If
    
    vEMachineNumber = cmbEMachineNumber.Text
    
    glngUserName = txtName.Text 'SmackBio
    'vRet = FontForFK1.GetTextBitmap(FK_Company, txtName.Text, glngUserName) 'SmackBio
    
    vRet = frmMain.FP_CLOCK1.SetCompanyName(mMachineNumber, _
                                           1, _
                                           glngUserName)
    If vRet = True Then
        lblMessage.Caption = "Set Company Name OK"
    Else
        frmMain.FP_CLOCK1.GetLastError vErrorCode
        lblMessage.Caption = ErrorPrint(vErrorCode)
    End If
    
    frmMain.FP_CLOCK1.EnableDevice mMachineNumber, True

End Sub


Private Sub cmdSetEnrollData_Click()
    Dim vEnrollNumber As Long
    Dim vCardNumber As Double
    Dim vEMachineNumber As Long
    Dim vFingerNumber As Long
    Dim vPrivilege As Long
    Dim vRet As Boolean
    Dim vErrorCode As Long
    Dim vConvResult As Long
    
    lblMessage.Caption = "Working..."
    DoEvents
    
    vEnrollNumber = Val(txtEnrollNumber.Text)
    vCardNumber = Val(txtCardNumber.Text)
    vFingerNumber = cmbBackupNumber.Text
    vPrivilege = cmbPrivilege.Text
    vEMachineNumber = cmbEMachineNumber.Text
    
    ' Card Number valid
    If vCardNumber <> 0 Then
        If vFingerNumber = 11 Then
            If vCardNumber > 2147483647 Then
            glngEnrollPData = vCardNumber - 4294967296#
            Else
            glngEnrollPData = vCardNumber
            End If
        End If
    End If
    '- DATA Conv ------------------------------------------------------------
    'vConvResult = FkCnv4001.FkConvGeneral(vEnrollNumber, _
    '                                    mMachineNumber, _
    '                                    vFingerNumber, _
    '                                    glngEnrollData, _
    '                                    glngEnrollData, _
    '                                    mConvKind)
    '
    'If vConvResult <> 0 Then
    '    lblMessage.Caption = "Conv Error"
    '    Exit Sub
    'End If
    
    vRet = frmMain.FP_CLOCK1.EnableDevice(mMachineNumber, False)
    If vRet = False Then
        lblMessage.Caption = gstrNoDevice
        Exit Sub
    End If

    vRet = frmMain.FP_CLOCK1.SetEnrollData(mMachineNumber, _
                                          vEnrollNumber, _
                                          vEMachineNumber, _
                                          vFingerNumber, _
                                          vPrivilege, _
                                          glngEnrollData, _
                                          glngEnrollPData)
                            
    If vRet = True Then
        lblMessage.Caption = "SetEnrollData OK"
    Else
        frmMain.FP_CLOCK1.GetLastError vErrorCode
        lblMessage.Caption = ErrorPrint(vErrorCode)
    End If
    
    frmMain.FP_CLOCK1.EnableDevice mMachineNumber, True
End Sub


Private Sub cmdUdiskDownload_Click()
    Dim vEnrollNumber As Long
    Dim vEMachineNumber As Long
    Dim vFingerNumber As Long
    Dim vPrivilege As Long
    Dim vEnable As Long
    Dim vFlag As Boolean
    Dim vRet As Long
    Dim vErrorCode As Long
    Dim vStr As String
    Dim vByte() As Byte
    Dim i As Long
    Dim vTitle As String
    Dim vConvResult As Long
    Dim vEnrollName As String
    Dim vstrFileName As String
    
    lstEnrollData.Clear
    
    
    dlgOpen.CancelError = False
    dlgOpen.Flags = cdlOFNHideReadOnly
    dlgOpen.Filter = "DAT Files (*.dat)|*.dat|All Files (*.*)|*.*"
    dlgOpen.FilterIndex = 1
    dlgOpen.InitDir = CurDir
    dlgOpen.ShowSave
    vstrFileName = dlgOpen.FileName
    If vstrFileName = "" Then Exit Sub
    
    
    
    vTitle = frmEnroll.Caption
    lblMessage.Caption = "Working..."
    DoEvents
    
    
    vFlag = False
    gGetState = True
    MousePointer = vbHourglass
    frmMain.FP_CLOCK1.UsbEnrollDataStart
    With datEnroll
        .RecordSource = "select * from " & "tblEnroll"
        .Refresh
         
         With .Recordset
             If .RecordCount = 0 Then GoTo EEE
            .MoveLast
            .MoveFirst
            Do While .EOF = False
                vEMachineNumber = !EMachineNumber
                vEnrollNumber = !EnrollNumber
                vFingerNumber = !FingerNumber
                vPrivilege = !Privilige
                glngEnrollPData = !Password
               ' vEnrollName = !EnrollName
                glngUserName = vEnrollName
                If vFingerNumber < 10 Then
                    vStr = !FPdata
                    vByte = vStr
                    For i = 0 To DATASIZE - 1
                        glngEnrollData(i) = vByte(i * 5 + 1)
                        glngEnrollData(i) = glngEnrollData(i) * 256 + vByte(i * 5 + 2)
                        glngEnrollData(i) = glngEnrollData(i) * 256 + vByte(i * 5 + 3)
                        glngEnrollData(i) = glngEnrollData(i) * 256 + vByte(i * 5 + 4)
                        If vByte(i * 5) = 0 Then
                            glngEnrollData(i) = 0 - glngEnrollData(i)
                        End If
                    Next
                End If
FFF:
                vRet = frmMain.FP_CLOCK1.SetUsbEnrollData(vEnrollNumber, _
                                                      vFingerNumber, _
                                                      vPrivilege, _
                                                      glngEnrollData, _
                                                      glngEnrollPData, _
                                                      glngUserName)
                If vRet <> True Then
                    vFlag = False
                    vStr = "SetUSBEnrollData"
                    frmMain.FP_CLOCK1.GetLastError vErrorCode
                    GoTo EEE
                End If

LLL:
                lblMessage.Caption = "ID = " & Format(vEnrollNumber, "000#") & ", FpNo = " & vFingerNumber _
                                    & ", Count = " & (.AbsolutePosition + 1)
                
                frmEnroll.Caption = (.AbsolutePosition + 1)
                DoEvents
                .MoveNext
            Loop
        End With
EEE:
    End With
    
     vRet = frmMain.FP_CLOCK1.EnrollDataSaveTOFile(vstrFileName)
    If vRet = True Then
        lblMessage.Caption = "USBWriteAllEnrollDatatoFile OK"
    Else
        frmMain.FP_CLOCK1.GetLastError vErrorCode
        lblMessage.Caption = ErrorPrint(vErrorCode)
        Exit Sub
    End If
    
    
    
    vTitle = frmEnroll.Caption
    MousePointer = vbDefault
    gGetState = False
    
    lblMessage.Caption = "SetAllUserData OK"
    DoEvents
End Sub




Private Sub cmdUdiskUpload_Click()

    Dim vstrFileName As String
    
    Dim vEnrollNumber As Long
     Dim vFingerNumber As Long
    Dim vPrivilege As Long
   Dim vEnable As Long
    Dim vFlag As Boolean
    Dim vRet As Long
    Dim vErrorCode As Long
    Dim vStr As String
    Dim i As Long
    Dim vTitle As String
     Dim vEnrollName As String
    
    
    dlgOpen.CancelError = False
    dlgOpen.Flags = cdlOFNHideReadOnly
    dlgOpen.Filter = "DAT Files (*.dat)|*.dat|All Files (*.*)|*.*"
    dlgOpen.FilterIndex = 1
    dlgOpen.InitDir = CurDir
    dlgOpen.ShowOpen
    vstrFileName = dlgOpen.FileName
    If vstrFileName = "" Then Exit Sub
    
    lstEnrollData.Clear
    vTitle = Me.Caption
    lblMessage.Caption = "Working..."
    DoEvents
    
    
    frmMain.FP_CLOCK1.UsbEnrollDataStart
    
    vRet = frmMain.FP_CLOCK1.EnrollDataReadFromFile(vstrFileName)
    If vRet = True Then
        lblMessage.Caption = "USBReadAllEnrollDataFromFile OK"
    Else
        frmMain.FP_CLOCK1.GetLastError vErrorCode
        lblMessage.Caption = ErrorPrint(vErrorCode)
        Exit Sub
    End If

'---- Get Enroll data and save into database -------------
  MousePointer = vbHourglass

    With datEnroll
        gGetState = True
        .RecordSource = "select * from " & "tblEnroll"
        .Refresh
        Do
EEE:
            vRet = frmMain.FP_CLOCK1.GetUsbEnrollData(vEnrollNumber, _
                                                  vFingerNumber, _
                                                  vPrivilege, _
                                                  glngEnrollData, _
                                                  glngEnrollPData, _
                                                  glngUserName)
            If vRet <> True Then
                vFlag = False
                vStr = "GetEnrollData"
                frmMain.FP_CLOCK1.GetLastError vErrorCode
                If vErrorCode = 6 Then 'enroll end
                vFlag = True
                End If
                Exit Do
            End If
            
         With .Recordset
                .AddNew
                !EMachineNumber = 1
                !EnrollNumber = vEnrollNumber
                !FingerNumber = vFingerNumber
                !Privilige = vPrivilege
                vEnrollName = CStr(glngUserName)
                !EnrollName = vEnrollName
                
                If vFingerNumber = 10 Then
                    !Password = glngEnrollPData
                ElseIf vFingerNumber = 11 Then
                    !Password = glngEnrollPData
                Else
                    For i = 0 To DATASIZE - 1
                        gbytEnrollData(i * 5) = 1
                        If glngEnrollData(i) < 0 Then
                            gbytEnrollData(i * 5) = 0
                            glngEnrollData(i) = Abs(glngEnrollData(i))
                        End If
                        gbytEnrollData(i * 5 + 1) = (glngEnrollData(i) \ 256 \ 256 \ 256)
                        gbytEnrollData(i * 5 + 2) = (glngEnrollData(i) \ 256 \ 256) Mod 256
                        gbytEnrollData(i * 5 + 3) = (glngEnrollData(i) \ 256) Mod 256
                        gbytEnrollData(i * 5 + 4) = glngEnrollData(i) Mod 256
                    Next
                    !FPdata = gbytEnrollData
                End If
                .Update
FFF:
           
             End With
            lblMessage.Caption = Format(vEnrollNumber, "0000#") & "-" & vFingerNumber
            frmEnroll.Caption = Format(vEnrollNumber, "0000#")
            txtEnrollNumber.Text = vEnrollNumber
            cmbBackupNumber.Text = vFingerNumber
            cmbEMachineNumber.Text = 1
            cmbPrivilege.Text = vPrivilege
            DoEvents
        Loop
            gGetState = False
            If .Recordset.RecordCount > 1 Then .Recordset.MoveLast
            
        End With
       
   Me.Caption = vTitle
    MousePointer = vbDefault

   If vFlag = True Then
        lblMessage.Caption = "UdiskUpload OK"
    Else
        lblMessage.Caption = vStr & ":" & ErrorPrint(vErrorCode)
    End If
End Sub

Private Sub datEnroll_Reposition()
    If gGetState = True Then Exit Sub
    With datEnroll.Recordset
        datEnroll.Caption = (.AbsolutePosition + 1) & "/" & .RecordCount
        If .RecordCount > 1 Then CurRecView
    End With
End Sub

Private Sub Form_Load()
    cmbBackupNumber.ListIndex = 0
    cmbEMachineNumber.ListIndex = 0
    txtEnrollNumber.Text = 1
    txtCardNumber.Text = 0
    cmbPrivilege.Text = 0
    gGetState = False
    cmbConvType.ListIndex = 0
    
    If VarType(glngEnrollData) = vbEmpty Then
        glngEnrollData = gTemplngEnrollData
    End If
    If VarType(glngUserName) = vbEmpty Then
        glngUserName = gTempEnrollName
    End If
   
    With datEnroll
        .ConnectionString = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & App.Path & "\datEnrollDat.mdb;Persist Security Info=False"
        .RecordSource = "select * from tblEnroll"
        .Refresh
        If .Recordset.RecordCount > 0 Then
            .Recordset.MoveLast
            .Recordset.MoveFirst
        End If
        .Caption = .Recordset.RecordCount
    End With
    mMachineNumber = frmMain.gMachineNumber
    frmMain.FP_CLOCK1.GetModel mMachineNumber, mDeviceKind, mDeviceVer
    mConvKind = 0
    If mDeviceKind = FK_328 Then
        lblMessage.Caption = "FK328KM Device Ver " & Format(mDeviceVer)
        mConvKind = 1
        cmdSendAllEnrollData.Enabled = False
        cmdSetCompany.Enabled = False
        cmdDeleteCompany.Enabled = False
    ElseIf mDeviceKind = FK_338 Then
        lblMessage.Caption = "FK338KM Device Ver " & Format(mDeviceVer)
        mConvKind = 4
        cmdSendAllEnrollData.Enabled = False
        cmdSetCompany.Enabled = False
        cmdDeleteCompany.Enabled = False
    ElseIf mDeviceKind = FK_528 Then
        lblMessage.Caption = "FK528KM Device Ver " & Format(mDeviceVer)
        mConvKind = 2
    ElseIf mDeviceKind = FK_526 Then
        lblMessage.Caption = "FK526EA Device Ver " & Format(mDeviceVer)
        mConvKind = 3
    ElseIf mDeviceKind = 0 Then
        lblMessage.Caption = " Device Invalid "
        mConvKind = 0
    End If
       
End Sub

Private Sub Form_Unload(Cancel As Integer)
    Me.Visible = False
    frmMain.Visible = True
End Sub

Private Function CurRecView()
    Dim vStr As String
    Dim vByte() As Byte
    Dim i As Long
    
    With datEnroll.Recordset
        If .RecordCount = 0 Then Exit Function
        If .AbsolutePosition = -1 Then Exit Function
        If !EnrollNumber <= 0 Then Exit Function
        txtEnrollNumber = !EnrollNumber
        cmbBackupNumber = !FingerNumber
        cmbEMachineNumber = !EMachineNumber
        lstEnrollData.Clear
        If !FingerNumber = 10 Then
            lstEnrollData.AddItem !Password
        End If
        If !FingerNumber < 10 Then
            vStr = !FPdata
            vByte = vStr
            For i = 0 To DATASIZE - 1
                glngEnrollData(i) = vByte(i * 5 + 1)
                glngEnrollData(i) = glngEnrollData(i) * 256 + vByte(i * 5 + 2)
                glngEnrollData(i) = glngEnrollData(i) * 256 + vByte(i * 5 + 3)
                glngEnrollData(i) = glngEnrollData(i) * 256 + vByte(i * 5 + 4)
                If vByte(i * 5) = 0 Then
                    glngEnrollData(i) = 0 - glngEnrollData(i)
                End If
                lstEnrollData.AddItem (CStr(glngEnrollData(i)))
            Next
        End If
    End With
End Function

Private Sub txtName_Change()
    ' SH3 Kind = 1
    ' FontForFK1.GetTextBitmap 1, txtName.Text, glngUserName
    ' Arm 44b0 Kind = 2
    ' FontForFK1.GetTextBitmap 2, txtName.Text, glngUserName 'SmackBio
End Sub
