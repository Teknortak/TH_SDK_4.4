VERSION 5.00
Object = "{FE664F43-CCCB-46A4-ADD4-825303E0ADAD}#1.0#0"; "FP_CLOCK.ocx"
Begin VB.Form frmMain 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "z"
   ClientHeight    =   8625
   ClientLeft      =   4815
   ClientTop       =   3135
   ClientWidth     =   7860
   FillColor       =   &H008080FF&
   Icon            =   "frmMain.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   8625
   ScaleWidth      =   7860
   StartUpPosition =   2  'ÆÁÄ»ÖÐÐÄ
   Begin FP_CLOCKLib.FP_CLOCK FP_CLOCK1 
      Height          =   375
      Left            =   360
      TabIndex        =   35
      Top             =   240
      Width           =   615
      _Version        =   65536
      _ExtentX        =   1085
      _ExtentY        =   661
      _StockProps     =   0
   End
   Begin VB.OptionButton optServer 
      Caption         =   "P2S"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   240
      TabIndex        =   30
      Top             =   6840
      Width           =   1095
   End
   Begin VB.Frame Frame5 
      Height          =   1455
      Left            =   240
      TabIndex        =   29
      Top             =   6960
      Width           =   3615
      Begin VB.TextBox txtServertimeout 
         Height          =   375
         Left            =   1680
         TabIndex        =   33
         Text            =   "5"
         Top             =   960
         Width           =   495
      End
      Begin VB.TextBox txtServerport 
         Height          =   375
         Left            =   1680
         TabIndex        =   32
         Text            =   "7005"
         Top             =   360
         Width           =   855
      End
      Begin VB.Label Label2 
         Caption         =   "Timeout :"
         BeginProperty Font 
            Name            =   "Times New Roman"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   240
         TabIndex        =   34
         Top             =   960
         Width           =   1095
      End
      Begin VB.Label Label1 
         Caption         =   "Server Port :"
         BeginProperty Font 
            Name            =   "Times New Roman"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   240
         TabIndex        =   31
         Top             =   360
         Width           =   1215
      End
   End
   Begin VB.OptionButton optNetworkDevice 
      Caption         =   "NetworkDevice"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   360
      TabIndex        =   28
      Top             =   3600
      Width           =   1935
   End
   Begin VB.OptionButton OptIsUSB 
      Caption         =   "USB"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   240
      TabIndex        =   26
      Top             =   6120
      Value           =   -1  'True
      Width           =   855
   End
   Begin VB.Frame Frame1 
      Height          =   495
      Left            =   240
      TabIndex        =   25
      Top             =   6240
      Width           =   3615
   End
   Begin VB.Frame Frame4 
      Caption         =   "Connect"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1005
      Left            =   240
      TabIndex        =   16
      Top             =   1200
      Width           =   7380
      Begin VB.CommandButton cmdOpen 
         Caption         =   "Open"
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
         Left            =   4020
         TabIndex        =   20
         Top             =   360
         Width           =   1365
      End
      Begin VB.CommandButton cmdClose 
         Caption         =   "Close"
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
         Left            =   5670
         TabIndex        =   19
         Top             =   360
         Width           =   1365
      End
      Begin VB.ComboBox cmbMachineNumber 
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
         ItemData        =   "frmMain.frx":0442
         Left            =   2085
         List            =   "frmMain.frx":0461
         Style           =   2  'Dropdown List
         TabIndex        =   17
         Top             =   375
         Width           =   1335
      End
      Begin VB.Label lblMachineNumber 
         AutoSize        =   -1  'True
         Caption         =   "Machine Number :"
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
         Left            =   210
         TabIndex        =   18
         Top             =   435
         Width           =   1695
      End
   End
   Begin VB.OptionButton optSerialDevice 
      Caption         =   "Serial Device"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   252
      Left            =   435
      TabIndex        =   14
      Top             =   2280
      Width           =   2085
   End
   Begin VB.Frame Frame3 
      Caption         =   "    "
      Height          =   1290
      Left            =   255
      TabIndex        =   11
      Top             =   2295
      Width           =   3660
      Begin VB.ComboBox cmbComPort 
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
         Height          =   360
         ItemData        =   "frmMain.frx":0480
         Left            =   1728
         List            =   "frmMain.frx":049C
         Style           =   2  'Dropdown List
         TabIndex        =   12
         Top             =   456
         Width           =   1695
      End
      Begin VB.Label lblComPort 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "ComPort : "
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
         Left            =   315
         TabIndex        =   13
         Top             =   465
         Width           =   1005
      End
   End
   Begin VB.Frame Frame2 
      Caption         =   "  "
      Height          =   2400
      Index           =   0
      Left            =   240
      TabIndex        =   6
      Top             =   3720
      Width           =   3660
      Begin VB.TextBox txtPassword 
         Height          =   375
         Left            =   1680
         TabIndex        =   27
         Text            =   "0"
         Top             =   1680
         Width           =   1695
      End
      Begin VB.TextBox txtIPAddress 
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
         Left            =   1725
         TabIndex        =   8
         Text            =   "192.168.1.224"
         Top             =   360
         Width           =   1692
      End
      Begin VB.TextBox txtPortNo 
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
         Left            =   1725
         TabIndex        =   7
         Text            =   "5005"
         Top             =   960
         Width           =   1692
      End
      Begin VB.Label lblPassword 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Password :"
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
         Left            =   360
         TabIndex        =   15
         Top             =   1680
         Width           =   1008
      End
      Begin VB.Label lblIPAddress 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Ip Address :"
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
         Left            =   360
         TabIndex        =   10
         Top             =   480
         Width           =   1128
      End
      Begin VB.Label lblPortNo 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Port Number :"
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
         Left            =   240
         TabIndex        =   9
         Top             =   1080
         Width           =   1308
      End
   End
   Begin VB.Frame frmMainfrmMainfrmMainfrmMainfrmMainfrmMainfrmMainfrmMainfrmMainfrmMainfrmMainfrmMainfrmMainfrmMainfrmMain 
      Caption         =   "Management Group"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   5760
      Left            =   4020
      TabIndex        =   1
      Top             =   2280
      Width           =   3600
      Begin VB.CommandButton cmdPassInfo 
         Caption         =   "Setting Pass Time"
         BeginProperty Font 
            Name            =   "Times New Roman"
            Size            =   12
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   492
         Left            =   240
         TabIndex        =   24
         Top             =   2760
         Width           =   3060
      End
      Begin VB.CommandButton cmdBellInfo 
         Caption         =   "SET BELL TIME"
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
         Left            =   240
         TabIndex        =   23
         Top             =   2280
         Width           =   3048
      End
      Begin VB.CommandButton cmdLockCtl 
         Caption         =   "Lock Control"
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
         Left            =   240
         TabIndex        =   22
         Top             =   1788
         Width           =   3048
      End
      Begin VB.CommandButton cmdSystemInfo 
         Caption         =   "System Info"
         BeginProperty Font 
            Name            =   "Times New Roman"
            Size            =   12
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   468
         Left            =   240
         TabIndex        =   21
         Top             =   1308
         Width           =   3048
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
         Height          =   480
         Left            =   240
         TabIndex        =   5
         Top             =   5160
         Width           =   3045
      End
      Begin VB.CommandButton cmdLogData 
         Caption         =   "Log Data Management"
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
         Left            =   240
         TabIndex        =   4
         Top             =   816
         Width           =   3045
      End
      Begin VB.CommandButton cmdEnrollData 
         Caption         =   "Enroll Data Management"
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
         Left            =   240
         TabIndex        =   3
         Top             =   324
         Width           =   3045
      End
      Begin VB.CommandButton cmdProuctCode 
         Caption         =   "Get Serial Number"
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
         Left            =   240
         TabIndex        =   2
         Top             =   3360
         Width           =   3045
      End
   End
   Begin VB.Label lbSubject 
      Alignment       =   2  'Center
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "FP_CLOCK Sample"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   20.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   465
      Left            =   2130
      TabIndex        =   0
      Top             =   240
      Width           =   3645
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Public gMachineNumber As Long
Dim mOpenFlag As Boolean

