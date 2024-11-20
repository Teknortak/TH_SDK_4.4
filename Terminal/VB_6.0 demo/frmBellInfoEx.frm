VERSION 5.00
Begin VB.Form frmBellInfoEx 
   Caption         =   "frmBellInfo"
   ClientHeight    =   6975
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   10065
   LinkTopic       =   "Form1"
   ScaleHeight     =   6975
   ScaleWidth      =   10065
   StartUpPosition =   3  '´°¿ÚÈ±Ê¡
   Begin VB.Frame Frame1 
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   9
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   735
      Left            =   30
      TabIndex        =   103
      Top             =   465
      Width           =   9675
      Begin VB.TextBox txtHoldTime 
         Height          =   435
         Left            =   5220
         TabIndex        =   104
         Top             =   240
         Width           =   585
      End
      Begin VB.Label Label6 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Hold Time :"
         Height          =   285
         Left            =   3840
         TabIndex        =   106
         Top             =   315
         Width           =   1185
      End
      Begin VB.Label Label1 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "(s)"
         Height          =   285
         Left            =   5865
         TabIndex        =   105
         Top             =   315
         Width           =   255
      End
   End
   Begin VB.Frame Frame2 
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   9
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   4380
      Left            =   0
      TabIndex        =   3
      Top             =   1185
      Width           =   9675
      Begin VB.TextBox txtHour 
         Height          =   405
         Index           =   23
         Left            =   6690
         TabIndex        =   101
         Top             =   3825
         Width           =   630
      End
      Begin VB.TextBox txtMinute 
         Height          =   405
         Index           =   23
         Left            =   7335
         TabIndex        =   100
         Top             =   3825
         Width           =   630
      End
      Begin VB.TextBox txtMinute 
         Height          =   405
         Index           =   22
         Left            =   7335
         TabIndex        =   99
         Top             =   3405
         Width           =   630
      End
      Begin VB.TextBox txtHour 
         Height          =   405
         Index           =   22
         Left            =   6690
         TabIndex        =   98
         Top             =   3405
         Width           =   630
      End
      Begin VB.TextBox txtHour 
         Height          =   405
         Index           =   21
         Left            =   6690
         TabIndex        =   97
         Top             =   2985
         Width           =   630
      End
      Begin VB.TextBox txtMinute 
         Height          =   405
         Index           =   21
         Left            =   7335
         TabIndex        =   96
         Top             =   2985
         Width           =   630
      End
      Begin VB.TextBox txtMinute 
         Height          =   405
         Index           =   20
         Left            =   7335
         TabIndex        =   95
         Top             =   2565
         Width           =   630
      End
      Begin VB.TextBox txtHour 
         Height          =   405
         Index           =   20
         Left            =   6690
         TabIndex        =   94
         Top             =   2565
         Width           =   630
      End
      Begin VB.TextBox txtHour 
         Height          =   405
         Index           =   19
         Left            =   6690
         TabIndex        =   93
         Top             =   2145
         Width           =   630
      End
      Begin VB.TextBox txtMinute 
         Height          =   405
         Index           =   19
         Left            =   7335
         TabIndex        =   92
         Top             =   2145
         Width           =   630
      End
      Begin VB.TextBox txtMinute 
         Height          =   405
         Index           =   18
         Left            =   7335
         TabIndex        =   91
         Top             =   1740
         Width           =   630
      End
      Begin VB.TextBox txtHour 
         Height          =   405
         Index           =   18
         Left            =   6690
         TabIndex        =   90
         Top             =   1740
         Width           =   630
      End
      Begin VB.TextBox txtHour 
         Height          =   405
         Index           =   17
         Left            =   6690
         TabIndex        =   89
         Top             =   1320
         Width           =   630
      End
      Begin VB.TextBox txtMinute 
         Height          =   405
         Index           =   17
         Left            =   7335
         TabIndex        =   88
         Top             =   1320
         Width           =   630
      End
      Begin VB.TextBox txtMinute 
         Height          =   405
         Index           =   16
         Left            =   7335
         TabIndex        =   87
         Top             =   900
         Width           =   630
      End
      Begin VB.TextBox txtHour 
         Height          =   405
         Index           =   16
         Left            =   6690
         TabIndex        =   86
         Top             =   900
         Width           =   630
      End
      Begin VB.CheckBox chkTime 
         Caption         =   "Time1"
         Height          =   285
         Index           =   23
         Left            =   6450
         TabIndex        =   85
         Top             =   3885
         Width           =   195
      End
      Begin VB.CheckBox chkTime 
         Caption         =   "Time1"
         Height          =   285
         Index           =   22
         Left            =   6450
         TabIndex        =   84
         Top             =   3465
         Width           =   195
      End
      Begin VB.CheckBox chkTime 
         Caption         =   "Time1"
         Height          =   285
         Index           =   21
         Left            =   6450
         TabIndex        =   83
         Top             =   3045
         Width           =   195
      End
      Begin VB.CheckBox chkTime 
         Caption         =   "Time1"
         Height          =   285
         Index           =   20
         Left            =   6450
         TabIndex        =   82
         Top             =   2625
         Width           =   195
      End
      Begin VB.CheckBox chkTime 
         Caption         =   "Time1"
         Height          =   285
         Index           =   19
         Left            =   6450
         TabIndex        =   81
         Top             =   2205
         Width           =   195
      End
      Begin VB.CheckBox chkTime 
         Caption         =   "Time1"
         Height          =   285
         Index           =   18
         Left            =   6450
         TabIndex        =   80
         Top             =   1800
         Width           =   195
      End
      Begin VB.CheckBox chkTime 
         Caption         =   "Time1"
         Height          =   285
         Index           =   17
         Left            =   6450
         TabIndex        =   79
         Top             =   1380
         Width           =   195
      End
      Begin VB.CheckBox chkTime 
         Caption         =   "Time1"
         Height          =   285
         Index           =   16
         Left            =   6450
         TabIndex        =   78
         Top             =   960
         Width           =   195
      End
      Begin VB.TextBox txtHour 
         Height          =   405
         Index           =   15
         Left            =   3570
         TabIndex        =   77
         Top             =   3825
         Width           =   630
      End
      Begin VB.TextBox txtMinute 
         Height          =   405
         Index           =   15
         Left            =   4215
         TabIndex        =   76
         Top             =   3825
         Width           =   630
      End
      Begin VB.TextBox txtMinute 
         Height          =   405
         Index           =   14
         Left            =   4215
         TabIndex        =   75
         Top             =   3405
         Width           =   630
      End
      Begin VB.TextBox txtHour 
         Height          =   405
         Index           =   14
         Left            =   3570
         TabIndex        =   74
         Top             =   3405
         Width           =   630
      End
      Begin VB.TextBox txtHour 
         Height          =   405
         Index           =   13
         Left            =   3570
         TabIndex        =   73
         Top             =   2985
         Width           =   630
      End
      Begin VB.TextBox txtMinute 
         Height          =   405
         Index           =   13
         Left            =   4215
         TabIndex        =   72
         Top             =   2985
         Width           =   630
      End
      Begin VB.TextBox txtMinute 
         Height          =   405
         Index           =   12
         Left            =   4215
         TabIndex        =   71
         Top             =   2565
         Width           =   630
      End
      Begin VB.TextBox txtHour 
         Height          =   405
         Index           =   12
         Left            =   3570
         TabIndex        =   70
         Top             =   2565
         Width           =   630
      End
      Begin VB.TextBox txtHour 
         Height          =   405
         Index           =   11
         Left            =   3570
         TabIndex        =   69
         Top             =   2145
         Width           =   630
      End
      Begin VB.TextBox txtMinute 
         Height          =   405
         Index           =   11
         Left            =   4215
         TabIndex        =   68
         Top             =   2145
         Width           =   630
      End
      Begin VB.TextBox txtMinute 
         Height          =   405
         Index           =   10
         Left            =   4215
         TabIndex        =   67
         Top             =   1740
         Width           =   630
      End
      Begin VB.TextBox txtHour 
         Height          =   405
         Index           =   10
         Left            =   3570
         TabIndex        =   66
         Top             =   1740
         Width           =   630
      End
      Begin VB.TextBox txtHour 
         Height          =   405
         Index           =   9
         Left            =   3570
         TabIndex        =   65
         Top             =   1320
         Width           =   630
      End
      Begin VB.TextBox txtMinute 
         Height          =   405
         Index           =   9
         Left            =   4215
         TabIndex        =   64
         Top             =   1320
         Width           =   630
      End
      Begin VB.TextBox txtMinute 
         Height          =   405
         Index           =   8
         Left            =   4215
         TabIndex        =   63
         Top             =   900
         Width           =   630
      End
      Begin VB.TextBox txtHour 
         Height          =   405
         Index           =   8
         Left            =   3570
         TabIndex        =   62
         Top             =   900
         Width           =   630
      End
      Begin VB.CheckBox chkTime 
         Caption         =   "Time1"
         Height          =   285
         Index           =   15
         Left            =   3330
         TabIndex        =   61
         Top             =   3885
         Width           =   195
      End
      Begin VB.CheckBox chkTime 
         Caption         =   "Time1"
         Height          =   285
         Index           =   14
         Left            =   3330
         TabIndex        =   60
         Top             =   3465
         Width           =   195
      End
      Begin VB.CheckBox chkTime 
         Caption         =   "Time1"
         Height          =   285
         Index           =   13
         Left            =   3330
         TabIndex        =   59
         Top             =   3045
         Width           =   195
      End
      Begin VB.CheckBox chkTime 
         Caption         =   "Time1"
         Height          =   285
         Index           =   12
         Left            =   3330
         TabIndex        =   58
         Top             =   2625
         Width           =   195
      End
      Begin VB.CheckBox chkTime 
         Caption         =   "Time1"
         Height          =   285
         Index           =   11
         Left            =   3330
         TabIndex        =   57
         Top             =   2205
         Width           =   195
      End
      Begin VB.CheckBox chkTime 
         Caption         =   "Time1"
         Height          =   285
         Index           =   10
         Left            =   3330
         TabIndex        =   56
         Top             =   1800
         Width           =   195
      End
      Begin VB.CheckBox chkTime 
         Caption         =   "Time1"
         Height          =   285
         Index           =   9
         Left            =   3330
         TabIndex        =   55
         Top             =   1380
         Width           =   195
      End
      Begin VB.CheckBox chkTime 
         Caption         =   "Time1"
         Height          =   285
         Index           =   8
         Left            =   3330
         TabIndex        =   54
         Top             =   960
         Width           =   195
      End
      Begin VB.TextBox txtHour 
         Height          =   405
         Index           =   7
         Left            =   450
         TabIndex        =   53
         Top             =   3825
         Width           =   630
      End
      Begin VB.TextBox txtMinute 
         Height          =   405
         Index           =   7
         Left            =   1095
         TabIndex        =   52
         Top             =   3825
         Width           =   630
      End
      Begin VB.TextBox txtMinute 
         Height          =   405
         Index           =   6
         Left            =   1095
         TabIndex        =   51
         Top             =   3405
         Width           =   630
      End
      Begin VB.TextBox txtHour 
         Height          =   405
         Index           =   6
         Left            =   450
         TabIndex        =   50
         Top             =   3405
         Width           =   630
      End
      Begin VB.TextBox txtHour 
         Height          =   405
         Index           =   5
         Left            =   450
         TabIndex        =   49
         Top             =   2985
         Width           =   630
      End
      Begin VB.TextBox txtMinute 
         Height          =   405
         Index           =   5
         Left            =   1095
         TabIndex        =   48
         Top             =   2985
         Width           =   630
      End
      Begin VB.TextBox txtMinute 
         Height          =   405
         Index           =   4
         Left            =   1095
         TabIndex        =   47
         Top             =   2565
         Width           =   630
      End
      Begin VB.TextBox txtHour 
         Height          =   405
         Index           =   4
         Left            =   450
         TabIndex        =   46
         Top             =   2565
         Width           =   630
      End
      Begin VB.TextBox txtHour 
         Height          =   405
         Index           =   3
         Left            =   450
         TabIndex        =   45
         Top             =   2145
         Width           =   630
      End
      Begin VB.TextBox txtMinute 
         Height          =   405
         Index           =   3
         Left            =   1095
         TabIndex        =   44
         Top             =   2145
         Width           =   630
      End
      Begin VB.TextBox txtMinute 
         Height          =   405
         Index           =   2
         Left            =   1095
         TabIndex        =   43
         Top             =   1740
         Width           =   630
      End
      Begin VB.TextBox txtHour 
         Height          =   405
         Index           =   2
         Left            =   450
         TabIndex        =   42
         Top             =   1740
         Width           =   630
      End
      Begin VB.TextBox txtHour 
         Height          =   405
         Index           =   1
         Left            =   450
         TabIndex        =   41
         Top             =   1320
         Width           =   630
      End
      Begin VB.TextBox txtMinute 
         Height          =   405
         Index           =   1
         Left            =   1095
         TabIndex        =   40
         Top             =   1320
         Width           =   630
      End
      Begin VB.TextBox txtMinute 
         Height          =   405
         Index           =   0
         Left            =   1095
         TabIndex        =   39
         Top             =   900
         Width           =   630
      End
      Begin VB.TextBox txtHour 
         Height          =   405
         Index           =   0
         Left            =   450
         TabIndex        =   38
         Top             =   900
         Width           =   630
      End
      Begin VB.CheckBox chkTime 
         Caption         =   "Time1"
         Height          =   285
         Index           =   7
         Left            =   195
         TabIndex        =   37
         Top             =   3885
         Width           =   195
      End
      Begin VB.CheckBox chkTime 
         Caption         =   "Time1"
         Height          =   285
         Index           =   6
         Left            =   195
         TabIndex        =   36
         Top             =   3465
         Width           =   195
      End
      Begin VB.CheckBox chkTime 
         Caption         =   "Time1"
         Height          =   285
         Index           =   5
         Left            =   195
         TabIndex        =   35
         Top             =   3045
         Width           =   195
      End
      Begin VB.CheckBox chkTime 
         Caption         =   "Time1"
         Height          =   285
         Index           =   4
         Left            =   195
         TabIndex        =   34
         Top             =   2625
         Width           =   195
      End
      Begin VB.CheckBox chkTime 
         Caption         =   "Time1"
         Height          =   285
         Index           =   3
         Left            =   195
         TabIndex        =   33
         Top             =   2205
         Width           =   195
      End
      Begin VB.CheckBox chkTime 
         Caption         =   "Time1"
         Height          =   285
         Index           =   2
         Left            =   195
         TabIndex        =   32
         Top             =   1800
         Width           =   195
      End
      Begin VB.CheckBox chkTime 
         Caption         =   "Time1"
         Height          =   285
         Index           =   1
         Left            =   195
         TabIndex        =   31
         Top             =   1380
         Width           =   195
      End
      Begin VB.CheckBox chkTime 
         Caption         =   "Time1"
         Height          =   285
         Index           =   0
         Left            =   195
         TabIndex        =   30
         Top             =   960
         Width           =   195
      End
      Begin VB.CheckBox chkMark 
         Caption         =   "Mark"
         Height          =   345
         Left            =   6270
         TabIndex        =   29
         Top             =   420
         Width           =   1365
      End
      Begin VB.ComboBox cmdWeekDay 
         Height          =   300
         ItemData        =   "frmBellInfoEx.frx":0000
         Left            =   3840
         List            =   "frmBellInfoEx.frx":0019
         Style           =   2  'Dropdown List
         TabIndex        =   28
         Top             =   390
         Width           =   2055
      End
      Begin VB.ComboBox cmbBellKind 
         Height          =   300
         Index           =   0
         ItemData        =   "frmBellInfoEx.frx":005D
         Left            =   1785
         List            =   "frmBellInfoEx.frx":006D
         Style           =   2  'Dropdown List
         TabIndex        =   27
         Top             =   900
         Width           =   1425
      End
      Begin VB.ComboBox cmbBellKind 
         Height          =   300
         Index           =   1
         ItemData        =   "frmBellInfoEx.frx":0089
         Left            =   1785
         List            =   "frmBellInfoEx.frx":0099
         Style           =   2  'Dropdown List
         TabIndex        =   26
         Top             =   1320
         Width           =   1425
      End
      Begin VB.ComboBox cmbBellKind 
         Height          =   300
         Index           =   2
         ItemData        =   "frmBellInfoEx.frx":00B5
         Left            =   1785
         List            =   "frmBellInfoEx.frx":00C5
         Style           =   2  'Dropdown List
         TabIndex        =   25
         Top             =   1740
         Width           =   1425
      End
      Begin VB.ComboBox cmbBellKind 
         Height          =   300
         Index           =   3
         ItemData        =   "frmBellInfoEx.frx":00E1
         Left            =   1785
         List            =   "frmBellInfoEx.frx":00F1
         Style           =   2  'Dropdown List
         TabIndex        =   24
         Top             =   2145
         Width           =   1425
      End
      Begin VB.ComboBox cmbBellKind 
         Height          =   300
         Index           =   4
         ItemData        =   "frmBellInfoEx.frx":010E
         Left            =   1785
         List            =   "frmBellInfoEx.frx":011E
         Style           =   2  'Dropdown List
         TabIndex        =   23
         Top             =   2565
         Width           =   1425
      End
      Begin VB.ComboBox cmbBellKind 
         Height          =   300
         Index           =   5
         ItemData        =   "frmBellInfoEx.frx":013B
         Left            =   1785
         List            =   "frmBellInfoEx.frx":014B
         Style           =   2  'Dropdown List
         TabIndex        =   22
         Top             =   2985
         Width           =   1425
      End
      Begin VB.ComboBox cmbBellKind 
         Height          =   300
         Index           =   6
         ItemData        =   "frmBellInfoEx.frx":0168
         Left            =   1785
         List            =   "frmBellInfoEx.frx":0178
         Style           =   2  'Dropdown List
         TabIndex        =   21
         Top             =   3405
         Width           =   1425
      End
      Begin VB.ComboBox cmbBellKind 
         Height          =   300
         Index           =   7
         ItemData        =   "frmBellInfoEx.frx":0195
         Left            =   1785
         List            =   "frmBellInfoEx.frx":01A5
         Style           =   2  'Dropdown List
         TabIndex        =   20
         Top             =   3825
         Width           =   1425
      End
      Begin VB.ComboBox cmbBellKind 
         Height          =   300
         Index           =   8
         ItemData        =   "frmBellInfoEx.frx":01C2
         Left            =   4920
         List            =   "frmBellInfoEx.frx":01D2
         Style           =   2  'Dropdown List
         TabIndex        =   19
         Top             =   900
         Width           =   1425
      End
      Begin VB.ComboBox cmbBellKind 
         Height          =   300
         Index           =   9
         ItemData        =   "frmBellInfoEx.frx":01EF
         Left            =   4920
         List            =   "frmBellInfoEx.frx":01FF
         Style           =   2  'Dropdown List
         TabIndex        =   18
         Top             =   1320
         Width           =   1425
      End
      Begin VB.ComboBox cmbBellKind 
         Height          =   300
         Index           =   10
         ItemData        =   "frmBellInfoEx.frx":021C
         Left            =   4920
         List            =   "frmBellInfoEx.frx":022C
         Style           =   2  'Dropdown List
         TabIndex        =   17
         Top             =   1740
         Width           =   1425
      End
      Begin VB.ComboBox cmbBellKind 
         Height          =   300
         Index           =   11
         ItemData        =   "frmBellInfoEx.frx":0249
         Left            =   4920
         List            =   "frmBellInfoEx.frx":0259
         Style           =   2  'Dropdown List
         TabIndex        =   16
         Top             =   2145
         Width           =   1425
      End
      Begin VB.ComboBox cmbBellKind 
         Height          =   300
         Index           =   12
         ItemData        =   "frmBellInfoEx.frx":0276
         Left            =   4920
         List            =   "frmBellInfoEx.frx":0286
         Style           =   2  'Dropdown List
         TabIndex        =   15
         Top             =   2565
         Width           =   1425
      End
      Begin VB.ComboBox cmbBellKind 
         Height          =   300
         Index           =   13
         ItemData        =   "frmBellInfoEx.frx":02A3
         Left            =   4920
         List            =   "frmBellInfoEx.frx":02B3
         Style           =   2  'Dropdown List
         TabIndex        =   14
         Top             =   2985
         Width           =   1425
      End
      Begin VB.ComboBox cmbBellKind 
         Height          =   300
         Index           =   14
         ItemData        =   "frmBellInfoEx.frx":02D0
         Left            =   4920
         List            =   "frmBellInfoEx.frx":02E0
         Style           =   2  'Dropdown List
         TabIndex        =   13
         Top             =   3405
         Width           =   1425
      End
      Begin VB.ComboBox cmbBellKind 
         Height          =   300
         Index           =   15
         ItemData        =   "frmBellInfoEx.frx":02FD
         Left            =   4920
         List            =   "frmBellInfoEx.frx":030D
         Style           =   2  'Dropdown List
         TabIndex        =   12
         Top             =   3825
         Width           =   1425
      End
      Begin VB.ComboBox cmbBellKind 
         Height          =   300
         Index           =   16
         ItemData        =   "frmBellInfoEx.frx":032A
         Left            =   8025
         List            =   "frmBellInfoEx.frx":033A
         Style           =   2  'Dropdown List
         TabIndex        =   11
         Top             =   900
         Width           =   1425
      End
      Begin VB.ComboBox cmbBellKind 
         Height          =   300
         Index           =   17
         ItemData        =   "frmBellInfoEx.frx":0357
         Left            =   8025
         List            =   "frmBellInfoEx.frx":0367
         Style           =   2  'Dropdown List
         TabIndex        =   10
         Top             =   1320
         Width           =   1425
      End
      Begin VB.ComboBox cmbBellKind 
         Height          =   300
         Index           =   18
         ItemData        =   "frmBellInfoEx.frx":0384
         Left            =   8025
         List            =   "frmBellInfoEx.frx":0394
         Style           =   2  'Dropdown List
         TabIndex        =   9
         Top             =   1740
         Width           =   1425
      End
      Begin VB.ComboBox cmbBellKind 
         Height          =   300
         Index           =   19
         ItemData        =   "frmBellInfoEx.frx":03B1
         Left            =   8025
         List            =   "frmBellInfoEx.frx":03C1
         Style           =   2  'Dropdown List
         TabIndex        =   8
         Top             =   2145
         Width           =   1425
      End
      Begin VB.ComboBox cmbBellKind 
         Height          =   300
         Index           =   20
         ItemData        =   "frmBellInfoEx.frx":03DE
         Left            =   8025
         List            =   "frmBellInfoEx.frx":03EE
         Style           =   2  'Dropdown List
         TabIndex        =   7
         Top             =   2565
         Width           =   1425
      End
      Begin VB.ComboBox cmbBellKind 
         Height          =   300
         Index           =   21
         ItemData        =   "frmBellInfoEx.frx":040B
         Left            =   8025
         List            =   "frmBellInfoEx.frx":041B
         Style           =   2  'Dropdown List
         TabIndex        =   6
         Top             =   2985
         Width           =   1425
      End
      Begin VB.ComboBox cmbBellKind 
         Height          =   300
         Index           =   22
         ItemData        =   "frmBellInfoEx.frx":0438
         Left            =   8025
         List            =   "frmBellInfoEx.frx":0448
         Style           =   2  'Dropdown List
         TabIndex        =   5
         Top             =   3405
         Width           =   1425
      End
      Begin VB.ComboBox cmbBellKind 
         Height          =   300
         Index           =   23
         ItemData        =   "frmBellInfoEx.frx":0465
         Left            =   8025
         List            =   "frmBellInfoEx.frx":0475
         Style           =   2  'Dropdown List
         TabIndex        =   4
         Top             =   3825
         Width           =   1425
      End
      Begin VB.Label Label7 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "WeekDay"
         Height          =   285
         Left            =   2610
         TabIndex        =   102
         Top             =   450
         Width           =   1020
      End
   End
   Begin VB.CommandButton cmdExit 
      Caption         =   "Exit"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   9
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   510
      Left            =   7785
      TabIndex        =   2
      Top             =   5730
      Width           =   1485
   End
   Begin VB.CommandButton cmdWrite 
      Caption         =   "Write"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   9
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   510
      Left            =   5917
      TabIndex        =   1
      Top             =   5730
      Width           =   1485
   End
   Begin VB.CommandButton cmdRead 
      Caption         =   "Read"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   9
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   510
      Left            =   4050
      TabIndex        =   0
      Top             =   5730
      Width           =   1485
   End
   Begin VB.Label lblMessage 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Message"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   9
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   420
      Left            =   30
      TabIndex        =   107
      Top             =   0
      Width           =   9675
   End
