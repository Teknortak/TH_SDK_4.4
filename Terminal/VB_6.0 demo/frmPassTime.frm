VERSION 5.00
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Begin VB.Form frmPassTime 
   Caption         =   "SETPASSTIME"
   ClientHeight    =   7815
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   14640
   LinkTopic       =   "Form1"
   ScaleHeight     =   7815
   ScaleWidth      =   14640
   StartUpPosition =   3  '窗口缺省
   Begin VB.CommandButton cmdSetuserctrlEx 
      Caption         =   "Set UserctrlEX"
      Height          =   375
      Left            =   12000
      TabIndex        =   111
      Top             =   5640
      Width           =   1575
   End
   Begin VB.CommandButton cmdwritelockgroup 
      Caption         =   "Write"
      Height          =   495
      Left            =   5520
      TabIndex        =   99
      Top             =   6360
      Width           =   975
   End
   Begin VB.Frame Frame4 
      Caption         =   "lockGroup"
      Height          =   1455
      Left            =   120
      TabIndex        =   94
      Top             =   5640
      Width           =   6975
      Begin VB.ComboBox cmbgroupindex 
         Height          =   300
         ItemData        =   "frmPassTime.frx":0000
         Left            =   480
         List            =   "frmPassTime.frx":0013
         TabIndex        =   102
         Text            =   "1"
         Top             =   840
         Width           =   735
      End
      Begin VB.CommandButton cmdreadlockgroup 
         Caption         =   "Read"
         Height          =   495
         Left            =   3840
         TabIndex        =   98
         Top             =   720
         Width           =   975
      End
      Begin VB.TextBox txtgroup 
         Height          =   375
         Left            =   2040
         TabIndex        =   96
         Text            =   "0"
         Top             =   840
         Width           =   1335
      End
      Begin VB.Label Label7 
         Caption         =   "group"
         Height          =   255
         Index           =   2
         Left            =   2280
         TabIndex        =   97
         Top             =   480
         Width           =   735
      End
      Begin VB.Label Label7 
         Caption         =   "index"
         Height          =   255
         Index           =   1
         Left            =   600
         TabIndex        =   95
         Top             =   480
         Width           =   735
      End
   End
   Begin VB.Frame Frame1 
      Caption         =   "DAY PASSTIME"
      Height          =   2535
      Left            =   120
      TabIndex        =   35
      Top             =   600
      Width           =   14415
      Begin VB.ComboBox cmbdayindex 
         Height          =   300
         ItemData        =   "frmPassTime.frx":0026
         Left            =   120
         List            =   "frmPassTime.frx":0042
         TabIndex        =   100
         Text            =   "1"
         Top             =   840
         Width           =   855
      End
      Begin VB.CommandButton cmdReadDaypasstime 
         Caption         =   "Read"
         Height          =   510
         Left            =   4440
         TabIndex        =   57
         Top             =   1680
         Width           =   1485
      End
      Begin VB.CommandButton cmdWritedaypasstime 
         Caption         =   "Write"
         Height          =   510
         Left            =   6840
         TabIndex        =   56
         Top             =   1680
         Width           =   1485
      End
      Begin VB.TextBox txtEndMinute 
         Height          =   405
         Index           =   0
         Left            =   3135
         TabIndex        =   55
         Text            =   "0"
         Top             =   720
         Width           =   390
      End
      Begin VB.TextBox txtEndHour 
         Height          =   405
         Index           =   0
         Left            =   2520
         TabIndex        =   54
         Text            =   "0"
         Top             =   720
         Width           =   375
      End
      Begin VB.TextBox txtStartHour 
         Height          =   405
         Index           =   0
         Left            =   1110
         TabIndex        =   53
         Text            =   "0"
         Top             =   720
         Width           =   390
      End
      Begin VB.TextBox txtStartMinute 
         Height          =   405
         Index           =   0
         Left            =   1755
         TabIndex        =   52
         Text            =   "0"
         Top             =   720
         Width           =   390
      End
      Begin VB.TextBox txtEndMinute 
         Height          =   405
         Index           =   1
         Left            =   5835
         TabIndex        =   51
         Text            =   "0"
         Top             =   720
         Width           =   390
      End
      Begin VB.TextBox txtEndHour 
         Height          =   405
         Index           =   1
         Left            =   5190
         TabIndex        =   50
         Text            =   "0"
         Top             =   720
         Width           =   375
      End
      Begin VB.TextBox txtStartHour 
         Height          =   405
         Index           =   1
         Left            =   3810
         TabIndex        =   49
         Text            =   "0"
         Top             =   720
         Width           =   390
      End
      Begin VB.TextBox txtStartMinute 
         Height          =   405
         Index           =   1
         Left            =   4455
         TabIndex        =   48
         Text            =   "0"
         Top             =   720
         Width           =   390
      End
      Begin VB.TextBox txtEndMinute 
         Height          =   405
         Index           =   2
         Left            =   8490
         TabIndex        =   47
         Text            =   "0"
         Top             =   720
         Width           =   390
      End
      Begin VB.TextBox txtEndHour 
         Height          =   405
         Index           =   2
         Left            =   7845
         TabIndex        =   46
         Text            =   "0"
         Top             =   720
         Width           =   375
      End
      Begin VB.TextBox txtStartHour 
         Height          =   405
         Index           =   2
         Left            =   6450
         TabIndex        =   45
         Text            =   "0"
         Top             =   720
         Width           =   390
      End
      Begin VB.TextBox txtStartMinute 
         Height          =   405
         Index           =   2
         Left            =   7095
         TabIndex        =   44
         Text            =   "0"
         Top             =   720
         Width           =   390
      End
      Begin VB.TextBox txtEndMinute 
         Height          =   405
         Index           =   3
         Left            =   11130
         TabIndex        =   43
         Text            =   "0"
         Top             =   720
         Width           =   390
      End
      Begin VB.TextBox txtEndHour 
         Height          =   405
         Index           =   3
         Left            =   10485
         TabIndex        =   42
         Text            =   "0"
         Top             =   720
         Width           =   375
      End
      Begin VB.TextBox txtStartHour 
         Height          =   405
         Index           =   3
         Left            =   9090
         TabIndex        =   41
         Text            =   "0"
         Top             =   720
         Width           =   390
      End
      Begin VB.TextBox txtStartMinute 
         Height          =   405
         Index           =   3
         Left            =   9735
         TabIndex        =   40
         Text            =   "0"
         Top             =   720
         Width           =   390
      End
      Begin VB.TextBox txtEndMinute 
         Height          =   405
         Index           =   4
         Left            =   13770
         TabIndex        =   39
         Text            =   "0"
         Top             =   720
         Width           =   390
      End
      Begin VB.TextBox txtEndHour 
         Height          =   405
         Index           =   4
         Left            =   13125
         TabIndex        =   38
         Text            =   "0"
         Top             =   720
         Width           =   375
      End
      Begin VB.TextBox txtStartHour 
         Height          =   405
         Index           =   4
         Left            =   11730
         TabIndex        =   37
         Text            =   "0"
         Top             =   720
         Width           =   390
      End
      Begin VB.TextBox txtStartMinute 
         Height          =   405
         Index           =   4
         Left            =   12375
         TabIndex        =   36
         Text            =   "0"
         Top             =   720
         Width           =   390
      End
      Begin VB.Label Label4 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "end"
         Height          =   180
         Index           =   1
         Left            =   2880
         TabIndex        =   93
         Top             =   480
         Width           =   270
      End
      Begin VB.Label Label2 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "DAY:"
         Height          =   180
         Index           =   0
         Left            =   240
         TabIndex        =   92
         Top             =   480
         Width           =   360
      End
      Begin VB.Label Label4 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Start"
         Height          =   180
         Index           =   0
         Left            =   1440
         TabIndex        =   91
         Top             =   480
         Width           =   450
      End
      Begin VB.Label Label4 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "end"
         Height          =   180
         Index           =   2
         Left            =   5640
         TabIndex        =   90
         Top             =   480
         Width           =   270
      End
      Begin VB.Label Label4 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Start"
         Height          =   180
         Index           =   3
         Left            =   4170
         TabIndex        =   89
         Top             =   480
         Width           =   450
      End
      Begin VB.Label Label4 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "end"
         Height          =   180
         Index           =   4
         Left            =   8250
         TabIndex        =   88
         Top             =   480
         Width           =   270
      End
      Begin VB.Label Label4 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Start"
         Height          =   180
         Index           =   5
         Left            =   6720
         TabIndex        =   87
         Top             =   480
         Width           =   450
      End
      Begin VB.Label Label4 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "end"
         Height          =   180
         Index           =   6
         Left            =   10890
         TabIndex        =   86
         Top             =   480
         Width           =   270
      End
      Begin VB.Label Label4 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Start"
         Height          =   180
         Index           =   7
         Left            =   9360
         TabIndex        =   85
         Top             =   480
         Width           =   450
      End
      Begin VB.Label Label4 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "end"
         Height          =   180
         Index           =   8
         Left            =   13440
         TabIndex        =   84
         Top             =   480
         Width           =   270
      End
      Begin VB.Label Label4 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Start"
         Height          =   180
         Index           =   9
         Left            =   12120
         TabIndex        =   83
         Top             =   480
         Width           =   450
      End
      Begin VB.Label Label2 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   ":"
         Height          =   285
         Index           =   23
         Left            =   2955
         TabIndex        =   82
         Top             =   720
         Width           =   180
      End
      Begin VB.Label Label2 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   ":"
         Height          =   285
         Index           =   15
         Left            =   1695
         TabIndex        =   81
         Top             =   720
         Width           =   180
      End
      Begin VB.Label Label2 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   ":"
         Height          =   285
         Index           =   24
         Left            =   5655
         TabIndex        =   80
         Top             =   720
         Width           =   180
      End
      Begin VB.Label Label2 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   ":"
         Height          =   285
         Index           =   39
         Left            =   4395
         TabIndex        =   79
         Top             =   720
         Width           =   180
      End
      Begin VB.Label Label2 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   ":"
         Height          =   285
         Index           =   40
         Left            =   8655
         TabIndex        =   78
         Top             =   720
         Width           =   180
      End
      Begin VB.Label Label2 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   ":"
         Height          =   285
         Index           =   55
         Left            =   7035
         TabIndex        =   77
         Top             =   720
         Width           =   180
      End
      Begin VB.Label Label2 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   ":"
         Height          =   285
         Index           =   56
         Left            =   10950
         TabIndex        =   76
         Top             =   720
         Width           =   180
      End
      Begin VB.Label Label2 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   ":"
         Height          =   285
         Index           =   71
         Left            =   10035
         TabIndex        =   75
         Top             =   720
         Width           =   180
      End
      Begin VB.Label Label2 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   ":"
         Height          =   285
         Index           =   72
         Left            =   13590
         TabIndex        =   74
         Top             =   720
         Width           =   180
      End
      Begin VB.Label Label2 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   ":"
         Height          =   285
         Index           =   87
         Left            =   12675
         TabIndex        =   73
         Top             =   720
         Width           =   180
      End
      Begin VB.Label Label1 
         Caption         =   "："
         Height          =   255
         Index           =   0
         Left            =   1530
         TabIndex        =   72
         Top             =   840
         Width           =   135
      End
      Begin VB.Label Label1 
         Caption         =   "："
         Height          =   255
         Index           =   1
         Left            =   2970
         TabIndex        =   71
         Top             =   840
         Width           =   135
      End
      Begin VB.Label Label1 
         Caption         =   "："
         Height          =   255
         Index           =   16
         Left            =   4290
         TabIndex        =   70
         Top             =   840
         Width           =   135
      End
      Begin VB.Label Label1 
         Caption         =   "："
         Height          =   255
         Index           =   24
         Left            =   5610
         TabIndex        =   69
         Top             =   840
         Width           =   135
      End
      Begin VB.Label Label1 
         Caption         =   "："
         Height          =   255
         Index           =   32
         Left            =   6930
         TabIndex        =   68
         Top             =   840
         Width           =   135
      End
      Begin VB.Label Label1 
         Caption         =   "："
         Height          =   255
         Index           =   40
         Left            =   8250
         TabIndex        =   67
         Top             =   840
         Width           =   135
      End
      Begin VB.Label Label1 
         Caption         =   "："
         Height          =   255
         Index           =   48
         Left            =   9570
         TabIndex        =   66
         Top             =   840
         Width           =   135
      End
      Begin VB.Label Label1 
         Caption         =   "："
         Height          =   255
         Index           =   56
         Left            =   10890
         TabIndex        =   65
         Top             =   840
         Width           =   135
      End
      Begin VB.Label Label1 
         Caption         =   "："
         Height          =   255
         Index           =   64
         Left            =   12210
         TabIndex        =   64
         Top             =   840
         Width           =   135
      End
      Begin VB.Label Label1 
         Caption         =   "："
         Height          =   255
         Index           =   72
         Left            =   13530
         TabIndex        =   63
         Top             =   840
         Width           =   135
      End
      Begin VB.Label Label3 
         Caption         =   "~"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   9
            Charset         =   134
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   0
         Left            =   2250
         TabIndex        =   62
         Top             =   840
         Width           =   135
      End
      Begin VB.Label Label3 
         Caption         =   "~"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   9
            Charset         =   134
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   8
         Left            =   4890
         TabIndex        =   61
         Top             =   840
         Width           =   135
      End
      Begin VB.Label Label3 
         Caption         =   "~"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   9
            Charset         =   134
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   16
         Left            =   7650
         TabIndex        =   60
         Top             =   840
         Width           =   135
      End
      Begin VB.Label Label3 
         Caption         =   "~"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   9
            Charset         =   134
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   24
         Left            =   10290
         TabIndex        =   59
         Top             =   840
         Width           =   135
      End
      Begin VB.Label Label3 
         Caption         =   "~"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   9
            Charset         =   134
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   32
         Left            =   12930
         TabIndex        =   58
         Top             =   840
         Width           =   135
      End
      Begin VB.Line Line1 
         X1              =   1320
         X2              =   3360
         Y1              =   360
         Y2              =   360
      End
      Begin VB.Line Line2 
         X1              =   3840
         X2              =   6120
         Y1              =   360
         Y2              =   360
      End
      Begin VB.Line Line3 
         X1              =   6600
         X2              =   8760
         Y1              =   360
         Y2              =   360
      End
      Begin VB.Line Line4 
         X1              =   9240
         X2              =   11400
         Y1              =   360
         Y2              =   360
      End
      Begin VB.Line Line5 
         X1              =   12360
         X2              =   14040
         Y1              =   360
         Y2              =   360
      End
   End
   Begin VB.Frame Frame3 
      Caption         =   "User access info"
      Height          =   3735
      Left            =   7440
      TabIndex        =   20
      Top             =   3480
      Width           =   6975
      Begin VB.CommandButton cmdGetuserctrlEx 
         Caption         =   "Get UsetctrlEx"
         Height          =   375
         Left            =   4560
         TabIndex        =   110
         Top             =   1680
         Width           =   1455
      End
      Begin VB.Frame Frame5 
         BackColor       =   &H80000016&
         Caption         =   "only for access borad"
         Height          =   975
         Left            =   1560
         TabIndex        =   103
         Top             =   840
         Width           =   2895
         Begin VB.TextBox txtWeekid4 
            Height          =   375
            Left            =   2160
            TabIndex        =   106
            Text            =   "0"
            Top             =   480
            Width           =   495
         End
         Begin VB.TextBox txtWeekid3 
            Height          =   375
            Left            =   1320
            TabIndex        =   105
            Text            =   "0"
            Top             =   480
            Width           =   495
         End
         Begin VB.TextBox txtWeekid2 
            Height          =   375
            Left            =   480
            TabIndex        =   104
            Text            =   "0"
            Top             =   480
            Width           =   495
         End
         Begin VB.Label Label15 
            Caption         =   "door4"
            Height          =   255
            Left            =   2160
            TabIndex        =   109
            Top             =   240
            Width           =   495
         End
         Begin VB.Label Label14 
            Caption         =   "door3"
            Height          =   255
            Left            =   1320
            TabIndex        =   108
            Top             =   240
            Width           =   495
         End
         Begin VB.Label Label5 
            Caption         =   "door2"
            Height          =   255
            Left            =   480
            TabIndex        =   107
            Top             =   240
            Width           =   495
         End
      End
      Begin MSComCtl2.DTPicker dtpEnddate 
         Height          =   375
         Left            =   1800
         TabIndex        =   34
         Top             =   2880
         Width           =   1575
         _ExtentX        =   2778
         _ExtentY        =   661
         _Version        =   393216
         Format          =   59310081
         CurrentDate     =   73050
      End
      Begin MSComCtl2.DTPicker dtpStartdate 
         Height          =   375
         Left            =   1800
         TabIndex        =   33
         Top             =   2400
         Width           =   1575
         _ExtentX        =   2778
         _ExtentY        =   661
         _Version        =   393216
         Format          =   59310081
         CurrentDate     =   41296
      End
      Begin VB.CommandButton cmdclearalluserctrl 
         Caption         =   "Clear ALL Userctrl"
         Height          =   375
         Left            =   4560
         TabIndex        =   32
         Top             =   3120
         Width           =   2055
      End
      Begin VB.CommandButton cmdDeleteuserttrl 
         Caption         =   "Delete Userctrl"
         Height          =   375
         Left            =   4560
         TabIndex        =   31
         Top             =   2640
         Width           =   1695
      End
      Begin VB.CommandButton cmdSetuserctrl 
         Caption         =   "Set Userctrl"
         Height          =   375
         Left            =   4560
         TabIndex        =   30
         Top             =   1200
         Width           =   1335
      End
      Begin VB.CommandButton cmdGetuserctrl 
         Caption         =   "Get Usetctrl"
         Height          =   375
         Left            =   4560
         TabIndex        =   29
         Top             =   720
         Width           =   1455
      End
      Begin VB.TextBox txtGroupid 
         Height          =   375
         Left            =   1680
         TabIndex        =   28
         Text            =   "0"
         Top             =   1920
         Width           =   495
      End
      Begin VB.TextBox txtWeekid 
         Height          =   375
         Left            =   960
         TabIndex        =   27
         Text            =   "0"
         Top             =   1200
         Width           =   495
      End
      Begin VB.TextBox txtEnrollnumber 
         Height          =   375
         Left            =   1320
         TabIndex        =   22
         Text            =   "1"
         Top             =   240
         Width           =   1455
      End
      Begin VB.Label Label16 
         Caption         =   "door1"
         Height          =   255
         Left            =   960
         TabIndex        =   113
         Top             =   840
         Width           =   495
      End
      Begin VB.Label Label13 
         Caption         =   "<==for access board"
         ForeColor       =   &H8000000D&
         Height          =   855
         Left            =   6240
         TabIndex        =   112
         Top             =   1680
         Width           =   615
      End
      Begin VB.Label Label12 
         Caption         =   "End date:"
         Height          =   255
         Left            =   720
         TabIndex        =   26
         Top             =   2880
         Width           =   855
      End
      Begin VB.Label Label11 
         Caption         =   "Start date:"
         Height          =   255
         Left            =   600
         TabIndex        =   25
         Top             =   2400
         Width           =   1095
      End
      Begin VB.Label Label10 
         Caption         =   "GROUP ID:"
         Height          =   255
         Left            =   600
         TabIndex        =   24
         Top             =   2040
         Width           =   855
      End
      Begin VB.Label Label9 
         Caption         =   "WEEK ID:"
         Height          =   375
         Left            =   240
         TabIndex        =   23
         Top             =   1320
         Width           =   735
      End
      Begin VB.Label Label8 
         Caption         =   "USER ID:"
         Height          =   255
         Left            =   360
         TabIndex        =   21
         Top             =   360
         Width           =   735
      End
   End
   Begin VB.Frame Frame2 
      Caption         =   "WEEK PASSTIME"
      Height          =   2295
      Left            =   120
      TabIndex        =   2
      Top             =   3240
      Width           =   6975
      Begin VB.ComboBox cmbweekindex 
         Height          =   300
         ItemData        =   "frmPassTime.frx":005E
         Left            =   360
         List            =   "frmPassTime.frx":007A
         TabIndex        =   101
         Text            =   "1"
         Top             =   720
         Width           =   855
      End
      Begin VB.CommandButton cmdWriteWeekpasstime 
         Caption         =   "Write"
         Height          =   495
         Left            =   4080
         TabIndex        =   19
         Top             =   1560
         Width           =   975
      End
      Begin VB.CommandButton cmdReadWeekpasstime 
         Caption         =   "Read"
         Height          =   495
         Left            =   960
         TabIndex        =   18
         Top             =   1440
         Width           =   975
      End
      Begin VB.TextBox txtWeekdata 
         Height          =   450
         Index           =   6
         Left            =   6000
         TabIndex        =   17
         Text            =   "0"
         Top             =   600
         Width           =   380
      End
      Begin VB.TextBox txtWeekdata 
         Height          =   450
         Index           =   5
         Left            =   5280
         TabIndex        =   16
         Text            =   "0"
         Top             =   600
         Width           =   380
      End
      Begin VB.TextBox txtWeekdata 
         Height          =   450
         Index           =   4
         Left            =   4680
         TabIndex        =   15
         Text            =   "0"
         Top             =   600
         Width           =   380
      End
      Begin VB.TextBox txtWeekdata 
         Height          =   450
         Index           =   3
         Left            =   4080
         TabIndex        =   14
         Text            =   "0"
         Top             =   600
         Width           =   380
      End
      Begin VB.TextBox txtWeekdata 
         Height          =   450
         Index           =   2
         Left            =   3480
         TabIndex        =   13
         Text            =   "0"
         Top             =   600
         Width           =   380
      End
      Begin VB.TextBox txtWeekdata 
         Height          =   450
         Index           =   1
         Left            =   2880
         TabIndex        =   12
         Text            =   "0"
         Top             =   600
         Width           =   380
      End
      Begin VB.TextBox txtWeekdata 
         Height          =   450
         Index           =   0
         Left            =   2280
         TabIndex        =   11
         Text            =   "0"
         Top             =   600
         Width           =   380
      End
      Begin VB.Label Label7 
         Caption         =   "WEEK"
         Height          =   255
         Index           =   0
         Left            =   480
         TabIndex        =   10
         Top             =   360
         Width           =   735
      End
      Begin VB.Label Label6 
         Caption         =   "SAT"
         Height          =   255
         Index           =   6
         Left            =   6000
         TabIndex        =   9
         Top             =   240
         Width           =   495
      End
      Begin VB.Label Label6 
         Caption         =   "FRI"
         Height          =   255
         Index           =   5
         Left            =   5280
         TabIndex        =   8
         Top             =   240
         Width           =   495
      End
      Begin VB.Label Label6 
         Caption         =   "THU"
         Height          =   255
         Index           =   4
         Left            =   4680
         TabIndex        =   7
         Top             =   240
         Width           =   495
      End
      Begin VB.Label Label6 
         Caption         =   "WED"
         Height          =   255
         Index           =   3
         Left            =   4080
         TabIndex        =   6
         Top             =   240
         Width           =   495
      End
      Begin VB.Label Label6 
         Caption         =   "TUE"
         Height          =   255
         Index           =   2
         Left            =   3480
         TabIndex        =   5
         Top             =   240
         Width           =   495
      End
      Begin VB.Label Label6 
         Caption         =   "MON"
         Height          =   255
         Index           =   1
         Left            =   2880
         TabIndex        =   4
         Top             =   240
         Width           =   495
      End
      Begin VB.Label Label6 
         Caption         =   "SUN"
         Height          =   375
         Index           =   0
         Left            =   2280
         TabIndex        =   3
         Top             =   240
         Width           =   495
      End
   End
   Begin VB.CommandButton cmdExit 
      Caption         =   "Exit"
      Height          =   510
      Left            =   6600
      TabIndex        =   0
      Top             =   7200
      Width           =   1485
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
      TabIndex        =   1
      Top             =   120
      Width           =   14520
   End
