VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "Msflxgrd.ocx"
Object = "{4903E1B8-A06D-4CF3-8A57-1583409C030D}#1.0#0"; "FPCLOC~1.OCX"
Begin VB.Form frmRealLog 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "FPCLOCK_Svr OCX Sample (Ver1.00)"
   ClientHeight    =   5670
   ClientLeft      =   4815
   ClientTop       =   3135
   ClientWidth     =   9360
   Icon            =   "frmRealLog.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   378
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   624
   StartUpPosition =   2  '屏幕中心
   Begin FPCLOCK_SVRLib.FPCLOCK_Svr FPCLOCK_Svr1 
      Height          =   255
      Left            =   6120
      TabIndex        =   11
      Top             =   840
      Width           =   495
      _Version        =   65536
      _ExtentX        =   873
      _ExtentY        =   450
      _StockProps     =   0
   End
   Begin VB.TextBox Text1 
      Height          =   375
      Left            =   8160
      TabIndex        =   9
      Text            =   "1"
      Top             =   720
      Width           =   615
   End
   Begin VB.CommandButton cmdClear 
      Caption         =   "Clear List"
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
      Left            =   7440
      TabIndex        =   8
      Top             =   5040
      Width           =   1695
   End
   Begin VB.CommandButton cmdCloseNetWork 
      Caption         =   "Close Network"
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
      Left            =   4860
      TabIndex        =   6
      Top             =   5040
      Width           =   1950
   End
   Begin VB.CommandButton cmdOpenNetWork 
      Caption         =   "Open Network"
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
      Left            =   2880
      TabIndex        =   5
      Top             =   5040
      Width           =   1950
   End
   Begin VB.TextBox txtPortNo 
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   405
      Left            =   1920
      TabIndex        =   4
      Text            =   "7005"
      Top             =   5085
      Width           =   855
   End
   Begin MSFlexGridLib.MSFlexGrid gridLogView 
      Height          =   3750
      Left            =   120
      TabIndex        =   1
      Top             =   1125
      Width           =   9045
      _ExtentX        =   15954
      _ExtentY        =   6615
      _Version        =   393216
      Cols            =   6
      Redraw          =   -1  'True
      GridLines       =   2
      SelectionMode   =   1
      AllowUserResizing=   1
   End
   Begin VB.Label Label1 
      Caption         =   "ret:"
      Height          =   255
      Left            =   7440
      TabIndex        =   10
      Top             =   840
      Width           =   495
   End
   Begin VB.Label lblPortNo 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Host Port :"
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
      Left            =   720
      TabIndex        =   7
      Top             =   5145
      Width           =   1095
   End
   Begin VB.Label lblEnrollData 
      AutoSize        =   -1  'True
      Caption         =   "Log Data :"
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
      Left            =   420
      TabIndex        =   3
      Top             =   795
      Width           =   960
   End
   Begin VB.Label lblTotal 
      AutoSize        =   -1  'True
      Caption         =   "Total :"
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
      Left            =   1935
      TabIndex        =   2
      Top             =   795
      Width           =   570
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
      Left            =   120
      TabIndex        =   0
      Top             =   240
      Width           =   9090
   End
End
Attribute VB_Name = "frmRealLog"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Const DEF_MAX_LOGCOUNT = 200000     ' max log data count to support by device.
Const DEF_MAX_DISPCOUNT = 30000     ' max count to show on a grid.
Const DEF_MUL_TWIPS = 15

Private fnGridHeight As Long
Private fngrdIndex As Long
Private fgrdLogView() As MSFlexGrid
Private fnCount As Long
Private fbOpenFlag As Boolean




Private Sub Form_Load()
    Dim vnii As Long
    Dim vngrdNumber As Long

    fnGridHeight = gridLogView.Height

    vngrdNumber = DEF_MAX_LOGCOUNT / DEF_MAX_DISPCOUNT
    If vngrdNumber * DEF_MAX_DISPCOUNT < DEF_MAX_LOGCOUNT Then vngrdNumber = vngrdNumber + 1
    If vngrdNumber < 1 Then vngrdNumber = 1

    ReDim fgrdLogView(vngrdNumber)
    Set fgrdLogView(1) = gridLogView

    If vngrdNumber > 1 Then
        For vnii = 2 To vngrdNumber
            If Not fgrdLogView(vnii) Is Nothing Then
                Controls.Remove fgrdLogView(vnii)
                Set fgrdLogView(vnii) = Nothing
            End If

            Set fgrdLogView(vnii) = Controls.Add("MSFlexGridLib.MSFlexGrid", "FlexGrid" & vnii)
            With fgrdLogView(vnii)
                .Left = gridLogView.Left
                .Top = gridLogView.Top
                .Width = gridLogView.Width
                .Height = 0
                .GridLines = gridLogView.GridLines
                .Visible = False
            End With
        Next
    End If
    
    cmdClear_Click

    fbOpenFlag = False
    FuncEnabledCommand True
    DoEvents
