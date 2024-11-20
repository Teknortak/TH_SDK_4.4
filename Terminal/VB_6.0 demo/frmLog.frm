VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.Form frmLog 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Manage Log Data"
   ClientHeight    =   7230
   ClientLeft      =   4815
   ClientTop       =   3135
   ClientWidth     =   11595
   Icon            =   "frmLog.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   7230
   ScaleWidth      =   11595
   StartUpPosition =   2  'ÆÁÄ»ÖÐÐÄ
   Begin VB.CommandButton cmdUSBGlogData 
      Caption         =   "Udisk Read GLogData"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   645
      Left            =   7920
      TabIndex        =   15
      Top             =   6360
      Width           =   1320
   End
   Begin VB.CommandButton cmdEmptySLog 
      Caption         =   "Empty SLogData"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   4080
      TabIndex        =   14
      Top             =   6360
      Width           =   1215
   End
   Begin VB.CommandButton cmdUSBSLogData 
      Caption         =   "Udisk Read SLogData"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   2760
      TabIndex        =   13
      Top             =   6360
      Width           =   1335
   End
   Begin VB.CommandButton cmdEmptyGLog 
      Caption         =   "Empty GLogData"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   645
      Left            =   9240
      TabIndex        =   10
      Top             =   6360
      Width           =   1260
   End
   Begin VB.CheckBox chkReadMark 
      Caption         =   "ReadMark"
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
      Left            =   9840
      TabIndex        =   7
      Top             =   1275
      Width           =   1365
   End
   Begin VB.CommandButton cmdAllGLogData 
      Caption         =   "Read All GLogData"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   645
      Left            =   6600
      TabIndex        =   6
      Top             =   6390
      Width           =   1230
   End
   Begin VB.CommandButton cmdAllSLogData 
      Caption         =   "Read All SLogData"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   645
      Left            =   1440
      TabIndex        =   4
      Top             =   6390
      Width           =   1245
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
      Height          =   645
      Left            =   10560
      TabIndex        =   3
      Top             =   6360
      Width           =   810
   End
   Begin VB.CommandButton cmdGlogData 
      Caption         =   "Read GLogData"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   645
      Left            =   5400
      TabIndex        =   2
      Top             =   6360
      Width           =   1200
   End
   Begin VB.CommandButton cmdSLogData 
      Caption         =   "Read SLogData"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   645
      Left            =   120
      TabIndex        =   1
      Top             =   6390
      Width           =   1245
   End
   Begin MSFlexGridLib.MSFlexGrid gridSLogData 
      Height          =   4800
      Left            =   360
      TabIndex        =   5
      Top             =   1560
      Width           =   10905
      _ExtentX        =   19235
      _ExtentY        =   8467
      _Version        =   393216
      Cols            =   9
      Redraw          =   -1  'True
      GridLines       =   2
      AllowUserResizing=   1
   End
   Begin MSFlexGridLib.MSFlexGrid gridSLogData1 
      Height          =   3200
      Left            =   360
      TabIndex        =   11
      Top             =   3160
      Width           =   10185
      _ExtentX        =   17965
      _ExtentY        =   5636
      _Version        =   393216
      Cols            =   9
      FixedRows       =   0
      Redraw          =   -1  'True
      GridLines       =   2
      AllowUserResizing=   1
   End
   Begin MSFlexGridLib.MSFlexGrid gridSLogData2 
      Height          =   1600
      Left            =   360
      TabIndex        =   12
      Top             =   4760
      Width           =   10185
      _ExtentX        =   17965
      _ExtentY        =   2831
      _Version        =   393216
      Cols            =   9
      FixedRows       =   0
      GridLines       =   2
      AllowUserResizing=   1
   End
   Begin MSComDlg.CommonDialog dlgOpen 
      Left            =   0
      Top             =   0
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
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
      Left            =   405
      TabIndex        =   9
      Top             =   1290
      Width           =   960
   End
   Begin VB.Label LabelTotal 
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
      Left            =   1920
      TabIndex        =   8
      Top             =   1290
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
      Left            =   360
      TabIndex        =   0
      Top             =   600
      Width           =   10905
   End
End
Attribute VB_Name = "frmLog"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Const gMaxLow = 30000
Dim mMachineNumber As Long
Public gstrLogItem As Variant

Private Sub chkReadMark_Click()
    frmMain.FP_CLOCK1.ReadMark = chkReadMark
End Sub