Private Sub cmbComPort_Change()
    If cmbComPort.Text = "" Then Exit Sub
    FP_CLOCK1.CommPort = cmbComPort.Text
End Sub

Private Sub cmbComPort_Click()
    FP_CLOCK1.CommPort = cmbComPort.Text
End Sub

Private Sub cmbMachineNumber_Click()
    gMachineNumber = cmbMachineNumber.ListIndex + 1
End Sub


Private Sub cmdBellInfo_Click()
  Me.Visible = False
  frmBellInfo.Visible = True
  
  
End Sub
Private Sub cmdClose_Click()
    If mOpenFlag = True Then
        FP_CLOCK1.CloseCommPort
        mOpenFlag = False
        cmdOpen.Enabled = True
        cmdClose.Enabled = False
        cmdEnrollData.Enabled = False
        cmdLogData.Enabled = False
        cmdSystemInfo.Enabled = False
        cmdProuctCode.Enabled = False
        cmdBellInfo.Enabled = False
        cmdPassInfo.Enabled = False
        cmdLockCtl.Enabled = False
     End If
End Sub

Private Sub cmdEnrollData_Click()
    Me.Visible = False
    frmEnroll.Visible = True
End Sub

Private Sub cmdExit_Click()
    Unload Me
End Sub

Private Sub cmdLockCtl_Click()
    Me.Visible = False
    frmLockCtl.Visible = True
