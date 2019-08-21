VERSION 5.00
Begin VB.Form Form2 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   9000
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   12000
   FillColor       =   &H00000040&
   BeginProperty Font 
      Name            =   "MS Sans Serif"
      Size            =   18
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   9000
   ScaleWidth      =   12000
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   WhatsThisButton =   -1  'True
   WhatsThisHelp   =   -1  'True
   WindowState     =   2  'Maximized
   Begin VB.CommandButton BeginTest 
      Caption         =   "Begin Testing"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   27.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1005
      Left            =   2160
      TabIndex        =   83
      Top             =   3840
      Width           =   6495
   End
   Begin VB.ComboBox ID 
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   30
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   795
      ItemData        =   "Form2.frx":0000
      Left            =   2040
      List            =   "Form2.frx":0002
      TabIndex        =   82
      Text            =   "Subject Monkey ID #"
      Top             =   2880
      Width           =   6855
   End
   Begin VB.TextBox TimeOutTime 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   7800
      MousePointer    =   1  'Arrow
      TabIndex        =   81
      Text            =   "5"
      Top             =   480
      Visible         =   0   'False
      Width           =   1215
   End
   Begin VB.CheckBox SelectCheck3 
      Alignment       =   1  'Right Justify
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   732
      Left            =   5880
      TabIndex        =   78
      Top             =   3960
      Visible         =   0   'False
      Width           =   375
   End
   Begin VB.CheckBox SelectCheck2 
      Alignment       =   1  'Right Justify
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   732
      Left            =   3840
      TabIndex        =   76
      Top             =   3960
      Visible         =   0   'False
      Width           =   375
   End
   Begin VB.TextBox PelletsPerTrial 
      Alignment       =   2  'Center
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   4920
      TabIndex        =   75
      Text            =   "1"
      Top             =   6360
      Visible         =   0   'False
      Width           =   735
   End
   Begin VB.TextBox SelectTrials 
      Alignment       =   2  'Center
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   6600
      TabIndex        =   72
      Text            =   "6"
      Top             =   4320
      Visible         =   0   'False
      Width           =   735
   End
   Begin VB.ComboBox SideStartLevel 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      ItemData        =   "Form2.frx":0004
      Left            =   6480
      List            =   "Form2.frx":001D
      TabIndex        =   3
      Text            =   "1"
      Top             =   480
      Visible         =   0   'False
      Width           =   1215
   End
   Begin VB.ComboBox TitrateSizeSide 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      ItemData        =   "Form2.frx":003D
      Left            =   5160
      List            =   "Form2.frx":0047
      TabIndex        =   2
      Text            =   "Yes"
      Top             =   480
      Visible         =   0   'False
      Width           =   1215
   End
   Begin VB.ComboBox TitrateSizeChase 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      ItemData        =   "Form2.frx":0054
      Left            =   6480
      List            =   "Form2.frx":005E
      TabIndex        =   7
      Text            =   "No"
      Top             =   1080
      Visible         =   0   'False
      Width           =   1215
   End
   Begin VB.ComboBox TitrateSizePursuit 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      ItemData        =   "Form2.frx":006B
      Left            =   7800
      List            =   "Form2.frx":0075
      TabIndex        =   12
      Text            =   "No"
      Top             =   1680
      Visible         =   0   'False
      Width           =   1215
   End
   Begin VB.ComboBox SizePursuit 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      ItemData        =   "Form2.frx":0082
      Left            =   2520
      List            =   "Form2.frx":008F
      TabIndex        =   8
      Text            =   "Large"
      Top             =   1680
      Visible         =   0   'False
      Width           =   1215
   End
   Begin VB.ComboBox SizeChase 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      ItemData        =   "Form2.frx":00A9
      Left            =   2520
      List            =   "Form2.frx":00B6
      TabIndex        =   4
      Text            =   "Medium"
      Top             =   1080
      Visible         =   0   'False
      Width           =   1215
   End
   Begin VB.TextBox TrialsSide 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   2520
      TabIndex        =   0
      TabStop         =   0   'False
      Text            =   "50"
      Top             =   480
      Visible         =   0   'False
      Width           =   1215
   End
   Begin VB.TextBox ResponseSide 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   3840
      MousePointer    =   1  'Arrow
      TabIndex        =   1
      Text            =   "5"
      Top             =   480
      Visible         =   0   'False
      Width           =   1215
   End
   Begin VB.TextBox TrialsChase 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   3840
      TabIndex        =   5
      Text            =   "50"
      Top             =   1080
      Visible         =   0   'False
      Width           =   1215
   End
   Begin VB.TextBox ResponseChase 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   5160
      MousePointer    =   1  'Arrow
      TabIndex        =   6
      Text            =   "5"
      Top             =   1080
      Visible         =   0   'False
      Width           =   1215
   End
   Begin VB.TextBox PursuitTime 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   6480
      MousePointer    =   1  'Arrow
      TabIndex        =   11
      Text            =   "5"
      Top             =   1680
      Visible         =   0   'False
      Width           =   1215
   End
   Begin VB.TextBox ResponsePursuit 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   5160
      MousePointer    =   1  'Arrow
      TabIndex        =   10
      Text            =   "5"
      Top             =   1680
      Visible         =   0   'False
      Width           =   1215
   End
   Begin VB.TextBox TrialsPursuit 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   3840
      TabIndex        =   9
      Text            =   "50"
      Top             =   1680
      Visible         =   0   'False
      Width           =   1215
   End
   Begin VB.TextBox TrialsMTS 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   2520
      TabIndex        =   13
      Text            =   "50"
      Top             =   2280
      Visible         =   0   'False
      Width           =   1215
   End
   Begin VB.TextBox TrialsDMTS 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   2520
      TabIndex        =   16
      Text            =   "50"
      Top             =   2880
      Visible         =   0   'False
      Width           =   1215
   End
   Begin VB.TextBox CorrectMTS 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   3840
      TabIndex        =   14
      Text            =   "80"
      Top             =   2280
      Visible         =   0   'False
      Width           =   1215
   End
   Begin VB.TextBox CorrectLS 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   3840
      TabIndex        =   21
      Text            =   "80"
      Top             =   3480
      Visible         =   0   'False
      Width           =   1215
   End
   Begin VB.TextBox CorrectDMTS 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   3840
      TabIndex        =   17
      Text            =   "80"
      Top             =   2880
      Visible         =   0   'False
      Width           =   1215
   End
   Begin VB.TextBox TrialsLS 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   2520
      TabIndex        =   20
      Text            =   "6"
      Top             =   3480
      Visible         =   0   'False
      Width           =   1215
   End
   Begin VB.TextBox LSTimeOut 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   5400
      TabIndex        =   22
      Text            =   "10"
      Top             =   3480
      Visible         =   0   'False
      Width           =   1215
   End
   Begin VB.TextBox DMTSTimeOut 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   5400
      TabIndex        =   18
      Text            =   "10"
      Top             =   2880
      Visible         =   0   'False
      Width           =   1215
   End
   Begin VB.TextBox MTSTimeOut 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   5400
      TabIndex        =   15
      Text            =   "10"
      Top             =   2280
      Visible         =   0   'False
      Width           =   1215
   End
   Begin VB.TextBox SetsCriterion 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   6720
      TabIndex        =   23
      Text            =   "10"
      Top             =   3480
      Visible         =   0   'False
      Width           =   1215
   End
   Begin VB.TextBox DMTSDelay 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   6720
      TabIndex        =   19
      Text            =   "10"
      Top             =   2880
      Visible         =   0   'False
      Width           =   1215
   End
   Begin VB.TextBox Text1 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   8895
      Left            =   10200
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   43
      Text            =   "Form2.frx":00D0
      Top             =   8040
      Visible         =   0   'False
      Width           =   11895
   End
   Begin VB.CheckBox MTSCheck 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   732
      Left            =   1560
      TabIndex        =   36
      Top             =   2160
      Visible         =   0   'False
      Width           =   852
   End
   Begin VB.CheckBox LSCheck 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   732
      Left            =   1560
      TabIndex        =   33
      Top             =   3360
      Visible         =   0   'False
      Width           =   852
   End
   Begin VB.CheckBox DMTSCheck 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   732
      Left            =   1560
      TabIndex        =   31
      Top             =   2760
      Visible         =   0   'False
      Width           =   852
   End
   Begin VB.CheckBox PursuitCheck 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   732
      Left            =   1560
      TabIndex        =   29
      Top             =   1560
      Visible         =   0   'False
      Width           =   852
   End
   Begin VB.CheckBox ChaseCheck 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   732
      Left            =   1560
      TabIndex        =   27
      Top             =   960
      Visible         =   0   'False
      Width           =   852
   End
   Begin VB.CheckBox SideCheck 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   732
      Left            =   1560
      TabIndex        =   25
      Top             =   360
      Visible         =   0   'False
      Width           =   852
   End
   Begin VB.CommandButton BackColor 
      Caption         =   "Change Background Color"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   915
      Left            =   9960
      TabIndex        =   42
      Top             =   1680
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.ComboBox Speed 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      ItemData        =   "Form2.frx":2255
      Left            =   720
      List            =   "Form2.frx":225F
      TabIndex        =   44
      Text            =   "1"
      Top             =   5520
      Visible         =   0   'False
      Width           =   1095
   End
   Begin VB.ComboBox StimFolder 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      ItemData        =   "Form2.frx":226D
      Left            =   4800
      List            =   "Form2.frx":226F
      TabIndex        =   46
      Text            =   "Stimuli"
      Top             =   5400
      Visible         =   0   'False
      Width           =   1095
   End
   Begin VB.ComboBox Auditory 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      ItemData        =   "Form2.frx":2271
      Left            =   720
      List            =   "Form2.frx":227B
      TabIndex        =   45
      Text            =   "Yes"
      Top             =   6240
      Visible         =   0   'False
      Width           =   1095
   End
   Begin VB.CheckBox SelectCheck 
      Alignment       =   1  'Right Justify
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   732
      Left            =   1680
      TabIndex        =   35
      Top             =   3960
      Visible         =   0   'False
      Width           =   375
   End
   Begin VB.Label Label7 
      Caption         =   "Timeout Time"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   7800
      TabIndex        =   80
      Top             =   240
      Visible         =   0   'False
      Width           =   1815
   End
   Begin VB.Label Label6 
      Caption         =   "Repeat"
      Height          =   495
      Left            =   4680
      TabIndex        =   79
      Top             =   4080
      Visible         =   0   'False
      Width           =   1455
   End
   Begin VB.Label Label5 
      Caption         =   "Random"
      Height          =   495
      Left            =   2400
      TabIndex        =   77
      Top             =   4080
      Visible         =   0   'False
      Width           =   1455
   End
   Begin VB.Label Label4 
      Caption         =   "How Many Pellets Per Trial?"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   3360
      TabIndex        =   74
      Top             =   5880
      Visible         =   0   'False
      Width           =   3855
   End
   Begin VB.Label TrialsSelectLabel 
      Caption         =   "Trials Per Task"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   6480
      TabIndex        =   73
      Top             =   4080
      Visible         =   0   'False
      Width           =   1215
   End
   Begin VB.Label MTSTimeOutLabel 
      Caption         =   "Time Out"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   5400
      TabIndex        =   61
      Top             =   2040
      Visible         =   0   'False
      Width           =   1455
   End
   Begin VB.Label TitrateSizeSideLabel 
      Caption         =   "Titrate Size?"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   5160
      TabIndex        =   49
      Top             =   240
      Visible         =   0   'False
      Width           =   1335
   End
   Begin VB.Label ResponseChaseLabel 
      Caption         =   "Response Time"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   5160
      TabIndex        =   55
      Top             =   840
      Visible         =   0   'False
      Width           =   1335
   End
   Begin VB.Label PursuitTimeLabel 
      Caption         =   "Pursuit Time"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   6480
      TabIndex        =   64
      Top             =   1440
      Visible         =   0   'False
      Width           =   1335
   End
   Begin VB.Label ResponsePursuitLabel 
      Caption         =   "Response Time"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   5160
      TabIndex        =   65
      Top             =   1440
      Visible         =   0   'False
      Width           =   1455
   End
   Begin VB.Label SetsCriterionLabel 
      Caption         =   "Sets to Criterion"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   6720
      TabIndex        =   51
      Top             =   3240
      Visible         =   0   'False
      Width           =   1815
   End
   Begin VB.Label DMTSDelayLabel 
      Caption         =   "Delay Interval"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   6720
      TabIndex        =   57
      Top             =   2640
      Visible         =   0   'False
      Width           =   1335
   End
   Begin VB.Label DMTSTimeOutLabel 
      Caption         =   "Time Out"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   5400
      TabIndex        =   58
      Top             =   2640
      Visible         =   0   'False
      Width           =   1455
   End
   Begin VB.Label LSTimeOutLabel 
      Caption         =   "Time Out"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   5400
      TabIndex        =   52
      Top             =   3240
      Visible         =   0   'False
      Width           =   1455
   End
   Begin VB.Label CorrectLSLabel 
      Caption         =   "% Correct to Criterion"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   3840
      TabIndex        =   53
      Top             =   3240
      Visible         =   0   'False
      Width           =   1815
   End
   Begin VB.Label CorrectDMTSLabel 
      Caption         =   "% Correct to Criterion"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   3840
      TabIndex        =   59
      Top             =   2640
      Visible         =   0   'False
      Width           =   1815
   End
   Begin VB.Label CorrectMTSLabel 
      Caption         =   "% Correct to Criterion"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   3840
      TabIndex        =   62
      Top             =   2040
      Visible         =   0   'False
      Width           =   1815
   End
   Begin VB.Label ResponseSideLabel 
      Caption         =   "Response Time"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   3840
      TabIndex        =   68
      Top             =   240
      Visible         =   0   'False
      Width           =   1815
   End
   Begin VB.Label TrialsChaseLabel 
      Caption         =   "Trials to Criterion"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   3840
      TabIndex        =   56
      Top             =   840
      Visible         =   0   'False
      Width           =   1815
   End
   Begin VB.Label TrialsPursuitLabel 
      Caption         =   "Trials to Criterion"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   3840
      TabIndex        =   66
      Top             =   1440
      Visible         =   0   'False
      Width           =   1815
   End
   Begin VB.Label SizeChaseLabel 
      Caption         =   "Size"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   2520
      TabIndex        =   71
      Top             =   840
      Visible         =   0   'False
      Width           =   1815
   End
   Begin VB.Label SizePursuitLabel 
      Caption         =   "Size"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   2520
      TabIndex        =   70
      Top             =   1440
      Visible         =   0   'False
      Width           =   1815
   End
   Begin VB.Label TrialsSideLabel 
      Caption         =   "Trials to Criterion"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   2520
      TabIndex        =   69
      Top             =   240
      Visible         =   0   'False
      Width           =   1815
   End
   Begin VB.Label TitrateSizePursuitLabel 
      Caption         =   "Titrate Size?"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   7800
      TabIndex        =   67
      Top             =   1440
      Visible         =   0   'False
      Width           =   1335
   End
   Begin VB.Label TrialsMTSLabel 
      Caption         =   "Trials to Criterion"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   2520
      TabIndex        =   63
      Top             =   2040
      Visible         =   0   'False
      Width           =   1815
   End
   Begin VB.Label TrialsDMTSLabel 
      Caption         =   "Trials to Criterion"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   2520
      TabIndex        =   60
      Top             =   2640
      Visible         =   0   'False
      Width           =   1815
   End
   Begin VB.Label TrialsLSLabel 
      Caption         =   "Trials to Criterion"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   2520
      TabIndex        =   54
      Top             =   3240
      Visible         =   0   'False
      Width           =   1815
   End
   Begin VB.Label TitrateSizeChaseLabel 
      Caption         =   "Titrate Size?"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   6480
      TabIndex        =   50
      Top             =   840
      Visible         =   0   'False
      Width           =   1335
   End
   Begin VB.Label Label3 
      Caption         =   "Start Level"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   6480
      TabIndex        =   48
      Top             =   240
      Visible         =   0   'False
      Width           =   1335
   End
   Begin VB.Label Upload 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Caption         =   "Upload Parameters"
      Height          =   615
      Left            =   7800
      TabIndex        =   47
      Top             =   4920
      Visible         =   0   'False
      Width           =   3735
   End
   Begin VB.Shape BackColorShape 
      FillColor       =   &H00FFFFFF&
      FillStyle       =   0  'Solid
      Height          =   1215
      Left            =   9960
      Top             =   360
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.Label StimLabel 
      Caption         =   "Which Folder Holds Stimuli?"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   3480
      TabIndex        =   41
      Top             =   4920
      Visible         =   0   'False
      Width           =   3855
   End
   Begin VB.Label Label2 
      Caption         =   "Auditory Feedback?"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   240
      TabIndex        =   40
      Top             =   5880
      Visible         =   0   'False
      Width           =   2775
   End
   Begin VB.Label SpeedLabel 
      Caption         =   "Computer Speed (1 - slow, 2 - fast)"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   735
      Left            =   240
      TabIndex        =   39
      Top             =   4680
      Visible         =   0   'False
      Width           =   2175
   End
   Begin VB.Label Label1 
      Caption         =   "Press ""h"" for Help"
      Height          =   495
      Left            =   8280
      TabIndex        =   38
      Top             =   5760
      Visible         =   0   'False
      Width           =   3015
   End
   Begin VB.Label MTSLabel 
      Caption         =   "MTS"
      Height          =   495
      Left            =   240
      TabIndex        =   37
      Top             =   2280
      Visible         =   0   'False
      Width           =   1335
   End
   Begin VB.Label SelectLabel 
      Caption         =   "SELECT"
      Height          =   495
      Left            =   240
      TabIndex        =   34
      Top             =   4080
      Visible         =   0   'False
      Width           =   1575
   End
   Begin VB.Label LSLabel 
      Caption         =   "LS"
      Height          =   495
      Left            =   240
      TabIndex        =   32
      Top             =   3480
      Visible         =   0   'False
      Width           =   1335
   End
   Begin VB.Label DMTSLabel 
      Caption         =   "DMTS"
      Height          =   495
      Left            =   240
      TabIndex        =   30
      Top             =   2880
      Visible         =   0   'False
      Width           =   1335
   End
   Begin VB.Label PursuitLabel 
      Caption         =   "Pursuit"
      Height          =   492
      Left            =   240
      TabIndex        =   28
      Top             =   1680
      Visible         =   0   'False
      Width           =   1332
   End
   Begin VB.Label ChaseLabel 
      Caption         =   "Chase"
      Height          =   492
      Left            =   240
      TabIndex        =   26
      Top             =   1080
      Visible         =   0   'False
      Width           =   1332
   End
   Begin VB.Label SideLabel 
      Caption         =   "Side"
      Height          =   495
      Left            =   240
      TabIndex        =   24
      Top             =   480
      Visible         =   0   'False
      Width           =   1335
   End