End
Attribute VB_Name = "frmPassTime"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Const DayPasstimeDataLen = 20
Dim mlngDayPassTimeInfo(DayPasstimeDataLen / 4 - 1) As Long
Dim mDayPassTimeInfo(5) As PASSTIMEINFO

Const WeekPasstimeDataLen = 7
Dim mlngWeekPasstimeInfo(DayPasstimeDataLen / 4 - 1) As Long
Dim mWeekPassTimeInfo(7) As Byte
Dim mMachineNumber As Long





Private Sub Check2_Click()

End Sub

Private Sub cmdExit_Click()
    Unload Me
    frmMain.Visible = True
End Sub




Private Sub cmdGetuserctrlEx_Click()
    Dim vEnrollNumber As Long
    Dim dwWeekTimeID As Long
     Dim dwWeekTimeID2 As Long
      Dim dwWeekTimeID3 As Long
       Dim dwWeekTimeID4 As Long
    Dim dwGroupID As Long
    Dim nSyear As Long
    Dim nSmonth As Long
    Dim nSday As Long
    Dim nEyear As Long
    Dim nEmonth As Long
    Dim nEday As Long
    
    Dim vRet As Boolean
    Dim vErrorCode As Long
    
    lblMessage.Caption = "Working..."
    DoEvents
    
    vRet = frmMain.FP_CLOCK1.EnableDevice(mMachineNumber, False)
    If vRet = False Then
        lblMessage.Caption = gstrNoDevice
        Exit Sub
    End If
    
    vEnrollNumber = Val(txtEnrollnumber.Text)
    
    vRet = frmMain.FP_CLOCK1.GetUserCtrlEx(mMachineNumber, vEnrollNumber, dwWeekTimeID, dwWeekTimeID2, dwWeekTimeID3, dwWeekTimeID4, dwGroupID, nSyear, nSmonth, nSday, nEyear, nEmonth, nEday)
   If vRet = True Then
        Dim t_date As Date
        txtWeekid.Text = dwWeekTimeID
         txtWeekid2.Text = dwWeekTimeID2
          txtWeekid3.Text = dwWeekTimeID3
           txtWeekid4.Text = dwWeekTimeID4
        txtGroupid.Text = dwGroupID
        
        t_date = nSyear & "-" & nSmonth & "-" & nSday
        dtpStartdate.Value = t_date
        t_date = nEyear & "-" & nEmonth & "-" & nEday
        dtpEnddate.Value = t_date
        lblMessage.Caption = "GetUserctrlEx OK"
    Else
        frmMain.FP_CLOCK1.GetLastError vErrorCode
        lblMessage.Caption = ErrorPrint(vErrorCode)
    End If
    
    frmMain.FP_CLOCK1.EnableDevice mMachineNumber, True
