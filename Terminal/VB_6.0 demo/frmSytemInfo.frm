VERSION 5.00
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomct2.ocx"
Begin VB.Form frmSystemInfo 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Manage System Info"
   ClientHeight    =   5295
   ClientLeft      =   4995
   ClientTop       =   3105
   ClientWidth     =   7050
   Icon            =   "frmSytemInfo.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   5295
   ScaleWidth      =   7050
   StartUpPosition =   2  'ÆÁÄ»ÖÐÐÄ
   Begin VB.TextBox txtinoutchar 
      Height          =   375
      Left            =   720
      TabIndex        =   20
      Text            =   "inout1"
      Top             =   4680
      Width           =   2415
   End
   Begin VB.TextBox txtinoutindex 
      Height          =   375
      Left            =   240
      TabIndex        =   19
      Text            =   "1"
      Top             =   4680
      Width           =   375
   End
   Begin VB.CommandButton cmdSetinoutchar 
      Caption         =   "Setinoutchar"
      Height          =   375
      Left            =   5400
      TabIndex        =   18
      Top             =   4680
      Width           =   1455
   End
   Begin VB.CommandButton cmdGetinoutchar 
      Caption         =   "Getinoutchar"
      Height          =   375
      Left            =   3600
      TabIndex        =   17
      Top             =   4680
      Width           =   1575
   End
   Begin VB.CommandButton Command1 
      Caption         =   "SetSystemTime"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   480
      Left            =   4680
      TabIndex        =   16
      Top             =   4080
      Width           =   1875
   End
   Begin MSComCtl2.DTPicker DTPicker1 
      Height          =   375
      Left            =   480
      TabIndex        =   15
      Top             =   4080
      Width           =   3255
      _ExtentX        =   5741
      _ExtentY        =   661
      _Version        =   393216
      CustomFormat    =   "yyyy-mm-dd HH:mm:ss"
      Format          =   92405763
      CurrentDate     =   40284
   End
   Begin VB.CommandButton cmdSetDeviceTime 
      Caption         =   "SetDeviceTime"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   480
      Left            =   300
      TabIndex        =   14
      Top             =   1800
      Width           =   1875
   End
   Begin VB.CommandButton cmdGetDeviceTime 
      Caption         =   "GetDeviceTime"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   480
      Left            =   300
      TabIndex        =   13
      Top             =   1170
      Width           =   1875
   End
   Begin VB.CommandButton cmdGetDeviceInfo 
      Caption         =   "GetDeviceInfo"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   480
      Left            =   300
      TabIndex        =   12
      Top             =   3315
      Width           =   1875
   End
   Begin VB.CommandButton cmdExit 
      Caption         =   "Exit"
      Default         =   -1  'True
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   480
      Left            =   4665
      TabIndex        =   11
      Top             =   1800
      Width           =   1875
   End
   Begin VB.CommandButton cmdPowerOn 
      Caption         =   "PowerOnDevice"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   480
      Left            =   2430
      TabIndex        =   10
      Top             =   1170
      Width           =   1875
   End
   Begin VB.CommandButton PowerOffDevice 
      Caption         =   "PowerOffDevice"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   480
      Left            =   2430
      TabIndex        =   9
      Top             =   1800
      Width           =   1875
   End
   Begin VB.CommandButton cmdSetDeviceInfo 
      Caption         =   "SetDeviceInfo"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   480
      Left            =   2430
      TabIndex        =   8
      Top             =   3315
      Width           =   1875
   End
   Begin VB.CommandButton cmdEnableDevice 
      Caption         =   "DisableDevice"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   480
      Left            =   4665
      TabIndex        =   7
      Top             =   1185
      Width           =   1875
   End
   Begin VB.ComboBox cmbSatus 
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
      ItemData        =   "frmSytemInfo.frx":0442
      Left            =   2340
      List            =   "frmSytemInfo.frx":0482
      Style           =   2  'Dropdown List
      TabIndex        =   5
      Top             =   2640
      Width           =   1320
   End
   Begin VB.TextBox txtSetDevInfo 
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
      Left            =   5520
      TabIndex        =   4
      Top             =   2595
      Width           =   885
   End
   Begin VB.CommandButton cmdGetDeviceStaus 
      Caption         =   "GetDeviceStatus"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   480
      Left            =   4665
      TabIndex        =   2
      Top             =   3315
      Width           =   1875
   End
   Begin VB.CheckBox chkEnableDevice 
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   345
      Left            =   4410
      TabIndex        =   1
      Top             =   1260
      Width           =   225
   End
   Begin VB.Label Label1 
      Caption         =   "Status Value:"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   345
      Left            =   4125
      TabIndex        =   6
      Top             =   2670
      Width           =   1275
   End
   Begin VB.Label lblStatus 
      Caption         =   "Status Paramerter:  Info Paramerter:"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   450
      TabIndex        =   3
      Top             =   2535
      Width           =   1740
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
      Height          =   420
      Left            =   345
      TabIndex        =   0
      Top             =   405
      Width           =   6210
   End