Private Sub cmdAllGLogData_Click()
    Dim vTMachineNumber As Long
    Dim vSMachineNumber As Long
    Dim vSEnrollNumber As Long
    Dim vVerifyMode As Long
    Dim vInout As Long
    Dim vEvent As Long
    Dim vYear As Long
    Dim vMonth As Long
    Dim vDay As Long
    Dim vHour As Long
    Dim vMinute As Long
    Dim vSecond As Long
    Dim vErrorCode As Long
    Dim vRet As Boolean
    Dim i, n As Long
    Dim vMaxLogCnt  As Long
    
    Dim vinouttype As Long
    Dim vaction As Long
    
    vMaxLogCnt = gMaxLow
    
    lblMessage.Caption = "Waiting..."
    LabelTotal.Caption = "Total : "
    DoEvents
    
    gridSLogData.Height = 4800
    gridSLogData.Redraw = False
    gridSLogData.Clear
    gridSLogData1.Top = gridSLogData.Top + gridSLogData.Height
    gridSLogData1.Height = 0
    gridSLogData1.Redraw = False
    gridSLogData1.Clear
    gridSLogData2.Top = gridSLogData.Top + gridSLogData.Height
    gridSLogData2.Height = 0
    gridSLogData2.Redraw = False
    gridSLogData2.Clear
    
     gstrLogItem = Array("", "TMachineNo", "EnrollNo", "EMachineNo", "InOut", "VeriMode", "DateTime")
    With gridSLogData
        .Row = 0
        .ColWidth(0) = 600
        For i = 1 To 6
            .Col = i
            .Text = gstrLogItem(i)
            .ColAlignment(i) = 3
            .ColWidth(i) = 1200
        Next i
        .Col = 6
        .ColWidth(5) = 2000
        .ColWidth(6) = 2000
        .ColWidth(7) = 100
        .ColWidth(8) = 100
        n = .Rows
        If n > 2 Then
            Do
                If n = 2 Then Exit Do
                .RemoveItem (n)
                n = n - 1
            Loop
        End If
        .Redraw = True
    End With
    With gridSLogData1
        .Row = 0
        .ColWidth(0) = 600
        For i = 1 To 6
            .Col = i
            .ColAlignment(i) = 3
            .ColWidth(i) = 1200
        Next i
        .Col = 6
        .ColWidth(5) = 2000
        .ColWidth(6) = 2000
        .ColWidth(7) = 100
        .ColWidth(8) = 100
        n = .Rows
        If n > 2 Then
            Do
                If n = 2 Then Exit Do
                .RemoveItem (n)
                n = n - 1
            Loop
        End If
        .Redraw = True
    End With
    With gridSLogData2
        .Row = 0
        .ColWidth(0) = 600
        For i = 1 To 6
            .Col = i
            .ColAlignment(i) = 3
            .ColWidth(i) = 1200
        Next i
        .Col = 6
        .ColWidth(5) = 2000
        .ColWidth(6) = 2000
        .ColWidth(7) = 100
        .ColWidth(8) = 100
        n = .Rows
        If n > 2 Then
            Do
                If n = 2 Then Exit Do
                .RemoveItem (n)
                n = n - 1
            Loop
        End If
        .Redraw = True
    End With
    
    MousePointer = vbHourglass
    vRet = frmMain.FP_CLOCK1.EnableDevice(mMachineNumber, False)
    If vRet = False Then
        lblMessage.Caption = gstrNoDevice
        MousePointer = vbDefault
        Exit Sub
    End If
    
    vRet = frmMain.FP_CLOCK1.ReadAllGLogData(mMachineNumber)
    If vRet = False Then
        frmMain.FP_CLOCK1.GetLastError vErrorCode
        lblMessage.Caption = ErrorPrint(vErrorCode)
    End If
    
    If vRet = True Then
        lblMessage.Caption = "Getting..."
        frmMain.FP_CLOCK1.EnableDevice mMachineNumber, True
        MousePointer = vbHourglass
        DoEvents
        gridSLogData.Redraw = False
        gridSLogData1.Redraw = False
        gridSLogData2.Redraw = False
        With gridSLogData
            i = 1
            Do

                vRet = frmMain.FP_CLOCK1.GetAllGLogDataWithSecond(mMachineNumber, _
                                                 vTMachineNumber, _
                                                 vSEnrollNumber, _
                                                 vSMachineNumber, _
                                                 vVerifyMode, _
                                                 vInout, _
                                                 vEvent, _
                                                 vYear, _
                                                 vMonth, _
                                                 vDay, _
                                                 vHour, _
                                                 vMinute, _
                                                 vSecond)
                If vRet = False Then Exit Do
                If vRet = True And i <> 1 Then
                    .AddItem (1)
                End If
                vinouttype = vInout
                vaction = vEvent
                .Row = i
                .Col = 0
                .Text = i
                .Col = 1
                .Text = vTMachineNumber
                .Col = 2
                .Text = vSEnrollNumber
                .Col = 3
                .Text = vSMachineNumber
                .Col = 4
                .Text = vinouttype
                .Col = 5
                If vSEnrollNumber <> 0 Then
                    If vaction = 0 Then
                         .Text = vaction & "/Normal"
                    ElseIf vaction = 1 Then
                        .Text = vaction & "/f1"
                    ElseIf vaction = 2 Then
                        .Text = vaction & "/f2"
                    ElseIf vaction = 3 Then
                        .Text = vaction & "/f3"
                    ElseIf vaction = 4 Then
                        .Text = vaction & "/f4"
                    ElseIf vaction = 5 Then
                        .Text = vaction & "/in"
                    ElseIf vaction = 6 Then
                        .Text = vaction & "/out"
                    Else
                        .Text = vaction & "/--"
                    End If
                Else
                    If vaction = 0 Then
                         .Text = vaction & "/Closed"
                    ElseIf vaction = 1 Then
                        .Text = vaction & "/Opened"
                    ElseIf vaction = 2 Then
                        .Text = vaction & "/HandOpen"
                    ElseIf vaction = 3 Then
                        .Text = vaction & "/ProcOpen"
                    ElseIf vaction = 4 Then
                        .Text = vaction & "/ProcClose"
                    ElseIf vaction = 5 Then
                        .Text = vaction & "/IllegalOpen"
                    ElseIf vaction = 6 Then
                        .Text = vaction & "/IlleagalRemove"
                     ElseIf vaction = 7 Then
                        .Text = vaction & "/Alarm"
                    Else
                        .Text = vaction & "/--"
                    End If
                End If
                .Col = 6
                .Text = CStr(vYear) & "/" & Format(vMonth, "0#") & "/" & Format(vDay, "0#") & _
                        " " & Format(vHour, "0#") & ":" & Format(vMinute, "0#") & "." & Format(vSecond, "0#")
                
                LabelTotal.Caption = "Total : " & i
                DoEvents
                i = i + 1
                If i > vMaxLogCnt Then Exit Do
            Loop
        End With
        
        If i > vMaxLogCnt Then
            gridSLogData.Height = gridSLogData.Height / 2
            gridSLogData1.Top = gridSLogData.Top + gridSLogData.Height
            gridSLogData1.Height = gridSLogData.Height
            With gridSLogData1
                Do
                    vRet = frmMain.FP_CLOCK1.GetGeneralLogData(mMachineNumber, _
                                                        vTMachineNumber, _
                                                        vSEnrollNumber, _
                                                        vSMachineNumber, _
                                                        vVerifyMode, _
                                                        vYear, _
                                                        vMonth, _
                                                        vDay, _
                                                        vHour, _
                                                        vMinute)
                    If vRet = False Then Exit Do
                    If vRet = True And i <> 1 Then
                        If i - vMaxLogCnt > 1 Then .AddItem (1)
                    End If
                    vinouttype = Int(vVerifyMode / 8)
                vaction = vVerifyMode Mod 8
                    .Row = i - vMaxLogCnt
                    .Col = 0
                    .Text = i
                     .Col = 1
                .Text = vTMachineNumber
                .Col = 2
                .Text = vSEnrollNumber
                .Col = 3
                .Text = vSMachineNumber
                .Col = 4
                .Text = vinouttype
                .Col = 5
                If vSEnrollNumber <> 0 Then
                    If vaction = 0 Then
                         .Text = vaction & "/Normal"
                    ElseIf vaction = 1 Then
                        .Text = vaction & "/f1"
                    ElseIf vaction = 2 Then
                        .Text = vaction & "/f2"
                    ElseIf vaction = 3 Then
                        .Text = vaction & "/f3"
                    ElseIf vaction = 4 Then
                        .Text = vaction & "/f4"
                    ElseIf vaction = 5 Then
                        .Text = vaction & "/in"
                    ElseIf vaction = 6 Then
                        .Text = vaction & "/out"
                    Else
                        .Text = vaction & "/--"
                    End If
                Else
                    If vaction = 0 Then
                         .Text = vaction & "/Closed"
                    ElseIf vaction = 1 Then
                        .Text = vaction & "/Opened"
                    ElseIf vaction = 2 Then
                        .Text = vaction & "/HandOpen"
                    ElseIf vaction = 3 Then
                        .Text = vaction & "/ProcOpen"
                    ElseIf vaction = 4 Then
                        .Text = vaction & "/ProcClose"
                    ElseIf vaction = 5 Then
                        .Text = vaction & "/IllegalOpen"
                    ElseIf vaction = 6 Then
                        .Text = vaction & "/IlleagalRemove"
                     ElseIf vaction = 7 Then
                        .Text = vaction & "/Alarm"
                    Else
                        .Text = vaction & "/--"
                    End If
                End If
                .Col = 6
                    .Text = CStr(vYear) & "/" & Format(vMonth, "0#") & "/" & Format(vDay, "0#") & _
                            " " & Format(vHour, "0#") & ":" & Format(vMinute, "0#")
                    
                    LabelTotal.Caption = "Total : " & i
                    DoEvents
                    i = i + 1
                    If i > vMaxLogCnt * 2 Then Exit Do
                Loop
            End With
        End If
        vMaxLogCnt = vMaxLogCnt * 2
        If i > vMaxLogCnt Then
            gridSLogData.Height = gridSLogData.Height * 2 / 3
            gridSLogData1.Top = gridSLogData.Top + gridSLogData.Height
            gridSLogData1.Height = gridSLogData.Height
            gridSLogData2.Top = gridSLogData.Top + gridSLogData.Height * 2
            gridSLogData2.Height = gridSLogData.Height
            With gridSLogData2
                Do
                    vRet = frmMain.FP_CLOCK1.GetGeneralLogData(mMachineNumber, _
                                                        vTMachineNumber, _
                                                        vSEnrollNumber, _
                                                        vSMachineNumber, _
                                                        vVerifyMode, _
                                                        vYear, _
                                                        vMonth, _
                                                        vDay, _
                                                        vHour, _
                                                        vMinute)
                    If vRet = False Then Exit Do
                    If vRet = True And i <> 1 Then
                        If i - vMaxLogCnt > 1 Then .AddItem (1)
                    End If
                    vinouttype = Int(vVerifyMode / 8)
                    vaction = vVerifyMode Mod 8
                    .Row = i - vMaxLogCnt
                    .Col = 0
                    .Text = i
                     .Col = 1
                .Text = vTMachineNumber
                .Col = 2
                .Text = vSEnrollNumber
                .Col = 3
                .Text = vSMachineNumber
                .Col = 4
                .Text = vinouttype
                .Col = 5
                If vSEnrollNumber <> 0 Then
                    If vaction = 0 Then
                         .Text = vaction & "/Normal"
                    ElseIf vaction = 1 Then
                        .Text = vaction & "/f1"
                    ElseIf vaction = 2 Then
                        .Text = vaction & "/f2"
                    ElseIf vaction = 3 Then
                        .Text = vaction & "/f3"
                    ElseIf vaction = 4 Then
                        .Text = vaction & "/f4"
                    ElseIf vaction = 5 Then
                        .Text = vaction & "/in"
                    ElseIf vaction = 6 Then
                        .Text = vaction & "/out"
                    Else
                        .Text = vaction & "/--"
                    End If
                Else
                    If vaction = 0 Then
                         .Text = vaction & "/Closed"
                    ElseIf vaction = 1 Then
                        .Text = vaction & "/Opened"
                    ElseIf vaction = 2 Then
                        .Text = vaction & "/HandOpen"
                    ElseIf vaction = 3 Then
                        .Text = vaction & "/ProcOpen"
                    ElseIf vaction = 4 Then
                        .Text = vaction & "/ProcClose"
                    ElseIf vaction = 5 Then
                        .Text = vaction & "/IllegalOpen"
                    ElseIf vaction = 6 Then
                        .Text = vaction & "/IlleagalRemove"
                     ElseIf vaction = 7 Then
                        .Text = vaction & "/Alarm"
                    Else
                        .Text = vaction & "/--"
                    End If
                End If
                .Col = 6
                    .Text = CStr(vYear) & "/" & Format(vMonth, "0#") & "/" & Format(vDay, "0#") & _
                            " " & Format(vHour, "0#") & ":" & Format(vMinute, "0#")
                    
                    LabelTotal.Caption = "Total : " & i
                    DoEvents
                    i = i + 1
                Loop
            End With
        End If
        gridSLogData.Redraw = True
        gridSLogData1.Redraw = True
        gridSLogData2.Redraw = True
        
        lblMessage.Caption = "ReadAllGLogData OK"
    End If
    
    'frmMain.FP_CLOCK1.EnableDevice mMachineNumber, True
    MousePointer = vbDefault
