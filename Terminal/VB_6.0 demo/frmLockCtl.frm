VERSION 5.00
Begin VB.Form frmLockCtl 
   Caption         =   "Door Open Control"
   ClientHeight    =   3270
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   6570
   LinkTopic       =   "Form1"
   ScaleHeight     =   3270
   ScaleWidth      =   6570
   StartUpPosition =   3  '´°¿ÚÈ±Ê¡
   Begin VB.ComboBox cmbdoor 
      Height          =   300
      ItemData        =   "frmLockCtl.frx":0000
      Left            =   600
      List            =   "frmLockCtl.frx":0010
      TabIndex        =   10
      Text            =   "all door"
      Top             =   2160
      Width           =   1095
   End
   Begin VB.CommandButton Cmdopendoorex 
      Caption         =   "Door Open Ex"
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
      Left            =   240
      TabIndex        =   8
      Top             =   1560
      Width           =   1872
   End
   Begin VB.CommandButton cmdWarnCancel 
      Caption         =   "Warn Cancel"
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
      Left            =   4440
      TabIndex        =   7
      Top             =   2028
      Width           =   1872
   End
   Begin VB.CommandButton cmdRestart 
      Caption         =   "Reboot"
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
      Left            =   2340
      TabIndex        =   6
      Top             =   2052
      Width           =   1848
   End
   Begin VB.CommandButton cmdAutoRecover 
      Caption         =   "Auto Recover"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   504
      Left            =   2328
      TabIndex        =   5
      Top             =   1464
      Width           =   1860
   End
   Begin VB.CommandButton cmdUncondClose 
      Caption         =   "Uncond Close"
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
      Left            =   4440
      TabIndex        =   4
      Top             =   1452
      Width           =   1884
   End
   Begin VB.CommandButton cmdUncondOpen 
      Caption         =   "Uncond Open"
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
      Left            =   4452
      TabIndex        =   3
      Top             =   900
      Width           =   1884
   End
   Begin VB.CommandButton cmdGetDoorStatus 
      Caption         =   "Get DoorStatus"
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
      Left            =   300
      TabIndex        =   2
      Top             =   924
      Width           =   1815
   End
   Begin VB.CommandButton cmdDoorOpen 
      Caption         =   "Door Open"
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
      Left            =   2328
      TabIndex        =   1
      Top             =   900
      Width           =   1872
   End
   Begin VB.Label Label1 
      Caption         =   "<==for access borad"
      Height          =   255
      Left            =   240
      TabIndex        =   9
      Top             =   2520
      Width           =   1935
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
      Left            =   288
      TabIndex        =   0
      Top             =   252
      Width           =   6012
   End
End
Attribute VB_Name = "frmLockCtl"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim mMachineNumber As Long

Private Sub cmdGetDoorStatus_Click()
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
        If vValue(0) = 1 Then
            lblMessage.Caption = "Uncond Door Open State!"
        ElseIf vValue(0) = 2 Then
            lblMessage.Caption = "Uncond Door Close State!"
        ElseIf vValue(0) = 3 Then
            lblMessage.Caption = "Program Door Open State!"
        ElseIf vValue(0) = 6 Then
            lblMessage.Caption = "Door Warnn Sound Cancel!"
        Else
            lblMessage.Caption = "User State !"
        End If
    Else
        frmMain.FP_CLOCK1.GetLastError vErrorCode
        lblMessage.Caption = ErrorPrint(vErrorCode)
    End If
    
    'txtSetDevInfo.Text = vValue(0)
    
    frmMain.FP_CLOCK1.EnableDevice mMachineNumber, True
    DoEvents

End Sub

Private Sub cmdAutoRecover_Click()
    Dim vErrorCode As Long
    Dim vRet As Boolean
    
    lblMessage.Caption = "Working..."
    DoEvents
    
    vRet = frmMain.FP_CLOCK1.EnableDevice(mMachineNumber, False)
    If vRet = False Then
        lblMessage.Caption = gstrNoDevice
        Exit Sub
    End If
    
    vRet = frmMain.FP_CLOCK1.SetDoorStatus(mMachineNumber, 4)
    If vRet = True Then
        lblMessage.Caption = "Uncond Door Open Success!"
    Else
        frmMain.FP_CLOCK1.GetLastError vErrorCode
        lblMessage.Caption = ErrorPrint(vErrorCode)
    End If
    frmMain.FP_CLOCK1.EnableDevice mMachineNumber, True
    DoEvents
End Sub

Private Sub cmdDoorOpen_Click()
    Dim vErrorCode As Long
    Dim vRet As Boolean
    
    lblMessage.Caption = "Working..."
    DoEvents
    
    vRet = frmMain.FP_CLOCK1.EnableDevice(mMachineNumber, False)
    If vRet = False Then
        lblMessage.Caption = gstrNoDevice
        Exit Sub
    End If
    
    vRet = frmMain.FP_CLOCK1.SetDoorStatus(mMachineNumber, 3)
    If vRet = True Then
        lblMessage.Caption = "Door Open Success!"
    Else
        frmMain.FP_CLOCK1.GetLastError vErrorCode
        lblMessage.Caption = ErrorPrint(vErrorCode)
    End If
    frmMain.FP_CLOCK1.EnableDevice mMachineNumber, True
    DoEvents