End
Attribute VB_Name = "frmSystemInfo"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim mMachineNumber As Long

Private Sub cmdEnableDevice_Click()
    Dim vFlag As Long
    Dim vRet As Boolean
    Dim vErrorCode As Long
    
    lblMessage.Caption = "Working..."
    DoEvents
    
    vFlag = chkEnableDevice.Value
    
    vRet = frmMain.FP_CLOCK1.EnableDevice(mMachineNumber, vFlag)
    If vRet = True Then
        If vFlag = 1 Then
            lblMessage.Caption = "Enable Device Success!"
        Else
            lblMessage.Caption = "Disable Device Success!"
        End If
    Else
        frmMain.FP_CLOCK1.GetLastError vErrorCode
        lblMessage.Caption = ErrorPrint(vErrorCode)
        Exit Sub
    End If
    
    If chkEnableDevice.Value = 1 Then
        chkEnableDevice.Value = 0
    Else
        chkEnableDevice.Value = 1
    End If
    
    DoEvents
End Sub

Private Sub cmdGetDeviceInfo_Click()
    Dim vInfo As Long
    Dim vValue(0) As Long
    Dim vRet As Boolean
    Dim vErrorCode As Long
    
    lblMessage.Caption = "Working..."
    DoEvents
    
    vInfo = cmbSatus.ListIndex + 1
    
    vRet = frmMain.FP_CLOCK1.EnableDevice(mMachineNumber, False)
    If vRet = False Then
        lblMessage.Caption = gstrNoDevice
        Exit Sub
    End If
    
    vRet = frmMain.FP_CLOCK1.GetDeviceInfo(mMachineNumber, vInfo, vValue(0))
    If vRet = True Then
        Select Case vInfo
            Case 1:  lblMessage.Caption = "(1) = ManagerCount = " & vValue(0)
            Case 2:  lblMessage.Caption = "(2) = Device ID = " & vValue(0)
            Case 3:  lblMessage.Caption = "(3) = Language = " & vValue(0)
            Case 4:  lblMessage.Caption = "(4) = PowerOffTime = " & vValue(0)
            Case 5:  lblMessage.Caption = "(5) = LockOperate = " & vValue(0)
            Case 6:  lblMessage.Caption = "(6) = GLogWarning = " & vValue(0)
            Case 7:  lblMessage.Caption = "(7) = SLogWarning = " & vValue(0)
            Case 8:  lblMessage.Caption = "(8) = ReVerifyTime = " & vValue(0)
            Case 9:  lblMessage.Caption = "(9) = Baudrate = " & vValue(0)
            Case 10: lblMessage.Caption = "(10) = DateSeperate = " & vValue(0)
            
            Case 13: lblMessage.Caption = "(13) = Opendoordelay = " & vValue(0)  '0~255 opendoor time
            Case 14: lblMessage.Caption = "(14) = sensortype = " & vValue(0) ' 1 enable door sensor 0 disable doorsensor
            Case 15: lblMessage.Caption = "(15) = antipass = " & vValue(0)  '1 enable antipass function 0 disable
            Case 16: lblMessage.Caption = "(16) = twodoor = " & vValue(0)    '0 disable 1' must another door is closed and then can open the door
            Case 17: lblMessage.Caption = "(17) = muti_user = " & vValue(0)  '0 disable 1~5 must 1~5  usser verify at the same time and then can open the door
            Case 18: lblMessage.Caption = "(18) = verifymode = " & vValue(0)  '0 fp/card/pwd 1 :card+fp 2:fp+pwd 3:card+fp+pwd 4:card+pwd
        End Select
    Else
        frmMain.FP_CLOCK1.GetLastError vErrorCode
        lblMessage.Caption = ErrorPrint(vErrorCode)
    End If
    
    frmMain.FP_CLOCK1.EnableDevice mMachineNumber, True