End Sub

Private Sub cmdReadDaypasstime_Click()
Dim vRet As Boolean
    Dim vErrorCode As Long
    Dim i As Long
    Dim dayindex As Long

    lblMessage.Caption = "Waiting..."
    DoEvents
    
    If frmMain.FP_CLOCK1.EnableDevice(mMachineNumber, False) = False Then
        lblMessage.Caption = gstrNoDevice
        Exit Sub
    End If
    
    dayindex = CInt(cmbdayindex.Text)
    vRet = frmMain.FP_CLOCK1.GetDayPassTime(mMachineNumber, dayindex, mlngDayPassTimeInfo(0))
    If vRet = True Then
        CopyMemory mDayPassTimeInfo(0), mlngDayPassTimeInfo(0), DayPasstimeDataLen
        
        For i = 0 To MAX_PASSTIMECOUNT_DAY - 1
        txtStartHour(i).Text = mDayPassTimeInfo(i).mStartHour
        txtStartMinute(i).Text = mDayPassTimeInfo(i).mStartMinute
        txtEndHour(i).Text = mDayPassTimeInfo(i).mEndHour
        txtEndMinute(i).Text = mDayPassTimeInfo(i).mEndMinute
        Next i
        
        lblMessage.Caption = "Success!"
    Else
        frmMain.FP_CLOCK1.GetLastError vErrorCode
        lblMessage.Caption = ErrorPrint(vErrorCode)
    End If

    frmMain.FP_CLOCK1.EnableDevice mMachineNumber, True