End Sub

Private Sub cmdAllSLogData_Click()
    Dim vTMachineNumber As Long
    Dim vSMachineNumber As Long
    Dim vSEnrollNumber As Long
    Dim vGEnrollNumber As Long
    Dim vGMachineNumber As Long
    Dim vManipulation As Long
    Dim vFingerNumber As Long
    Dim vYear As Long
    Dim vMonth As Long
    Dim vDay As Long
    Dim vHour As Long
    Dim vMinute As Long
    Dim vRet As Boolean
    Dim vErrorCode As Long
    Dim i, n As Long
    
    gridSLogData.Height = 4800
    gridSLogData.Redraw = False
    gridSLogData.Clear
    gridSLogData1.Top = gridSLogData.Top + gridSLogData.Height
    gridSLogData1.Height = 0
    gridSLogData1.Redraw = False
    gridSLogData1.Clear
    gridSLogData2.Top = gridSLogData.Top + gridSLogData.Height
    gridSLogData2.Height = 0
    gridSLogData2.Redraw = False
    gridSLogData2.Clear
    
    lblMessage.Caption = "Waiting..."
    LabelTotal.Caption = "Total : "
    DoEvents
    gridSLogData.Redraw = False
    gridSLogData.Clear
    gstrLogItem = Array("", "TMNo", "SEnlNo", "SMNo", "GEnlNo", "GMNo", "Manipulation", "FpNo", "DateTime")
    
    With gridSLogData
        .Row = 0
        .ColWidth(0) = 600
        For i = 1 To 8
            .Col = i
            .Text = gstrLogItem(i)
            .ColWidth(i) = 900
            .ColAlignment(i) = 3
        Next i
        .ColWidth(6) = 2000
        .ColAlignment(6) = 2
        .ColWidth(7) = 800
        .Col = 8
        .Text = gstrLogItem(8)
        .ColWidth(8) = 2000
        n = .Rows
        If n > 2 Then
            Do
                If n = 2 Then Exit Do
                .RemoveItem (n)
                n = n - 1
            Loop
        End If
        .Redraw = True
    End With
    
    MousePointer = vbHourglass
    vRet = frmMain.FP_CLOCK1.EnableDevice(mMachineNumber, False)
    If vRet = False Then
        lblMessage.Caption = gstrNoDevice
        MousePointer = vbDefault
        Exit Sub
    End If
    
    vRet = frmMain.FP_CLOCK1.ReadAllSLogData(mMachineNumber)
    If vRet = False Then
        frmMain.FP_CLOCK1.GetLastError vErrorCode
        lblMessage.Caption = ErrorPrint(vErrorCode)
    End If
    
    If vRet = True Then
        lblMessage.Caption = "Getting..."
        MousePointer = vbHourglass
        DoEvents
        With gridSLogData
            .Redraw = False
            i = 1
            Do
                vRet = frmMain.FP_CLOCK1.GetAllSLogData(mMachineNumber, _
                                                        vTMachineNumber, _
                                                        vSEnrollNumber, _
                                                        vSMachineNumber, _
                                                        vGEnrollNumber, _
                                                        vGMachineNumber, _
                                                        vManipulation, _
                                                        vFingerNumber, _
                                                        vYear, _
                                                        vMonth, _
                                                        vDay, _
                                                        vHour, _
                                                        vMinute)
                If vRet = False Then Exit Do
                If vRet = True And i <> 1 Then
                    .AddItem (1)
                End If

                .Row = i
                .Col = 0
                .Text = i
                .Col = 1
                .Text = vTMachineNumber
                .Col = 2
                .Text = vSEnrollNumber
                .Col = 3
                .Text = vSMachineNumber
                .Col = 4
                .Text = vGEnrollNumber
                .Col = 5
                .Text = vGMachineNumber
                .Col = 6
                Select Case vManipulation
                    Case 1
                        .Text = vManipulation & "--" & "Enroll User"
                    Case 2
                        .Text = vManipulation & "--" & "Enroll Manager"
                    Case 3
                        .Text = vManipulation & "--" & "Delete User"
                    Case 4
                        .Text = vManipulation & "--" & "Delete All LogData"
                    Case 5
                        .Text = vManipulation & "--" & "Modify System Info"
                    Case 6
                        .Text = vManipulation & "--" & "Before Set Time"
                    Case 7
                        .Text = vManipulation & "--" & "Set Time"
                    Case 8
                        .Text = vManipulation & "--" & "Modify Log Setting"
                    Case 9
                        .Text = vManipulation & "--" & "Modify Comm Setting"
                End Select
                
                .Col = 7
                If vFingerNumber < 10 Then
                    .Text = vFingerNumber
                ElseIf vFingerNumber = 10 Then
                    .Text = "Password"
                Else
                    .Text = "Card"
                End If
                .Col = 8
                .Text = CStr(vYear) & "/" & Format(vMonth, "0#") & "/" & Format(vDay, "0#") & _
                        " " & Format(vHour, "0#") & ":" & Format(vMinute, "0#")
                
                LabelTotal.Caption = "Total : " & i
                DoEvents
                i = i + 1
            Loop
            .Redraw = True
        End With
        lblMessage.Caption = "ReadAllSLogData OK"
    End If
    
    MousePointer = vbDefault
    frmMain.FP_CLOCK1.EnableDevice mMachineNumber, True
End Sub