End Sub

Private Sub cmdGetDeviceStaus_Click()
    Dim vStatus As Long
    Dim vValue(0) As Long
    Dim vRet As Boolean
    Dim vErrorCode As Long
    
    lblMessage.Caption = "Working..."
    DoEvents
    
    vStatus = cmbSatus.ListIndex + 1
    
    vRet = frmMain.FP_CLOCK1.EnableDevice(mMachineNumber, False)
    If vRet = False Then
        lblMessage.Caption = gstrNoDevice
        Exit Sub
    End If
    
    vRet = frmMain.FP_CLOCK1.GetDeviceStatus(mMachineNumber, vStatus, vValue(0))
    If vRet = True Then
        Select Case vStatus
            Case 1:  lblMessage.Caption = "(1) = Manager count = " & vValue(0)
            Case 2:  lblMessage.Caption = "(2) = User count = " & vValue(0)
            Case 3:  lblMessage.Caption = "(3) = Fp count = " & vValue(0)
            Case 4:  lblMessage.Caption = "(4) = Password count = " & vValue(0)
            Case 5:  lblMessage.Caption = "(5) = SLog count = " & vValue(0)
            Case 6:  lblMessage.Caption = "(6) = GLog count = " & vValue(0)
        End Select
    Else
        frmMain.FP_CLOCK1.GetLastError vErrorCode
        lblMessage.Caption = ErrorPrint(vErrorCode)
    End If
    
    frmMain.FP_CLOCK1.EnableDevice mMachineNumber, True
End Sub

Private Sub cmdGetDeviceTime_Click()
    Dim vYear As Long
    Dim vMonth As Long
    Dim vDay As Long
    Dim vHour As Long
    Dim vMinute As Long
    Dim vDayOfWeek As Long
    Dim strDataTime As String
    Dim vRet As Boolean
    Dim vErrorCode As Long
    
    lblMessage.Caption = "Working..."
    DoEvents
    
    vRet = frmMain.FP_CLOCK1.EnableDevice(mMachineNumber, False)
    If vRet = False Then
        lblMessage.Caption = gstrNoDevice
        Exit Sub
    End If
    
    vRet = frmMain.FP_CLOCK1.GetDeviceTime(mMachineNumber, vYear, vMonth, vDay, vHour, vMinute, vDayOfWeek)
    If vRet = True Then
        If vDayOfWeek = 0 Then vDayOfWeek = 7
        strDataTime = "Date = " & CStr(vYear) & "/" & CStr(vMonth) & "/" & CStr(vDay) & " , " & GetWeekDay(vDayOfWeek) & _
                        " , Time = " & CStr(vHour) & ":" & Format(CStr(vMinute), "0#")
        lblMessage.Caption = strDataTime
    Else
        frmMain.FP_CLOCK1.GetLastError vErrorCode
        lblMessage.Caption = ErrorPrint(vErrorCode)
    End If
    frmMain.FP_CLOCK1.EnableDevice mMachineNumber, True
    DoEvents
