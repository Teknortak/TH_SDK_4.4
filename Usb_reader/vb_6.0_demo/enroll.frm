VERSION 5.00
Object = "{5641F7A6-84AE-4221-A3D9-6EABE32C219C}#1.0#0"; "Fpreader.ocx"
Object = "{67397AA1-7FB1-11D0-B148-00A0C922E820}#6.0#0"; "msadodc.ocx"
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   5385
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   7125
   LinkTopic       =   "Form1"
   ScaleHeight     =   5385
   ScaleWidth      =   7125
   StartUpPosition =   3  '����ȱʡ
   Begin VB.CommandButton cmdEnrollFPwithstring 
      Caption         =   "Enroll FP with string"
      Height          =   495
      Left            =   4680
      TabIndex        =   11
      Top             =   840
      Width           =   2055
   End
   Begin VB.TextBox txtPrivilige 
      Height          =   375
      Left            =   5640
      TabIndex        =   10
      Text            =   "0"
      Top             =   2880
      Width           =   615
   End
   Begin VB.TextBox txtFPNUM 
      Height          =   270
      Left            =   5640
      TabIndex        =   8
      Text            =   "0"
      Top             =   2520
      Width           =   615
   End
   Begin VB.TextBox txtID 
      Height          =   375
      Left            =   5640
      TabIndex        =   6
      Text            =   "1"
      Top             =   2040
      Width           =   1095
   End
   Begin VB.CommandButton cmdDeletedatabase 
      Caption         =   "Delete all"
      Height          =   375
      Left            =   4800
      TabIndex        =   4
      Top             =   4200
      Width           =   1695
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Cancel"
      Height          =   375
      Left            =   4680
      TabIndex        =   0
      Top             =   1440
      Width           =   2055
   End
   Begin VB.CommandButton cmdEnrollFP 
      Caption         =   "Enroll FP"
      Height          =   495
      Left            =   4680
      TabIndex        =   1
      Top             =   240
      Width           =   2055
   End
   Begin MSAdodcLib.Adodc datEnroll 
      Height          =   495
      Left            =   4680
      Top             =   3480
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
         Name            =   "����"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      _Version        =   393216
   End
   Begin VB.Label Label3 
      Caption         =   "Privilige:"
      Height          =   375
      Left            =   4560
      TabIndex        =   9
      Top             =   2880
      Width           =   975
   End
   Begin VB.Label Label2 
      Caption         =   "FP-NUM:"
      Height          =   375
      Left            =   4560
      TabIndex        =   7
      Top             =   2520
      Width           =   735
   End
   Begin VB.Label Label1 
      Caption         =   "ID:"
      Height          =   255
      Left            =   4680
      TabIndex        =   5
      Top             =   2040
      Width           =   375
   End
   Begin FPREADERLib.Fpreader Fpreader1 
      Height          =   495
      Left            =   6960
      TabIndex        =   3
      Top             =   1560
      Visible         =   0   'False
      Width           =   855
      _Version        =   65536
      _ExtentX        =   1508
      _ExtentY        =   873
      _StockProps     =   0
   End
   Begin VB.Image Image1 
      Height          =   4320
      Left            =   480
      Picture         =   "enroll.frx":0000
      Top             =   120
      Width           =   3840
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
      Left            =   0
      TabIndex        =   2
      Top             =   4800
      Width           =   7035
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Const DATASIZE = 1420 / 4
Const NAMESIZE = 54
Dim glngEnrollData As Variant
Dim gTemplngEnrollData(DATASIZE) As Long
Dim gbytEnrollData(DATASIZE * 5) As Byte

Private Sub cmdDeletedatabase_Click()
 datEnroll.Recordset.ActiveConnection.Execute "delete * from tblEnroll"
 datEnroll.Caption = datEnroll.Recordset.RecordCount
  datEnroll.Refresh
End Sub
Private Sub Form_Load()
If VarType(glngEnrollData) = vbEmpty Then
        glngEnrollData = gTemplngEnrollData
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
End Sub

Private Sub cmdEnrollFP_Click()

