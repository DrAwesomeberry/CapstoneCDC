VERSION 5.00
Object = "{6FBA474E-43AC-11CE-9A0E-00AA0062BB4C}#1.0#0"; "SYSINFO.OCX"
Begin VB.Form Form1 
   BackColor       =   &H00FFFFFF&
   BorderStyle     =   0  'None
   Caption         =   "Form1"
   ClientHeight    =   9000
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   12000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   9000
   ScaleWidth      =   12000
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   WindowState     =   2  'Maximized
   Begin VB.Timer SideTimeOut 
      Enabled         =   0   'False
      Interval        =   5000
      Left            =   5160
      Top             =   2040
   End
   Begin VB.Timer SideTimeOutTimer 
      Enabled         =   0   'False
      Interval        =   20
      Left            =   4680
      Top             =   2040
   End
   Begin VB.Timer Timer5 
      Enabled         =   0   'False
      Interval        =   5000
      Left            =   4200
      Top             =   2040
   End
   Begin VB.Timer ColorTimer 
      Enabled         =   0   'False
      Interval        =   750
      Left            =   3360
      Top             =   0
   End
   Begin VB.Timer FlashTimer 
      Enabled         =   0   'False
      Interval        =   5000
      Left            =   3840
      Top             =   0
   End
   Begin VB.Timer Timer1 
      Enabled         =   0   'False
      Interval        =   750
      Left            =   5520
      Top             =   0
   End
   Begin VB.Timer TimeOutTimer2 
      Enabled         =   0   'False
      Interval        =   60000
      Left            =   5280
      Top             =   3120
   End
   Begin VB.Timer TimeOutTimer 
      Enabled         =   0   'False
      Interval        =   60000
      Left            =   4680
      Top             =   3120
   End
   Begin VB.CommandButton NextTrialSelect 
      Caption         =   "Next Trial Select"
      Height          =   375
      Left            =   4680
      TabIndex        =   12
      Top             =   1200
      Visible         =   0   'False
      Width           =   1455
   End
   Begin VB.CommandButton NextTrialRandom 
      Caption         =   "Next Trial Random"
      Height          =   375
      Left            =   6120
      TabIndex        =   11
      Top             =   1200
      Visible         =   0   'False
      Width           =   1455
   End
   Begin VB.Timer SelectTimer 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   4200
      Top             =   2520
   End
   Begin VB.Timer LSTimeOut 
      Enabled         =   0   'False
      Left            =   6360
      Top             =   2040
   End
   Begin VB.Timer LSTimer 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   6360
      Top             =   1560
   End
   Begin VB.CommandButton LS 
      Caption         =   "LS"
      Height          =   255
      Left            =   3240
      TabIndex        =   10
      Top             =   2760
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.Timer DMTSTimer2 
      Enabled         =   0   'False
      Left            =   6000
      Top             =   2520
   End
   Begin VB.Timer DMTSTimeOut 
      Enabled         =   0   'False
      Left            =   6000
      Top             =   2040
   End
   Begin VB.Timer DMTSTimer 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   6000
      Top             =   1560
   End
   Begin VB.FileListBox File1 
      Height          =   480
      Left            =   3360
      TabIndex        =   9
      Top             =   3360
      Visible         =   0   'False
      Width           =   615
   End
   Begin VB.Timer MTSTimeOut 
      Enabled         =   0   'False
      Left            =   5640
      Top             =   2040
   End
   Begin VB.Timer MTSTimer 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   5640
      Top             =   1560
   End
   Begin VB.Timer PursuitTimer2 
      Enabled         =   0   'False
      Left            =   5280
      Top             =   1560
   End
   Begin VB.Timer PursuitTimer 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   4920
      Top             =   1560
   End
   Begin VB.Timer ChaseTimer 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   4560
      Top             =   1560
   End
   Begin VB.CommandButton Pursuit 
      Caption         =   "Pursuit"
      Height          =   255
      Left            =   3240
      TabIndex        =   8
      Top             =   2040
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.CommandButton MTS 
      Caption         =   "MTS"
      Height          =   255
      Left            =   3240
      TabIndex        =   7
      Top             =   2280
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.CommandButton DMTS 
      Caption         =   "DMTS"
      Height          =   255
      Left            =   3240
      TabIndex        =   6
      Top             =   2520
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.CommandButton Side 
      Caption         =   "Side"
      Height          =   255
      Left            =   3240
      TabIndex        =   5
      Top             =   1560
      Visible         =   0   'False
      Width           =   975
   End
   Begin SysInfoLib.SysInfo SysInfo1 
      Left            =   600
      Top             =   5400
      _ExtentX        =   1005
      _ExtentY        =   1005
      _Version        =   393216
   End
   Begin VB.CommandButton Chase 
      Caption         =   "Chase"
      Height          =   255
      Left            =   3240
      TabIndex        =   4
      Top             =   1800
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.Timer Timer4 
      Enabled         =   0   'False
      Interval        =   1000
      Left            =   5160
      Top             =   0
   End
   Begin VB.CommandButton Pellet 
      Caption         =   "Pellet"
      Height          =   375
      Left            =   4680
      TabIndex        =   3
      Top             =   840
      Visible         =   0   'False
      Width           =   1935
   End
   Begin VB.CommandButton NextTrialTrain 
      Caption         =   "Next Trial Train"
      Height          =   375
      Left            =   3240
      TabIndex        =   2
      Top             =   1200
      Visible         =   0   'False
      Width           =   1455
   End
   Begin VB.Timer Timer3 
      Enabled         =   0   'False
      Interval        =   10
      Left            =   4800
      Top             =   0
   End
   Begin VB.CommandButton ShowTrial 
      Caption         =   "Show Trial"
      Height          =   375
      Left            =   3240
      TabIndex        =   1
      Top             =   840
      Visible         =   0   'False
      Width           =   1455
   End
   Begin VB.CommandButton Quit 
      Caption         =   "Quit"
      Height          =   255
      Left            =   3240
      TabIndex        =   0
      Top             =   600
      Visible         =   0   'False
      Width           =   495
   End
   Begin VB.Timer Timer2 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   4440
      Top             =   0
   End
   Begin VB.Timer SideTimer 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   4200
      Top             =   1560
   End
   Begin VB.TextBox TrialsNumber 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BorderStyle     =   0  'None
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   24
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   6120
      TabIndex        =   13
      Top             =   0
      Visible         =   0   'False
      Width           =   1335
   End
   Begin VB.Shape SideStim 
      BorderStyle     =   0  'Transparent
      FillColor       =   &H0000FF00&
      FillStyle       =   0  'Solid
      Height          =   9015
      Index           =   1
      Left            =   10080
      Top             =   0
      Visible         =   0   'False
      Width           =   1935
   End
   Begin VB.Shape joy 
      FillColor       =   &H000000FF&
      FillStyle       =   0  'Solid
      Height          =   250
      Left            =   5875
      Shape           =   3  'Circle
      Top             =   4375
      Width           =   250
   End
   Begin VB.Shape SideStim 
      BorderStyle     =   0  'Transparent
      FillColor       =   &H0000FF00&
      FillStyle       =   0  'Solid
      Height          =   1935
      Index           =   0
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   12015
   End
   Begin VB.Label TrialsLabel 
      BackColor       =   &H80000009&
      Caption         =   "Trial:"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   24
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   4440
      TabIndex        =   14
      Top             =   0
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.Image SelectChoice 
      Enabled         =   0   'False
      Height          =   1815
      Index           =   5
      Left            =   1440
      Stretch         =   -1  'True
      Top             =   1080
      Visible         =   0   'False
      Width           =   1815
   End
   Begin VB.Image SelectChoice 
      Enabled         =   0   'False
      Height          =   1815
      Index           =   4
      Left            =   1440
      Stretch         =   -1  'True
      Top             =   3360
      Visible         =   0   'False
      Width           =   1815
   End
   Begin VB.Image SelectChoice 
      Enabled         =   0   'False
      Height          =   1815
      Index           =   3
      Left            =   1440
      Stretch         =   -1  'True
      Top             =   5640
      Visible         =   0   'False
      Width           =   1815
   End
   Begin VB.Image SelectChoice 
      Enabled         =   0   'False
      Height          =   1815
      Index           =   2
      Left            =   8760
      Stretch         =   -1  'True
      Top             =   5640
      Visible         =   0   'False
      Width           =   1815
   End
   Begin VB.Image SelectChoice 
      Enabled         =   0   'False
      Height          =   1815
      Index           =   1
      Left            =   8760
      Stretch         =   -1  'True
      Top             =   3360
      Visible         =   0   'False
      Width           =   1815
   End
   Begin VB.Image SelectChoice 
      Enabled         =   0   'False
      Height          =   1815
      Index           =   0
      Left            =   8760
      Stretch         =   -1  'True
      Top             =   1080
      Visible         =   0   'False
      Width           =   1815
   End
   Begin VB.Shape SideStim 
      BorderStyle     =   0  'Transparent
      FillColor       =   &H0000FF00&
      FillStyle       =   0  'Solid
      Height          =   9015
      Index           =   2
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   1935
   End
   Begin VB.Shape SideStim 
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   0  'Transparent
      FillColor       =   &H0000FF00&
      FillStyle       =   0  'Solid
      Height          =   1935
      Index           =   3
      Left            =   0
      Top             =   7080
      Visible         =   0   'False
      Width           =   12135
   End
   Begin VB.Image Match2 
      Height          =   2655
      Left            =   8760
      Stretch         =   -1  'True
      Top             =   240
      Visible         =   0   'False
      Width           =   2895
   End
   Begin VB.Image Match1 
      Height          =   2655
      Left            =   240
      Stretch         =   -1  'True
      Top             =   240
      Visible         =   0   'False
      Width           =   2895
   End
   Begin VB.Image Sample 
      Height          =   2655
      Left            =   4560
      Stretch         =   -1  'True
      Top             =   3840
      Visible         =   0   'False
      Width           =   2895
   End
   Begin VB.Shape ChaseCircle 
      FillColor       =   &H0000FF00&
      FillStyle       =   0  'Solid
      Height          =   1335
      Left            =   1800
      Shape           =   3  'Circle
      Top             =   3480
      Visible         =   0   'False
      Width           =   1335
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim myJoy As JOYINFOEX
Dim PelletsDispensed As Integer
Dim AutoSelect(10)
Dim AutoSelectNumber As Integer
Dim PelletsNeeded As Integer
Dim PelletsGiven As Integer
Dim LastSideCorrect As String
Dim SelectChoiceNumber As Integer
Dim YesterdayOrder$(5000)
Dim NotShown As Integer
Dim NotShown2 As Integer
Dim CurrentXPos As Long
Dim CurrentYPos As Long
Dim Shown As Integer
Dim IsPrimed As String
Dim StillX As Integer
Dim StillY As Integer
Dim CursorOn As String
Dim GavePellet As String
Dim JoySpeed As Integer
Dim CircleSpeed As Integer
Dim Contacts As Integer
Dim FirstJoy As Long
Dim SecondJoy As Long
Dim SideHot As String
Dim ChaseHot As String
Dim PursuitHot As String
Dim MTSHot As String
Dim DMTSHot As String
Dim LSHot As String
Dim NewTask As String
Dim CurrentTask As String
Dim ChoiceTrialNumber As Integer
Dim TheChoice$(50)
Dim WhichSample As String
Dim FileName As String
Dim RandomSampleNumber As Integer
Dim RandomMatchNumber As Integer
Dim TrialNumber As Integer
Dim TotalTrialNumber As Integer
Dim ResponseTime As Double
Dim SideNumberTrials As Integer
Dim LeftDirection As Integer
Dim TopDirection As Integer
Dim ResponseSide As Long
Dim SideTrialNumber As Integer
Dim SideLevel As Integer
Dim SideTrialsCorrect As Integer
Dim SideCorrectNeeded As Integer
Dim SideFinished As String
Dim SideTime As Double
Dim SideTimeOutTime As Integer
Dim NumberSide5Trials As Integer
Dim CriterionSide5Trials As Integer
Dim Side5Time$(500)
Dim ThisSideTime As Double
Dim TotalSideTime As Double
Dim ResponseChase As Long
Dim ChaseTrialNumber As Integer
Dim ChaseTrialsCorrect As Integer
Dim ChaseCorrectNeeded As Integer
Dim ChaseFinished As String
Dim ChaseErrors As Integer
Dim Chase200Time$(500)
Dim CriterionChaseTrials As Integer
Dim ThisChaseTime As Double
Dim TotalChaseTime As Double
Dim ResponsePursuit As Integer
Dim PursuitTime As Double
Dim PursuitTrialNumber As Integer
Dim PursuitTrialsCorrect As Integer
Dim PursuitCorrectNeeded As Integer
Dim PursuitFinished As String
Dim PursuitErrors As Integer
Dim MetPursuitCriterion As String
Dim PursuitTrack$(500)
Dim PursuitBlock As Integer
Dim PursuitBlockCorrect As Integer
Dim MTSTrialNumber As Integer
Dim MTSTrial As Integer
Dim MTSWord$(5000)
Dim MTSCriterion$(5000)
Dim MTSFinished As String
Dim MTSCorrect As Integer
Dim DMTSTrialNumber As Integer
Dim DMTSTrial As Integer
Dim DMTSWord$(5000)
Dim DMTSCriterion$(5000)
Dim DMTSFinished As String
Dim DMTSCorrect As Integer
Dim DMTSTime As Integer
Dim TitratedTime As Double
Dim LSTrialNumber As Integer
Dim LSTrial As Integer
Dim LSWord$(5000)
Dim LSCriterion$(5000)
Dim LSFinished As String
Dim LSCorrect As Integer
Dim LSSets As Integer
Dim LSNewSet As String
Dim LSSetsCorrect As Integer
Dim SetNumber As Integer
Dim CorrectSide As String
Dim BlockTrial As Integer
Dim LSBlockTrial As Integer
Dim NotMovedYet As String
Dim TrialTimer As Double
Dim TrialTimer2 As Double
Dim DelayTime As Integer
Dim t As Double
Dim t2 As Double
Public ValX
Public ValY
Public MC
Dim myvar As String
Private Declare Function ShowCursor Lib "user32" (ByVal bShow As Long) As Long
Private Declare Function PlaySound Lib "winmm.dll" Alias "PlaySoundA" (ByVal lpszName As String, ByVal hModule As Long, ByVal dwFlags As Long) As Long