End Sub




Private Sub cmdreadlockgroup_Click()
Dim vRet As Boolean
    Dim vErrorCode As Long
    Dim groupindex As Long
    Dim group As Long

    lblMessage.Caption = "Waiting..."
    DoEvents
    
    If frmMain.FP_CLOCK1.EnableDevice(mMachineNumber, False) = False Then
        lblMessage.Caption = gstrNoDevice
        Exit Sub
    End If
    
    groupindex = CInt(cmbgroupindex.Text)
    vRet = frmMain.FP_CLOCK1.GetLockGroup(mMachineNumber, groupindex, group)
    If vRet = True Then
        txtgroup.Text = group
        lblMessage.Caption = "Success!"
    Else
        frmMain.FP_CLOCK1.GetLastError vErrorCode
        lblMessage.Caption = ErrorPrint(vErrorCode)
    End If

    frmMain.FP_CLOCK1.EnableDevice mMachineNumber, True
End Sub

Private Sub cmdSetuserctrlEx_Click()
 Dim vEnrollNumber As Long
    Dim dwWeekTimeID As Long
      Dim dwWeekTimeID2 As Long
        Dim dwWeekTimeID3 As Long
          Dim dwWeekTimeID4 As Long
    Dim dwGroupID As Long
    Dim nSyear As Long
    Dim nSmonth As Long
    Dim nSday As Long
    Dim nEyear As Long
    Dim nEmonth As Long
    Dim nEday As Long
    
    Dim vRet As Boolean
    Dim vErrorCode As Long
    
    lblMessage.Caption = "Working..."
    DoEvents
    
    
    
    vRet = frmMain.FP_CLOCK1.EnableDevice(mMachineNumber, False)
    If vRet = False Then
        lblMessage.Caption = gstrNoDevice
        Exit Sub
    End If
    
    vEnrollNumber = Val(txtEnrollnumber.Text)
    
    dwWeekTimeID = Val(txtWeekid.Text)
    dwWeekTimeID2 = Val(txtWeekid2.Text)
    dwWeekTimeID3 = Val(txtWeekid3.Text)
    dwWeekTimeID4 = Val(txtWeekid4.Text)
    dwGroupID = Val(txtGroupid.Text)
    nSyear = Val(dtpStartdate.Year)
    nSmonth = Val(dtpStartdate.Month)
    nSday = Val(dtpStartdate.Day)
        
    nEyear = Val(dtpEnddate.Year)
    nEmonth = Val(dtpEnddate.Month)
    nEday = Val(dtpEnddate.Day)
    
    vRet = frmMain.FP_CLOCK1.SetUserCtrlEx(mMachineNumber, vEnrollNumber, dwWeekTimeID, dwWeekTimeID2, dwWeekTimeID3, dwWeekTimeID4, dwGroupID, nSyear, nSmonth, nSday, nEyear, nEmonth, nEday)
   If vRet = True Then
        lblMessage.Caption = "SetUserctrlEx OK"
    Else
        frmMain.FP_CLOCK1.GetLastError vErrorCode
        lblMessage.Caption = ErrorPrint(vErrorCode)
    End If
    
    frmMain.FP_CLOCK1.EnableDevice mMachineNumber, True