Dim vret As Boolean
Dim vsesionindex As Long
Dim versinchar As String
Dim Apppath As String
Dim i As Long
   Apppath = App.Path & "\test.bmp"
    vret = Fpreader1.ConnectUsb()
     If vret = False Then
        lblMessage.Caption = gstrNoDevice
        Exit Sub
    End If
    '/////////////////һ��Ҫִ������������Էֳ���1000öָ���㷨����3000ö�㷨��
   '///  vsesionindex =0  1000�㷨 ��Ҫ������ָ��
   '//// vsesionindex =1  3000�㷨 ��Ҫ������ָ��
    vret = Fpreader1.GetVersion(vsesionindex, versinchar)
    If vret = False Then
        lblMessage.Caption = gstrNoDevice
        Exit Sub
    End If
    lblMessage.Caption = versinchar
    
    
     vret = Fpreader1.OnoffLED(1) '//////����ָ��ͷ
     
    lblMessage.Caption = "press figer 1 #"
    lblMessage.Refresh
    
    i = True
    While i = True
       vret = Fpreader1.DetectFinger() '//////���ָ��ͷ���Ƿ���ָ�ư���
       If vret = True Then
          i = False
       End If
      ' DoEvents
     '  Sleep (200)
    Wend
    
     '///////////////////////////////////////////////////////////////��ȡ����ʾͼƬ
      vret = Fpreader1.GetImage(Apppath) '//////��ȡָ��ͼ�񣬲���Ϊ���ָ��ͼƬ��·��
    If vret = False Then
        lblMessage.Caption = "get image fail"
           vret = Fpreader1.OnoffLED(0) '/////�ر�ָ��ͷ
          vret = Fpreader1.DisConnectUsb() '�ر�USB�˿�
         
        Exit Sub
    End If
   Image1.Picture = LoadPicture(Apppath)  '//////��ָ��ͼƬ���¼��ص�������
    Image1.Refresh
    
    '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    vret = Fpreader1.GetTemplet(0) '//////��ȡ�����㡣����0 ��ȡ��һöָ�ƣ�1��ȡ�ڶ�öָ��
     If vret = False Then
        lblMessage.Caption = "GetTempletfail"
           vret = Fpreader1.OnoffLED(0) '/////�ر�ָ��ͷ
          vret = Fpreader1.DisConnectUsb() '�ر�USB�˿�
        Exit Sub
    End If
    
    '//////////////////////////////////////////////////////////////�Ҳ����ݿ�������û���ظ�ָ��
    
    Dim vFingerNumber As Long
     Dim vStr As String
    Dim vByte() As Byte
    
      With datEnroll
        .RecordSource = "select * from " & "tblEnroll"
        .Refresh
         
         With .Recordset
             If .RecordCount = 0 Then GoTo EEE
            .MoveLast
            .MoveFirst
            Do While .EOF = False
                FingerNumber = !FingerNumber
                 If vFingerNumber < 10 And Not IsNull(!FPdata) Then
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
               
                    vret = Fpreader1.VerifyFinger(glngEnrollData) '//////�����ݿ��е�ָ����ɼ�����������бȶ�
                   If vret = True Then
                      lblMessage.Caption = "FP DOUBLE"  '////˵�����ݿ�������ͬ��ָ�ƣ��˳�
                        vret = Fpreader1.OnoffLED(0) '/////�ر�ָ��ͷ
                        vret = Fpreader1.DisConnectUsb() '�ر�USB�˿�
                       Exit Sub
                   End If
                End If
                .MoveNext
            Loop
        End With