Private Sub Chase_Click()

ChaseCircle.FillColor = 65280

Close #3
Open App.Path + "\DataFiles\" + FileName + " Chase Data.txt" For Append As 3

ChaseTrialNumber = ChaseTrialNumber + 1

ResponseChase2 = Form2.ResponseChase.Text

If Form2.SelectCheck.Value = 0 Then
    ChaseCorrectNeeded = Form2.TrialsChase.Text
Else:
    TheChoiceTrials = Form2.SelectTrials.Text
    ChoiceTrials = TheChoiceTrials
    ChoiceTrialNumber = ChoiceTrialNumber + 1
    If ChoiceTrialNumber = ChoiceTrials Then
        ChoiceTrialNumber = 0
        NewTask = "True"
    End If
End If
If Form2.SizeChase.Text = "Small" Then
    ChaseCircle.Height = 975
    ChaseCircle.Width = 975
End If
If Form2.SizeChase.Text = "Medium" Then
    ChaseCircle.Height = 1335
    ChaseCircle.Width = 1335
End If
If Form2.SizeChase.Text = "Large" Then
    ChaseCircle.Height = 2055
    ChaseCircle.Width = 2055
End If

Randomize
ChaseCircle.Left = Int((SysInfo1.WorkAreaWidth - (ChaseCircle.Width * 2)) * Rnd)
ChaseCircle.Top = Int((SysInfo1.WorkAreaHeight - (ChaseCircle.Height * 2)) * Rnd)

LeftDirection = CircleSpeed
TopDirection = CircleSpeed

Print #1, Date$; " "; Time$; " Chase "; TotalTrialNumber; " "; ChaseTrialNumber; " "; Form2.SizeChase.Text; " ";
'Print #3, Date$; " "; Time$; " "; " "; ChaseTrialNumber; " "; Form2.SizeChase.Text; " ";

Randomize
joy.Left = Int((SysInfo1.WorkAreaWidth - (joy.Width * 2)) * Rnd)
joy.Top = Int((SysInfo1.WorkAreaHeight - (joy.Height * 2)) * Rnd)
ChaseCircle.Visible = True
joy.Visible = True

DoagainChase:

myJoy.dwSize = 64
myJoy.dwFlags = JOY_RETURNALL

R& = joyGetPosEx(JOYSTICKID1, myJoy)

If myJoy.dwXpos = StillX And myJoy.dwYpos = StillY Then
    ChaseTimer.Enabled = True
Else:
    GoTo DoagainChase
End If

End Sub

Private Sub ChaseTimer_Timer()

myJoy.dwSize = 64
myJoy.dwFlags = JOY_RETURNALL

' Get the joystick coordinates.
R& = joyGetPosEx(JOYSTICKID1, myJoy)

If myJoy.dwXpos = FirstJoy And myJoy.dwYpos = SecondJoy Then
    Timer3.Enabled = False
Else:
    Timer3.Enabled = True
End If

' Check joystick coordinates.  If they are greater or less than the
' center coordinates, move the lines and command button in the
' appropriate direction and speed.

If MC = 0 Then
Call Makeconst
End If

If myJoy.dwXpos > ValX And joy.Left < 11550 Then
    TimeOutTimer.Enabled = False
    If NotMovedYet = "True" Then
        NotMovedYet = "False"
        TrialTimer = Timer
    End If
    TheFirst = myJoy.dwXpos - ValX
    joy.Left = joy.Left + (TheFirst / JoySpeed)
End If
If myJoy.dwYpos > ValY And joy.Top < 8680 Then
    TimeOutTimer.Enabled = False
    If NotMovedYet = "True" Then
        NotMovedYet = "False"
        TrialTimer = Timer
    End If
    TheSecond = myJoy.dwYpos - ValY
    joy.Top = joy.Top + (TheSecond / JoySpeed)
End If
If myJoy.dwXpos < ValX And joy.Left > 0 Then
    TimeOutTimer.Enabled = False
    If NotMovedYet = "True" Then
        NotMovedYet = "False"
        TrialTimer = Timer
    End If
    TheFirst = ValX - myJoy.dwXpos
    joy.Left = joy.Left - (TheFirst / JoySpeed)
End If
If myJoy.dwYpos < ValY And joy.Top > 0 Then
    TimeOutTimer.Enabled = False
    If NotMovedYet = "True" Then
        NotMovedYet = "False"
        TrialTimer = Timer
    End If
    TheSecond = ValY - myJoy.dwYpos
    joy.Top = joy.Top - (TheSecond / JoySpeed)
End If

If joy.Top + joy.Height < ChaseCircle.Top + ChaseCircle.Height And joy.Left + joy.Width < ChaseCircle.Left + ChaseCircle.Width And joy.Left > ChaseCircle.Left And joy.Top > ChaseCircle.Top And ChaseCircle.Visible = True Then
    Timer3.Enabled = False
    ChaseTimer.Enabled = False
    NotMovedYet = "True"
    ResponseTime = Timer - TrialTimer
    ChaseTime = Round(ResponseTime, 2)
    Print #1, ChaseTime
    'Print #3, ChaseTime
    ResponseTime = 0
    TrialTimer = 0
    ChaseCircle.Visible = False
    joy.Visible = False
    joy.Left = 6000
    joy.Top = 4320

    If ChaseTime < ResponseChase Or ResponseChase = 0 Then
        ChaseTrialsCorrect = ChaseTrialsCorrect + 1
        ChaseErrors = 0
    Else:
        ChaseErrors = ChaseErrors + 1
        ChaseTrialsCorrect = 0
    End If
    ErrorsMade = Form2.TrialsChase.Text
    If ChaseErrors = ErrorsMade Then
        ChaseErrors = 0
        If Form2.TitrateSizeChase.Text = "Yes" Then
            If Form2.SizeChase.Text = "Medium" Then
                Form2.SizeChase.Text = "Large"
            End If
            If Form2.SizeChase.Text = "Small" Then
                Form2.SizeChase.Text = "Medium"
            End If
        End If
    End If
    If ChaseTrialsCorrect = ChaseCorrectNeeded Then
        ChaseTrialsCorrect = 0
        If Form2.TitrateSizeChase.Text = "Yes" Then
            If Form2.SizeChase.Text = "Small" Then
                ChaseFinished = "True"
            End If
            If Form2.SizeChase.Text = "Medium" Then
                Form2.SizeChase.Text = "Small"
            End If
            If Form2.SizeChase.Text = "Large" Then
                Form2.SizeChase.Text = "Medium"
            End If
        Else:
            ChaseFinished = "True"
        End If
    End If
    If Form2.Auditory.Text = "Yes" Then
        RetVal = PlaySound(App.Path + "\correct.wav", 0, 0)
    End If
    Pellet_Click
End If

End Sub

Private Sub ColorTimer_Timer()

ColorTimer.Enabled = False
FlashTimer.Enabled = True
    
End Sub

Private Sub DMTS_Click()

Close #6
Open App.Path + "\DataFiles\" + FileName + " DMTS Data.txt" For Append As 6

DMTSTrialNumber = DMTSTrialNumber + 1

If Form2.SelectCheck.Value = 0 Then
    DMTSTrial = Form2.TrialsDMTS.Text
Else:
    TheChoiceTrials = Form2.SelectTrials.Text
    ChoiceTrials = TheChoiceTrials
    ChoiceTrialNumber = ChoiceTrialNumber + 1
    If ChoiceTrialNumber = ChoiceTrials Then
        ChoiceTrialNumber = 0
        NewTask = "True"
    End If
End If

DMTSOut = Form2.DMTSTimeOut.Text
DMTSTimeOut.Interval = DMTSOut * 1000
DMTSCorrect2 = Form2.CorrectDMTS.Text
DMTSCorrect = Round(DMTSTrial * (DMTSCorrect2 / 100), 0)

File1.Path = App.Path
File1.Path = App.Path + "\" + Form2.StimFolder.Text
DMTSFile = File1.ListCount
For n = 0 To DMTSFile - 1
    DMTSWord$(n) = File1.List(n)
Next n

Randomize
RandomSampleNumber = Int(DMTSFile * Rnd)

DoagainDMTS:
Randomize
RandomMatchNumber = Int(DMTSFile * Rnd)

If RandomMatchNumber = RandomSampleNumber Then
    GoTo DoagainDMTS
End If