End Sub

Private Sub cmdLogData_Click()
    Me.Visible = False
    frmLog.Visible = True
End Sub

Private Sub cmdOpen_Click()
    Dim lpszIPAddress As String
    Dim vRet As Boolean
    
    If optNetworkDevice = True Then
        lpszIPAddress = txtIPAddress
        FP_CLOCK1.SetIPAddress lpszIPAddress, CLng(txtPortNo.Text), CLng(txtPassword.Text)
        If FP_CLOCK1.OpenCommPort(gMachineNumber) = True Then
            mOpenFlag = True
            cmdOpen.Enabled = False
            cmdClose.Enabled = True
            cmdEnrollData.Enabled = True
            cmdLogData.Enabled = True
            cmdSystemInfo.Enabled = True
            cmdProuctCode.Enabled = True
            cmdBellInfo.Enabled = True
             cmdPassInfo.Enabled = True
            cmdLockCtl.Enabled = True
        End If
    End If
    If optSerialDevice = True Then
        FP_CLOCK1.CommPort = cmbComPort.ListIndex + 1
        FP_CLOCK1.Baudrate = 115200
        If FP_CLOCK1.OpenCommPort(gMachineNumber) = True Then
            mOpenFlag = True
            cmdOpen.Enabled = False
            cmdClose.Enabled = True
            cmdEnrollData.Enabled = True
            cmdLogData.Enabled = True
            cmdSystemInfo.Enabled = True
            cmdProuctCode.Enabled = True
            cmdBellInfo.Enabled = True
             cmdPassInfo.Enabled = True
            cmdLockCtl.Enabled = True
        End If
    End If
    If OptIsUSB = True Then
        If FP_CLOCK1.OpenCommPort(gMachineNumber) = True Then
            mOpenFlag = True
            cmdOpen.Enabled = False
            cmdClose.Enabled = True
            cmdEnrollData.Enabled = True
            cmdLogData.Enabled = True
            cmdSystemInfo.Enabled = True
            cmdProuctCode.Enabled = True
            cmdBellInfo.Enabled = True
             cmdPassInfo.Enabled = True
            cmdLockCtl.Enabled = True
        End If
    End If
    
    If optServer = True Then
        If FP_CLOCK1.OpenCommPort(gMachineNumber) = True Then
            mOpenFlag = True
            cmdOpen.Enabled = False
            cmdClose.Enabled = True
            cmdEnrollData.Enabled = True
            cmdLogData.Enabled = True
            cmdSystemInfo.Enabled = True
            cmdProuctCode.Enabled = True
            cmdBellInfo.Enabled = True
             cmdPassInfo.Enabled = True
            cmdLockCtl.Enabled = True
        End If
    End If
End Sub

Private Sub cmdOpenDlg_Click()
    Dim vstrFileName As String
    
End Sub

Private Sub cmdPassInfo_Click()
    Me.Visible = False
    frmPassTime.Visible = True
End Sub

Private Sub cmdProuctCode_Click()
    Me.Visible = False
    frmSerialNo.Visible = True
End Sub

Private Sub cmdSystemInfo_Click()
    Me.Visible = False
    frmSystemInfo.Visible = True
End Sub

