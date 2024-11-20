VERSION 5.00
Begin VB.Form frmSerialNo 
   Caption         =   "Serial Number"
   ClientHeight    =   4320
   ClientLeft      =   5010
   ClientTop       =   3120
   ClientWidth     =   7965
   Icon            =   "frmPrtCode.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   4320
   ScaleWidth      =   7965
   StartUpPosition =   2  'ÆÁÄ»ÖÐÐÄ
   Begin VB.TextBox txtMacCode 
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
      Left            =   2520
      MaxLength       =   32
      TabIndex        =   13
      Top             =   2640
      Width           =   4785
   End
   Begin VB.CommandButton cmdGetMac 
      Caption         =   "Get Mac"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   675
      Left            =   5280
      TabIndex        =   11
      Top             =   3240
      Width           =   1455
   End
   Begin VB.TextBox txtProductCode 
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
      Left            =   2565
      MaxLength       =   32
      TabIndex        =   6
      Top             =   2145
      Width           =   4785
   End
   Begin VB.CommandButton cmdGetProductCode 
      Caption         =   "Get ProductCode"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   675
      Left            =   3480
      TabIndex        =   5
      Top             =   3270
      Width           =   1695
   End
   Begin VB.CommandButton cmdGetBackupNumber 
      Caption         =   "Get BackupNumber"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   675
      Left            =   1680
      TabIndex        =   4
      Top             =   3270
      Width           =   1815
   End
   Begin VB.TextBox txtBackupNo 
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
      Left            =   2565
      MaxLength       =   32
      TabIndex        =   3
      Top             =   1545
      Width           =   4785
   End
   Begin VB.TextBox txtSerialNo 
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
      Left            =   2565
      MaxLength       =   32
      TabIndex        =   2
      Top             =   945
      Width           =   4785
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
      Height          =   675
      Left            =   6720
      TabIndex        =   1
      Top             =   3270
      Width           =   1215
   End
   Begin VB.CommandButton cmdGetSerialNumber 
      Caption         =   "Get SerialNumber"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   675
      Left            =   15
      TabIndex        =   0
      Top             =   3270
      Width           =   1560
   End
   Begin VB.Label Label2 
      Alignment       =   1  'Right Justify
      AutoSize        =   -1  'True
      Caption         =   "mac:"
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
      Left            =   1320
      TabIndex        =   12
      Top             =   2640
      Width           =   480
   End
   Begin VB.Label lblBackuplNo 
      Alignment       =   1  'Right Justify
      AutoSize        =   -1  'True
      Caption         =   "Backup Number :"
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
      Left            =   510
      TabIndex        =   10
      Top             =   1605
      Width           =   1770
   End
   Begin VB.Label Label1 
      Alignment       =   1  'Right Justify
      AutoSize        =   -1  'True
      Caption         =   "Product Code :"
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
      Left            =   510
      TabIndex        =   9
      Top             =   2205
      Width           =   1485
   End
   Begin VB.Label lblSerialNo 
      Alignment       =   1  'Right Justify
      AutoSize        =   -1  'True
      Caption         =   "Serial Number :"
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
      Left            =   510
      TabIndex        =   8
      Top             =   1005
      Width           =   1590
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
      Left            =   270
      TabIndex        =   7
      Top             =   345
      Width           =   7425
   End
End
Attribute VB_Name = "frmSerialNo"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim mMachineNumber As Long

Private Sub cmdGetBackupNumber_Click()
    Dim vBackupNumber As Long
    Dim vErrorCode As Long
    
    lblMessage.Caption = "Waiting..."
    txtBackupNo = ""
    DoEvents
    
    If frmMain.FP_CLOCK1.EnableDevice(mMachineNumber, False) = False Then
        lblMessage.Caption = gstrNoDevice
        Exit Sub
    End If
    
    vBackupNumber = frmMain.FP_CLOCK1.GetBackupNumber(mMachineNumber)
    If vBackupNumber <> 0 Then
        txtBackupNo = vBackupNumber
        lblMessage = "Success"
    Else
        frmMain.FP_CLOCK1.GetLastError vErrorCode
        lblMessage.Caption = ErrorPrint(vErrorCode)
    End If
    
    frmMain.FP_CLOCK1.EnableDevice mMachineNumber, True
End Sub

Private Sub cmdGetMac_Click()
   Dim vMacCode As String
    Dim vRet As Long
    Dim vErrorCode As Long
    
    lblMessage.Caption = "Waiting..."
    txtMacCode = ""
    DoEvents
    
    vRet = frmMain.FP_CLOCK1.EnableDevice(mMachineNumber, False)
    If vRet = False Then
        lblMessage.Caption = gstrNoDevice
        Exit Sub
    End If
    
    vRet = frmMain.FP_CLOCK1.GetMacCode(mMachineNumber, vMacCode)
    If vRet = True Then
        txtMacCode = vMacCode
        lblMessage = "Success"
    Else
        frmMain.FP_CLOCK1.GetLastError vErrorCode
        lblMessage.Caption = ErrorPrint(vErrorCode)
    End If
    
    frmMain.FP_CLOCK1.EnableDevice mMachineNumber, True
End Sub

Private Sub cmdGetProductCode_Click()
    Dim vProductCode As String
    Dim vRet As Long
    Dim vErrorCode As Long
    
    lblMessage.Caption = "Waiting..."
    txtProductCode = ""
    DoEvents
    
    vRet = frmMain.FP_CLOCK1.EnableDevice(mMachineNumber, False)
    If vRet = False Then
        lblMessage.Caption = gstrNoDevice
        Exit Sub
    End If
    
    vRet = frmMain.FP_CLOCK1.GetProductCode(mMachineNumber, vProductCode)
    If vRet = True Then
        txtProductCode = vProductCode
        lblMessage = "Success"
    Else
        frmMain.FP_CLOCK1.GetLastError vErrorCode
        lblMessage.Caption = ErrorPrint(vErrorCode)
    End If
    
    frmMain.FP_CLOCK1.EnableDevice mMachineNumber, True
End Sub

Private Sub cmdGetSerialNumber_Click()
    Dim vSerialNumber As String
    Dim vRet As Long
    Dim vErrorCode As Long
    
    lblMessage.Caption = "Waiting..."
    txtSerialNo = ""
    DoEvents
    
    vRet = frmMain.FP_CLOCK1.EnableDevice(mMachineNumber, False)
    If vRet = False Then
        lblMessage.Caption = gstrNoDevice
        Exit Sub
    End If
    
    vRet = frmMain.FP_CLOCK1.GetSerialNumber(mMachineNumber, vSerialNumber)
    If vRet = True Then
        txtSerialNo = vSerialNumber
        lblMessage = "Success"
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

Private Sub Form_Load()
    mMachineNumber = frmMain.gMachineNumber
End Sub

Private Sub Form_Unload(Cancel As Integer)
    Unload Me
    frmMain.Visible = True
End Sub