End
Attribute VB_Name = "frmBellInfoEx"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Option Explicit

Const DataLen = 704
Private mlngBellInfo(DataLen - 1) As Long
Private mPreWeekDay As Long
Private mBellInfoEx As BELLINFOEx
Private mBellCount As Long


Private Sub cmdExit_Click()
    Unload Me
    frmMain.Visible = True
End Sub

Private Sub cmdRead_Click()
    Dim vRet As Boolean
    Dim vMachineNumber As Long

    lblMessage.Caption = ""
    vMachineNumber = frmMain.gMachineNumber
    vRet = frmMain.FP_CLOCK1.EnableDevice(vMachineNumber, False)

    If vRet = True Then
        lblMessage.Caption = "Device exist."
        DoEvents
    Else
        lblMessage.Caption = "Device No."
        Exit Sub
    End If
    vRet = frmMain.FP_CLOCK1.GetBellTimeEx(vMachineNumber, mBellCount, mlngBellInfo(0))
    If vRet = True Then
        CopyMemory mBellInfoEx, mlngBellInfo(0), DataLen
        mPreWeekDay = cmdWeekDay.ListIndex
        cmdWeekDay_Click
    Else
        lblMessage.Caption = "Device No."
        Exit Sub
    End If

    vRet = frmMain.FP_CLOCK1.EnableDevice(vMachineNumber, True)
    If vRet = True Then
        lblMessage.Caption = "Success"
    End If
    