End Sub

Private Sub Form_Unload(Cancel As Integer)
    cmdCloseNetWork_Click
End Sub

Private Sub funcGeneralLogDataGridFormat()
    Dim vtObject
    Dim vnii As Long
    Dim vstrLogItem As Variant

    vstrLogItem = Array("", "EnrollNo", "VerifyMode", "InOut", "DateTime", "IP", "Port", "DevID", "SerialNo")
    With fgrdLogView(1)
        .Redraw = False
        .Height = fnGridHeight
        .Cols = 9
        .Rows = 1
        .Clear
        .ColWidth(0) = 35 * DEF_MUL_TWIPS
        .Row = 0
        For vnii = 1 To .Cols - 1
            .Col = vnii
            .Text = vstrLogItem(vnii)
            .ColWidth(vnii) = 50 * DEF_MUL_TWIPS
            .ColAlignment(vnii) = 3
        Next vnii
        .ColWidth(2) = 120 * DEF_MUL_TWIPS
        .ColWidth(4) = 110 * DEF_MUL_TWIPS
        .ColWidth(5) = 70 * DEF_MUL_TWIPS
        .ColWidth(6) = 50 * DEF_MUL_TWIPS
        .ColWidth(7) = 50 * DEF_MUL_TWIPS
        .ColWidth(8) = 80 * DEF_MUL_TWIPS
        .Redraw = True
        DoEvents
    End With

    For Each vtObject In fgrdLogView
        If Not vtObject Is Nothing Then
            If vtObject.Name <> "gridLogView" Then
                With vtObject
                    .Redraw = False
                    .Left = fgrdLogView(1).Left
                    .Top = fgrdLogView(1).Top
                    .Width = fgrdLogView(1).Width
                    .Height = 0
                    .Cols = fgrdLogView(1).Cols
                    .Rows = 0
                    .Clear
                    For vnii = 0 To .Cols - 1
                        .ColWidth(vnii) = fgrdLogView(1).ColWidth(vnii)
                        .ColAlignment(vnii) = fgrdLogView(1).ColAlignment(vnii)
                    Next vnii
                    .Redraw = False
                    .Visible = False
                End With
            End If
        End If
    Next
    DoEvents
End Sub

Private Function funcShowGeneralLogDataToGrid(anCount As Long, aSEnrollNumber As Long, _
                                        aVerifyMode As Long, aInOutMode As Long, _
                                        adwDate As Date, abDrawFlag As Boolean, astrRemoteIP As String, anRemotePort As Long, anDeviceId As Long, linkindex As Long, anSN As String) As Boolean

    Dim vStr As String
    Dim vnkk As Long
    Dim vnHeight As Long, vnTop As Long, vnPos As Long

    funcShowGeneralLogDataToGrid = True
    If anCount <= 1 Then
        fngrdIndex = 1
        fgrdLogView(1).Redraw = abDrawFlag
    Else
        If fngrdIndex * DEF_MAX_DISPCOUNT < anCount Then
            If abDrawFlag = False Then
                fgrdLogView(fngrdIndex).Redraw = True
            End If
            fngrdIndex = fngrdIndex + 1
            If fngrdIndex > UBound(fgrdLogView) Then
                funcShowGeneralLogDataToGrid = False
                Exit Function
            End If
            vnHeight = fnGridHeight
            vnTop = fgrdLogView(1).Top
            For vnkk = 1 To fngrdIndex
                fgrdLogView(vnkk).Top = vnTop + (vnkk - 1) * (vnHeight / fngrdIndex)
                fgrdLogView(vnkk).Height = vnHeight / fngrdIndex
            Next vnkk
            fgrdLogView(fngrdIndex).Redraw = abDrawFlag
            fgrdLogView(fngrdIndex).Visible = True
        End If
    End If
    vnPos = anCount - (fngrdIndex - 1) * DEF_MAX_DISPCOUNT
    If fngrdIndex > 1 Then vnPos = vnPos - 1

    With fgrdLogView(fngrdIndex)
        .AddItem (1)
        .Row = vnPos
        .Col = 0
        .Text = anCount
        .Col = 1
        .Text = aSEnrollNumber
        .Col = 2
        If aSEnrollNumber <> 0 Then
                Select Case aVerifyMode Mod LOG_OPEN_DOOR
                    Case 0
                        vStr = "Normal"
                    Case 1
                        vStr = "F1"
                    Case 2
                        vStr = "F2"
                    Case 3
                        vStr = "F3"
                    Case 4
                        vStr = "F4"
                    Case 5
                        vStr = "IN"
                    Case 6
                        vStr = "OUT"
                    Case Else
                        vStr = "--"
                End Select
        Else
              Select Case aVerifyMode Mod LOG_OPEN_DOOR
                    Case 0
                        vStr = "closed"
                    Case 1
                        vStr = "opened"
                    Case 2
                        vStr = "hand open"
                    Case 3
                        vStr = "POPEN"
                    Case 4
                        vStr = "pro close"
                    Case 5
                        vStr = "ILLEGALOPEN"
                    Case 6
                        vStr = "REMOVE"
                     Case 7
                        vStr = "ALARM"
                    Case Else
                        vStr = "--"
                End Select
        End If
        If aVerifyMode \ LOG_OPEN_THREAT = 1 Then
            vStr = vStr + " & Open Door as Threat"
        ElseIf aVerifyMode \ LOG_OPEN_DOOR = 1 Then
            vStr = vStr + " & Open Door"
        Else
            vStr = vStr
        End If
        .Text = vStr
        .Col = 3
        Select Case aInOutMode
            Case LOG_IOMODE_IN
                .Text = "IN"
            Case LOG_IOMODE_OUT
                .Text = "OUT"
            Case Else
                .Text = "--"
        End Select

        .Col = 4
        .Text = CStr(Year(adwDate)) & "/" & Format(Month(adwDate), "0#") & "/" & Format(Day(adwDate), "0#") & _
                " " & Format(Hour(adwDate), "0#") & ":" & Format(Minute(adwDate), "0#") & ":" & Format(Second(adwDate), "0#")
        .Col = 5
        .Text = astrRemoteIP
        .Col = 6
        .Text = Trim(Str(anRemotePort))
        .Col = 7
        .Text = anDeviceId
        .Col = 8
        .Text = anSN
        If .Rows > 14 Then
            .TopRow = .Rows - 13
        End If
        lblTotal.Caption = "Total : " & anCount
        DoEvents
    End With
