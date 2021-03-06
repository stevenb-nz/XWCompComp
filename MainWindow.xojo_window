#tag Window
Begin Window MainWindow
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Compatibility   =   ""
   Composite       =   False
   Frame           =   4
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   224
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   2140907519
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "CCC"
   Visible         =   True
   Width           =   144
   Begin RadioButton modeRadioButton
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "Grid"
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   1
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   88
      Transparent     =   False
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   100
   End
   Begin RadioButton modeRadioButton
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "Answers"
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   3
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   152
      Transparent     =   False
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   100
   End
   Begin RadioButton modeRadioButton
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "Crossword"
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   0
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   56
      Transparent     =   False
      Underline       =   False
      Value           =   True
      Visible         =   True
      Width           =   100
   End
   Begin RadioButton modeRadioButton
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "Clues"
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   2
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   120
      Transparent     =   False
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   100
   End
   BeginSegmented SegmentedControl modeSegmentedControl
      Enabled         =   True
      Height          =   24
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MacControlStyle =   0
      Scope           =   0
      Segments        =   "New\n\nTrue\rEdit\n\nFalse"
      SelectionType   =   0
      TabIndex        =   5
      TabPanelIndex   =   0
      Top             =   20
      Transparent     =   False
      Visible         =   True
      Width           =   100
   End
   Begin PushButton okayButton
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   False
      Caption         =   "OK"
      Default         =   True
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   184
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   104
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub EnableMenuItems()
		  if currentGrid = nil then
		    GridEdit.Enabled = false
		    GridFitWords.Enabled = false
		  else
		    GridEdit.Enabled = true
		    GridFitWords.Enabled = true
		  end
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  currentGrid = nil
		  
		End Sub
	#tag EndEvent


	#tag MenuHandler
		Function GridFitWords() As Boolean Handles GridFitWords.Action
			dim i,j,clueNumber as integer
			
			FitWords.grid = currentGrid
			
			FitWords.Width = FitWords.grid.hor*27+353
			FitWords.MinWidth = FitWords.grid.hor*27+353
			FitWords.MaxWidth = FitWords.grid.hor*27+353
			FitWords.Height = FitWords.grid.ver*27+13
			FitWords.MinHeight = FitWords.grid.ver*27+13
			FitWords.MaxHeight = FitWords.grid.ver*27+13
			
			FitWords.arrow = nil
			clueNumber = 1
			for j = 0 to currentGrid.hor-1
			for i = 0 to currentGrid.ver-1
			if not currentGrid.grid(i,j) then
			if i = 0 and j = 0 then
			if (i < currentGrid.hor-1 and not currentGrid.grid(i+1,j)) or (j < currentGrid.ver-1 and not currentGrid.grid(i,j+1)) then
			if i < currentGrid.hor-1 and not currentGrid.grid(i+1,j) then
			FitWords.AcrossListbox.AddRow str(clueNumber) + ". "
			if FitWords.arrow = nil then
			FitWords.arrow = new DirectionArrow
			FitWords.arrow.x = i
			FitWords.arrow.y = j
			FitWords.arrow.horizontal = true
			end
			end
			if j < currentGrid.ver-1 and not currentGrid.grid(i,j+1) then
			FitWords.DownListbox.AddRow str(clueNumber) + ". "
			if FitWords.arrow = nil then
			FitWords.arrow = new DirectionArrow
			FitWords.arrow.x = i
			FitWords.arrow.y = j
			FitWords.arrow.horizontal = false
			end
			end
			clueNumber = clueNumber + 1
			end
			ElseIf i = 0 then
			if (i < currentGrid.hor-1 and not currentGrid.grid(i+1,j)) or (currentGrid.grid(i,j-1) and j < currentGrid.ver-1 and not currentGrid.grid(i,j+1)) then
			if i < currentGrid.hor-1 and not currentGrid.grid(i+1,j) then
			FitWords.AcrossListbox.AddRow str(clueNumber) + ". "
			if FitWords.arrow = nil then
			FitWords.arrow = new DirectionArrow
			FitWords.arrow.x = i
			FitWords.arrow.y = j
			FitWords.arrow.horizontal = true
			end
			end
			if currentGrid.grid(i,j-1) and j < currentGrid.ver-1 and not currentGrid.grid(i,j+1) then
			FitWords.DownListbox.AddRow str(clueNumber) + ". "
			if FitWords.arrow = nil then
			FitWords.arrow = new DirectionArrow
			FitWords.arrow.x = i
			FitWords.arrow.y = j
			FitWords.arrow.horizontal = false
			end
			end
			clueNumber = clueNumber + 1
			end
			ElseIf j = 0 then
			if (currentGrid.grid(i-1,j) and i < currentGrid.hor-1 and not currentGrid.grid(i+1,j)) or (j < currentGrid.ver-1 and not currentGrid.grid(i,j+1)) then
			if currentGrid.grid(i-1,j) and i < currentGrid.hor-1 and not currentGrid.grid(i+1,j) then
			FitWords.AcrossListbox.AddRow str(clueNumber) + ". "
			if FitWords.arrow = nil then
			FitWords.arrow = new DirectionArrow
			FitWords.arrow.x = i
			FitWords.arrow.y = j
			FitWords.arrow.horizontal = true
			end
			end
			if j < currentGrid.ver-1 and not currentGrid.grid(i,j+1) then
			FitWords.DownListbox.AddRow str(clueNumber) + ". "
			if FitWords.arrow = nil then
			FitWords.arrow = new DirectionArrow
			FitWords.arrow.x = i
			FitWords.arrow.y = j
			FitWords.arrow.horizontal = false
			end
			end
			clueNumber = clueNumber + 1
			end
			else
			if (currentGrid.grid(i-1,j) and i < currentGrid.hor-1 and not currentGrid.grid(i+1,j)) or (currentGrid.grid(i,j-1) and j < currentGrid.ver-1 and not currentGrid.grid(i,j+1)) then
			if currentGrid.grid(i-1,j) and i < currentGrid.hor-1 and not currentGrid.grid(i+1,j) then
			FitWords.AcrossListbox.AddRow str(clueNumber) + ". "
			if FitWords.arrow = nil then
			FitWords.arrow = new DirectionArrow
			FitWords.arrow.x = i
			FitWords.arrow.y = j
			FitWords.arrow.horizontal = true
			end
			end
			if currentGrid.grid(i,j-1) and j < currentGrid.ver-1 and not currentGrid.grid(i,j+1) then
			FitWords.DownListbox.AddRow str(clueNumber) + ". "
			if FitWords.arrow = nil then
			FitWords.arrow = new DirectionArrow
			FitWords.arrow.x = i
			FitWords.arrow.y = j
			FitWords.arrow.horizontal = false
			end
			end
			clueNumber = clueNumber + 1
			end
			end
			end
			next
			next
			
			FitWords.show
			
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function GridNew() As Boolean Handles GridNew.Action
			GridSettings.ShowModal
			Return True
			
		End Function
	#tag EndMenuHandler


	#tag Property, Flags = &h0
		currentGrid As Grid
	#tag EndProperty

	#tag Property, Flags = &h0
		modeComponent As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h0
		modeNewEdit As Integer = 0
	#tag EndProperty