End Sub

Private Sub cmdWeekDay_Click()
    Dim vWeekDay As Long
    Dim i As Long
    vWeekDay = cmdWeekDay.ListIndex
'    If mPreWeekDay <> vWeekDay Then
'        mBellInfoEx.BellHoldTime = CLng(txtHoldTime.Text)
'        mBellInfoEx.BellTime(mPreWeekDay).mWeekDay = mPreWeekDay
'        mBellInfoEx.BellTime(mPreWeekDay).mMark = chkMark.Value
'        For i = 0 To MAX_BELLCOUNT_DAYEx - 1
'            mBellInfoEx.BellTime(mPreWeekDay).mValid(i) = chkTime(i).Value
'            mBellInfoEx.BellTime(mPreWeekDay).mHour(i) = CLng(txtHour(i).Text)
'            mBellInfoEx.BellTime(mPreWeekDay).mMinute(i) = CLng(txtMinute(i).Text)
'        Next i
'        mPreWeekDay = vWeekDay
'    End If
    If mBellInfoEx.BellHoldTime > 60 Then mBellInfoEx.BellHoldTime = 3
    txtHoldTime.Text = mBellInfoEx.BellHoldTime
    If mBellInfoEx.BellTime(vWeekDay).mMark > 1 Then mBellInfoEx.BellTime(vWeekDay).mMark = 1
    chkMark.Value = mBellInfoEx.BellTime(vWeekDay).mMark
    For i = 0 To MAX_BELLCOUNT_DAYEX - 1
        If mBellInfoEx.BellTime(vWeekDay).BellKind(i) > 3 Then mBellInfoEx.BellTime(vWeekDay).BellKind(i) = 1
        cmbBellKind(i).ListIndex = mBellInfoEx.BellTime(vWeekDay).BellKind(i)
        
        If mBellInfoEx.BellTime(vWeekDay).mValid(i) > 1 Then mBellInfoEx.BellTime(vWeekDay).mValid(i) = 1
        chkTime(i).Value = mBellInfoEx.BellTime(vWeekDay).mValid(i)
        
        txtHour(i).Text = mBellInfoEx.BellTime(vWeekDay).mHour(i)
        txtMinute(i).Text = mBellInfoEx.BellTime(vWeekDay).mMinute(i)
        mBellInfoEx.BellTime(vWeekDay).BellKind(i) = cmbBellKind(i).ListIndex
    Next i