End
Attribute VB_Name = "Form2"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim ColorCode As Integer

Private Sub BackColor_Click()

ColorCode = ColorCode + 1
If ColorCode > 15 Then
    ColorCode = 0
End If

BackColorShape.FillColor = QBColor(ColorCode)

End Sub

Private Sub BeginTest_Click()

If ID.Text = "Subject Monkey ID #" Then
    MsgBox ("Error. Please choose a monkey ID number.")
Else:
    If SelectCheck.Value = 1 Then
        TitrateSizeSide.Text = "No"
        TitrateSizeChase.Text = "No"
        TitrateSizePursuit.Text = "No"
    End If
    Form2.Visible = False
    Form1.BackColor = QBColor(ColorCode)
    Form1.Visible = True
End If

End Sub

Private Sub Form_KeyPress(ascii As Integer)

If ascii = Asc("q") Then
    End
End If
    
If ascii = Asc("h") And Text1.Visible = False Then
    Text1.Visible = True
Else:
    Text1.Visible = False
End If

End Sub

Private Sub Form_Load()

Open App.Path + "\Animal IDs.txt" For Input As 8
Do Until EOF(8)
    Line Input #8, MonkName
    ID.AddItem MonkName
Loop
Close 8

Text1.Top = 120
Text1.Left = 120
ColorCode = 15
Upload_Click