End Function

Private Sub cmdClear_Click()
    fnCount = 0
    lblTotal.Caption = "Total : 0"
    funcGeneralLogDataGridFormat
End Sub

Private Sub cmdOpenNetWork_Click()
    Dim vnNetPort As Long
    Dim vnResultCode As Long
    
    cmdOpenNetWork.Enabled = False
    vnNetPort = Val(txtPortNo.Text)
    vnResultCode = FPCLOCK_Svr1.OpenNetwork(vnNetPort)
    If vnResultCode = RUN_SUCCESS Then
        fbOpenFlag = True
        FuncEnabledCommand False
    Else
        MsgBox ReturnResultPrint(vnResultCode), vbOKOnly, "error"
        cmdOpenNetWork.Enabled = True
    End If
    
    cmdClear_Click
End Sub

Private Sub cmdCloseNetWork_Click()
    Dim vnNetPort As Long
    
    vnNetPort = Val(txtPortNo.Text)
    If fbOpenFlag = True Then
        FPCLOCK_Svr1.CloseNetwork vnNetPort
        fbOpenFlag = False
        FuncEnabledCommand True
    End If
End Sub

Private Sub FuncEnabledCommand(abEnableFlag As Boolean)
    lblPortNo.Enabled = abEnableFlag
    txtPortNo.Enabled = abEnableFlag
    cmdOpenNetWork.Enabled = abEnableFlag
    cmdCloseNetWork.Enabled = Not abEnableFlag
End Sub

Private Sub FPCLOCK_Svr1_OnReceiveGLogData(ByVal astrDeviceIP As String, ByVal anDevicePort As Long, ByVal vnDeviceID As Long, ByVal anSEnrollNumber As Long, ByVal anVerifyMode As Long, ByVal anInOutMode As Long, ByVal anLogDate As Date, ByVal linkindex As Long, ByVal anSN As String)
     Dim result As Long
     Dim vnResultCode As Long
    Dim sendindex As Long
    Dim senddeviceid As Long
    Dim sendenrollID As Long
    
    sendindex = linkindex
    senddeviceid = vnDeviceID
    sendenrollID = anSEnrollNumber
    'result = 1   '查找结果
    result = Text1.Text
    fnCount = fnCount + 1
    vnResultCode = FPCLOCK_Svr1.SendResultandTime(sendindex, senddeviceid, sendenrollID, result)
    funcShowGeneralLogDataToGrid fnCount, anSEnrollNumber, anVerifyMode, anInOutMode, anLogDate, True, astrDeviceIP, anDevicePort, vnDeviceID, linkindex, anSN
    
End Sub