End Sub

Private Sub cmdWritedaypasstime_Click()
Dim vRet As Boolean
Dim vErrorCode As Long
Dim i As Long
Dim dayindex As Long
    
    lblMessage.Caption = "Waiting..."
    DoEvents
    
    If frmMain.FP_CLOCK1.EnableDevice(mMachineNumber, False) = False Then
        lblMessage.Caption = gstrNoDevice
        Exit Sub
    End If
    
    For i = 0 To MAX_PASSTIMECOUNT_DAY - 1
        mDayPassTimeInfo(i).mStartHour = txtStartHour(i).Text
        mDayPassTimeInfo(i).mStartMinute = txtStartMinute(i).Text
        mDayPassTimeInfo(i).mEndHour = txtEndHour(i).Text
        mDayPassTimeInfo(i).mEndMinute = txtEndMinute(i).Text
    Next i
    
    dayindex = CInt(cmbdayindex.Text)
    CopyMemory mlngDayPassTimeInfo(0), mDayPassTimeInfo(0), DayPasstimeDataLen
    
    vRet = frmMain.FP_CLOCK1.SetDayPassTime(mMachineNumber, dayindex, mlngDayPassTimeInfo(0))
    If vRet = True Then
        lblMessage.Caption = "Success!"
    Else
        frmMain.FP_CLOCK1.GetLastError vErrorCode
        lblMessage.Caption = ErrorPrint(vErrorCode)
    End If

    frmMain.FP_CLOCK1.EnableDevice mMachineNumber, True