End Sub

Private Sub SelectCheck_Click()

TitrateSizeSide.Text = "No"
TitrateSizeChase.Text = "No"
TitrateSizePursuit.Text = "No"

End Sub

Private Sub SelectCheck2_Click()

SelectCheck.Value = 1
SelectCheck3.Value = 0

End Sub

Private Sub SelectCheck3_Click()

SelectCheck.Value = 1
SelectCheck2.Value = 0

End Sub

Private Sub Upload_Click()

Open App.Path + "\parameters.txt" For Input As 7

Line Input #7, Dead
Line Input #7, Dead
Line Input #7, Dead
Line Input #7, Dead
Line Input #7, SessionType
If SessionType = "Select" Then
    If SelectCheck.Value = 0 Then
        SelectCheck.Value = 1
    End If
End If
Line Input #7, Dead
Line Input #7, Dead
Line Input #7, TheTypeSelect
If TheTypeSelect = "Yes" Then
    If SelectCheck2.Value = 0 Then
        SelectCheck2.Value = 1
    End If
End If
Line Input #7, Dead
Line Input #7, Dead
Line Input #7, ThePellets
PelletsPerTrial.Text = ThePellets
Line Input #7, Dead
Line Input #7, Dead
Line Input #7, TheSpeed
Speed.Text = TheSpeed
Line Input #7, Dead
Line Input #7, Dead
Line Input #7, TheAuditory
Auditory.Text = TheAuditory
Line Input #7, Dead
Line Input #7, Dead
Line Input #7, TheStimFolder
StimFolder.Text = TheStimFolder
Line Input #7, Dead
Line Input #7, Dead
Line Input #7, TheBackground
ColorCode = TheBackground
BackColorShape.FillColor = QBColor(ColorCode)
Line Input #7, Dead
Line Input #7, Dead
Line Input #7, TrialsSet
Line Input #7, Dead
Line Input #7, Dead
Line Input #7, SideActive
If SideActive = "Yes" Then
    SideCheck.Value = 1