End Sub

Private Sub Cmdopendoorex_Click()
  Dim vErrorCode As Long
    Dim vRet As Boolean
    Dim doorindex As Long
    
    doorindex = cmbdoor.ListIndex + 1
    lblMessage.Caption = "Working..."
    DoEvents
    
    vRet = frmMain.FP_CLOCK1.EnableDevice(mMachineNumber, False)
    If vRet = False Then
        lblMessage.Caption = gstrNoDevice
        Exit Sub
    End If
    
    vRet = frmMain.FP_CLOCK1.OpendoorEx(mMachineNumber, doorindex)
    If vRet = True Then
        lblMessage.Caption = "Door Open Success!"
    Else
        frmMain.FP_CLOCK1.GetLastError vErrorCode
        lblMessage.Caption = ErrorPrint(vErrorCode)
    End If
    frmMain.FP_CLOCK1.EnableDevice mMachineNumber, True
    DoEvents
End Sub

Private Sub cmdRestart_Click()
    Dim vErrorCode As Long
    Dim vRet As Boolean
    
    lblMessage.Caption = "Working..."
    DoEvents
    
    vRet = frmMain.FP_CLOCK1.EnableDevice(mMachineNumber, False)
    If vRet = False Then
        lblMessage.Caption = gstrNoDevice
        Exit Sub
    End If
    
    vRet = frmMain.FP_CLOCK1.SetDoorStatus(mMachineNumber, 5)
    If vRet = True Then
        lblMessage.Caption = "Uncond Door Open Success!"
    Else
        frmMain.FP_CLOCK1.GetLastError vErrorCode
        lblMessage.Caption = ErrorPrint(vErrorCode)
    End If
    frmMain.FP_CLOCK1.EnableDevice mMachineNumber, True
    DoEvents
End Sub

Private Sub cmdUncondClose_Click()
    Dim vErrorCode As Long
    Dim vRet As Boolean
    
    lblMessage.Caption = "Working..."
    DoEvents
    
    vRet = frmMain.FP_CLOCK1.EnableDevice(mMachineNumber, False)
    If vRet = False Then
        lblMessage.Caption = gstrNoDevice
        Exit Sub
    End If
    
    vRet = frmMain.FP_CLOCK1.SetDoorStatus(mMachineNumber, 2)
    If vRet = True Then
        lblMessage.Caption = "Uncond Door Open Success!"
    Else
        frmMain.FP_CLOCK1.GetLastError vErrorCode
        lblMessage.Caption = ErrorPrint(vErrorCode)
    End If
    frmMain.FP_CLOCK1.EnableDevice mMachineNumber, True
    DoEvents
End Sub

Private Sub cmdUncondOpen_Click()
    Dim vErrorCode As Long
    Dim vRet As Boolean
    
    lblMessage.Caption = "Working..."
    DoEvents
    
    vRet = frmMain.FP_CLOCK1.EnableDevice(mMachineNumber, False)
    If vRet = False Then
        lblMessage.Caption = gstrNoDevice
        Exit Sub
    End If
    
    vRet = frmMain.FP_CLOCK1.SetDoorStatus(mMachineNumber, 1)
    If vRet = True Then
        lblMessage.Caption = "Uncond Door Open Success!"
    Else
        frmMain.FP_CLOCK1.GetLastError vErrorCode
        lblMessage.Caption = ErrorPrint(vErrorCode)
    End If
    frmMain.FP_CLOCK1.EnableDevice mMachineNumber, True
    DoEvents
End Sub

Private Sub cmdWarnCancel_Click()
    Dim vErrorCode As Long
    Dim vRet As Boolean
    
    lblMessage.Caption = "Working..."
    DoEvents
    
    vRet = frmMain.FP_CLOCK1.EnableDevice(mMachineNumber, False)
    If vRet = False Then
        lblMessage.Caption = gstrNoDevice
        Exit Sub
    End If
    
    vRet = frmMain.FP_CLOCK1.SetDoorStatus(mMachineNumber, 6)
    If vRet = True Then
        lblMessage.Caption = "Uncond Door Open Success!"
    Else
        frmMain.FP_CLOCK1.GetLastError vErrorCode
        lblMessage.Caption = ErrorPrint(vErrorCode)
    End If
    frmMain.FP_CLOCK1.EnableDevice mMachineNumber, True
    DoEvents
End Sub

Private Sub Command1_Click()

End Sub

Private Sub Form_Load()
    mMachineNumber = frmMain.gMachineNumber
End Sub
Private Sub Form_Unload(Cancel As Integer)
    Me.Visible = False
    frmMain.Visible = True
End Sub