EEE:
    End With
    '/////////////////////////////////һ��Ҫ�����ָ�ſ�������������ɼ�
     lblMessage.Caption = "take off you figer"
    lblMessage.Refresh
     i = True
    While i = True
       vret = Fpreader1.DetectFinger()
       If vret = False Then
          i = False
       End If
      ' DoEvents
      ' Sleep (200)
    Wend
    '/////////////////////////////////////////////////////////////////////���ڶ���
     lblMessage.Caption = "press figer 2 #"
    lblMessage.Refresh
    
    i = True
    While i = True
       vret = Fpreader1.DetectFinger()
       If vret = True Then
          i = False
       End If
      ' DoEvents
      ' Sleep (200)
    Wend
    '///////////////////////////////////////////////////////////////��ȡ����ʾͼƬ
      vret = Fpreader1.GetImage(Apppath)
    If vret = False Then
        lblMessage.Caption = "get image fail"
         vret = Fpreader1.OnoffLED(0) '/////�ر�ָ��ͷ
          vret = Fpreader1.DisConnectUsb() '�ر�USB�˿�
        Exit Sub
    End If
    Image1.Picture = LoadPicture(Apppath)
    Image1.Refresh
    
    vret = Fpreader1.GetTemplet(1)
     If vret = False Then
        lblMessage.Caption = "GetTempletfail"
           vret = Fpreader1.OnoffLED(0) '/////�ر�ָ��ͷ
          vret = Fpreader1.DisConnectUsb() '�ر�USB�˿�
        Exit Sub
    End If
    
    '////////////////////////////////////////////////////////////////////������3000ö�㷨�Ĳɼ��ǣ���Ҫ������
    
    If vsesionindex = 1 Then
    
     '/////////////////////////////////һ��Ҫ�����ָ�ſ�������������ɼ�
      lblMessage.Caption = "take off you figer"
    lblMessage.Refresh
     i = True
    While i = True
       vret = Fpreader1.DetectFinger()
       If vret = False Then
          i = False
       End If
      ' DoEvents
      ' Sleep (200)
    Wend
    '/////////////////////////////////////////////////////////////////////���ڶ���
     lblMessage.Caption = "press figer 3 #"
    lblMessage.Refresh
    
    i = True
    While i = True
       vret = Fpreader1.DetectFinger()
       If vret = True Then
          i = False
       End If
      ' DoEvents
      ' Sleep (200)
    Wend
    
    
    '///////////////////////////////////////////////////////////////��ȡ����ʾͼƬ
     vret = Fpreader1.GetImage(Apppath)
    If vret = False Then
        lblMessage.Caption = "get image fail"
          vret = Fpreader1.OnoffLED(0) '/////�ر�ָ��ͷ
          vret = Fpreader1.DisConnectUsb() '�ر�USB�˿�
        Exit Sub
    End If
    Image1.Picture = LoadPicture(Apppath)
    Image1.Refresh
    
    '//////////////////////////////////////////////////////////////////
    
    vret = Fpreader1.GetTemplet(2)
     If vret = False Then
        lblMessage.Caption = "GetTempletfail"
           vret = Fpreader1.OnoffLED(0) '/////�ر�ָ��ͷ
          vret = Fpreader1.DisConnectUsb() '�ر�USB�˿�
        Exit Sub
    End If
   
    
    
    End If
    
    '////////////////////////////////////////////////////////////////////////ȫ������ָ��
    
    vret = Fpreader1.GetMergeChar(glngEnrollData)  '/////////////////////�ϲ����ɼ��ϲ����ָ������
     If vret = False Then
        lblMessage.Caption = "MergeCharerror"
          vret = Fpreader1.OnoffLED(0) '/////�ر�ָ��ͷ
          vret = Fpreader1.DisConnectUsb() '�ر�USB�˿�
        Exit Sub
    End If
    
    '/////////////////////////////////////////save to database
     With datEnroll
        gGetState = True
        .RecordSource = "select * from " & "tblEnroll"
        .Refresh
            With .Recordset
                .AddNew
                !EMachineNumber = 1
                !EnrollNumber = txtID.Text
                !FingerNumber = txtFPNUM.Text
                !Privilige = txtPrivilige.Text
                
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
                
                .Update
            End With
        If .Recordset.RecordCount > 1 Then .Recordset.MoveLast
        .Caption = .Recordset.RecordCount
    End With
    
    datEnroll.Refresh
    
    '///////////////////////////////////////////////////////////
    lblMessage.Caption = "enroll ok!!"
      vret = Fpreader1.OnoffLED(0) '/////�ر�ָ��ͷ
       vret = Fpreader1.DisConnectUsb() '�ر�USB�˿�
    
End Sub

Private Sub Command1_Click()
'cmdEnrollFP.Cancel
End Sub




Private Sub cmdEnrollFPwithstring_Click()
Dim vret As Boolean
Dim vsesionindex As Long
Dim versinchar As String
Dim Apppath As String
Dim i As Long