End Sub

Private Sub cmdWrite_Click()
    Dim vRet As Boolean
    Dim vMachineNumber As Long
    Dim vWeekDay As Long
    Dim i As Long
    lblMessage.Caption = ""
    vMachineNumber = frmMain.gMachineNumber
    vRet = frmMain.FP_CLOCK1.EnableDevice(vMachineNumber, False)
    If vRet = True Then
        lblMessage.Caption = "Device exist."
        DoEvents
    Else
        lblMessage.Caption = "Device No."
        Exit Sub
    End If
    
    vWeekDay = cmdWeekDay.ListIndex
    mBellInfoEx.BellHoldTime = CLng(txtHoldTime.Text)
    mBellInfoEx.BellTime(vWeekDay).mWeekDay = vWeekDay
    mBellInfoEx.BellTime(vWeekDay).mMark = chkMark.Value
    For i = 0 To MAX_BELLCOUNT_DAYEX - 1
        mBellInfoEx.BellTime(vWeekDay).mValid(i) = chkTime(i).Value
        mBellInfoEx.BellTime(vWeekDay).mHour(i) = CLng(txtHour(i).Text)
        mBellInfoEx.BellTime(vWeekDay).mMinute(i) = CLng(txtMinute(i).Text)
        mBellInfoEx.BellTime(vWeekDay).BellKind(i) = cmbBellKind(i).ListIndex
    Next i
    
    CopyMemory mlngBellInfo(0), mBellInfoEx, DataLen
    vRet = frmMain.FP_CLOCK1.SetBellTimeEx(vMachineNumber, mBellCount, mlngBellInfo(0))
    If vRet = False Then
        lblMessage.Caption = "Device No."
        Exit Sub
    End If

    vRet = frmMain.FP_CLOCK1.EnableDevice(vMachineNumber, True)
    If vRet = True Then
        lblMessage.Caption = "Success"
    End If