Private Sub Form_Load()
    Dim lpszIPAddress As String

    'Set Initial Value
    optSerialDevice.Value = True
    lblComPort.Enabled = True
    cmbComPort.Enabled = True
    
    optNetworkDevice.Value = False
    lblIPAddress.Enabled = False
    txtIPAddress.Enabled = False
    lblPortNo.Enabled = False
    txtPortNo.Enabled = False
    lblPassword.Enabled = False
    txtPassword.Enabled = False
    
    cmdOpen.Enabled = True
    cmdClose.Enabled = False
    cmdEnrollData.Enabled = False
    cmdLogData.Enabled = False
    cmdSystemInfo.Enabled = False
    cmdProuctCode.Enabled = False
    cmdBellInfo.Enabled = False
     cmdPassInfo.Enabled = False
    cmdLockCtl.Enabled = False
    
    mOpenFlag = False
    cmbMachineNumber = 1
    cmbComPort = 1
End Sub

Private Sub Form_Unload(Cancel As Integer)
    If mOpenFlag = True Then
        FP_CLOCK1.CloseCommPort
        mOpenFlag = False
     End If
End Sub

Private Sub optIsServer_Click(Index As Integer)
    If OptIsUSB = True Then
        lblComPort.Enabled = False
        cmbComPort.Enabled = False
        lblIPAddress.Enabled = False
        txtIPAddress.Enabled = False
        lblPortNo.Enabled = False
        txtPortNo.Enabled = False
        lblPassword.Enabled = False
        txtPassword.Enabled = False
    End If
End Sub

Private Sub OptIsUSB_Click()
    If OptIsUSB = True Then
        lblComPort.Enabled = False
        cmbComPort.Enabled = False
        lblIPAddress.Enabled = False
        txtIPAddress.Enabled = False
        lblPortNo.Enabled = False
        txtPortNo.Enabled = False
        lblPassword.Enabled = False
        txtPassword.Enabled = False
        
        txtServerport.Enabled = False
        txtServertimeout.Enabled = False
        FP_CLOCK1.IsUSB = True
    End If
End Sub

Private Sub optNetworkDevice_Click()
    Dim lpszIPAddress As String
    
    If optNetworkDevice = True Then
        lblComPort.Enabled = False
        cmbComPort.Enabled = False
        lblIPAddress.Enabled = True
        txtIPAddress.Enabled = True
        lblPortNo.Enabled = True
        txtPortNo.Enabled = True
        lblPassword.Enabled = True
        txtPassword.Enabled = True
        lpszIPAddress = txtIPAddress
        
        txtServerport.Enabled = False
        txtServertimeout.Enabled = False
        
        FP_CLOCK1.SetIPAddress lpszIPAddress, CLng(txtPortNo.Text), CLng(txtPassword.Text)
    End If
End Sub

Private Sub optSerialDevice_Click()
    Dim lpszIPAddress As String
    
    If optSerialDevice = True Then
        lblComPort.Enabled = True
        cmbComPort.Enabled = True
        lblIPAddress.Enabled = False
        txtIPAddress.Enabled = False
        lblPortNo.Enabled = False
        txtPortNo.Enabled = False
        lblPassword.Enabled = False
        txtPassword.Enabled = False
        
        txtServerport.Enabled = False
        txtServertimeout.Enabled = False
        FP_CLOCK1.CommPort = cmbComPort.ListIndex + 1
    End If
End Sub

Private Sub optServer_Click()
   If optServer = True Then
        lblComPort.Enabled = False
        cmbComPort.Enabled = False
        lblIPAddress.Enabled = False
        txtIPAddress.Enabled = False
        lblPortNo.Enabled = False
        txtPortNo.Enabled = False
        lblPassword.Enabled = False
        txtPassword.Enabled = False
        
        txtServerport.Enabled = True
        txtServertimeout.Enabled = True
        
        FP_CLOCK1.SetServerPortandtick CLng(txtServerport.Text), CLng(txtServertimeout.Text)
   End If
End Sub

Private Sub txtIPAddress_Change()
    Dim lpszIPAddress As String
    
    If txtIPAddress = "" Then Exit Sub
    If txtPortNo = "" Then Exit Sub
    lpszIPAddress = txtIPAddress
    FP_CLOCK1.SetIPAddress lpszIPAddress, CLng(txtPortNo.Text), CLng(txtPassword.Text)
End Sub

Private Sub txtPortNo_Change()
    Dim lpszIPAddress As String
    
    If txtIPAddress = "" Then Exit Sub
    If txtPortNo = "" Then Exit Sub
    lpszIPAddress = txtIPAddress
    FP_CLOCK1.SetIPAddress lpszIPAddress, CLng(txtPortNo.Text), CLng(txtPassword.Text)
End Sub