Dim glngEnrollDataString As String


   Apppath = App.Path & "\test.bmp"
    vret = Fpreader1.ConnectUsb()
     If vret = False Then
        lblMessage.Caption = gstrNoDevice
        Exit Sub
    End If
    '/////////////////һ��Ҫִ������������Էֳ���1000öָ���㷨����3000ö�㷨��
   '///  vsesionindex =0  1000�㷨 ��Ҫ������ָ��
   '//// vsesionindex =1  3000�㷨 ��Ҫ������ָ��
    vret = Fpreader1.GetVersion(vsesionindex, versinchar)
    If vret = False Then
        lblMessage.Caption = gstrNoDevice
        Exit Sub
    End If
    lblMessage.Caption = versinchar
    
    
     vret = Fpreader1.OnoffLED(1) '//////����ָ��ͷ
     
    lblMessage.Caption = "press figer 1 #"
    lblMessage.Refresh
    
    i = True
    While i = True
       vret = Fpreader1.DetectFinger() '//////���ָ��ͷ���Ƿ���ָ�ư���
       If vret = True Then
          i = False
       End If
      ' DoEvents
     '  Sleep (200)
    Wend
    
     '///////////////////////////////////////////////////////////////��ȡ����ʾͼƬ
      vret = Fpreader1.GetImage(Apppath) '//////��ȡָ��ͼ�񣬲���Ϊ���ָ��ͼƬ��·��
    If vret = False Then
        lblMessage.Caption = "get image fail"
           vret = Fpreader1.OnoffLED(0) '/////�ر�ָ��ͷ
          vret = Fpreader1.DisConnectUsb() '�ر�USB�˿�
         
        Exit Sub
    End If
   Image1.Picture = LoadPicture(Apppath)  '//////��ָ��ͼƬ���¼��ص�������
    Image1.Refresh
    
    '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    vret = Fpreader1.GetTemplet(0) '//////��ȡ�����㡣����0 ��ȡ��һöָ�ƣ�1��ȡ�ڶ�öָ��
     If vret = False Then
        lblMessage.Caption = "GetTempletfail"
           vret = Fpreader1.OnoffLED(0) '/////�ر�ָ��ͷ
          vret = Fpreader1.DisConnectUsb() '�ر�USB�˿�
        Exit Sub
    End If
    
    '//////////////////////////////////////////////////////////////�Ҳ����ݿ�������û���ظ�ָ��
    
    Dim vFingerNumber As Long
     Dim vStr As String
    Dim vByte() As Byte
    
      With datEnroll
        .RecordSource = "select * from " & "tblEnroll"
        .Refresh
         
         With .Recordset
             If .RecordCount = 0 Then GoTo EEE
            .MoveLast
            .MoveFirst
            Do While .EOF = False
                FingerNumber = !FingerNumber
                 If vFingerNumber < 10 And Not IsNull(!FPData_Str) Then
                    glngEnrollDataString = !FPData_Str
                    vret = Fpreader1.VerifyFingerWithstring(glngEnrollDataString) '//////�����ݿ��е�ָ����ɼ�����������бȶ�
                    If vret = True Then
                       lblMessage.Caption = "FP DOUBLE"  '////˵�����ݿ�������ͬ��ָ�ƣ��˳�
                       vret = Fpreader1.OnoffLED(0) '/////�ر�ָ��ͷ
                       vret = Fpreader1.DisConnectUsb() '�ر�USB�˿�
                      Exit Sub
                    End If
                End If
                .MoveNext
            Loop
        End With