End Sub

Private Sub Form_Load()
    Dim i As Integer
    Dim j As Integer
    
    mPreWeekDay = 0
    cmdWeekDay.ListIndex = 0
    For i = 0 To MAX_BELLCOUNT_DAYEX - 1
        cmbBellKind(i).Clear
        cmbBellKind(i).AddItem "None"
        cmbBellKind(i).AddItem "Sound"
        cmbBellKind(i).AddItem "Bell"
        cmbBellKind(i).AddItem "ALL"
        cmbBellKind(i).ListIndex = 0
    Next i
    
    mBellInfoEx.BellHoldTime = 0
    mBellInfoEx.Reserve(0) = 0
    mBellInfoEx.Reserve(1) = 0
    mBellInfoEx.Reserve(2) = 0
    For i = 0 To MAX_BELLCOUNT_WEEK - 1
        mBellInfoEx.BellTime(i).mMark = 0
        mBellInfoEx.BellTime(i).mWeekDay = 0
        mBellInfoEx.BellTime(i).mReserve(0) = 0
        mBellInfoEx.BellTime(i).mReserve(1) = 0
        For j = 0 To MAX_BELLCOUNT_DAYEX - 1
            mBellInfoEx.BellTime(i).mValid(j) = 0
            mBellInfoEx.BellTime(i).mHour(j) = 0
            mBellInfoEx.BellTime(i).mMinute(j) = 0
            mBellInfoEx.BellTime(i).BellKind(j) = 0
        Next j
    Next i
