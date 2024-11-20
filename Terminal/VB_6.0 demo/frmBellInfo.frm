VERSION 5.00
Begin VB.Form frmBellInfo 
   Caption         =   "Setting Bell Time"
   ClientHeight    =   6105
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   6525
   BeginProperty Font 
      Name            =   "Times New Roman"
      Size            =   12
      Charset         =   0
      Weight          =   700
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmBellInfo.frx":0000
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   ScaleHeight     =   6105
   ScaleWidth      =   6525
   StartUpPosition =   2  'CenterScreen
   Begin VB.TextBox txtBellCount 
      Height          =   435
      Left            =   4710
      TabIndex        =   28
      Top             =   1500
      Width           =   585
   End
   Begin VB.TextBox txtHour 
      Height          =   405
      Index           =   7
      Left            =   2655
      TabIndex        =   27
      Top             =   4455
      Width           =   630
   End
   Begin VB.TextBox txtMinute 
      Height          =   405
      Index           =   7
      Left            =   3540
      TabIndex        =   26
      Top             =   4455
      Width           =   630
   End
   Begin VB.TextBox txtMinute 
      Height          =   405
      Index           =   6
      Left            =   3540
      TabIndex        =   25
      Top             =   4035
      Width           =   630
   End
   Begin VB.TextBox txtHour 
      Height          =   405
      Index           =   6
      Left            =   2655
      TabIndex        =   24
      Top             =   4035
      Width           =   630
   End
   Begin VB.TextBox txtHour 
      Height          =   405
      Index           =   5
      Left            =   2655
      TabIndex        =   23
      Top             =   3615
      Width           =   630
   End
   Begin VB.TextBox txtMinute 
      Height          =   405
      Index           =   5
      Left            =   3540
      TabIndex        =   22
      Top             =   3615
      Width           =   630
   End
   Begin VB.TextBox txtMinute 
      Height          =   405
      Index           =   4
      Left            =   3540
      TabIndex        =   21
      Top             =   3195
      Width           =   630
   End
   Begin VB.TextBox txtHour 
      Height          =   405
      Index           =   4
      Left            =   2655
      TabIndex        =   20
      Top             =   3195
      Width           =   630
   End
   Begin VB.TextBox txtHour 
      Height          =   405
      Index           =   3
      Left            =   2655
      TabIndex        =   19
      Top             =   2775
      Width           =   630
   End
   Begin VB.TextBox txtMinute 
      Height          =   405
      Index           =   3
      Left            =   3540
      TabIndex        =   18
      Top             =   2775
      Width           =   630
   End
   Begin VB.TextBox txtMinute 
      Height          =   405
      Index           =   2
      Left            =   3540
      TabIndex        =   17
      Top             =   2370
      Width           =   630
   End
   Begin VB.TextBox txtHour 
      Height          =   405
      Index           =   2
      Left            =   2655
      TabIndex        =   16
      Top             =   2370
      Width           =   630
   End
   Begin VB.TextBox txtHour 
      Height          =   405
      Index           =   1
      Left            =   2655
      TabIndex        =   15
      Top             =   1950
      Width           =   630
   End
   Begin VB.TextBox txtMinute 
      Height          =   405
      Index           =   1
      Left            =   3540
      TabIndex        =   14
      Top             =   1950
      Width           =   630
   End
   Begin VB.TextBox txtMinute 
      Height          =   405
      Index           =   0
      Left            =   3540
      TabIndex        =   13
      Top             =   1530
      Width           =   630
   End
   Begin VB.TextBox txtHour 
      Height          =   405
      Index           =   0
      Left            =   2655
      TabIndex        =   12
      Top             =   1530
      Width           =   630
   End
   Begin VB.CheckBox chkValid 
      Caption         =   "Time1"
      Height          =   285
      Index           =   7
      Left            =   2160
      TabIndex        =   11
      Top             =   4500
      Width           =   195
   End
   Begin VB.CheckBox chkValid 
      Caption         =   "Time1"
      Height          =   285
      Index           =   6
      Left            =   2160
      TabIndex        =   10
      Top             =   4080
      Width           =   195
   End
   Begin VB.CheckBox chkValid 
      Caption         =   "Time1"
      Height          =   285
      Index           =   5
      Left            =   2160
      TabIndex        =   9
      Top             =   3660
      Width           =   195
   End
   Begin VB.CheckBox chkValid 
      Caption         =   "Time1"
      Height          =   285
      Index           =   4
      Left            =   2160
      TabIndex        =   8
      Top             =   3240
      Width           =   195
   End
   Begin VB.CheckBox chkValid 
      Caption         =   "Time1"
      Height          =   285
      Index           =   3
      Left            =   2160
      TabIndex        =   7
      Top             =   2820
      Width           =   195
   End
   Begin VB.CheckBox chkValid 
      Caption         =   "Time1"
      Height          =   285
      Index           =   2
      Left            =   2160
      TabIndex        =   6
      Top             =   2415
      Width           =   195
   End
   Begin VB.CheckBox chkValid 
      Caption         =   "Time1"
      Height          =   285
      Index           =   1
      Left            =   2160
      TabIndex        =   5
      Top             =   1995
      Width           =   195
   End
   Begin VB.CheckBox chkValid 
      Caption         =   "Time1"
      Height          =   285
      Index           =   0
      Left            =   2160
      TabIndex        =   4
      Top             =   1575
      Width           =   195
   End
   Begin VB.CommandButton cmdExit 
      Caption         =   "Exit"
      Height          =   510
      Left            =   4365
      TabIndex        =   2
      Top             =   5145
      Width           =   1485
   End
   Begin VB.CommandButton cmdWrite 
      Caption         =   "Write"
      Height          =   510
      Left            =   2490
      TabIndex        =   1
      Top             =   5145
      Width           =   1485
   End
   Begin VB.CommandButton cmdRead 
      Caption         =   "Read"
      Height          =   510
      Left            =   630
      TabIndex        =   0
      Top             =   5145
      Width           =   1485
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   ":"
      Height          =   285
      Index           =   15
      Left            =   3360
      TabIndex        =   48
      Top             =   1575
      Width           =   180
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   ":"
      Height          =   285
      Index           =   14
      Left            =   3360
      TabIndex        =   47
      Top             =   4500
      Width           =   180
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   ":"
      Height          =   285
      Index           =   13
      Left            =   3360
      TabIndex        =   46
      Top             =   4080
      Width           =   180
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   ":"
      Height          =   285
      Index           =   12
      Left            =   3360
      TabIndex        =   45
      Top             =   3660
      Width           =   180
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   ":"
      Height          =   285
      Index           =   11
      Left            =   3360
      TabIndex        =   44
      Top             =   3240
      Width           =   180
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   ":"
      Height          =   285
      Index           =   10
      Left            =   3360
      TabIndex        =   43
      Top             =   2820
      Width           =   180
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   ":"
      Height          =   285
      Index           =   9
      Left            =   3360
      TabIndex        =   42
      Top             =   2415
      Width           =   180
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   ":"
      Height          =   285
      Index           =   8
      Left            =   3360
      TabIndex        =   41
      Top             =   1995
      Width           =   180
   End
   Begin VB.Label Label5 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Bell Point"
      Height          =   285
      Left            =   705
      TabIndex        =   40
      Top             =   1140
      Width           =   975
   End
   Begin VB.Label Label3 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "UseFlag"
      Height          =   285
      Left            =   1860
      TabIndex        =   39
      Top             =   1140
      Width           =   825
   End
   Begin VB.Label Label4 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Start Time"
      Height          =   285
      Left            =   2895
      TabIndex        =   38
      Top             =   1140
      Width           =   1065
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Point 8:"
      Height          =   285
      Index           =   7
      Left            =   870
      TabIndex        =   37
      Top             =   4500
      Width           =   765
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Point 7:"
      Height          =   285
      Index           =   6
      Left            =   870
      TabIndex        =   36
      Top             =   4080
      Width           =   765
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Point 6:"
      Height          =   285
      Index           =   5
      Left            =   870
      TabIndex        =   35
      Top             =   3660
      Width           =   765
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Point 5:"
      Height          =   285
      Index           =   4
      Left            =   870
      TabIndex        =   34
      Top             =   3240
      Width           =   765
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Point 4:"
      Height          =   285
      Index           =   3
      Left            =   870
      TabIndex        =   33
      Top             =   2820
      Width           =   765
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Point 3:"
      Height          =   285
      Index           =   2
      Left            =   870
      TabIndex        =   32
      Top             =   2415
      Width           =   765
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Point 2:"
      Height          =   285
      Index           =   1
      Left            =   870
      TabIndex        =   31
      Top             =   1995
      Width           =   765
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Point 1:"
      Height          =   285
      Index           =   0
      Left            =   870
      TabIndex        =   30
      Top             =   1575
      Width           =   765
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Bell Count :"
      Height          =   285
      Left            =   4425
      TabIndex        =   29
      Top             =   1140
      Width           =   1200
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
      Left            =   435
      TabIndex        =   3
      Top             =   375
      Width           =   5760
   End