Private Sub cmdEmptyGLog_Click()
    Dim vRet As Boolean
    Dim vErrorCode As Long
    
    lblMessage.Caption = "Working..."
    DoEvents
    
    vRet = frmMain.FP_CLOCK1.EnableDevice(mMachineNumber, False)
    If vRet = False Then
        lblMessage.Caption = gstrNoDevice
        Exit Sub
    End If
    
    vRet = frmMain.FP_CLOCK1.EmptyGeneralLogData(mMachineNumber)
    If vRet = True Then
        lblMessage.Caption = "EmptyGeneralLogData OK"
    Else
        frmMain.FP_CLOCK1.GetLastError vErrorCode
        lblMessage.Caption = ErrorPrint(vErrorCode)
    End If
    
    frmMain.FP_CLOCK1.EnableDevice mMachineNumber, True
End Sub

Private Sub cmdEmptySLog_Click()
    Dim vRet As Boolean
    Dim vErrorCode As Long
    
    lblMessage.Caption = "Working..."
    DoEvents
    
    vRet = frmMain.FP_CLOCK1.EnableDevice(mMachineNumber, False)
    If vRet = False Then
        lblMessage.Caption = gstrNoDevice
        Exit Sub
    End If
    
    vRet = frmMain.FP_CLOCK1.EmptySuperLogData(mMachineNumber)
    If vRet = True Then
        lblMessage.Caption = "EmptySuperLogData OK"
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