End Sub

Private Sub cmdGetDoorStatus_Click()
    Dim vInfo As Long
    Dim vValue(0) As Long
    Dim vErrorCode As Long
    Dim vRet As Boolean
    
    lblMessage.Caption = "Working..."
    DoEvents
    
    vRet = frmMain.FP_CLOCK1.EnableDevice(mMachineNumber, False)
    If vRet = False Then
        lblMessage.Caption = gstrNoDevice
        Exit Sub
    End If
    
    vRet = frmMain.FP_CLOCK1.GetDoorStatus(mMachineNumber, vValue(0))
    If vRet = True Then
        lblMessage.Caption = "Success!"
    Else
        frmMain.FP_CLOCK1.GetLastError vErrorCode
        lblMessage.Caption = ErrorPrint(vErrorCode)
    End If
    
    txtSetDevInfo.Text = vValue(0)
    
    frmMain.FP_CLOCK1.EnableDevice mMachineNumber, True
    DoEvents

End Sub

Private Sub cmdGetinoutchar_Click()
 Dim vInfo As Long
    Dim vValue As Long
    Dim vErrorCode As Long
    Dim vRet As Boolean
    Dim str As String
    
    lblMessage.Caption = "Working..."
    DoEvents
    
    vValue = Val(txtinoutindex.Text)
    
    vRet = frmMain.FP_CLOCK1.EnableDevice(mMachineNumber, False)
    If vRet = False Then
        lblMessage.Caption = gstrNoDevice
        Exit Sub
    End If
    
    vRet = frmMain.FP_CLOCK1.GetInoutchar(mMachineNumber, vValue, str)
    If vRet = True Then
        lblMessage.Caption = "Success!"
        txtinoutchar.Text = str
    Else
        frmMain.FP_CLOCK1.GetLastError vErrorCode
        lblMessage.Caption = ErrorPrint(vErrorCode)
    End If
    frmMain.FP_CLOCK1.EnableDevice mMachineNumber, True
    DoEvents
End Sub

Private Sub cmdPowerOn_Click()
    frmMain.FP_CLOCK1.PowerOnAllDevice
End Sub

Private Sub cmdSetDeviceInfo_Click()
    Dim vInfo As Long
    Dim vValue As Long
    Dim vErrorCode As Long
    Dim vRet As Boolean
    
    lblMessage.Caption = "Working..."
    DoEvents
    
    vInfo = cmbSatus.ListIndex + 1
    vValue = Val(txtSetDevInfo.Text)
    
    vRet = frmMain.FP_CLOCK1.EnableDevice(mMachineNumber, False)
    If vRet = False Then
        lblMessage.Caption = gstrNoDevice
        Exit Sub
    End If
    
    vRet = frmMain.FP_CLOCK1.SetDeviceInfo(mMachineNumber, vInfo, vValue)
    If vRet = True Then
        lblMessage.Caption = "Success!"
        
        'SmackBio
        If vInfo = 2 Then
            mMachineNumber = vValue
            Sleep 1000
        End If
    Else
        frmMain.FP_CLOCK1.GetLastError vErrorCode
        lblMessage.Caption = ErrorPrint(vErrorCode)
    End If
    frmMain.FP_CLOCK1.EnableDevice mMachineNumber, True
    DoEvents
End Sub

Private Sub cmdSetDeviceTime_Click()
    Dim vRet As Boolean
    Dim vErrorCode As Long
    
    lblMessage.Caption = "Working..."
    DoEvents
    
    vRet = frmMain.FP_CLOCK1.EnableDevice(mMachineNumber, False)
    If vRet = False Then
        lblMessage.Caption = gstrNoDevice
        Exit Sub
    End If
    
    vRet = frmMain.FP_CLOCK1.SetDeviceTime(mMachineNumber)
    If vRet = True Then
        lblMessage.Caption = "Success!"
    Else
        frmMain.FP_CLOCK1.GetLastError vErrorCode
        lblMessage.Caption = ErrorPrint(vErrorCode)
    End If
    
    frmMain.FP_CLOCK1.EnableDevice mMachineNumber, True
    DoEvents