End Sub

Private Sub cmdReadWeekpasstime_Click()
Dim vRet As Boolean
    Dim vErrorCode As Long
    Dim i As Long
    Dim weekindex As Long

    lblMessage.Caption = "Waiting..."
    DoEvents
    
    If frmMain.FP_CLOCK1.EnableDevice(mMachineNumber, False) = False Then
        lblMessage.Caption = gstrNoDevice
        Exit Sub
    End If
    weekindex = CInt(cmbweekindex.Text)
    vRet = frmMain.FP_CLOCK1.GetWeekPassTime(mMachineNumber, weekindex, mlngWeekPasstimeInfo(0))
    If vRet = True Then
        CopyMemory mWeekPassTimeInfo(0), mlngWeekPasstimeInfo(0), WeekPasstimeDataLen
        
        For i = 0 To 7 - 1
        txtWeekdata(i).Text = mWeekPassTimeInfo(i)
        Next i
        
        lblMessage.Caption = "Success!"
    Else
        frmMain.FP_CLOCK1.GetLastError vErrorCode
        lblMessage.Caption = ErrorPrint(vErrorCode)
    End If

    frmMain.FP_CLOCK1.EnableDevice mMachineNumber, True

End Sub

Private Sub cmdwritelockgroup_Click()
Dim vRet As Boolean
    Dim vErrorCode As Long
    Dim groupindex As Long
    Dim group As Long

    lblMessage.Caption = "Waiting..."
    DoEvents
    
    If frmMain.FP_CLOCK1.EnableDevice(mMachineNumber, False) = False Then
        lblMessage.Caption = gstrNoDevice
        Exit Sub
    End If
    
    groupindex = CInt(cmbgroupindex.Text)
    group = txtgroup.Text
    vRet = frmMain.FP_CLOCK1.SetLockGroup(mMachineNumber, groupindex, group)
    If vRet = True Then
        lblMessage.Caption = "Success!"
    Else
        frmMain.FP_CLOCK1.GetLastError vErrorCode
        lblMessage.Caption = ErrorPrint(vErrorCode)
    End If

    frmMain.FP_CLOCK1.EnableDevice mMachineNumber, True