Private Sub cmdGlogData_Click()
    Dim vTMachineNumber As Long
    Dim vSMachineNumber As Long
    Dim vSEnrollNumber As Long
    Dim vInOutMode As Long
    Dim vVerifyMode As Long
    Dim vInout As Long
    Dim vEvent As Long
    Dim vYear As Long
    Dim vMonth As Long
    Dim vDay As Long
    Dim vHour As Long
    Dim vMinute As Long
    Dim vSecond As Long
    Dim vRet As Boolean
    Dim vErrorCode As Long
    Dim i, n As Long
    Dim vMaxLogCnt As Long
    
    Dim vinouttype As Long
    Dim vaction As Long
    
    vMaxLogCnt = gMaxLow
    
    lblMessage.Caption = "Waiting..."
    LabelTotal.Caption = "Total : "
    DoEvents
    
    gridSLogData.Height = 4800
    gridSLogData.Redraw = False
    gridSLogData.Clear
    gridSLogData1.Top = gridSLogData.Top + gridSLogData.Height
    gridSLogData1.Height = 0
    gridSLogData1.Redraw = False
    gridSLogData1.Clear
    gridSLogData2.Top = gridSLogData.Top + gridSLogData.Height
    gridSLogData2.Height = 0
    gridSLogData2.Redraw = False
    gridSLogData2.Clear
  
    gstrLogItem = Array("", "TMachineNo", "EnrollNo", "EMachineNo", "InOut", "VeriMode", "DateTime")
    With gridSLogData
        .Row = 0
        .ColWidth(0) = 600
        For i = 1 To 6
            .Col = i
            .Text = gstrLogItem(i)
            .ColAlignment(i) = 3
            .ColWidth(i) = 1200
        Next i
        .Col = 6
        .ColWidth(5) = 2000
        .ColWidth(6) = 2000
        .ColWidth(7) = 100
        .ColWidth(8) = 100
        n = .Rows
        If n > 2 Then
            Do
                If n = 2 Then Exit Do
                .RemoveItem (n)
                n = n - 1
            Loop
        End If
        .Redraw = True
    End With
    With gridSLogData1
        .Row = 0
        .ColWidth(0) = 600
        For i = 1 To 6
            .Col = i
            .ColAlignment(i) = 3
            .ColWidth(i) = 1200
        Next i
        .Col = 6
        .ColWidth(5) = 2000
        .ColWidth(6) = 2000
        .ColWidth(7) = 100
        .ColWidth(8) = 100
        n = .Rows
        If n > 2 Then
            Do
                If n = 2 Then Exit Do
                .RemoveItem (n)
                n = n - 1
            Loop
        End If
        .Redraw = True
    End With
    With gridSLogData2
        .Row = 0
        .ColWidth(0) = 600
        For i = 1 To 6
            .Col = i
            .ColAlignment(i) = 3
            .ColWidth(i) = 1200
        Next i
        .Col = 6
        .ColWidth(5) = 2000
        .ColWidth(6) = 2000
        .ColWidth(7) = 100
        .ColWidth(8) = 100
        n = .Rows
        If n > 2 Then
            Do
                If n = 2 Then Exit Do
                .RemoveItem (n)
                n = n - 1
            Loop
        End If
        .Redraw = True
    End With
    
    MousePointer = vbHourglass
    vRet = frmMain.FP_CLOCK1.EnableDevice(mMachineNumber, False)
    If vRet = False Then
        lblMessage.Caption = gstrNoDevice
        MousePointer = vbDefault
        Exit Sub
    End If
    
    vRet = frmMain.FP_CLOCK1.ReadGeneralLogData(mMachineNumber)
    If vRet = False Then
        frmMain.FP_CLOCK1.GetLastError vErrorCode
        lblMessage.Caption = ErrorPrint(vErrorCode)
    End If
    
    If vRet = True Then
        MousePointer = vbHourglass
        frmMain.FP_CLOCK1.EnableDevice mMachineNumber, True
        lblMessage.Caption = "Getting ..."
        DoEvents
        gridSLogData.Redraw = False
        gridSLogData1.Redraw = False
        gridSLogData2.Redraw = False
        With gridSLogData
            i = 1
            Do
                vRet = frmMain.FP_CLOCK1.GetGeneralLogDataWithSecond(mMachineNumber, _
                                                    vTMachineNumber, _
                                                    vSEnrollNumber, _
                                                    vSMachineNumber, _
                                                    vVerifyMode, _
                                                    vInout, _
                                                    vEvent, _
                                                    vYear, _
                                                    vMonth, _
                                                    vDay, _
                                                    vHour, _
                                                    vMinute, _
                                                    vSecond)
                If vRet = False Then Exit Do
                If vRet = True And i <> 1 Then
                    .AddItem (1)
                End If
                 vinouttype = vInout
                 vaction = vEvent
                .Row = i
                .Col = 0
                .Text = i
                .Col = 1
                .Text = vTMachineNumber
                .Col = 2
                .Text = vSEnrollNumber
                .Col = 3
                .Text = vSMachineNumber
                .Col = 4
                .Text = vinouttype
                .Col = 5
                If vSEnrollNumber <> 0 Then
                    If vaction = 0 Then
                         .Text = vaction & "/Normal"
                    ElseIf vaction = 1 Then
                        .Text = vaction & "/f1"
                    ElseIf vaction = 2 Then
                        .Text = vaction & "/f2"
                    ElseIf vaction = 3 Then
                        .Text = vaction & "/f3"
                    ElseIf vaction = 4 Then
                        .Text = vaction & "/f4"
                    ElseIf vaction = 5 Then
                        .Text = vaction & "/in"
                    ElseIf vaction = 6 Then
                        .Text = vaction & "/out"
                    Else
                        .Text = vaction & "/--"
                    End If
                Else
                    If vaction = 0 Then
                         .Text = vaction & "/Closed"
                    ElseIf vaction = 1 Then
                        .Text = vaction & "/Opened"
                    ElseIf vaction = 2 Then
                        .Text = vaction & "/HandOpen"
                    ElseIf vaction = 3 Then
                        .Text = vaction & "/ProcOpen"
                    ElseIf vaction = 4 Then
                        .Text = vaction & "/ProcClose"
                    ElseIf vaction = 5 Then
                        .Text = vaction & "/IllegalOpen"
                    ElseIf vaction = 6 Then
                        .Text = vaction & "/IlleagalRemove"
                     ElseIf vaction = 7 Then
                        .Text = vaction & "/Alarm"
                    Else
                        .Text = vaction & "/--"
                    End If
                End If
                .Col = 6
                .Text = CStr(vYear) & "/" & Format(vMonth, "0#") & "/" & Format(vDay, "0#") & _
                        " " & Format(vHour, "0#") & ":" & Format(vMinute, "0#") & "." & Format(vSecond, "0#")
                
                LabelTotal.Caption = "Total : " & i
                DoEvents
                i = i + 1
                If i > vMaxLogCnt Then Exit Do
            Loop
        End With
        
        If i > vMaxLogCnt Then
            gridSLogData.Height = gridSLogData.Height / 2
            gridSLogData1.Top = gridSLogData.Top + gridSLogData.Height
            gridSLogData1.Height = gridSLogData.Height
            With gridSLogData1
                Do
                    vRet = frmMain.FP_CLOCK1.GetGeneralLogData(mMachineNumber, _
                                                        vTMachineNumber, _
                                                        vSEnrollNumber, _
                                                        vSMachineNumber, _
                                                        vVerifyMode, _
                                                        vYear, _
                                                        vMonth, _
                                                        vDay, _
                                                        vHour, _
                                                        vMinute)
                    If vRet = False Then Exit Do
                    If vRet = True And i <> 1 Then
                        If i - vMaxLogCnt > 1 Then .AddItem (1)
                    End If
                    vinouttype = Int(vVerifyMode / 8)
                vaction = vVerifyMode Mod 8
                    .Row = i - vMaxLogCnt
                    .Col = 0
                    .Text = i
                    .Col = 1
                .Text = vTMachineNumber
                .Col = 2
                .Text = vSEnrollNumber
                .Col = 3
                .Text = vSMachineNumber
                .Col = 4
                .Text = vinouttype
                .Col = 5
                If vSEnrollNumber <> 0 Then
                    If vaction = 0 Then
                         .Text = vaction & "/Normal"
                    ElseIf vaction = 1 Then
                        .Text = vaction & "/f1"
                    ElseIf vaction = 2 Then
                        .Text = vaction & "/f2"
                    ElseIf vaction = 3 Then
                        .Text = vaction & "/f3"
                    ElseIf vaction = 4 Then
                        .Text = vaction & "/f4"
                    ElseIf vaction = 5 Then
                        .Text = vaction & "/in"
                    ElseIf vaction = 6 Then
                        .Text = vaction & "/out"
                    Else
                        .Text = vaction & "/--"
                    End If
                Else
                    If vaction = 0 Then
                         .Text = vaction & "/Closed"
                    ElseIf vaction = 1 Then
                        .Text = vaction & "/Opened"
                    ElseIf vaction = 2 Then
                        .Text = vaction & "/HandOpen"
                    ElseIf vaction = 3 Then
                        .Text = vaction & "/ProcOpen"
                    ElseIf vaction = 4 Then
                        .Text = vaction & "/ProcClose"
                    ElseIf vaction = 5 Then
                        .Text = vaction & "/IllegalOpen"
                    ElseIf vaction = 6 Then
                        .Text = vaction & "/IlleagalRemove"
                     ElseIf vaction = 7 Then
                        .Text = vaction & "/Alarm"
                    Else
                        .Text = vaction & "/--"
                    End If
                End If
                .Col = 6
                    .Text = CStr(vYear) & "/" & Format(vMonth, "0#") & "/" & Format(vDay, "0#") & _
                            " " & Format(vHour, "0#") & ":" & Format(vMinute, "0#")
                    
                    LabelTotal.Caption = "Total : " & i
                    DoEvents
                    i = i + 1
                    If i > vMaxLogCnt * 2 Then Exit Do
                Loop
            End With
        End If
        vMaxLogCnt = vMaxLogCnt * 2
        If i > vMaxLogCnt Then
            gridSLogData.Height = gridSLogData.Height * 2 / 3
            gridSLogData1.Top = gridSLogData.Top + gridSLogData.Height
            gridSLogData1.Height = gridSLogData.Height
            gridSLogData2.Top = gridSLogData.Top + gridSLogData.Height * 2
            gridSLogData2.Height = gridSLogData.Height
            With gridSLogData2
                Do
                    vRet = frmMain.FP_CLOCK1.GetGeneralLogData(mMachineNumber, _
                                                        vTMachineNumber, _
                                                        vSEnrollNumber, _
                                                        vSMachineNumber, _
                                                        vVerifyMode, _
                                                        vYear, _
                                                        vMonth, _
                                                        vDay, _
                                                        vHour, _
                                                        vMinute)
                    If vRet = False Then Exit Do
                    If vRet = True And i <> 1 Then
                        If i - vMaxLogCnt > 1 Then .AddItem (1)
                    End If
                    vinouttype = Int(vVerifyMode / 8)
                vaction = vVerifyMode Mod 8
                    .Row = i - vMaxLogCnt
                    .Col = 0
                    .Text = i
                     .Col = 1
                .Text = vTMachineNumber
                .Col = 2
                .Text = vSEnrollNumber
                .Col = 3
                .Text = vSMachineNumber
                .Col = 4
                .Text = vinouttype
                .Col = 5
                If vSEnrollNumber <> 0 Then
                    If vaction = 0 Then
                         .Text = vaction & "/Normal"
                    ElseIf vaction = 1 Then
                        .Text = vaction & "/f1"
                    ElseIf vaction = 2 Then
                        .Text = vaction & "/f2"
                    ElseIf vaction = 3 Then
                        .Text = vaction & "/f3"
                    ElseIf vaction = 4 Then
                        .Text = vaction & "/f4"
                    ElseIf vaction = 5 Then
                        .Text = vaction & "/in"
                    ElseIf vaction = 6 Then
                        .Text = vaction & "/out"
                    Else
                        .Text = vaction & "/--"
                    End If
                Else
                    If vaction = 0 Then
                         .Text = vaction & "/Closed"
                    ElseIf vaction = 1 Then
                        .Text = vaction & "/Opened"
                    ElseIf vaction = 2 Then
                        .Text = vaction & "/HandOpen"
                    ElseIf vaction = 3 Then
                        .Text = vaction & "/ProcOpen"
                    ElseIf vaction = 4 Then
                        .Text = vaction & "/ProcClose"
                    ElseIf vaction = 5 Then
                        .Text = vaction & "/IllegalOpen"
                    ElseIf vaction = 6 Then
                        .Text = vaction & "/IlleagalRemove"
                     ElseIf vaction = 7 Then
                        .Text = vaction & "/Alarm"
                    Else
                        .Text = vaction & "/--"
                    End If
                End If
                .Col = 6
                    .Text = CStr(vYear) & "/" & Format(vMonth, "0#") & "/" & Format(vDay, "0#") & _
                            " " & Format(vHour, "0#") & ":" & Format(vMinute, "0#")
                    
                    LabelTotal.Caption = "Total : " & i
                    DoEvents
                    i = i + 1
                Loop
            End With
        End If
        gridSLogData.Redraw = True
        gridSLogData1.Redraw = True
        gridSLogData2.Redraw = True
        
        lblMessage.Caption = "ReadGeneralLogData OK"
    End If
    
    MousePointer = vbDefault
    'frmMain.FP_CLOCK1.EnableDevice mMachineNumber, True
End Sub