End Sub

Private Sub cmdSetDoorStatus_Click()
    Dim vInfo As Long
    Dim vValue As Long
    Dim vErrorCode As Long
    Dim vRet As Boolean
    
    lblMessage.Caption = "Working..."
    DoEvents
    
    vValue = Val(txtSetDevInfo.Text)
    
    vRet = frmMain.FP_CLOCK1.EnableDevice(mMachineNumber, False)
    If vRet = False Then
        lblMessage.Caption = gstrNoDevice
        Exit Sub
    End If
    
    vRet = frmMain.FP_CLOCK1.SetDoorStatus(mMachineNumber, vValue)
    If vRet = True Then
        lblMessage.Caption = "Success!"
    Else
        frmMain.FP_CLOCK1.GetLastError vErrorCode
        lblMessage.Caption = ErrorPrint(vErrorCode)
    End If
    frmMain.FP_CLOCK1.EnableDevice mMachineNumber, True
    DoEvents
End Sub



Private Sub cmdSetinoutchar_Click()
    Dim vInfo As Long
    Dim vValue As Long
    Dim vErrorCode As Long
    Dim vRet As Boolean
    Dim str  As String
    
    lblMessage.Caption = "Working..."
    DoEvents
    
    vValue = Val(txtinoutindex.Text)
    
    str = txtinoutchar.Text
    
    vRet = frmMain.FP_CLOCK1.EnableDevice(mMachineNumber, False)
    If vRet = False Then
        lblMessage.Caption = gstrNoDevice
        Exit Sub
    End If
    
    vRet = frmMain.FP_CLOCK1.SetInoutchar(mMachineNumber, vValue, str)
    If vRet = True Then
        lblMessage.Caption = "Success!"
    Else
        frmMain.FP_CLOCK1.GetLastError vErrorCode
        lblMessage.Caption = ErrorPrint(vErrorCode)
    End If
    frmMain.FP_CLOCK1.EnableDevice mMachineNumber, True
    DoEvents
End Sub

Private Sub Command1_Click()
    Dim tmp_Date As Date
    
    tmp_Date = Format(DTPicker1.Value, "yyyy-mm-dd hh:MM:ss")
    Date = tmp_Date
    Time = tmp_Date
End Sub

Private Sub PowerOffDevice_Click()
    Dim vRet As Boolean
    Dim vErrorCode As Long
    
    lblMessage.Caption = "Working..."
    DoEvents
    
    vRet = frmMain.FP_CLOCK1.PowerOffDevice(mMachineNumber)
    If vRet = True Then
        lblMessage.Caption = "Success!"
    Else
        lblMessage.Caption = ErrorPrint(vErrorCode)
        frmMain.FP_CLOCK1.GetLastError vErrorCode
    End If
End Sub

Private Sub Form_Load()
    cmbSatus.ListIndex = 0
    mMachineNumber = frmMain.gMachineNumber
End Sub

Private Sub Form_Unload(Cancel As Integer)
    Me.Visible = False
    frmMain.Visible = True
End Sub

Private Sub cmdExit_Click()
    Unload Me
    frmMain.Visible = True
End Sub

Private Function GetWeekDay(anDay As Long) As String
   Select Case anDay
        Case 1
            GetWeekDay = "Monday"
        Case 2
            GetWeekDay = "Tuesday"
        Case 3
            GetWeekDay = "Wednesday"
        Case 4
            GetWeekDay = "Thursday"
        Case 5
            GetWeekDay = "Friday"
        Case 6
            GetWeekDay = "Saturday"
        Case 7
            GetWeekDay = "Sunday"
    End Select
End Function