End Sub

Private Sub cmdWriteWeekpasstime_Click()
Dim vRet As Boolean
Dim vErrorCode As Long
Dim i As Long
 Dim weekindex As Long
    
    lblMessage.Caption = "Waiting..."
    DoEvents
    
    If frmMain.FP_CLOCK1.EnableDevice(mMachineNumber, False) = False Then
        lblMessage.Caption = gstrNoDevice
        Exit Sub
    End If
    
    For i = 0 To 7 - 1
        mWeekPassTimeInfo(i) = txtWeekdata(i).Text
    Next i
    weekindex = CInt(cmbweekindex.Text)
    CopyMemory mlngWeekPasstimeInfo(0), mWeekPassTimeInfo(0), WeekPasstimeDataLen
    
    vRet = frmMain.FP_CLOCK1.SetWeekPassTime(mMachineNumber, weekindex, mlngWeekPasstimeInfo(0))
    If vRet = True Then
        lblMessage.Caption = "Success!"
    Else
        frmMain.FP_CLOCK1.GetLastError vErrorCode
        lblMessage.Caption = ErrorPrint(vErrorCode)
    End If

    frmMain.FP_CLOCK1.EnableDevice mMachineNumber, True
End Sub

Private Sub Command2_Click()

End Sub

Private Sub Form_Load()
    mMachineNumber = frmMain.gMachineNumber
End Sub

Private Sub Form_Unload(Cancel As Integer)
    Unload Me
    frmMain.Visible = True
End Sub