End Sub

Private Sub Form_Unload(Cancel As Integer)
    Unload Me
    frmMain.Visible = True
End Sub
Private Sub ConvertDataLong()
On Error Resume Next
    Dim vnii As Long
    Dim vByte(DataLen - 1) As Byte
    
    CopyMemory vByte(0), mBellInfoEx, DataLen
    For vnii = 0 To DataLen / 4 - 1
        mlngBellInfo(vnii) = vByte(vnii * 4 + 3)
        mlngBellInfo(vnii) = mlngBellInfo(vnii) * 256 + vByte(vnii * 4 + 2)
        mlngBellInfo(vnii) = mlngBellInfo(vnii) * 256 + vByte(vnii * 4 + 1)
        mlngBellInfo(vnii) = mlngBellInfo(vnii) * 256 + vByte(vnii * 4 + 0)
    Next
End Sub
Private Sub ConvertDataByte()
    On Error Resume Next
    Dim vnii As Long
    Dim vByte(DataLen - 1) As Byte
    Dim vVal As Long
    
    For vnii = 0 To 5
        vVal = mlngBellInfo(vnii)
        vByte(vnii * 4 + 3) = vVal Mod 256
        vVal = vVal \ 256
        vByte(vnii * 4 + 2) = vVal Mod 256
        vVal = vVal \ 256
        vByte(vnii * 4 + 1) = vVal Mod 256
        vVal = vVal \ 256
        vByte(vnii * 4) = vVal Mod 256
    Next
    CopyMemory mBellInfoEx, vByte(0), DataLen
End Sub




Private Sub lblMachineNumber_Click()

End Sub