Private Sub cmdSLogData_Click()
    Dim vTMachineNumber As Long
    Dim vSMachineNumber As Long
    Dim vSEnrollNumber As Long
    Dim vGEnrollNumber As Long
    Dim vGMachineNumber As Long
    Dim vManipulation As Long
    Dim vFingerNumber As Long
    Dim vYear As Long
    Dim vMonth As Long
    Dim vDay As Long
    Dim vHour As Long
    Dim vMinute As Long
    Dim vRet As Boolean
    Dim vErrorCode As Long
    Dim i, n As Long
    
    gridSLogData.Height = 4800
    gridSLogData.Redraw = False
    gridSLogData.Clear
    gridSLogData1.Top = gridSLogData.Top + gridSLogData.Height
    gridSLogData1.Height = 0
    gridSLogData1.Redraw = False
    gridSLogData1.Clear
    gridSLogData2.Top = gridSLogData.Top + gridSLogData.Height
    gridSLogData2.Height = 0
    gridSLogData2.Redraw = False
    gridSLogData2.Clear
    
    lblMessage.Caption = "Waiting..."
    LabelTotal.Caption = "Total : "
    DoEvents
    
    gridSLogData.Redraw = False
    gridSLogData.Clear
    
    gstrLogItem = Array("", "TMNo", "SEnlNo", "SMNo", "GEnlNo", "GMNo", "Manipulation", "FpNo", "DateTime")
    With gridSLogData
        .Row = 0
        .ColWidth(0) = 600
        For i = 1 To 8
            .Col = i
            .Text = gstrLogItem(i)
            .ColAlignment(i) = 3
            .ColWidth(i) = 900
        Next i
        .Col = 6
        .ColWidth(6) = 2000
        .ColAlignment(6) = 2
        .ColWidth(7) = 800
        .Col = 8
        .Text = gstrLogItem(8)
        .ColWidth(8) = 2000
        n = .Rows
        If n > 2 Then
            Do
                If n = 2 Then Exit Do
                .RemoveItem (n)
                n = n - 1
            Loop
        End If
        .Redraw = True
    End With
    
    MousePointer = vbHourglass
    vRet = frmMain.FP_CLOCK1.EnableDevice(mMachineNumber, False)
    If vRet = False Then
        lblMessage.Caption = gstrNoDevice
        MousePointer = vbDefault
        Exit Sub
    End If
    
    vRet = frmMain.FP_CLOCK1.ReadSuperLogData(mMachineNumber)
    If vRet = False Then
        frmMain.FP_CLOCK1.GetLastError vErrorCode
        lblMessage.Caption = ErrorPrint(vErrorCode)
    End If
    
    If vRet = True Then
        MousePointer = vbHourglass
        lblMessage.Caption = "Getting ..."
        DoEvents
        With gridSLogData
            .Redraw = False
            i = 1
            Do
                vRet = frmMain.FP_CLOCK1.GetSuperLogData(mMachineNumber, _
                                                        vTMachineNumber, _
                                                        vSEnrollNumber, _
                                                        vSMachineNumber, _
                                                        vGEnrollNumber, _
                                                        vGMachineNumber, _
                                                        vManipulation, _
                                                        vFingerNumber, _
                                                        vYear, _
                                                        vMonth, _
                                                        vDay, _
                                                        vHour, _
                                                        vMinute)
                If vRet = False Then Exit Do
                If vRet = True And i <> 1 Then
                    .AddItem (1)
                End If

                .Row = i
                .Col = 0
                .Text = i
                .Col = 1
                .Text = vTMachineNumber
                .Col = 2
                .Text = vSEnrollNumber
                .Col = 3
                .Text = vSMachineNumber
                .Col = 4
                .Text = vGEnrollNumber
                .Col = 5
                .Text = vGMachineNumber
                .Col = 6
                Select Case vManipulation
                    Case 1
                        .Text = vManipulation & "--" & "Enroll User"
                    Case 2
                        .Text = vManipulation & "--" & "Enroll Manager"
                    Case 3
                        .Text = vManipulation & "--" & "Delete User"
                    Case 4
                        .Text = vManipulation & "--" & "Delete All LogData"
                    Case 5
                        .Text = vManipulation & "--" & "Modify System Info"
                    Case 6
                        .Text = vManipulation & "--" & "Before Set Time"
                    Case 7
                        .Text = vManipulation & "--" & "Set Time"
                    Case 8
                        .Text = vManipulation & "--" & "Modify Log Setting"
                    Case 9
                        .Text = vManipulation & "--" & "Modify Comm Setting"
                End Select
                .Col = 7
                If vFingerNumber < 10 Then
                    .Text = vFingerNumber
                ElseIf vFingerNumber = 10 Then
                    .Text = "Password"
                Else
                    .Text = "Card"
                End If
                .Col = 8
                .Text = CStr(vYear) & "/" & Format(vMonth, "0#") & "/" & Format(vDay, "0#") & _
                        " " & Format(vHour, "0#") & ":" & Format(vMinute, "0#")
                
                LabelTotal.Caption = "Total : " & i
                DoEvents
                i = i + 1
            Loop
            .Redraw = True
        End With
        lblMessage.Caption = "ReadSuperLogData OK"
    End If
    
    MousePointer = vbDefault
    frmMain.FP_CLOCK1.EnableDevice mMachineNumber, True
End Sub