EEE:
    End With
    '/////////////////////////////////һ��Ҫ�����ָ�ſ�������������ɼ�
     lblMessage.Caption = "take off you figer"
    lblMessage.Refresh
     i = True
    While i = True
       vret = Fpreader1.DetectFinger()
       If vret = False Then
          i = False
       End If
      ' DoEvents
      ' Sleep (200)
    Wend
    '/////////////////////////////////////////////////////////////////////���ڶ���
     lblMessage.Caption = "press figer 2 #"
    lblMessage.Refresh
    
    i = True
    While i = True
       vret = Fpreader1.DetectFinger()
       If vret = True Then
          i = False
       End If
      ' DoEvents
      ' Sleep (200)
    Wend
    '///////////////////////////////////////////////////////////////��ȡ����ʾͼƬ
      vret = Fpreader1.GetImage(Apppath)
    If vret = False Then
        lblMessage.Caption = "get image fail"
         vret = Fpreader1.OnoffLED(0) '/////�ر�ָ��ͷ
          vret = Fpreader1.DisConnectUsb() '�ر�USB�˿�
        Exit Sub
    End If
    Image1.Picture = LoadPicture(Apppath)
    Image1.Refresh
    
    vret = Fpreader1.GetTemplet(1)
     If vret = False Then
        lblMessage.Caption = "GetTempletfail"
           vret = Fpreader1.OnoffLED(0) '/////�ر�ָ��ͷ
          vret = Fpreader1.DisConnectUsb() '�ر�USB�˿�
        Exit Sub
    End If
    
    '////////////////////////////////////////////////////////////////////������3000ö�㷨�Ĳɼ��ǣ���Ҫ������
    
    If vsesionindex = 1 Then
    
     '/////////////////////////////////һ��Ҫ�����ָ�ſ�������������ɼ�
      lblMessage.Caption = "take off you figer"
    lblMessage.Refresh
     i = True
    While i = True
       vret = Fpreader1.DetectFinger()
       If vret = False Then
          i = False
       End If
      ' DoEvents
      ' Sleep (200)
    Wend
    '/////////////////////////////////////////////////////////////////////���ڶ���
     lblMessage.Caption = "press figer 3 #"
    lblMessage.Refresh
    
    i = True
    While i = True
       vret = Fpreader1.DetectFinger()
       If vret = True Then
          i = False
       End If
      ' DoEvents
      ' Sleep (200)
    Wend
    
    
    '///////////////////////////////////////////////////////////////��ȡ����ʾͼƬ
     vret = Fpreader1.GetImage(Apppath)
    If vret = False Then
        lblMessage.Caption = "get image fail"
          vret = Fpreader1.OnoffLED(0) '/////�ر�ָ��ͷ
          vret = Fpreader1.DisConnectUsb() '�ر�USB�˿�
        Exit Sub
    End If
    Image1.Picture = LoadPicture(Apppath)
    Image1.Refresh
    
    '//////////////////////////////////////////////////////////////////
    
    vret = Fpreader1.GetTemplet(2)
     If vret = False Then
        lblMessage.Caption = "GetTempletfail"
           vret = Fpreader1.OnoffLED(0) '/////�ر�ָ��ͷ
          vret = Fpreader1.DisConnectUsb() '�ر�USB�˿�
        Exit Sub
    End If
   
    
    
    End If
    
    '////////////////////////////////////////////////////////////////////////ȫ������ָ��
    
    vret = Fpreader1.GetMergeCharWithstring(glngEnrollDataString)  '/////////////////////�ϲ����ɼ��ϲ����ָ������
     If vret = False Then
        lblMessage.Caption = "MergeCharerror"
          vret = Fpreader1.OnoffLED(0) '/////�ر�ָ��ͷ
          vret = Fpreader1.DisConnectUsb() '�ر�USB�˿�
        Exit Sub
    End If
    
    '/////////////////////////////////////////save to database
     With datEnroll
        gGetState = True
        .RecordSource = "select * from " & "tblEnroll"
        .Refresh
            With .Recordset
                .AddNew
                !EMachineNumber = 1
                !EnrollNumber = txtID.Text
                !FingerNumber = txtFPNUM.Text
                !Privilige = txtPrivilige.Text
                !FPData_Str = glngEnrollDataString
                
                .Update
            End With
        If .Recordset.RecordCount > 1 Then .Recordset.MoveLast
        .Caption = .Recordset.RecordCount
    End With
    
    datEnroll.Refresh
    
    '///////////////////////////////////////////////////////////
    lblMessage.Caption = "enroll ok!!"
      vret = Fpreader1.OnoffLED(0) '/////�ر�ָ��ͷ
       vret = Fpreader1.DisConnectUsb() '�ر�USB�˿�
    
End Sub