Else:
    SideCheck.Value = 0
End If
Line Input #7, Dead
Line Input #7, Dead
Line Input #7, SideTrialsCrit
TrialsSide.Text = SideTrialsCrit
Line Input #7, Dead
Line Input #7, Dead
Line Input #7, SideTaskResponse
ResponseSide.Text = SideTaskResponse
Line Input #7, Dead
Line Input #7, Dead
Line Input #7, TitrateSide
TitrateSizeSide.Text = TitrateSide
Line Input #7, Dead
Line Input #7, Dead
Line Input #7, TheSideStartLevel
SideStartLevel.Text = TheSideStartLevel
Line Input #7, Dead
Line Input #7, Dead
Line Input #7, TheTimeoutTime
TimeOutTime.Text = TheTimeoutTime
Line Input #7, Dead
Line Input #7, Dead
Line Input #7, ChaseActive
If ChaseActive = "Yes" Then
    ChaseCheck.Value = 1
Else:
    ChaseCheck.Value = 0
End If
Line Input #7, Dead
Line Input #7, Dead
Line Input #7, ChaseSize
SizeChase.Text = ChaseSize
Line Input #7, Dead
Line Input #7, Dead
Line Input #7, ChaseTrialsCrit
TrialsChase.Text = ChaseTrialsCrit
Line Input #7, Dead
Line Input #7, Dead
Line Input #7, ChaseTaskResponse
ResponseChase.Text = ChaseTaskResponse
Line Input #7, Dead
Line Input #7, Dead
Line Input #7, TitrateChase
TitrateSizeChase.Text = TitrateChase
Line Input #7, Dead
Line Input #7, Dead
Line Input #7, PursuitActive
If PursuitActive = "Yes" Then
    PursuitCheck.Value = 1