Sample.Picture = LoadPicture(App.Path + "\" + Form2.StimFolder.Text + "\" + DMTSWord$(RandomSampleNumber))
Print #1, Date$; " "; Time$; " DMTS "; TotalTrialNumber; " "; DMTSTrialNumber; " "; Form2.DMTSTimeOut.Text; " "; Left$(DMTSWord$(RandomSampleNumber), Len(DMTSWord$(RandomSampleNumber)) - 4); " ";
'Print #6, Date$; " "; Time$; " "; DMTSTrialNumber; " "; Form2.DMTSTimeOut.Text; " "; Left$(DMTSWord$(RandomSampleNumber), Len(DMTSWord$(RandomSampleNumber)) - 4); " ";

Randomize
RanSide = Int(2 * Rnd)
If RanSide = 0 Then
    Match1.Picture = LoadPicture(App.Path + "\" + Form2.StimFolder.Text + "\" + DMTSWord$(RandomSampleNumber))
    CorrectSide = "Left"
    Print #1, " Left ";
    'Print #6, " Left ";
    Match2.Picture = LoadPicture(App.Path + "\" + Form2.StimFolder.Text + "\" + DMTSWord$(RandomMatchNumber))
    Print #1, Left$(DMTSWord$(RandomMatchNumber), Len(DMTSWord$(RandomMatchNumber)) - 4);
    'Print #6, Left$(DMTSWord$(RandomMatchNumber), Len(DMTSWord$(RandomMatchNumber)) - 4);
Else:
    Match2.Picture = LoadPicture(App.Path + "\" + Form2.StimFolder.Text + "\" + DMTSWord$(RandomSampleNumber))
    CorrectSide = "Right"
    Print #1, " Right ";
    'Print #6, " Right ";
    Match1.Picture = LoadPicture(App.Path + "\" + Form2.StimFolder.Text + "\" + DMTSWord$(RandomMatchNumber))
    Print #1, Left$(DMTSWord$(RandomMatchNumber), Len(DMTSWord$(RandomMatchNumber)) - 4);
    'Print #6, Left$(DMTSWord$(RandomMatchNumber), Len(DMTSWord$(RandomMatchNumber)) - 4);
End If

ChooseMatchLocation1 = Int(6 * Rnd)
    
If ChooseMatchLocation1 = 0 Then
    Match1.Left = 240
    Match1.Top = 240
    Match2.Left = 8760
    Match2.Top = 240
End If
If ChooseMatchLocation1 = 1 Then
    Match1.Left = 240
    Match1.Top = 240
    Match2.Left = 8760
    Match2.Top = 6000
End If
If ChooseMatchLocation1 = 2 Then
    Match1.Left = 240
    Match1.Top = 240
    Match2.Left = 240
    Match2.Top = 6000
End If
If ChooseMatchLocation1 = 3 Then
    Match1.Left = 8760
    Match1.Top = 240
    Match2.Left = 8760
    Match2.Top = 6000
End If
If ChooseMatchLocation1 = 4 Then
    Match1.Left = 8760
    Match1.Top = 240
    Match2.Left = 240
    Match2.Top = 6000
End If
If ChooseMatchLocation1 = 5 Then
    Match1.Left = 8760
    Match1.Top = 6000
    Match2.Left = 240
    Match2.Top = 6000
End If

Sample.Visible = True
joy.Left = 5880
joy.Top = 7680
joy.Visible = True
DMTSTimer.Enabled = True

End Sub

Private Sub DMTSTimeOut_Timer()

DMTSTimeOut.Enabled = False
If Form2.SelectCheck.Value = 1 Then
    NextTrialSelect_Click
Else:
    NextTrialTrain_Click
End If

End Sub

Private Sub DMTSTimer_Timer()

myJoy.dwSize = 64
myJoy.dwFlags = JOY_RETURNALL

' Get the joystick coordinates.
R& = joyGetPosEx(JOYSTICKID1, myJoy)

' Check joystick coordinates.  If they are greater or less than the
' center coordinates, move the lines and command button in the
' appropriate direction and speed.

If MC = 0 Then
Call Makeconst
End If

If myJoy.dwYpos > ValY And joy.Top < 8680 Then
    TheSecond = myJoy.dwYpos - ValY
    joy.Top = joy.Top + (TheSecond / JoySpeed)
End If
If myJoy.dwYpos < ValY And joy.Top > 0 Then
    TheSecond = ValY - myJoy.dwYpos
    joy.Top = joy.Top - (TheSecond / JoySpeed)
End If
If myJoy.dwXpos > ValX And joy.Left < 11550 Then
    TheFirst = myJoy.dwXpos - ValX
    joy.Left = joy.Left + (TheFirst / JoySpeed)
End If
If myJoy.dwXpos < ValX And joy.Left > 0 Then
    TheFirst = ValX - myJoy.dwXpos
    joy.Left = joy.Left - (TheFirst / JoySpeed)
End If
If joy.Top + joy.Height < Sample.Top + Sample.Height And joy.Left + joy.Width < Sample.Left + Sample.Width And joy.Left > Sample.Left And joy.Top > Sample.Top And Sample.Visible = True Then
    WhichSample = "DMTS"
    joy.Visible = False
    DMTSTimer.Enabled = False
    joy.Top = 5040
    joy.Left = 5880
    Sample.Enabled = False
    Sample.Visible = False
    If Form2.DMTSDelay.Text <> "Random" And Form2.DMTSDelay.Text <> "Titrate" Then
        DelayTime = Form2.DMTSDelay.Text
        DMTSTimer2.Interval = DelayTime * 1000
    End If
    If Form2.DMTSDelay.Text = "Random" Then
        Randomize
        DelayTime = Int(Rnd * 30 + 1)
        DMTSTimer2.Interval = DelayTime * 1000
    End If
    If Form2.DMTSDelay.Text = "Titrate" Then
        If DMTSTrialNumber = 1 Then
            DMTSTime = 1000
            DMTSTimer2.Interval = DMTSTime
        End If
    End If
    Print #1, " "; DMTSTimer2.Interval;
    'Print #6, " "; DMTSTimer2.Interval;
    DMTSTimer2.Enabled = True
End If

If joy.Top + joy.Height < Match1.Top + Match1.Height And joy.Left + joy.Width < Match1.Left + Match1.Width And joy.Left > Match1.Left And joy.Top > Match1.Top And Match1.Visible = True Then
    DMTSTimer.Enabled = False
    Match1.Visible = False
    Match2.Visible = False
    Sample.Visible = False
    Sample.Enabled = True
    joy.Visible = False
    joy.Left = 5880
    joy.Top = 7680
    BlockTrial = BlockTrial + 1
    If BlockTrial > DMTSTrial Then
        BlockTrial = 1
    End If
    If CorrectSide = "Left" Then
        If Form2.DMTSDelay.Text = "Titrate" Then
            DMTSTime = DMTSTime + 1000
            If DMTSTime > 30000 Then
                DMTSTime = 30000
            End If
            DMTSTimer2.Interval = DMTSTime
        End If
        If Form2.Auditory.Text = "Yes" Then
            RetVal = PlaySound(App.Path + "\correct.wav", 0, 0)
        End If
        Print #1, " Correct"
        'Print #6, " Correct"
        DMTSCriterion$(BlockTrial) = "Correct"
        CorrectTrials = 0
        For w = 1 To DMTSTrial
            If DMTSCriterion$(w) = "Correct" Then
                CorrectTrials = CorrectTrials + 1
            End If
        Next w
        If CorrectTrials > DMTSCorrect - 1 Then
            For w2 = 0 To DMTSTrial
                DMTSCriterion$(w) = "Incorrect"
            Next w2
            DMTSFinished = "True"
        End If
        Pellet_Click
    Else:
        If Form2.DMTSDelay.Text = "Titrate" Then
            DMTSTime = DMTSTime - 1000
            If DMTSTime < 1000 Then
                DMTSTime = 1000
            End If
            DMTSTimer2.Interval = DMTSTime
        End If
        If Form2.Auditory.Text = "Yes" Then
            RetVal = PlaySound(App.Path + "\incorrect.wav", 0, 0)
        End If
        Print #1, " Incorrect"
        'Print #6, " Incorrect"
        DMTSCriterion$(BlockTrial) = "Incorrect"
        DMTSTimeOut.Enabled = True
        DMTSCriterion$(BlockTrial) = "Incorrect"
        Close #6
        Close #1
    End If
End If
If joy.Top + joy.Height < Match2.Top + Match2.Height And joy.Left + joy.Width < Match2.Left + Match2.Width And joy.Left > Match2.Left And joy.Top > Match2.Top And Match2.Visible = True Then
    DMTSTimer.Enabled = False
    Match1.Visible = False
    Match2.Visible = False
    Sample.Visible = False
    Sample.Enabled = True
    joy.Visible = False
    joy.Left = 5880
    joy.Top = 7680
    BlockTrial = BlockTrial + 1
    If BlockTrial > DMTSTrial Then
        BlockTrial = 1
    End If
    If CorrectSide = "Right" Then
        If Form2.DMTSDelay.Text = "Titrate" Then
            DMTSTime = DMTSTime + 100
            DMTSTimer2.Interval = DMTSTime
        End If
        If Form2.Auditory.Text = "Yes" Then
            RetVal = PlaySound(App.Path + "\correct.wav", 0, 0)
        End If
        Print #1, " Correct"
        'Print #6, " Correct"
        DMTSCriterion$(BlockTrial) = "Correct"
        CorrectTrials = 0
        For w = 1 To DMTSTrial
            If DMTSCriterion$(w) = "Correct" Then
                CorrectTrials = CorrectTrials + 1
            End If
        Next w
        If CorrectTrials > DMTSCorrect - 1 Then
            For w2 = 0 To DMTSTrial
                DMTSCriterion$(w) = "Incorrect"
            Next w2
            DMTSFinished = "True"
        End If
        Pellet_Click
    Else:
        If Form2.DMTSDelay.Text = "Titrate" Then
            DMTSTime = DMTSTime - 100
            If DMTSTime < 100 Then
                DMTSTime = 100
            End If
            DMTSTimer2.Interval = DMTSTime
        End If
        If Form2.Auditory.Text = "Yes" Then
            RetVal = PlaySound(App.Path + "\incorrect.wav", 0, 0)
        End If
        Print #1, " Incorrect"
        'Print #6, " Incorrect"
        DMTSCriterion$(BlockTrial) = "Incorrect"
        DMTSTimeOut.Enabled = True
        DMTSCriterion$(BlockTrial) = "Incorrect"
    End If
    Close #6
    Close #1
End If

End Sub

Private Sub DMTSTimer2_Timer()

DMTSTimer2.Enabled = False
Sample_Click

End Sub

Private Sub FlashTimer_Timer()

FlashTimer.Enabled = False

If myJoy.dwXpos = CurrentXPos And myJoy.dwYpos = CurrentYPos Then
    ColorTimer.Enabled = True
Else:
    CurrentXPos = myJoy.dwXpos
    CurrentYPos = myJoy.dwYpos
    FlashTimer.Enabled = True
End If

End Sub

Private Sub Form_KeyPress(ascii As Integer)

If ascii = Asc("t") And TrialsLabel.Visible = False Then
    TrialsLabel.Visible = True
    TrialsNumber.Text = TotalTrialNumber
    TrialsNumber.Visible = True
Else:
    TrialsLabel.Visible = False
    TrialsNumber.Visible = False
End If

If ascii = Asc("q") Then
    This = MsgBox("Number of pellets consumed shown above.", vbOKOnly, PelletsDispensed)
    End
End If

End Sub
Private Sub Form_Load()

myJoy.dwSize = 64
myJoy.dwFlags = JOY_RETURNALL
R& = joyGetPosEx(JOYSTICKID1, myJoy)

StillX = myJoy.dwXpos
StillY = myJoy.dwYpos
NotMovedYet = "True"

TheSideTimeOutTime = Form2.TimeOutTime.Text
SideTimeOutTime = TheSideTimeOutTime

If Form2.Speed.Text = 1 Then
    JoySpeed = 200
    CircleSpeed = 50
End If
If Form2.Speed.Text = 2 Then
    JoySpeed = 800
    CircleSpeed = 20
End If

SetNumber = 1

FirstJoy = myJoy.dwXpos
SecondJoy = myJoy.dwYpos

PelletsNeeded = Form2.PelletsPerTrial.Text
FileName = Form2.ID.Text

Open App.Path + "\DataFiles\" + FileName + " Data.txt" For Append As 1

If Form2.SelectCheck3.Value = 1 Then
    Open App.Path + "\Today Select Order.txt" For Input As 21
    Do Until EOF(21)
        LineNumber = LineNumber + 1
        Line Input #21, YesterdayOrder$(LineNumber)
    Loop
End If

If Form2.SelectCheck.Value = 1 Then
    Open App.Path + "\DataFiles\" + FileName + " Select Order.txt" For Append As 20
    If Form2.SelectCheck3.Value <> 1 Then
        Open App.Path + "\DataFiles\" + FileName + " Today Select Order.txt" For Append As 21
    End If
    NewTask = "True"
    NextTrialSelect_Click
Else:
    NextTrialTrain_Click
End If

End Sub
Private Sub LS_Click()

Open App.Path + "\DataFiles\" + FileName + " LS Data.txt" For Append As 7

LSTrialNumber = LSTrialNumber + 1

Match1.Left = 240
Match1.Top = 240
Match2.Left = 8760
Match2.Top = 240

If Form2.SelectCheck.Value = 0 Then
    LSTrial = Form2.TrialsLS.Text
Else:
    TheChoiceTrials = Form2.SelectTrials.Text
    ChoiceTrials = TheChoiceTrials
    ChoiceTrialNumber = ChoiceTrialNumber + 1
    If ChoiceTrialNumber = ChoiceTrials Then
        ChoiceTrialNumber = 0
        NewTask = "True"
    End If
End If

LSCorrect2 = Form2.CorrectLS.Text
LSCorrect = Round(LSTrial * (LSCorrect2 / 100), 0)
LSOut = Form2.LSTimeOut.Text
LSTimeOut.Interval = LSOut * 1000
LSSetsCrit = Form2.SetsCriterion.Text
LSSets = LSSetsCrit

If LSNewSet = "True" Or LSTrialNumber = 1 Then
    LSNewSet = "False"
    File1.Path = App.Path
    File1.Path = App.Path + "\" + Form2.StimFolder.Text
    LSFile = File1.ListCount
    For n = 0 To LSFile - 1
        LSWord$(n) = File1.List(n)
    Next n

    Randomize
    RandomSampleNumber = Int(LSFile * Rnd)

DoagainLS:
    Randomize
    RandomMatchNumber = Int(LSFile * Rnd)

    If RandomMatchNumber = RandomSampleNumber Then
        GoTo DoagainLS
    End If
End If
    
Print #1, Date$; " "; Time$; " LS "; TotalTrialNumber; " "; SetNumber; " "; LSTrialNumber; " "; Form2.LSTimeOut.Text; " "; Left$(LSWord$(RandomSampleNumber), Len(LSWord$(RandomSampleNumber)) - 4);
'Print #7, Date$; " "; Time$; " "; SetNumber; " "; LSTrialNumber; " "; Form2.LSTimeOut.Text; " "; Left$(LSWord$(RandomSampleNumber), Len(LSWord$(RandomSampleNumber)) - 4);

Randomize
RanSide = Int(2 * Rnd)
If RanSide = 0 Then
    Match1.Picture = LoadPicture(App.Path + "\" + Form2.StimFolder.Text + "\" + LSWord$(RandomSampleNumber))
    CorrectSide = "Left"
    Print #1, " Left ";
    'Print #7, " Left ";
    Match2.Picture = LoadPicture(App.Path + "\" + Form2.StimFolder.Text + "\" + LSWord$(RandomMatchNumber))
    Print #1, Left$(LSWord$(RandomMatchNumber), Len(LSWord$(RandomMatchNumber)) - 4);
    'Print #7, Left$(LSWord$(RandomMatchNumber), Len(LSWord$(RandomMatchNumber)) - 4);
Else:
    Match2.Picture = LoadPicture(App.Path + "\" + Form2.StimFolder.Text + "\" + LSWord$(RandomSampleNumber))
    CorrectSide = "Right"
    Print #1, " Right ";
    'Print #7, " Right ";
    Match1.Picture = LoadPicture(App.Path + "\" + Form2.StimFolder.Text + "\" + LSWord$(RandomMatchNumber))
    Print #1, Left$(LSWord$(RandomMatchNumber), Len(LSWord$(RandomMatchNumber)) - 4);
    'Print #7, Left$(LSWord$(RandomMatchNumber), Len(LSWord$(RandomMatchNumber)) - 4);
End If

Match1.Visible = True
Match2.Visible = True
joy.Left = 5880
joy.Top = 7680
joy.Visible = True
t = Timer
LSTimer.Enabled = True

End Sub

Private Sub LSTimeOut_Timer()

LSTimeOut.Enabled = False
If Form2.SelectCheck.Value = 1 Then
    NextTrialSelect_Click
Else:
    NextTrialTrain_Click
End If

End Sub

Private Sub LSTimer_Timer()

myJoy.dwSize = 64
myJoy.dwFlags = JOY_RETURNALL

' Get the joystick coordinates.
R& = joyGetPosEx(JOYSTICKID1, myJoy)

' Check joystick coordinates.  If they are greater or less than the
' center coordinates, move the lines and command button in the
' appropriate direction and speed.

If MC = 0 Then
Call Makeconst
End If

If myJoy.dwXpos > ValX And joy.Left < 11550 Then
TheFirst = myJoy.dwXpos - ValX
 joy.Left = joy.Left + (TheFirst / JoySpeed)
End If
If myJoy.dwYpos > ValY And joy.Top < 8680 Then
TheSecond = myJoy.dwYpos - ValY
joy.Top = joy.Top + (TheSecond / JoySpeed)
End If
If myJoy.dwXpos < ValX And joy.Left > 0 Then
TheFirst = ValX - myJoy.dwXpos
joy.Left = joy.Left - (TheFirst / JoySpeed)
End If
If myJoy.dwYpos < ValY And joy.Top > 0 Then
TheSecond = ValY - myJoy.dwYpos
joy.Top = joy.Top - (TheSecond / JoySpeed)
End If

If joy.Top + joy.Height < Match1.Top + Match1.Height And joy.Left + joy.Width < Match1.Left + Match1.Width And joy.Left > Match1.Left And joy.Top > Match1.Top And Match1.Visible = True Then
    Print #1, " "; Round(Timer - t, 2);
    'Print #7, " "; Round(Timer - t, 2);
    Match1.Visible = False
    Match2.Visible = False
    joy.Visible = False
    LSTimer.Enabled = False
    joy.Left = 5880
    joy.Top = 7680
    LSBlockTrial = LSBlockTrial + 1
    If LSBlockTrial > LSTrial Then
        LSBlockTrial = 1
    End If
    If CorrectSide = "Left" Then
        If Form2.Auditory.Text = "Yes" Then
            RetVal = PlaySound(App.Path + "\correct.wav", 0, 0)
        End If
        Print #1, " Correct"
        'Print #7, " Correct"
        LSCriterion$(LSBlockTrial) = "Correct"
        If LSBlockTrial = LSTrial Then
            SetNumber = SetNumber + 1
            For w = 1 To LSTrial
                If LSCriterion$(w) = "Correct" Then
                    CorrectTrials = CorrectTrials + 1
                End If
            Next w
            If CorrectTrials > LSCorrect - 1 Then
                LSSetsCorrect = LSSetsCorrect + 1
                For w2 = 0 To LSTrial
                    LSCriterion$(w) = "Incorrect"
                Next w2
            Else:
                LSSetsCorrect = 0
            End If
            If LSSetsCorrect = LSSets Then
                LSFinished = "True"
            Else:
                LSNewSet = "True"
            End If
        End If
        Pellet_Click
    Else:
        If Form2.Auditory.Text = "Yes" Then
            RetVal = PlaySound(App.Path + "\incorrect.wav", 0, 0)
        End If
        Print #1, " Incorrect"
        'Print #7, " Incorrect"
        LSCriterion$(LSBlockTrial) = "Incorrect"
        LSTimeOut.Enabled = True
        LSCriterion$(LSBlockTrial) = "Incorrect"
        
        If LSBlockTrial = LSTrial Then
            SetNumber = SetNumber + 1
            For w = 1 To LSTrial
                If LSCriterion$(w) = "Correct" Then
                    CorrectTrials = CorrectTrials + 1
                End If
            Next w
            If CorrectTrials > LSCorrect - 1 Then
                LSSetsCorrect = LSSetsCorrect + 1
                For w2 = 0 To LSTrial
                    LSCriterion$(w) = "Incorrect"
                Next w2
            Else:
                LSSetsCorrect = 0
            End If
            If LSSetsCorrect = LSSets Then
                LSFinished = "True"
            Else:
                LSNewSet = "True"
            End If
        End If
    End If
    Close #7
    Close #1
End If

If joy.Top + joy.Height < Match2.Top + Match2.Height And joy.Left + joy.Width < Match2.Left + Match2.Width And joy.Left > Match2.Left And joy.Top > Match2.Top And Match2.Visible = True Then
    Print #1, " "; Round(Timer - t, 2);
    'Print #7, " "; Round(Timer - t, 2);
    Match1.Visible = False
    Match2.Visible = False
    joy.Visible = False
    LSTimer.Enabled = False
    joy.Left = 5880
    joy.Top = 7680
    LSBlockTrial = LSBlockTrial + 1
    If LSBlockTrial > LSTrial Then
        LSBlockTrial = 1
    End If
    If CorrectSide = "Right" Then
        If Form2.Auditory.Text = "Yes" Then
            RetVal = PlaySound(App.Path + "\correct.wav", 0, 0)
        End If
        Print #1, " Correct"
        'Print #7, " Correct"
        LSCriterion$(LSBlockTrial) = "Correct"
        If LSBlockTrial = LSTrial Then
            SetNumber = SetNumber + 1
            For w = 1 To LSTrial
                If LSCriterion$(w) = "Correct" Then
                    CorrectTrials = CorrectTrials + 1
                End If
            Next w
            If CorrectTrials > LSCorrect - 1 Then
                LSSetsCorrect = LSSetsCorrect + 1
                For w2 = 0 To LSTrial
                    LSCriterion$(w) = "Incorrect"
                Next w2
            Else:
                LSSetsCorrect = 0
            End If
            If LSSetsCorrect = LSSets Then
                LSFinished = "True"
            Else:
                LSNewSet = "True"
            End If
        End If
        Pellet_Click
    Else:
        If Form2.Auditory.Text = "Yes" Then
            RetVal = PlaySound(App.Path + "\correct.wav", 0, 0)
        End If
        Print #1, " Incorrect"
        'Print #7, " Incorrect"
        LSCriterion$(LSBlockTrial) = "Incorrect"
        LSTimeOut.Enabled = True
        LSCriterion$(LSBlockTrial) = "Incorrect"
        
        If LSBlockTrial = LSTrial Then
            SetNumber = SetNumber + 1
            For w = 1 To LSTrial
                If LSCriterion$(w) = "Correct" Then
                    CorrectTrials = CorrectTrials + 1
                End If
            Next w
            If CorrectTrials > LSCorrect - 1 Then
                LSSetsCorrect = LSSetsCorrect + 1
                For w2 = 0 To LSTrial
                    LSCriterion$(w) = "Incorrect"
                Next w2
            Else:
                LSSetsCorrect = 0
            End If
            If LSSetsCorrect = LSSets Then
                LSFinished = "True"
            Else:
                LSNewSet = "True"
            End If
        End If
    End If
    Close #7
    Close #1
End If

End Sub

Private Sub MTS_Click()

Open App.Path + "\DataFiles\" + FileName + " MTS Data.txt" For Append As 5

MTSTrialNumber = MTSTrialNumber + 1

If Form2.SelectCheck.Value = 0 Then
    MTSTrial = Form2.TrialsMTS.Text
Else:
    TheChoiceTrials = Form2.SelectTrials.Text
    ChoiceTrials = TheChoiceTrials
    ChoiceTrialNumber = ChoiceTrialNumber + 1
    If ChoiceTrialNumber = ChoiceTrials Then
        ChoiceTrialNumber = 0
        NewTask = "True"
    End If
End If

MTSCorrect2 = Form2.CorrectMTS.Text
MTSCorrect = Round(MTSTrial * (MTSCorrect2 / 100), 0)
MTSOut = Form2.MTSTimeOut.Text
MTSTimeOut.Interval = MTSOut * 1000

File1.Path = App.Path
File1.Path = App.Path + "\" + Form2.StimFolder.Text
MTSFile = File1.ListCount
For n = 0 To MTSFile - 1
    MTSWord$(n) = File1.List(n)
Next n

Randomize
RandomSampleNumber = Int(MTSFile * Rnd)

DoagainMTS:
Randomize
RandomMatchNumber = Int(MTSFile * Rnd)

If RandomMatchNumber = RandomSampleNumber Then
    GoTo DoagainMTS
End If

Sample.Picture = LoadPicture(App.Path + "\" + Form2.StimFolder.Text + "\" + MTSWord$(RandomSampleNumber))
Print #1, Date$; " "; Time$; " MTS "; TotalTrialNumber; " "; MTSTrialNumber; " "; Form2.MTSTimeOut.Text; " "; Left$(MTSWord$(RandomSampleNumber), Len(MTSWord$(RandomSampleNumber)) - 4);
'Print #5, Date$; " "; Time$; " "; MTSTrialNumber; " "; Form2.MTSTimeOut.Text; " "; Left$(MTSWord$(RandomSampleNumber), Len(MTSWord$(RandomSampleNumber)) - 4);

Randomize
RanSide = Int(2 * Rnd)
If RanSide = 0 Then
    Match1.Picture = LoadPicture(App.Path + "\" + Form2.StimFolder.Text + "\" + MTSWord$(RandomSampleNumber))
    CorrectSide = "Left"
    Print #1, " Left ";
    'Print #5, " Left ";
    Match2.Picture = LoadPicture(App.Path + "\" + Form2.StimFolder.Text + "\" + MTSWord$(RandomMatchNumber))
    Print #1, Left$(MTSWord$(RandomMatchNumber), Len(MTSWord$(RandomMatchNumber)) - 4);
    'Print #5, Left$(MTSWord$(RandomMatchNumber), Len(MTSWord$(RandomMatchNumber)) - 4);
Else:
    Match2.Picture = LoadPicture(App.Path + "\" + Form2.StimFolder.Text + "\" + MTSWord$(RandomSampleNumber))
    CorrectSide = "Right"
    Print #1, " Right ";
    'Print #5, " Right ";
    Match1.Picture = LoadPicture(App.Path + "\" + Form2.StimFolder.Text + "\" + MTSWord$(RandomMatchNumber))
    Print #1, Left$(MTSWord$(RandomMatchNumber), Len(MTSWord$(RandomMatchNumber)) - 4);
    'Print #5, Left$(MTSWord$(RandomMatchNumber), Len(MTSWord$(RandomMatchNumber)) - 4);
End If

ChooseMatchLocation1 = Int(6 * Rnd)
    
If ChooseMatchLocation1 = 0 Then
    Match1.Left = 240
    Match1.Top = 240
    Match2.Left = 8760
    Match2.Top = 240
End If
If ChooseMatchLocation1 = 1 Then
    Match1.Left = 240
    Match1.Top = 240
    Match2.Left = 8760
    Match2.Top = 6000
End If
If ChooseMatchLocation1 = 2 Then
    Match1.Left = 240
    Match1.Top = 240
    Match2.Left = 240
    Match2.Top = 6000
End If
If ChooseMatchLocation1 = 3 Then
    Match1.Left = 8760
    Match1.Top = 240
    Match2.Left = 8760
    Match2.Top = 6000
End If
If ChooseMatchLocation1 = 4 Then
    Match1.Left = 8760
    Match1.Top = 240
    Match2.Left = 240
    Match2.Top = 6000
End If
If ChooseMatchLocation1 = 5 Then
    Match1.Left = 8760
    Match1.Top = 6000
    Match2.Left = 240
    Match2.Top = 6000
End If

Sample.Visible = True
joy.Left = 5880
joy.Top = 7680
joy.Visible = True
MTSTimer.Enabled = True

End Sub

Private Sub MTSTimeOut_Timer()

MTSTimeOut.Enabled = False
If Form2.SelectCheck.Value = 1 Then
    NextTrialSelect_Click
Else:
    NextTrialTrain_Click
End If

End Sub

Private Sub MTSTimer_Timer()

myJoy.dwSize = 64
myJoy.dwFlags = JOY_RETURNALL

' Get the joystick coordinates.
R& = joyGetPosEx(JOYSTICKID1, myJoy)

' Check joystick coordinates.  If they are greater or less than the
' center coordinates, move the lines and command button in the
' appropriate direction and speed.

If MC = 0 Then
Call Makeconst
End If

If myJoy.dwYpos > ValY And joy.Top < 8680 Then
    TheSecond = myJoy.dwYpos - ValY
    joy.Top = joy.Top + (TheSecond / JoySpeed)
End If
If myJoy.dwYpos < ValY And joy.Top > 0 Then
    TheSecond = ValY - myJoy.dwYpos
    joy.Top = joy.Top - (TheSecond / JoySpeed)
End If
If myJoy.dwXpos > ValX And joy.Left < 11550 Then
    TheFirst = myJoy.dwXpos - ValX
    joy.Left = joy.Left + (TheFirst / JoySpeed)
End If
If myJoy.dwXpos < ValX And joy.Left > 0 Then
    TheFirst = ValX - myJoy.dwXpos
    joy.Left = joy.Left - (TheFirst / JoySpeed)
End If

If joy.Top + joy.Height < Sample.Top + Sample.Height And joy.Left + joy.Width < Sample.Left + Sample.Width And joy.Left > Sample.Left And joy.Top > Sample.Top And Sample.Visible = True And Sample.Enabled = True Then
    MTSTimer.Enabled = False
    WhichSample = "MTS"
    joy.Visible = False
    joy.Top = 5040
    joy.Left = 6000
    Sample.Enabled = False
    Sample_Click
End If

If joy.Top + joy.Height < Match1.Top + Match1.Height And joy.Left + joy.Width < Match1.Left + Match1.Width And joy.Left > Match1.Left And joy.Top > Match1.Top And Match1.Visible = True Then
    MTSTimer.Enabled = False
    Match1.Visible = False
    Match2.Visible = False
    Sample.Visible = False
    Sample.Enabled = True
    joy.Visible = False
    joy.Left = 5880
    joy.Top = 7680
    BlockTrial = BlockTrial + 1
    If BlockTrial > MTSTrial Then
        BlockTrial = 1
    End If
    If CorrectSide = "Left" Then
        If Form2.Auditory.Text = "Yes" Then
            RetVal = PlaySound(App.Path + "\correct.wav", 0, 0)
        End If
        Print #1, " Correct"
        'Print #5, " Correct"
        MTSCriterion$(BlockTrial) = "Correct"
        For w = 1 To MTSTrial
            If MTSCriterion$(w) = "Correct" Then
                CorrectTrials = CorrectTrials + 1
            End If
        Next w
        If CorrectTrials > MTSCorrect - 1 Then
            For w2 = 0 To MTSTrial
                MTSCriterion$(w) = "Incorrect"
            Next w2
            MTSFinished = "True"
        End If
        Pellet_Click
    Else:
        If Form2.Auditory.Text = "Yes" Then
            RetVal = PlaySound(App.Path + "\incorrect.wav", 0, 0)
        End If
        Print #1, " Incorrect"
        'Print #5, " Incorrect"
        MTSCriterion$(BlockTrial) = "Incorrect"
        MTSTimeOut.Enabled = True
        MTSCriterion$(BlockTrial) = "Incorrect"
    End If
    Close #5
    Close #1
End If

If joy.Top + joy.Height < Match2.Top + Match2.Height And joy.Left + joy.Width < Match2.Left + Match2.Width And joy.Left > Match2.Left And joy.Top > Match2.Top And Match2.Visible = True Then
    MTSTimer.Enabled = False
    Match1.Visible = False
    Match2.Visible = False
    Sample.Visible = False
    Sample.Enabled = True
    joy.Visible = False
    joy.Left = 5880
    joy.Top = 7680
    BlockTrial = BlockTrial + 1
    If BlockTrial > MTSTrial Then
        BlockTrial = 1
    End If
    If CorrectSide = "Right" Then
        If Form2.Auditory.Text = "Yes" Then
            RetVal = PlaySound(App.Path + "\correct.wav", 0, 0)
        End If
        Print #1, " Correct"
        'Print #5, " Correct"
        MTSCriterion$(BlockTrial) = "Correct"
        For w = 1 To MTSTrial
            If MTSCriterion$(w) = "Correct" Then
                CorrectTrials = CorrectTrials + 1
            End If
        Next w
        If CorrectTrials > MTSCorrect - 1 Then
            For w2 = 0 To MTSTrial
                MTSCriterion$(w) = "Incorrect"
            Next w2
            MTSFinished = "True"
        End If
        Pellet_Click
    Else:
        If Form2.Auditory.Text = "Yes" Then
            RetVal = PlaySound(App.Path + "\incorrect.wav", 0, 0)
        End If
        Print #1, " Incorrect"
        'Print #5, " Incorrect"
        MTSCriterion$(BlockTrial) = "Incorrect"
        MTSTimeOut.Enabled = True
        MTSCriterion$(BlockTrial) = "Incorrect"
    End If
    Close #5
    Close #1
End If

End Sub

Private Sub NextTrialSelect_Click()

Close #1
Open App.Path + "\DataFiles\" + FileName + " Data.txt" For Append As 1

TotalTrialNumber = TotalTrialNumber + 1

If NewTask = "True" Then
    NewTask = "False"
    If SelectChoice(0).Enabled = False And SelectChoice(1).Enabled = False And SelectChoice(2).Enabled = False And SelectChoice(3).Enabled = False And SelectChoice(4).Enabled = False And SelectChoice(5).Enabled = False Then
        If TotalTrialNumber > 1 Then
            Print #20,
        End If
        If Form2.SideCheck.Value = 1 Then
DoagainSide:
            Randomize
            Spot1 = Int(Rnd * 6)
            If SelectChoice(Spot1).Visible = True Then
                GoTo DoagainSide
            Else:
                SelectChoice(Spot1).Picture = LoadPicture(App.Path + "\Side.bmp")
                SelectChoice(Spot1).Visible = True
                SelectChoice(Spot1).Enabled = True
                TheChoice$(Spot1) = "Side"
            End If
        End If
        If Form2.ChaseCheck.Value = 1 Then
DoagainChase:
            Randomize
            Spot2 = Int(Rnd * 6)
            If SelectChoice(Spot2).Visible = True Then
                GoTo DoagainChase
            Else:
                SelectChoice(Spot2).Picture = LoadPicture(App.Path + "\Chase.bmp")
                SelectChoice(Spot2).Visible = True
                SelectChoice(Spot2).Enabled = True
                TheChoice$(Spot2) = "Chase"
            End If
        End If
        If Form2.PursuitCheck.Value = 1 Then
DoagainPursuit:
            Randomize
            Spot3 = Int(Rnd * 6)
            If SelectChoice(Spot3).Visible = True Then
                GoTo DoagainPursuit
            Else:
                SelectChoice(Spot3).Picture = LoadPicture(App.Path + "\Pursuit.bmp")
                SelectChoice(Spot3).Visible = True
                SelectChoice(Spot3).Enabled = True
                TheChoice$(Spot3) = "Pursuit"
            End If
        End If
        If Form2.MTSCheck.Value = 1 Then
DoagainMTS:
            Randomize
            Spot4 = Int(Rnd * 6)
            If SelectChoice(Spot4).Visible = True Then
                GoTo DoagainMTS
            Else:
                SelectChoice(Spot4).Picture = LoadPicture(App.Path + "\MTS.bmp")
                SelectChoice(Spot4).Visible = True
                SelectChoice(Spot4).Enabled = True
                TheChoice$(Spot4) = "MTS"
            End If
        End If
        If Form2.DMTSCheck.Value = 1 Then
DoagainDMTS:
            Randomize
            Spot5 = Int(Rnd * 6)
            If SelectChoice(Spot5).Visible = True Then
                GoTo DoagainDMTS
            Else:
                SelectChoice(Spot5).Picture = LoadPicture(App.Path + "\DMTS.bmp")
                SelectChoice(Spot5).Visible = True
                SelectChoice(Spot5).Enabled = True
                TheChoice$(Spot5) = "DMTS"
            End If
        End If
        If Form2.LSCheck.Value = 1 Then
DoagainLS:
            Randomize
            Spot6 = Int(Rnd * 6)
            If SelectChoice(Spot6).Visible = True Then
                GoTo DoagainLS
            Else:
                SelectChoice(Spot6).Picture = LoadPicture(App.Path + "\LS.bmp")
                SelectChoice(Spot6).Visible = True
                SelectChoice(Spot6).Enabled = True
                TheChoice$(Spot6) = "LS"
            End If
        End If
    End If
    SelectChoice(0).Visible = True
    SelectChoice(1).Visible = True
    SelectChoice(2).Visible = True
    SelectChoice(3).Visible = True
    SelectChoice(4).Visible = True
    SelectChoice(5).Visible = True
    If Form2.SelectCheck2.Value = 0 Then
        joy.Visible = True
        SelectTimer.Enabled = True
    End If
    If Form2.SelectCheck2.Value = 1 Then
doagain47:
        Randomize
        AutoChoose = Int(Rnd * 6)
        If SelectChoice(AutoChoose).Enabled = True Then
            SelectChoice(AutoChoose).Enabled = False
            SelectChoice(AutoChoose).Picture = LoadPicture
            For b = 0 To 5
                SelectChoice(b).Visible = False
            Next b
            If TheChoice$(AutoChoose) = "Side" Then
                Side_Click
                CurrentTask = "Side"
            End If
            If TheChoice$(AutoChoose) = "Chase" Then
                Chase_Click
                CurrentTask = "Chase"
            End If
            If TheChoice$(AutoChoose) = "Pursuit" Then
                Pursuit_Click
                CurrentTask = "Pursuit"
            End If
            If TheChoice$(AutoChoose) = "MTS" Then
                MTS_Click
                CurrentTask = "MTS"
            End If
            If TheChoice$(AutoChoose) = "DMTS" Then
                DMTS_Click
                CurrentTask = "DMTS"
            End If
            If TheChoice$(AutoChoose) = "LS" Then
                LS_Click
                CurrentTask = "LS"
            End If
            If Form2.SelectCheck.Value = 1 Then
                Print #20, CurrentTask,
                Print #21, CurrentTask
            End If
        Else:
            GoTo doagain47
        End If
    End If
    If Form2.SelectCheck3.Value = 1 Then
        For b = 0 To 5
            SelectChoice(b).Visible = False
        Next b
        SelectChoiceNumber = SelectChoiceNumber + 1
        If YesterdayOrder$(SelectChoiceNumber) = "" Then
            End
        End If
        If YesterdayOrder$(SelectChoiceNumber) = "Side" Then
            Side_Click
            CurrentTask = "Side"
        End If
        If YesterdayOrder$(SelectChoiceNumber) = "Chase" Then
            Chase_Click
            CurrentTask = "Chase"
        End If
        If YesterdayOrder$(SelectChoiceNumber) = "Pursuit" Then
            Pursuit_Click
            CurrentTask = "Pursuit"
        End If
        If YesterdayOrder$(SelectChoiceNumber) = "MTS" Then
            MTS_Click
            CurrentTask = "MTS"
        End If
        If YesterdayOrder$(SelectChoiceNumber) = "DMTS" Then
            DMTS_Click
            CurrentTask = "DMTS"
        End If
        If YesterdayOrder$(SelectChoiceNumber) = "LS" Then
            LS_Click
            CurrentTask = "LS"
        End If
        If Form2.SelectCheck.Value = 1 Then
            Print #20, CurrentTask,
        End If
    End If
Else:
    If CurrentTask = "Side" Then
        Side_Click
    End If
    If CurrentTask = "Chase" Then
        Chase_Click
    End If
    If CurrentTask = "Pursuit" Then
        Pursuit_Click
    End If
    If CurrentTask = "MTS" Then
        MTS_Click
    End If
    If CurrentTask = "DMTS" Then
        DMTS_Click
    End If
    If CurrentTask = "LS" Then
        LS_Click
    End If
End If

End Sub

Private Sub NextTrialTrain_Click()

Close #1
Open App.Path + "\DataFiles\" + FileName + " Data.txt" For Append As 1

TotalTrialNumber = TotalTrialNumber + 1

If Form2.SideCheck.Value = 0 Then
    SideFinished = "True"
End If
If Form2.ChaseCheck.Value = 0 Then
    ChaseFinished = "True"
End If
If Form2.PursuitCheck.Value = 0 Then
    PursuitFinished = "True"
End If
If Form2.MTSCheck.Value = 0 Then
    MTSFinished = "True"
End If
If Form2.DMTSCheck.Value = 0 Then
    DMTSFinished = "True"
End If
If Form2.LSCheck.Value = 0 Then
    LSFinished = "True"
End If

If SideFinished <> "True" And Form2.SideCheck.Value = 1 Then
    Side_Click
Else:
    If ChaseFinished <> "True" And Form2.ChaseCheck.Value = 1 Then
        Chase_Click
    Else:
        If PursuitFinished <> "True" And Form2.PursuitCheck.Value = 1 Then
            Pursuit_Click
        Else:
            If MTSFinished <> "True" And Form2.MTSCheck.Value = 1 Then
                MTS_Click
            Else:
                If DMTSFinished <> "True" And Form2.DMTSCheck.Value = 1 Then
                    DMTS_Click
                Else:
                    If LSFinished <> "True" And Form2.LSCheck.Value = 1 Then
                        LS_Click
                    Else:
                        Debug.Print "Yep"
                        End
                    End If
                End If
            End If
        End If
    End If
End If

End Sub

Private Sub Pellet_Click()

joy.Visible = False
joy.Top = 6600
joy.Left = 6120

PelletsGiven = PelletsGiven + 1
PelletsDispensed = PelletsDispensed + 1
Dim RetVal
RetVal = Shell("C:\Pellet.EXE")
Timer4.Enabled = True
    
End Sub

Private Sub Pursuit_Click()

Close #4
Open App.Path + "\DataFiles\" + FileName + " Pursuit Data.txt" For Append As 4

PursuitTrialNumber = PursuitTrialNumber + 1

If Form2.PursuitTime.Text <> "Random" Then
    PursuitTime = Form2.PursuitTime.Text
Else:
    Randomize
    PursuitTime = Int(Rnd * 20 + 1)
End If

PursuitTimer2.Interval = PursuitTime * 1000

ResponsePursuit = Form2.ResponsePursuit.Text
If Form2.SelectCheck.Value = 0 Then
    PursuitCorrectNeeded = Form2.TrialsPursuit.Text
Else:
    TheChoiceTrials = Form2.SelectTrials.Text
    ChoiceTrials = TheChoiceTrials
    ChoiceTrialNumber = ChoiceTrialNumber + 1
    If ChoiceTrialNumber = ChoiceTrials Then
        ChoiceTrialNumber = 0
        NewTask = "True"
    End If
End If

If Form2.SizePursuit.Text = "Small" Then
    ChaseCircle.Height = 975
    ChaseCircle.Width = 975
End If
If Form2.SizePursuit.Text = "Medium" Then
    ChaseCircle.Height = 1335
    ChaseCircle.Width = 1335
End If
If Form2.SizePursuit.Text = "Large" Then
    ChaseCircle.Height = 2055
    ChaseCircle.Width = 2055
End If

Randomize
ChaseCircle.Left = Int((SysInfo1.WorkAreaWidth - (ChaseCircle.Width * 2)) * Rnd)
ChaseCircle.Top = Int((SysInfo1.WorkAreaHeight - (ChaseCircle.Height * 2)) * Rnd)

LeftDirection = CircleSpeed
TopDirection = CircleSpeed

Print #1, Date$; " "; Time$; " Pursuit "; TotalTrialNumber; " "; PursuitTrialNumber; " "; Form2.SizePursuit.Text;
'Print #4, Date$; " "; Time$; " "; PursuitTrialNumber; " "; Form2.SizePursuit.Text;

Randomize
joy.Left = Int((SysInfo1.WorkAreaWidth - (joy.Width * 2)) * Rnd)
joy.Top = Int((SysInfo1.WorkAreaHeight - (joy.Height * 2)) * Rnd)
ChaseCircle.Visible = True
joy.Visible = True

DoagainPursuit:

myJoy.dwSize = 64
myJoy.dwFlags = JOY_RETURNALL

R& = joyGetPosEx(JOYSTICKID1, myJoy)

If myJoy.dwXpos = StillX And myJoy.dwYpos = StillY Then
    PursuitTimer.Enabled = True
Else:
    GoTo DoagainPursuit
End If

End Sub

Private Sub PursuitTimer_Timer()

myJoy.dwSize = 64
myJoy.dwFlags = JOY_RETURNALL

' Get the joystick coordinates.
R& = joyGetPosEx(JOYSTICKID1, myJoy)

If myJoy.dwXpos = FirstJoy And myJoy.dwYpos = SecondJoy And ChaseCircle.FillColor = &HFF00& Then
    Timer3.Enabled = False
Else:
    Timer3.Enabled = True
End If

If MC = 0 Then
Call Makeconst
End If

If myJoy.dwXpos > ValX And joy.Left < 11550 Then
    TimeOutTimer2.Enabled = False
    If NotMovedYet = "True" Then
        NotMovedYet = "False"
        TrialTimer2 = Timer
    End If
    TheFirst = myJoy.dwXpos - ValX
    joy.Left = joy.Left + (TheFirst / JoySpeed)
End If
If myJoy.dwYpos > ValY And joy.Top < 8680 Then
    TimeOutTimer2.Enabled = False
    If NotMovedYet = "True" Then
        NotMovedYet = "False"
        TrialTimer2 = Timer
    End If
    TheSecond = myJoy.dwYpos - ValY
    joy.Top = joy.Top + (TheSecond / JoySpeed)
End If
If myJoy.dwXpos < ValX And joy.Left > 0 Then
    TimeOutTimer2.Enabled = False
    If NotMovedYet = "True" Then
        NotMovedYet = "False"
        TrialTimer2 = Timer
    End If
    TheFirst = ValX - myJoy.dwXpos
    joy.Left = joy.Left - (TheFirst / JoySpeed)
End If
If myJoy.dwYpos < ValY And joy.Top > 0 Then
    TimeOutTimer2.Enabled = False
    If NotMovedYet = "True" Then
        NotMovedYet = "False"
        TrialTimer2 = Timer
    End If
    TheSecond = ValY - myJoy.dwYpos
    joy.Top = joy.Top - (TheSecond / JoySpeed)
End If

If joy.Top + joy.Height < ChaseCircle.Top + ChaseCircle.Height And joy.Left + joy.Width < ChaseCircle.Left + ChaseCircle.Width And joy.Left > ChaseCircle.Left And joy.Top > ChaseCircle.Top And ChaseCircle.Visible = True Then
    ChaseCircle.FillColor = &HFFFFFF
    PursuitTimer2.Enabled = True
    IsPrimed = "True"
Else:
    ChaseCircle.FillColor = &HFF00&
    PursuitTimer2.Enabled = False
    If IsPrimed = "True" Then
        Contacts = Contacts + 1
        IsPrimed = "False"
    End If
End If

End Sub

Private Sub PursuitTimer2_Timer()

PursuitTimer.Enabled = False
PursuitTimer2.Enabled = False
TimeOutTimer2.Enabled = False
Timer3.Enabled = False
NotMovedYet = "True"
IsPrimed = "False"
ResponseTime = ResponseTime + (Timer - TrialTimer2)
ThePursuitTime = Round(ResponseTime, 2)
Print #1, " "; PursuitTime; " "; Contacts; " "; ThePursuitTime
'Print #4, " "; PursuitTime; " "; Contacts; " "; ThePursuitTime
'Close #4
ResponseTime = 0
TrialTimer2 = 0
ChaseCircle.Visible = False
joy.Visible = False
joy.Left = 6000
joy.Top = 4320
If ThePursuitTime < ResponsePursuit Or ResponsePursuit = 0 Then
    PursuitTrialsCorrect = PursuitTrialsCorrect + 1
    PursuitErrors = 0
Else:
    PursuitErrors = PursuitErrors + 1
    PursuitTrialsCorrect = 0
End If
ErrorsMade = Form2.TrialsPursuit.Text
If PursuitErrors = ErrorsMade Then
    PursuitErrors = 0
    If Form2.TitrateSizePursuit.Text = "Yes" Then
        If Form2.SizePursuit.Text = "Medium" Then
            Form2.SizePursuit.Text = "Large"
        End If
        If Form2.SizePursuit.Text = "Small" Then
            Form2.SizePursuit.Text = "Medium"
        End If
    End If
End If
If PursuitTrialsCorrect = PursuitCorrectNeeded Then
    PursuitTrialsCorrect = 0
    If Form2.TitrateSizePursuit.Text = "Yes" Then
        If Form2.SizePursuit.Text = "Small" Then
            SizePursuitFinished = "True"
        End If
        If Form2.SizePursuit.Text = "Medium" Then
            Form2.SizePursuit.Text = "Small"
        End If
        If Form2.SizePursuit.Text = "Large" Then
            Form2.SizePursuit.Text = "Medium"
        End If
    Else:
        PursuitFinished = "True"
    End If
End If

If Form2.Auditory.Text = "Yes" Then
    RetVal = PlaySound(App.Path + "\correct.wav", 0, 0)
End If

Contacts = 0
Pellet_Click
    
End Sub

Private Sub Sample_Click()

Match1.Visible = True
Match2.Visible = True
joy.Visible = True

If WhichSample = "MTS" Then
    MTSTimer.Enabled = True
Else
    DMTSTimer.Enabled = True
End If

End Sub

Private Sub SelectTimer_Timer()

myJoy.dwSize = 64
myJoy.dwFlags = JOY_RETURNALL

' Get the joystick coordinates.
R& = joyGetPosEx(JOYSTICKID1, myJoy)

' Check joystick coordinates.  If they are greater or less than the
' center coordinates, move the lines and command button in the
' appropriate direction and speed.

If MC = 0 Then
Call Makeconst
End If

If myJoy.dwXpos > ValX And joy.Left < 11550 Then
TheFirst = myJoy.dwXpos - ValX
 joy.Left = joy.Left + (TheFirst / JoySpeed)
End If
If myJoy.dwYpos > ValY And joy.Top < 8680 Then
TheSecond = myJoy.dwYpos - ValY
joy.Top = joy.Top + (TheSecond / JoySpeed)
End If
If myJoy.dwXpos < ValX And joy.Left > 0 Then
TheFirst = ValX - myJoy.dwXpos
joy.Left = joy.Left - (TheFirst / JoySpeed)
End If
If myJoy.dwYpos < ValY And joy.Top > 0 Then
TheSecond = ValY - myJoy.dwYpos
joy.Top = joy.Top - (TheSecond / JoySpeed)
End If

For A = 0 To 5
    If joy.Top + joy.Height < SelectChoice(A).Top + SelectChoice(A).Height And joy.Left + joy.Width < SelectChoice(A).Left + SelectChoice(A).Width And joy.Left > SelectChoice(A).Left And joy.Top > SelectChoice(A).Top And SelectChoice(A).Visible = True And SelectChoice(A).Enabled = True Then
        joy.Visible = False
        joy.Left = 5880
        joy.Top = 4800
        SelectTimer.Enabled = False
        SelectChoice(A).Enabled = False
        SelectChoice(A).Picture = LoadPicture
        For b = 0 To 5
            SelectChoice(b).Visible = False
        Next b
        If TheChoice$(A) = "Side" Then
            Side_Click
            CurrentTask = "Side"
        End If
        If TheChoice$(A) = "Chase" Then
            Chase_Click
            CurrentTask = "Chase"
        End If
        If TheChoice$(A) = "Pursuit" Then
            Pursuit_Click
            CurrentTask = "Pursuit"
        End If
        If TheChoice$(A) = "MTS" Then
            MTS_Click
            CurrentTask = "MTS"
        End If
        If TheChoice$(A) = "DMTS" Then
            DMTS_Click
            CurrentTask = "DMTS"
        End If
        If TheChoice$(A) = "LS" Then
            LS_Click
            CurrentTask = "LS"
        End If
        If Form2.SelectCheck.Value = 1 Then
            Print #20, CurrentTask,
            Print #21, CurrentTask
        End If
    End If
Next A

End Sub

Private Sub ShowTrial_Click()

ShowTrialNumber.Caption = TrialNumber
WordTrial.Visible = True
ShowTrialNumber.Visible = True
Timer3.Enabled = True

End Sub

Private Sub Side_Click()

SideStim(0).Visible = False
SideStim(1).Visible = False
SideStim(2).Visible = False
SideStim(3).Visible = False

Close #2
Open App.Path + "\DataFiles\" + FileName + " Side Data.txt" For Append As 2

SideTrialNumber = SideTrialNumber + 1

If SideTrialNumber = 1 Then
    If Form2.SideStartLevel.Text = " 1" Or Form2.SideStartLevel.Text = "1" Then
        SideLevel = 1
    End If
    If Form2.SideStartLevel.Text = " 2" Or Form2.SideStartLevel.Text = "2" Then
        SideLevel = 2
    End If
    If Form2.SideStartLevel.Text = " 3" Or Form2.SideStartLevel.Text = "3" Then
        SideLevel = 3
    End If
    If Form2.SideStartLevel.Text = " 4" Or Form2.SideStartLevel.Text = "4" Then
        SideLevel = 4
    End If
    If Form2.SideStartLevel.Text = " 5" Or Form2.SideStartLevel.Text = "5" Then
        SideLevel = 5
    End If
    If Form2.SideStartLevel.Text = " 6" Or Form2.SideStartLevel.Text = "6" Then
        SideLevel = 6
    End If
    If Form2.SideStartLevel.Text = " 7" Or Form2.SideStartLevel.Text = "7" Then
        SideLevel = 7
    End If
End If

If Form2.SelectCheck.Value = 0 Then
    SideCorrectNeeded = Form2.TrialsSide.Text
    ResponseSide = Form2.ResponseSide.Text
Else:
    SideCorrectNeeded = 0
    TheChoiceTrials = Form2.SelectTrials.Text
    ChoiceTrials = TheChoiceTrials
    ChoiceTrialNumber = ChoiceTrialNumber + 1
    If ChoiceTrialNumber = ChoiceTrials Then
        ChoiceTrialNumber = 0
        NewTask = "True"
    End If
End If

If SideLevel = 1 Then
    SideStim(0).Height = 4100
    SideStim(1).Width = 5600
    SideStim(1).Left = 6400
    SideStim(3).Height = 4100
    SideStim(3).Top = 4900
    SideStim(2).Width = 5600
Else:
    SideStim(0).Height = 1935
    SideStim(1).Width = 1935
    SideStim(1).Left = 10080
    SideStim(3).Height = 1935
    SideStim(3).Top = 7080
    SideStim(2).Width = 1935
End If
If SideLevel = 1 Then
    SideStim(0).Visible = True
    SideStim(1).Visible = True
    SideStim(2).Visible = True
    SideStim(3).Visible = True
    WhatWalls = "TRBL"
End If
If SideLevel = 2 Then
    SideStim(0).Visible = True
    SideStim(1).Visible = True
    SideStim(2).Visible = True
    SideStim(3).Visible = True
    WhatWalls = "TRBL"
End If
If SideLevel = 3 Then
    Randomize
    NotShown = Int(3 * Rnd)
    SideStim(0).Visible = True
    SideStim(1).Visible = True
    SideStim(2).Visible = True
    SideStim(3).Visible = True
    If NotShown = 0 Then
        WhatWalls = "RBL"
    End If
    If NotShown = 1 Then
        WhatWalls = "BLT"
    End If
    If NotShown = 2 Then
        WhatWalls = "LTR"
    End If
    If NotShown = 3 Then
        WhatWalls = "TRB"
    End If
    SideStim(NotShown).Visible = False
End If
If SideLevel = 4 Then
    Randomize
    NotShown = Int(4 * Rnd)
Doagain:
    Randomize
    NotShown2 = Int(4 * Rnd)
    If NotShown2 = NotShown Then
        GoTo Doagain
    End If
    SideStim(0).Visible = True
    SideStim(1).Visible = True
    SideStim(2).Visible = True
    SideStim(3).Visible = True
    SideStim(NotShown).Visible = False
    SideStim(NotShown2).Visible = False
    If NotShown = 0 Then
        If NotShown2 = 1 Then
            WhatWalls = "BL"
        End If
        If NotShown2 = 2 Then
            WhatWalls = "RL"
        End If
        If NotShown2 = 3 Then
            WhatWalls = "RB"
        End If
    End If
    If NotShown = 1 Then
        If NotShown2 = 0 Then
            WhatWalls = "BL"
        End If
        If NotShown2 = 2 Then
            WhatWalls = "LT"
        End If
        If NotShown2 = 3 Then
            WhatWalls = "TB"
        End If
    End If
    If NotShown = 2 Then
        If NotShown2 = 0 Then
            WhatWalls = "RL"
        End If
        If NotShown2 = 1 Then
            WhatWalls = "LT"
        End If
        If NotShown2 = 3 Then
            WhatWalls = "RT"
        End If
    End If
    If NotShown = 3 Then
        If NotShown2 = 0 Then
            WhatWalls = "RB"
        End If
        If NotShown2 = 1 Then
            WhatWalls = "TB"
        End If
        If NotShown2 = 2 Then
            WhatWalls = "RT"
        End If
    End If
End If
If SideLevel = 5 Then
    Randomize
    Shown = Int(4 * Rnd)
    SideStim(Shown).Visible = True
    WhatWalls = Shown
End If
If SideLevel = 6 Then
    Randomize
    Shown = Int(3 * Rnd)
    WhatWalls = Shown
    If Shown = 0 Or Shown = 3 Then
        Randomize
        TheLeft = Int(Rnd * (SysInfo1.WorkAreaWidth / 2))
        SideStim(Shown).Width = SysInfo1.WorkAreaWidth / 2
        SideStim(Shown).Left = TheLeft
    End If
    If Shown = 1 Or Shown = 2 Then
        Randomize
        TheTop = Int(Rnd * (SysInfo1.WorkAreaHeight / 2))
        SideStim(Shown).Height = SysInfo1.WorkAreaHeight / 2
        SideStim(Shown).Top = TheTop
    End If
    SideStim(Shown).Visible = True
End If
If SideLevel = 7 Then
    Randomize
    Shown = Int(3 * Rnd)
    WhatWalls = Shown
    If Shown = 0 Or Shown = 3 Then
        Randomize
        TheLeft = Int(Rnd * (SysInfo1.WorkAreaWidth - (SysInfo1.WorkAreaWidth / 4)))
        SideStim(Shown).Width = SysInfo1.WorkAreaWidth / 4
        SideStim(Shown).Left = TheLeft
    End If
    If Shown = 1 Or Shown = 2 Then
        Randomize
        TheTop = Int(Rnd * (SysInfo1.WorkAreaHeight - (SysInfo1.WorkAreaHeight / 4)))
        SideStim(Shown).Height = SysInfo1.WorkAreaHeight / 4
        SideStim(Shown).Top = TheTop
    End If
    SideStim(Shown).Visible = True
End If

Print #1, Date$; " "; Time$; " Side "; TotalTrialNumber; " "; SideTrialNumber; " "; SideLevel; " "; WhatWalls;
'Print #2, Date$; " "; Time$; " "; SideTrialNumber; " "; SideLevel; " "; WhatWalls;

joy.Top = 4375
joy.Left = 5875
joy.Visible = True

DoagainSide:

myJoy.dwSize = 64
myJoy.dwFlags = JOY_RETURNALL

R& = joyGetPosEx(JOYSTICKID1, myJoy)

If myJoy.dwXpos = StillX And myJoy.dwYpos = StillY Then
    SideTimer.Enabled = True
    CurrentXPos = StillX
    CurrentYPos = StillY
    Timer2.Enabled = True
Else:
    GoTo DoagainSide
End If

End Sub

Private Sub SideTimeOut_Timer()

SideTimeOut.Enabled = False
If Form2.SelectCheck.Value = 1 Then
    NextTrialSelect_Click
Else:
    NextTrialTrain_Click
End If
    
End Sub

Private Sub SideTimeOutTimer_Timer()

If Timer - SideTime > SideTimeOutTime Then
    SideTimeOutTimer.Enabled = False
    SideTimer.Enabled = False
    NotMovedYet = "True"
    ResponseTime = 0
    Print #1, " "; "TO"
    'Print #2, " "; "TO"
    SideTrialsCorrect = 0
    TrialTimer = 0
    For b = 0 To 3
        SideStim(b).Visible = False
    Next b
    joy.Visible = False
    joy.Left = 6000
    joy.Top = 4320
    LastSideCorrect = "False"
    If Form2.TitrateSizeSide.Text = "Yes" Then
        If SideLevel = 2 Then
            SideLevel = 1
        End If
        If SideLevel = 3 Then
            SideLevel = 2
        End If
        If SideLevel = 4 Then
            SideLevel = 3
        End If
        If SideLevel = 5 Then
            SideLevel = 4
        End If
        If SideLevel = 6 Then
            SideLevel = 5
        End If
        If SideLevel = 7 Then
            SideLevel = 6
        End If
    End If
    SideTimeOut.Enabled = True
End If
 
End Sub

Private Sub SideTimer_Timer()

myJoy.dwSize = 64
myJoy.dwFlags = JOY_RETURNALL

' Get the joystick coordinates.
R& = joyGetPosEx(JOYSTICKID1, myJoy)

' Check joystick coordinates.  If they are greater or less than the
' center coordinates, move the lines and command button in the
' appropriate direction and speed.

If MC = 0 Then
Call Makeconst
End If

If myJoy.dwXpos > ValX And joy.Left < 11550 Then
    If NotMovedYet = "True" Then
        NotMovedYet = "False"
        TrialTimer = Timer
        SideTime = Timer
        SideTimeOutTimer.Enabled = True
    End If
    TheFirst = myJoy.dwXpos - ValX
    joy.Left = joy.Left + (TheFirst / JoySpeed)
End If
If myJoy.dwYpos > ValY And joy.Top < 8680 Then
    If NotMovedYet = "True" Then
        NotMovedYet = "False"
        TrialTimer = Timer
        SideTime = Timer
        SideTimeOutTimer.Enabled = True
    End If
    TheSecond = myJoy.dwYpos - ValY
    joy.Top = joy.Top + (TheSecond / JoySpeed)
End If
If myJoy.dwXpos < ValX And joy.Left > 0 Then
    If NotMovedYet = "True" Then
        NotMovedYet = "False"
        TrialTimer = Timer
        SideTime = Timer
        SideTimeOutTimer.Enabled = True
    End If
    TheFirst = ValX - myJoy.dwXpos
    joy.Left = joy.Left - (TheFirst / JoySpeed)
End If
If myJoy.dwYpos < ValY And joy.Top > 0 Then
    If NotMovedYet = "True" Then
        NotMovedYet = "False"
        TrialTimer = Timer
        SideTime = Timer
        SideTimeOutTimer.Enabled = True
    End If
    TheSecond = ValY - myJoy.dwYpos
    joy.Top = joy.Top - (TheSecond / JoySpeed)
End If

For A = 0 To 3
    If joy.Top + joy.Height < SideStim(A).Top + SideStim(A).Height And joy.Left + joy.Width < SideStim(A).Left + SideStim(A).Width And joy.Left > SideStim(A).Left And joy.Top > SideStim(A).Top And SideStim(A).Visible = True Then
        SideTimer.Enabled = False
        SideTimeOutTimer.Enabled = False
        NotMovedYet = "True"
        ResponseTime = Timer - TrialTimer
        TrialSideTime = Round(ResponseTime, 2)
        ResponseTime = 0
        Print #1, " "; TrialSideTime
        'Print #2, " "; TrialSideTime
        'Close #2
        TrialTimer = 0
        For b = 0 To 3
            SideStim(b).Visible = False
        Next b
        joy.Visible = False
        joy.Left = 6000
        joy.Top = 4320

        If Form2.Auditory.Text = "Yes" Then
            RetVal = PlaySound(App.Path + "\correct.wav", 0, 0)
        End If
        Pellet_Click
        LastSideCorrect = "True"
        If TrialSideTime < ResponseSide Or ResponseSide = 0 Then
            SideTrialsCorrect = SideTrialsCorrect + 1
        Else:
            SideTrialsCorrect = 0
        End If
        If Form2.SelectCheck.Value = 0 Then
            If SideTrialsCorrect = SideCorrectNeeded And SideCorrectNeeded <> 0 Then
                SideTrialsCorrect = 0
                If Form2.TitrateSizeSide.Text = "Yes" Then
                    If SideLevel = 7 Then
                        SideFinished = "True"
                    End If
                    If SideLevel = 6 Then
                        SideLevel = 7
                        Randomize
                    End If
                    If SideLevel = 5 Then
                        SideLevel = 6
                    End If
                    If SideLevel = 4 Then
                        SideLevel = 5
                    End If
                    If SideLevel = 3 Then
                        SideLevel = 4
                    End If
                    If SideLevel = 2 Then
                        SideLevel = 3
                    End If
                    If SideLevel = 1 Then
                        SideLevel = 2
                    End If
                End If
            End If
        End If
    End If
Next A

End Sub

Private Sub TimeOutTimer_Timer()

ChaseTimer.Enabled = False
TimeOutTimer.Enabled = False
ChaseCircle.Visible = False
joy.Visible = False
joy.Left = 6000
joy.Top = 4320
ChaseTrialNumber = ChaseTrialNumber - 1
ResponseTime = 0
TrialTimer = 0
NotMovedYet = "True"
'Print #3, "Dropped"
Timer4.Enabled = True

End Sub

Private Sub TimeOutTimer2_Timer()

PursuitTimer.Enabled = False
PursuitTimer2.Enabled = False
TimeOutTimer2.Enabled = False
ChaseCircle.Visible = False
joy.Visible = False
joy.Left = 6000
joy.Top = 4320
PursuitTrialNumber = PursuitTrialNumber - 1
If MetPursuitCriterion = "True" Then
    PursuitBlock = PursuitBlock + 1
End If
ResponseTime = 0
TrialTimer = 0
NotMovedYet = "True"
'Print #4, "Dropped"
Timer4.Enabled = True

End Sub

Private Sub Timer1_Timer()

Timer1.Enabled = False
Pellet_Click

End Sub

Private Sub Timer2_Timer()
' If the button is past the left border, the button is set ON the border.
If joy.Left < 0 Then
  joy.Left = 0
End If

' If the button is past the top border, the button is set ON the border.
If joy.Top < 0 Then
  joy.Top = 0
End If

' If the button is past the right border, the button is set ON the border.
If joy.Left > 11550 Then
  joy.Left = 11550
End If

' If the button is past the bottom border, the button is set ON the border.
If joy.Top > 8680 Then
  joy.Top = 8680
End If

End Sub

Private Sub Makeconst()
ValX = myJoy.dwXpos
ValY = myJoy.dwYpos
MC = 1
End Sub

Private Sub Timer3_Timer()

ChaseCircle.Left = ChaseCircle.Left + LeftDirection
ChaseCircle.Top = ChaseCircle.Top + TopDirection

If ChaseCircle.Top + ChaseCircle.Width > SysInfo1.WorkAreaHeight + (ChaseCircle.Width / 2) Or ChaseCircle.Top < 50 Then
    TopDirection = -TopDirection
End If
    
If ChaseCircle.Left + ChaseCircle.Width > SysInfo1.WorkAreaWidth Or ChaseCircle.Left < 50 Then
    LeftDirection = -LeftDirection
End If

End Sub

Private Sub Timer4_Timer()

Timer4.Enabled = False
If PelletsGiven = PelletsNeeded Then
    PelletsGiven = 0
    If Form2.SelectCheck.Value = 1 Then
        NextTrialSelect_Click
    Else:
        NextTrialTrain_Click
    End If
Else:
    Timer1.Enabled = True
End If

End Sub

Private Sub Timer5_Timer()

Timer5.Enabled = False
Timer4.Enabled = True

End Sub