End
Attribute VB_Name = "frmBellInfo"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Const DataLen = 24
Dim mlngBellInfo(DataLen / 4 - 1) As Long
Dim mBellCount As Long
Dim mBellInfo As BELLINFO
Dim mMachineNumber As Long

Private Sub cmdExit_Click()
    Unload Me
    frmMain.Visible = True
End Sub

Private Sub cmdRead_Click()
Dim vRet As Boolean
    Dim vErrorCode As Long

    lblMessage.Caption = "Waiting..."
    DoEvents
    
    If frmMain.FP_CLOCK1.EnableDevice(mMachineNumber, False) = False Then
        lblMessage.Caption = gstrNoDevice
        Exit Sub
    End If
    
    vRet = frmMain.FP_CLOCK1.GetBellTime(mMachineNumber, mBellCount, mlngBellInfo(0))
    If vRet = True Then
        CopyMemory mBellInfo, mlngBellInfo(0), DataLen
        ShowValue
        lblMessage.Caption = "Success!"
    Else
        frmMain.FP_CLOCK1.GetLastError vErrorCode
        lblMessage.Caption = ErrorPrint(vErrorCode)
    End If

    frmMain.FP_CLOCK1.EnableDevice mMachineNumber, True
End Sub

Private Sub cmdWrite_Click()
Dim vRet As Boolean
Dim vErrorCode As Long
    
    lblMessage.Caption = "Waiting..."
    DoEvents
    
    If frmMain.FP_CLOCK1.EnableDevice(mMachineNumber, False) = False Then
        lblMessage.Caption = gstrNoDevice
        Exit Sub
    End If
    
    GetValue
    CopyMemory mlngBellInfo(0), mBellInfo, DataLen
    
    vRet = frmMain.FP_CLOCK1.SetBellTime(mMachineNumber, mBellCount, mlngBellInfo(0))
    If vRet = True Then
        lblMessage.Caption = "Success!"
    Else
        frmMain.FP_CLOCK1.GetLastError vErrorCode
        lblMessage.Caption = ErrorPrint(vErrorCode)
    End If

    frmMain.FP_CLOCK1.EnableDevice mMachineNumber, True
End Sub

Private Sub Form_Load()
    mMachineNumber = frmMain.gMachineNumber
End Sub

Private Sub Form_Unload(Cancel As Integer)
    Unload Me
    frmMain.Visible = True
End Sub

Private Sub ShowValue()
Dim i As Long

    For i = 0 To MAX_BELLCOUNT_DAY - 1
        txtHour(i).Text = mBellInfo.mHour(i)
        txtMinute(i).Text = mBellInfo.mMinute(i)
        If mBellInfo.mValid(i) > 1 Then mBellInfo.mValid(i) = 0
        chkValid(i).Value = mBellInfo.mValid(i)
    Next i
    txtBellCount.Text = mBellCount
End Sub

Private Sub GetValue()
Dim i As Long

    For i = 0 To MAX_BELLCOUNT_DAY - 1
        mBellInfo.mHour(i) = txtHour(i).Text
        mBellInfo.mMinute(i) = txtMinute(i).Text
        mBellInfo.mValid(i) = chkValid(i).Value
    Next i
    mBellCount = txtBellCount.Text
End Sub