Else:
    PursuitCheck.Value = 0
End If
Line Input #7, Dead
Line Input #7, Dead
Line Input #7, PursuitSize
SizePursuit.Text = PursuitSize
Line Input #7, Dead
Line Input #7, Dead
Line Input #7, PursuitTrialsCrit
TrialsPursuit.Text = PursuitTrialsCrit
Line Input #7, Dead
Line Input #7, Dead
Line Input #7, PursuitTaskResponse
ResponsePursuit.Text = PursuitTaskResponse
Line Input #7, Dead
Line Input #7, Dead
Line Input #7, PursuitResponseTime
PursuitTime.Text = PursuitResponseTime
Line Input #7, Dead
Line Input #7, Dead
Line Input #7, TitratePursuit
TitrateSizePursuit.Text = TitratePursuit
Line Input #7, Dead
Line Input #7, Dead
Line Input #7, MTSActive
If MTSActive = "Yes" Then
    MTSCheck.Value = 1
Else:
    MTSCheck.Value = 0
End If
Line Input #7, Dead
Line Input #7, Dead
Line Input #7, MTSCriterion
TrialsMTS.Text = MTSCriterion
Line Input #7, Dead
Line Input #7, Dead
Line Input #7, MTSPercent
CorrectMTS.Text = MTSPercent
Line Input #7, Dead
Line Input #7, Dead
Line Input #7, MTSTime
MTSTimeOut.Text = MTSTime
Line Input #7, Dead
Line Input #7, Dead
Line Input #7, DMTSActive
If DMTSActive = "Yes" Then
    DMTSCheck.Value = 1