#tag EndWindowCode

#tag Events modeRadioButton
	#tag Event
		Sub Action(index as Integer)
		  modeComponent = index * 2
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events modeSegmentedControl
	#tag Event
		Sub Action(itemIndex as integer)
		  modeNewEdit = itemIndex
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events okayButton
	#tag Event
		Sub Action()
		  select case modeComponent+modeNewEdit
		  case 0
		    MsgBox str(modeComponent+modeNewEdit)
		  case 1
		    MsgBox str(modeComponent+modeNewEdit)
		  case 2
		    MsgBox str(modeComponent+modeNewEdit)
		  case 3
		    MsgBox str(modeComponent+modeNewEdit)
		  case 4
		    MsgBox str(modeComponent+modeNewEdit)
		  case 5
		    MsgBox str(modeComponent+modeNewEdit)
		  case 6
		    MsgBox str(modeComponent+modeNewEdit)
		  case 7
		    MsgBox str(modeComponent+modeNewEdit)
		  end
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="Name"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Interfaces"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Super"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Width"
		Visible=true
		Group="Size"
		InitialValue="600"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Size"
		InitialValue="400"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinWidth"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinHeight"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaxWidth"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaxHeight"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Frame"
		Visible=true
		Group="Frame"
		InitialValue="0"
		Type="Integer"
		EditorType="Enum"
		#tag EnumValues
			"0 - Document"
			"1 - Movable Modal"
			"2 - Modal Dialog"
			"3 - Floating Window"
			"4 - Plain Box"
			"5 - Shadowed Box"
			"6 - Rounded Window"
			"7 - Global Floating Window"
			"8 - Sheet Window"
			"9 - Metal Window"
			"11 - Modeless Dialog"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=true
		Group="Frame"
		InitialValue="Untitled"
		Type="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="CloseButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Resizeable"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreenButton"
		Visible=true
		Group="Frame"
		InitialValue="False"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Composite"
		Group="OS X (Carbon)"
		InitialValue="False"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MacProcID"
		Group="OS X (Carbon)"
		InitialValue="0"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="ImplicitInstance"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Placement"
		Visible=true
		Group="Behavior"
		InitialValue="0"
		Type="Integer"
		EditorType="Enum"
		#tag EnumValues
			"0 - Default"
			"1 - Parent Window"
			"2 - Main Screen"
			"3 - Parent Window Screen"
			"4 - Stagger"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="LiveResize"
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreen"
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasBackColor"
		Visible=true
		Group="Background"
		InitialValue="False"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="BackColor"
		Visible=true
		Group="Background"
		InitialValue="&hFFFFFF"
		Type="Color"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Background"
		Type="Picture"
		EditorType="Picture"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBar"
		Visible=true
		Group="Menus"
		Type="MenuBar"
		EditorType="MenuBar"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBarVisible"
		Visible=true
		Group="Deprecated"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="modeComponent"
		Group="Behavior"
		InitialValue="0"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="modeNewEdit"
		Group="Behavior"
		InitialValue="0"
		Type="Integer"
	#tag EndViewProperty
#tag EndViewBehavior