Private Sub cmdUSBGlogData_Click()
 Dim vTMachineNumber As Long
    Dim vSMachineNumber As Long
    Dim vSEnrollNumber As Long
    Dim vInOutMode As Long
    Dim vVerifyMode As Long
    Dim vInout As Long
    Dim vEvent As Long
    Dim vYear As Long
    Dim vMonth As Long
    Dim vDay As Long
    Dim vHour As Long
    Dim vMinute As Long
    Dim vSecond As Long
    Dim vRet As Boolean
    Dim vErrorCode As Long
    Dim i, n As Long
    Dim vMaxLogCnt As Long
    
    Dim vinouttype As Long
    Dim vaction As Long
    
    Dim vstrFileName As String
    
    dlgOpen.CancelError = False
    dlgOpen.Flags = cdlOFNHideReadOnly
    dlgOpen.Filter = "DAT Files (*.dat)|*.dat|All Files (*.*)|*.*"
    dlgOpen.FilterIndex = 1
    dlgOpen.InitDir = CurDir
    dlgOpen.ShowOpen
    vstrFileName = dlgOpen.FileName
    If vstrFileName = "" Then Exit Sub
    
    vMaxLogCnt = gMaxLow
    
    lblMessage.Caption = "Waiting..."
    LabelTotal.Caption = "Total : "
    DoEvents
    
    gridSLogData.Height = 4800
    gridSLogData.Redraw = False
    gridSLogData.Clear
    gridSLogData1.Top = gridSLogData.Top + gridSLogData.Height
    gridSLogData1.Height = 0
    gridSLogData1.Redraw = False
    gridSLogData1.Clear
    gridSLogData2.Top = gridSLogData.Top + gridSLogData.Height
    gridSLogData2.Height = 0
    gridSLogData2.Redraw = False
    gridSLogData2.Clear
  
    gstrLogItem = Array("", "TMachineNo", "EnrollNo", "EMachineNo", "InOut", "VeriMode", "DateTime")
    With gridSLogData
        .Row = 0
        .ColWidth(0) = 600
        For i = 1 To 6
            .Col = i
            .Text = gstrLogItem(i)
            .ColAlignment(i) = 3
            .ColWidth(i) = 1200
        Next i
        .Col = 6
        .ColWidth(5) = 2000
        .ColWidth(6) = 2000
        .ColWidth(7) = 100
        .ColWidth(8) = 100
        n = .Rows
        If n > 2 Then
            Do
                If n = 2 Then Exit Do
                .RemoveItem (n)
                n = n - 1
            Loop
        End If
        .Redraw = True
    End With
    With gridSLogData1
        .Row = 0
        .ColWidth(0) = 600
        For i = 1 To 6
            .Col = i
            .ColAlignment(i) = 3
            .ColWidth(i) = 1200
        Next i
        .Col = 6
        .ColWidth(5) = 2000
        .ColWidth(6) = 2000
        .ColWidth(7) = 100
        .ColWidth(8) = 100
        n = .Rows
        If n > 2 Then
            Do
                If n = 2 Then Exit Do
                .RemoveItem (n)
                n = n - 1
            Loop
        End If
        .Redraw = True
    End With
    With gridSLogData2
        .Row = 0
        .ColWidth(0) = 600
        For i = 1 To 6
            .Col = i
            .ColAlignment(i) = 3
            .ColWidth(i) = 1200
        Next i
        .Col = 6
        .ColWidth(5) = 2000
        .ColWidth(6) = 2000
        .ColWidth(7) = 100
        .ColWidth(8) = 100
        n = .Rows
        If n > 2 Then
            Do
                If n = 2 Then Exit Do
                .RemoveItem (n)
                n = n - 1
            Loop
        End If
        .Redraw = True
    End With
    
    MousePointer = vbHourglass
    
    
    vRet = frmMain.FP_CLOCK1.USBReadGeneralLogData(vstrFileName)
    If vRet = False Then
        frmMain.FP_CLOCK1.GetLastError vErrorCode
        lblMessage.Caption = ErrorPrint(vErrorCode)
    End If
    
    If vRet = True Then
        MousePointer = vbHourglass
        lblMessage.Caption = "Getting ..."
        DoEvents
        gridSLogData.Redraw = False
        gridSLogData1.Redraw = False
        gridSLogData2.Redraw = False
        With gridSLogData
            i = 1
            Do
                vRet = frmMain.FP_CLOCK1.GetGeneralLogDataWithSecond(mMachineNumber, _
                                                    vTMachineNumber, _
                                                    vSEnrollNumber, _
                                                    vSMachineNumber, _
                                                    vVerifyMode, _
                                                    vInout, _
                                                    vEvent, _
                                                    vYear, _
                                                    vMonth, _
                                                    vDay, _
                                                    vHour, _
                                                    vMinute, _
                                                    vSecond)
                If vRet = False Then Exit Do
                If vRet = True And i <> 1 Then
                    .AddItem (1)
                End If
                 vinouttype = vInout
                vaction = vEvent
                .Row = i
                .Col = 0
                .Text = i
                .Col = 1
                .Text = vTMachineNumber
                .Col = 2
                .Text = vSEnrollNumber
                .Col = 3
                .Text = vSMachineNumber
                .Col = 4
                .Text = vinouttype
                .Col = 5
                If vSEnrollNumber <> 0 Then
                    If vaction = 0 Then
                         .Text = vaction & "/Normal"
                    ElseIf vaction = 1 Then
                        .Text = vaction & "/f1"
                    ElseIf vaction = 2 Then
                        .Text = vaction & "/f2"
                    ElseIf vaction = 3 Then
                        .Text = vaction & "/f3"
                    ElseIf vaction = 4 Then
                        .Text = vaction & "/f4"
                    ElseIf vaction = 5 Then
                        .Text = vaction & "/in"
                    ElseIf vaction = 6 Then
                        .Text = vaction & "/out"
                    Else
                        .Text = vaction & "/--"
                    End If
                Else
                    If vaction = 0 Then
                         .Text = vaction & "/Closed"
                    ElseIf vaction = 1 Then
                        .Text = vaction & "/Opened"
                    ElseIf vaction = 2 Then
                        .Text = vaction & "/HandOpen"
                    ElseIf vaction = 3 Then
                        .Text = vaction & "/ProcOpen"
                    ElseIf vaction = 4 Then
                        .Text = vaction & "/ProcClose"
                    ElseIf vaction = 5 Then
                        .Text = vaction & "/IllegalOpen"
                    ElseIf vaction = 6 Then
                        .Text = vaction & "/IlleagalRemove"
                     ElseIf vaction = 7 Then
                        .Text = vaction & "/Alarm"
                    Else
                        .Text = vaction & "/--"
                    End If
                End If
                .Col = 6
                .Text = CStr(vYear) & "/" & Format(vMonth, "0#") & "/" & Format(vDay, "0#") & _
                        " " & Format(vHour, "0#") & ":" & Format(vMinute, "0#") & "." & Format(vSecond, "0#")
                
                LabelTotal.Caption = "Total : " & i
                DoEvents
                i = i + 1
                If i > vMaxLogCnt Then Exit Do
            Loop
        End With
        
        If i > vMaxLogCnt Then
            gridSLogData.Height = gridSLogData.Height / 2
            gridSLogData1.Top = gridSLogData.Top + gridSLogData.Height
            gridSLogData1.Height = gridSLogData.Height
            With gridSLogData1
                Do
                    vRet = frmMain.FP_CLOCK1.GetGeneralLogData(mMachineNumber, _
                                                        vTMachineNumber, _
                                                        vSEnrollNumber, _
                                                        vSMachineNumber, _
                                                        vVerifyMode, _
                                                        vYear, _
                                                        vMonth, _
                                                        vDay, _
                                                        vHour, _
                                                        vMinute)
                    If vRet = False Then Exit Do
                    If vRet = True And i <> 1 Then
                        If i - vMaxLogCnt > 1 Then .AddItem (1)
                    End If
                    .Row = i - vMaxLogCnt
                    .Col = 0
                    .Text = i
                   .Col = 1
                .Text = vTMachineNumber
                .Col = 2
                .Text = vSEnrollNumber
                .Col = 3
                .Text = vSMachineNumber
                .Col = 4
                .Text = vinouttype
                .Col = 5
                If vSEnrollNumber <> 0 Then
                    If vaction = 0 Then
                         .Text = vaction & "/Normal"
                    ElseIf vaction = 1 Then
                        .Text = vaction & "/f1"
                    ElseIf vaction = 2 Then
                        .Text = vaction & "/f2"
                    ElseIf vaction = 3 Then
                        .Text = vaction & "/f3"
                    ElseIf vaction = 4 Then
                        .Text = vaction & "/f4"
                    ElseIf vaction = 5 Then
                        .Text = vaction & "/in"
                    ElseIf vaction = 6 Then
                        .Text = vaction & "/out"
                    Else
                        .Text = vaction & "/--"
                    End If
                Else
                    If vaction = 0 Then
                         .Text = vaction & "/Closed"
                    ElseIf vaction = 1 Then
                        .Text = vaction & "/Opened"
                    ElseIf vaction = 2 Then
                        .Text = vaction & "/HandOpen"
                    ElseIf vaction = 3 Then
                        .Text = vaction & "/ProcOpen"
                    ElseIf vaction = 4 Then
                        .Text = vaction & "/ProcClose"
                    ElseIf vaction = 5 Then
                        .Text = vaction & "/IllegalOpen"
                    ElseIf vaction = 6 Then
                        .Text = vaction & "/IlleagalRemove"
                     ElseIf vaction = 7 Then
                        .Text = vaction & "/Alarm"
                    Else
                        .Text = vaction & "/--"
                    End If
                End If
                .Col = 6
                    .Text = CStr(vYear) & "/" & Format(vMonth, "0#") & "/" & Format(vDay, "0#") & _
                            " " & Format(vHour, "0#") & ":" & Format(vMinute, "0#")
                    
                    LabelTotal.Caption = "Total : " & i
                    DoEvents
                    i = i + 1
                    If i > vMaxLogCnt * 2 Then Exit Do
                Loop
            End With
        End If
        vMaxLogCnt = vMaxLogCnt * 2
        If i > vMaxLogCnt Then
            gridSLogData.Height = gridSLogData.Height * 2 / 3
            gridSLogData1.Top = gridSLogData.Top + gridSLogData.Height
            gridSLogData1.Height = gridSLogData.Height
            gridSLogData2.Top = gridSLogData.Top + gridSLogData.Height * 2
            gridSLogData2.Height = gridSLogData.Height
            With gridSLogData2
                Do
                    vRet = frmMain.FP_CLOCK1.GetGeneralLogData(mMachineNumber, _
                                                        vTMachineNumber, _
                                                        vSEnrollNumber, _
                                                        vSMachineNumber, _
                                                        vVerifyMode, _
                                                        vYear, _
                                                        vMonth, _
                                                        vDay, _
                                                        vHour, _
                                                        vMinute)
                    If vRet = False Then Exit Do
                    If vRet = True And i <> 1 Then
                        If i - vMaxLogCnt > 1 Then .AddItem (1)
                    End If
                    .Row = i - vMaxLogCnt
                    .Col = 0
                    .Text = i
                    .Col = 1
                .Text = vTMachineNumber
                .Col = 2
                .Text = vSEnrollNumber
                .Col = 3
                .Text = vSMachineNumber
                .Col = 4
                .Text = vinouttype
                .Col = 5
                If vSEnrollNumber <> 0 Then
                    If vaction = 0 Then
                         .Text = vaction & "/Normal"
                    ElseIf vaction = 1 Then
                        .Text = vaction & "/f1"
                    ElseIf vaction = 2 Then
                        .Text = vaction & "/f2"
                    ElseIf vaction = 3 Then
                        .Text = vaction & "/f3"
                    ElseIf vaction = 4 Then
                        .Text = vaction & "/f4"
                    ElseIf vaction = 5 Then
                        .Text = vaction & "/in"
                    ElseIf vaction = 6 Then
                        .Text = vaction & "/out"
                    Else
                        .Text = vaction & "/--"
                    End If
                Else
                    If vaction = 0 Then
                         .Text = vaction & "/Closed"
                    ElseIf vaction = 1 Then
                        .Text = vaction & "/Opened"
                    ElseIf vaction = 2 Then
                        .Text = vaction & "/HandOpen"
                    ElseIf vaction = 3 Then
                        .Text = vaction & "/ProcOpen"
                    ElseIf vaction = 4 Then
                        .Text = vaction & "/ProcClose"
                    ElseIf vaction = 5 Then
                        .Text = vaction & "/IllegalOpen"
                    ElseIf vaction = 6 Then
                        .Text = vaction & "/IlleagalRemove"
                     ElseIf vaction = 7 Then
                        .Text = vaction & "/Alarm"
                    Else
                        .Text = vaction & "/--"
                    End If
                End If
                .Col = 6
                    .Text = CStr(vYear) & "/" & Format(vMonth, "0#") & "/" & Format(vDay, "0#") & _
                            " " & Format(vHour, "0#") & ":" & Format(vMinute, "0#")
                    
                    LabelTotal.Caption = "Total : " & i
                    DoEvents
                    i = i + 1
                Loop
            End With
        End If
        gridSLogData.Redraw = True
        gridSLogData1.Redraw = True
        gridSLogData2.Redraw = True
        
        lblMessage.Caption = "USB ReadGeneralLogData OK"
    End If
    
    MousePointer = vbDefault