Else:
    DMTSCheck.Value = 0
End If
Line Input #7, Dead
Line Input #7, Dead
Line Input #7, DMTSCriterion
TrialsDMTS.Text = DMTSCriterion
Line Input #7, Dead
Line Input #7, Dead
Line Input #7, DMTSPercent
CorrectDMTS.Text = DMTSPercent
Line Input #7, Dead
Line Input #7, Dead
Line Input #7, DMTSTime
DMTSTimeOut.Text = DMTSTime
Line Input #7, Dead
Line Input #7, Dead
Line Input #7, DelayDMTS
DMTSDelay.Text = DelayDMTS
Line Input #7, Dead
Line Input #7, Dead
Line Input #7, LSActive
If LSActive = "Yes" Then
    LSCheck.Value = 1
Else:
    LSCheck.Value = 0
End If
Line Input #7, Dead
Line Input #7, Dead
Line Input #7, LSCriterion
TrialsLS.Text = LSCriterion
Line Input #7, Dead
Line Input #7, Dead
Line Input #7, LSPercent
CorrectLS.Text = LSPercent
Line Input #7, Dead
Line Input #7, Dead
Line Input #7, LSTime
LSTimeOut.Text = LSTime
Line Input #7, Dead
Line Input #7, Dead
Line Input #7, LSSets
SetsCriterion.Text = LSSets

Close #7

End Sub