Private Sub cmdGetuserctrl_Click()
    Dim vEnrollNumber As Long
    Dim dwWeekTimeID As Long
    Dim dwGroupID As Long
    Dim nSyear As Long
    Dim nSmonth As Long
    Dim nSday As Long
    Dim nEyear As Long
    Dim nEmonth As Long
    Dim nEday As Long
    
    Dim vRet As Boolean
    Dim vErrorCode As Long
    
    lblMessage.Caption = "Working..."
    DoEvents
    
    vRet = frmMain.FP_CLOCK1.EnableDevice(mMachineNumber, False)
    If vRet = False Then
        lblMessage.Caption = gstrNoDevice
        Exit Sub
    End If
    
    vEnrollNumber = Val(txtEnrollnumber.Text)
    
    vRet = frmMain.FP_CLOCK1.GetUserCtrl(mMachineNumber, vEnrollNumber, dwWeekTimeID, dwGroupID, nSyear, nSmonth, nSday, nEyear, nEmonth, nEday)
   If vRet = True Then
        Dim t_date As Date
        txtWeekid.Text = dwWeekTimeID
        txtGroupid.Text = dwGroupID
        
        t_date = nSyear & "-" & nSmonth & "-" & nSday
        dtpStartdate.Value = t_date
        t_date = nEyear & "-" & nEmonth & "-" & nEday
        dtpEnddate.Value = t_date
        lblMessage.Caption = "GetUserctrl OK"
    Else
        frmMain.FP_CLOCK1.GetLastError vErrorCode
        lblMessage.Caption = ErrorPrint(vErrorCode)
    End If
    
    frmMain.FP_CLOCK1.EnableDevice mMachineNumber, True
End Sub

Private Sub cmdSetuserctrl_Click()
 Dim vEnrollNumber As Long
    Dim dwWeekTimeID As Long
    Dim dwGroupID As Long
    Dim nSyear As Long
    Dim nSmonth As Long
    Dim nSday As Long
    Dim nEyear As Long
    Dim nEmonth As Long
    Dim nEday As Long
    
    Dim vRet As Boolean
    Dim vErrorCode As Long
    
    lblMessage.Caption = "Working..."
    DoEvents
    
    
    
    vRet = frmMain.FP_CLOCK1.EnableDevice(mMachineNumber, False)
    If vRet = False Then
        lblMessage.Caption = gstrNoDevice
        Exit Sub
    End If
    
    vEnrollNumber = Val(txtEnrollnumber.Text)
    
    dwWeekTimeID = Val(txtWeekid.Text)
    dwGroupID = Val(txtGroupid.Text)
    nSyear = Val(dtpStartdate.Year)
    nSmonth = Val(dtpStartdate.Month)
    nSday = Val(dtpStartdate.Day)
        
    nEyear = Val(dtpEnddate.Year)
    nEmonth = Val(dtpEnddate.Month)
    nEday = Val(dtpEnddate.Day)
    
    vRet = frmMain.FP_CLOCK1.SetUserCtrl(mMachineNumber, vEnrollNumber, dwWeekTimeID, dwGroupID, nSyear, nSmonth, nSday, nEyear, nEmonth, nEday)
   If vRet = True Then
        lblMessage.Caption = "SetUserctrl OK"
    Else
        frmMain.FP_CLOCK1.GetLastError vErrorCode
        lblMessage.Caption = ErrorPrint(vErrorCode)
    End If
    
    frmMain.FP_CLOCK1.EnableDevice mMachineNumber, True
End Sub

Private Sub cmdDeleteuserttrl_Click()
 Dim vEnrollNumber As Long
   
    Dim vRet As Boolean
    Dim vErrorCode As Long
    
    lblMessage.Caption = "Working..."
    DoEvents
    
    
    
    vRet = frmMain.FP_CLOCK1.EnableDevice(mMachineNumber, False)
    If vRet = False Then
        lblMessage.Caption = gstrNoDevice
        Exit Sub
    End If
    
    vEnrollNumber = Val(txtEnrollnumber.Text)
    
    
    vRet = frmMain.FP_CLOCK1.DeleteUserCtrl(mMachineNumber, vEnrollNumber)
   If vRet = True Then
        lblMessage.Caption = "DeleteUserCtrl OK"
    Else
        frmMain.FP_CLOCK1.GetLastError vErrorCode
        lblMessage.Caption = ErrorPrint(vErrorCode)
    End If
    
    frmMain.FP_CLOCK1.EnableDevice mMachineNumber, True
End Sub

Private Sub cmdclearalluserctrl_Click()
    Dim vRet As Boolean
    Dim vErrorCode As Long
    
    lblMessage.Caption = "Working..."
    DoEvents
    
    
    
    vRet = frmMain.FP_CLOCK1.EnableDevice(mMachineNumber, False)
    If vRet = False Then
        lblMessage.Caption = gstrNoDevice
        Exit Sub
    End If
    
    vRet = frmMain.FP_CLOCK1.ClearUserCtrl(mMachineNumber)
   If vRet = True Then
        lblMessage.Caption = "ClearUserCtrl OK"
    Else
        frmMain.FP_CLOCK1.GetLastError vErrorCode
        lblMessage.Caption = ErrorPrint(vErrorCode)
    End If
    frmMain.FP_CLOCK1.EnableDevice mMachineNumber, True
End Sub