End Sub

Private Sub cmdUSBSLogData_Click()
  Dim vTMachineNumber As Long
    Dim vSMachineNumber As Long
    Dim vSEnrollNumber As Long
    Dim vGEnrollNumber As Long
    Dim vGMachineNumber As Long
    Dim vManipulation As Long
    Dim vFingerNumber As Long
    Dim vYear As Long
    Dim vMonth As Long
    Dim vDay As Long
    Dim vHour As Long
    Dim vMinute As Long
    Dim vRet As Boolean
    Dim vErrorCode As Long
    Dim i, n As Long
    
     Dim vstrFileName As String
     
    dlgOpen.CancelError = False
    dlgOpen.Flags = cdlOFNHideReadOnly
    dlgOpen.Filter = "DAT Files (*.dat)|*.dat|All Files (*.*)|*.*"
    dlgOpen.FilterIndex = 1
    dlgOpen.InitDir = CurDir
    dlgOpen.ShowOpen
    vstrFileName = dlgOpen.FileName
    If vstrFileName = "" Then Exit Sub
    
    gridSLogData.Height = 4800
    gridSLogData.Redraw = False
    gridSLogData.Clear
    gridSLogData1.Top = gridSLogData.Top + gridSLogData.Height
    gridSLogData1.Height = 0
    gridSLogData1.Redraw = False
    gridSLogData1.Clear
    gridSLogData2.Top = gridSLogData.Top + gridSLogData.Height
    gridSLogData2.Height = 0
    gridSLogData2.Redraw = False
    gridSLogData2.Clear
    
    lblMessage.Caption = "Waiting..."
    LabelTotal.Caption = "Total : "
    DoEvents
    
    gridSLogData.Redraw = False
    gridSLogData.Clear
    
    gstrLogItem = Array("", "TMNo", "SEnlNo", "SMNo", "GEnlNo", "GMNo", "Manipulation", "FpNo", "DateTime")
    With gridSLogData
        .Row = 0
        .ColWidth(0) = 600
        For i = 1 To 8
            .Col = i
            .Text = gstrLogItem(i)
            .ColAlignment(i) = 3
            .ColWidth(i) = 900
        Next i
        .Col = 6
        .ColWidth(6) = 2000
        .ColAlignment(6) = 2
        .ColWidth(7) = 800
        .Col = 8
        .Text = gstrLogItem(8)
        .ColWidth(8) = 2000
        n = .Rows
        If n > 2 Then
            Do
                If n = 2 Then Exit Do
                .RemoveItem (n)
                n = n - 1
            Loop
        End If
        .Redraw = True
    End With
    
    MousePointer = vbHourglass
    
    
    vRet = frmMain.FP_CLOCK1.USBReadSuperLogData(vstrFileName)
    If vRet = False Then
        frmMain.FP_CLOCK1.GetLastError vErrorCode
        lblMessage.Caption = ErrorPrint(vErrorCode)
    End If
    
    If vRet = True Then
        MousePointer = vbHourglass
        lblMessage.Caption = "Getting ..."
        DoEvents
        With gridSLogData
            .Redraw = False
            i = 1
            Do
                vRet = frmMain.FP_CLOCK1.GetSuperLogData(mMachineNumber, _
                                                        vTMachineNumber, _
                                                        vSEnrollNumber, _
                                                        vSMachineNumber, _
                                                        vGEnrollNumber, _
                                                        vGMachineNumber, _
                                                        vManipulation, _
                                                        vFingerNumber, _
                                                        vYear, _
                                                        vMonth, _
                                                        vDay, _
                                                        vHour, _
                                                        vMinute)
                If vRet = False Then Exit Do
                If vRet = True And i <> 1 Then
                    .AddItem (1)
                End If

                .Row = i
                .Col = 0
                .Text = i
                .Col = 1
                .Text = vTMachineNumber
                .Col = 2
                .Text = vSEnrollNumber
                .Col = 3
                .Text = vSMachineNumber
                .Col = 4
                .Text = vGEnrollNumber
                .Col = 5
                .Text = vGMachineNumber
                .Col = 6
               Select Case vManipulation
                    Case 1
                        .Text = vManipulation & "--" & "Enroll User"
                    Case 2
                        .Text = vManipulation & "--" & "Enroll Manager"
                    Case 3
                        .Text = vManipulation & "--" & "Delete User"
                    Case 4
                        .Text = vManipulation & "--" & "Delete All LogData"
                    Case 5
                        .Text = vManipulation & "--" & "Modify System Info"
                    Case 6
                        .Text = vManipulation & "--" & "Before Set Time"
                    Case 7
                        .Text = vManipulation & "--" & "Set Time"
                    Case 8
                        .Text = vManipulation & "--" & "Modify Log Setting"
                    Case 9
                        .Text = vManipulation & "--" & "Modify Comm Setting"
                End Select
                .Col = 7
                If vFingerNumber < 10 Then
                    .Text = vFingerNumber
                ElseIf vFingerNumber = 10 Then
                    .Text = "Password"
                Else
                    .Text = "Card"
                End If
                .Col = 8
                .Text = CStr(vYear) & "/" & Format(vMonth, "0#") & "/" & Format(vDay, "0#") & _
                        " " & Format(vHour, "0#") & ":" & Format(vMinute, "0#")
                
                LabelTotal.Caption = "Total : " & i
                DoEvents
                i = i + 1
            Loop
            .Redraw = True
        End With
        lblMessage.Caption = " USB ReadSuperLogData OK"
    End If
    MousePointer = vbDefault
End Sub

Private Sub Form_Load()
    mMachineNumber = frmMain.gMachineNumber
    chkReadMark.Value = 1
End Sub

Private Sub Form_Unload(Cancel As Integer)
    Me.Visible = False
    frmMain.Visible = True
End Sub

