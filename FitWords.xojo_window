#tag Window
Begin Window FitWords
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Compatibility   =   ""
   Composite       =   False
   Frame           =   11
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   True
   Height          =   400
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   0
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   False
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   False
   Title           =   "Fit Words"
   Visible         =   False
   Width           =   600
   Begin Listbox AcrossListbox
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   True
      ColumnCount     =   1
      ColumnsResizable=   False
      ColumnWidths    =   ""
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   -1
      Enabled         =   True
      EnableDrag      =   False
      EnableDragReorder=   False
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   True
      HeadingIndex    =   -1
      Height          =   360
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Across"
      Italic          =   False
      Left            =   281
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      RequiresSelection=   False
      Scope           =   0
      ScrollbarHorizontal=   False
      ScrollBarVertical=   True
      SelectionType   =   0
      ShowDropIndicator=   False
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   20
      Transparent     =   False
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   150
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin Listbox DownListbox
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   True
      ColumnCount     =   1
      ColumnsResizable=   False
      ColumnWidths    =   ""
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   -1
      Enabled         =   True
      EnableDrag      =   False
      EnableDragReorder=   False
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   True
      HeadingIndex    =   -1
      Height          =   360
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Down"
      Italic          =   False
      Left            =   430
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      RequiresSelection=   False
      Scope           =   0
      ScrollbarHorizontal=   False
      ScrollBarVertical=   True
      SelectionType   =   0
      ShowDropIndicator=   False
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   20
      Transparent     =   False
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   150
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  handleKeys key
		  return false
		  
		End Function
	#tag EndEvent

	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  dim leftx, topy, squarex, squarey as integer
		  
		  squarex = grid.hor
		  squarey = grid.ver
		  
		  leftx = x-7
		  if leftx >= 0 then
		    if leftx mod 27 < 25 then
		      squarex = leftx \ 27
		    end
		  end
		  
		  topy = y-7
		  if topy >= 0 then
		    if topy mod 27 < 25 then
		      squarey = topy \ 27
		    end
		  end
		  
		  if squarex < grid.hor and squarey < grid.ver then
		    
		    if not grid.grid(squarex,squarey) then
		      if arrow <> nil then
		        if arrow.x = squarex and arrow.y = squarey then
		          arrow.horizontal = not arrow.horizontal
		        else
		          arrow.x = squarex
		          arrow.y = squarey
		        end
		      end
		    end
		  end
		  Refresh
		  
		End Function
	#tag EndEvent

	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  dim i,j,k,l,clueNumber as integer
		  
		  g.PenWidth = 1
		  g.PenHeight = 1
		  g.ForeColor = RGB(0,0,0)
		  for i = 0 to grid.hor-1
		    for j = 0 to grid.ver-1
		      g.DrawRect(i*27+7,j*27+7,26,26)
		    next
		  next
		  
		  g.PenWidth = 6
		  g.PenHeight = 6
		  g.DrawRect(0,0,grid.hor*27+13,grid.ver*27+13)
		  
		  g.TextSize = 24
		  g.ForeColor = RGB(255,223,223)
		  if arrow <> nil then
		    if arrow.horizontal then
		      g.DrawString("➡︎",arrow.x*27+10,arrow.y*27+29)
		    else
		      g.DrawString("⬇︎",arrow.x*27+10,arrow.y*27+29)
		    end
		  end
		  
		  g.TextSize = 7
		  g.ForeColor = Color.black
		  clueNumber = 1
		  for j = 0 to grid.hor-1
		    for i = 0 to grid.ver-1
		      if grid.grid(i,j) then
		        g.FillRect(i*27+8,j*27+8,24,24)
		      else
		        if grid.cells(i,j) <> "" then
		          g.TextSize = 18
		          g.DrawString(grid.cells(i,j),i*27+14,j*27+27)
		          g.TextSize = 7
		        end
		        if i = 0 and j = 0 then
		          if (i < grid.hor-1 and not grid.grid(i+1,j)) or (j < grid.ver-1 and not grid.grid(i,j+1)) then
		            g.DrawString(str(clueNumber),i*27+10,j*27+14)
		            clueNumber = clueNumber + 1
		          end
		        ElseIf i = 0 then
		          if (i < grid.hor-1 and not grid.grid(i+1,j)) or (grid.grid(i,j-1) and j < grid.ver-1 and not grid.grid(i,j+1)) then
		            g.DrawString(str(clueNumber),i*27+10,j*27+14)
		            clueNumber = clueNumber + 1
		          end
		        ElseIf j = 0 then
		          if (grid.grid(i-1,j) and i < grid.hor-1 and not grid.grid(i+1,j)) or (j < grid.ver-1 and not grid.grid(i,j+1)) then
		            g.DrawString(str(clueNumber),i*27+10,j*27+14)
		            clueNumber = clueNumber + 1
		          end
		        else
		          if (grid.grid(i-1,j) and i < grid.hor-1 and not grid.grid(i+1,j)) or (grid.grid(i,j-1) and j < grid.ver-1 and not grid.grid(i,j+1)) then
		            g.DrawString(str(clueNumber),i*27+10,j*27+14)
		            clueNumber = clueNumber + 1
		          end
		        end
		      end
		    next
		  next
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub handleKeys(Key as String)
		  Select case Asc(Key)
		  case 28
		    arrow.horizontal = true
		  case 29
		    arrow.horizontal = true
		  case 30
		    arrow.horizontal = false
		  case 31
		    arrow.horizontal = false
		  case 32,65 to 90,97 to 122
		    grid.cells(arrow.x,arrow.y) = Uppercase(Key)
		  else
		    
		  end
		  Refresh
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		arrow As DirectionArrow
	#tag EndProperty

	#tag Property, Flags = &h0
		grid As Grid
	#tag EndProperty


#tag EndWindowCode

#tag Events AcrossListbox
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  handleKeys key
		  return true
		  
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events DownListbox
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  handleKeys key
		  return true
		  
		End Function
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
#tag EndViewBehavior
