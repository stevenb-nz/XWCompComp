#tag Window
Begin Window GridDesigner
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Compatibility   =   ""
   Composite       =   False
   Frame           =   11
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
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
   Title           =   "Grid Designer"
   Visible         =   False
   Width           =   600
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Function CancelClose(appQuitting as Boolean) As Boolean
		  dim n as integer
		  
		  if ContentsChanged then
		    n = MsgBox("Do you want to store this grid?", 35)
		    select case n
		    case 2
		      return true
		    case 6
		      storeGrid
		    end
		  end
		  
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
		    grid.grid(squarex,squarey) = not grid.grid(squarex,squarey)
		    grid.open = if(grid.grid(squarex,squarey), grid.open-1, grid.open+1)
		    
		    Select Case selectedSymmetry
		    Case 1
		      if squarex <> (grid.hor-1)-squarex then
		        grid.grid((grid.hor-1)-squarex,squarey) = not grid.grid((grid.hor-1)-squarex,squarey)
		        grid.open = if(grid.grid((grid.hor-1)-squarex,squarey), grid.open-1, grid.open+1)
		      end
		    Case 2
		      if squarey <> (grid.ver-1)-squarey then
		        grid.grid(squarex,(grid.ver-1)-squarey) = not grid.grid(squarex,(grid.ver-1)-squarey)
		        grid.open = if(grid.grid(squarex,(grid.ver-1)-squarey), grid.open-1, grid.open+1)
		      end
		    Case 3
		      if squarex <> (grid.hor-1)-squarex then
		        grid.grid((grid.hor-1)-squarex,squarey) = not grid.grid((grid.hor-1)-squarex,squarey)
		        grid.open = if(grid.grid((grid.hor-1)-squarex,squarey), grid.open-1, grid.open+1)
		      end
		      if squarey <> (grid.ver-1)-squarey then
		        grid.grid(squarex,(grid.ver-1)-squarey) = not grid.grid(squarex,(grid.ver-1)-squarey)
		        grid.open = if(grid.grid(squarex,(grid.ver-1)-squarey), grid.open-1, grid.open+1)
		      end
		      if squarex <> (grid.hor-1)-squarex and squarey <> (grid.ver-1)-squarey then
		        grid.grid((grid.hor-1)-squarex,(grid.ver-1)-squarey) = not grid.grid((grid.hor-1)-squarex,(grid.ver-1)-squarey)
		        grid.open = if(grid.grid((grid.hor-1)-squarex,(grid.ver-1)-squarey), grid.open-1, grid.open+1)
		      end
		    Case 4
		      if squarex <> (grid.hor-1)-squarex or squarey <> (grid.ver-1)-squarey then
		        grid.grid((grid.hor-1)-squarex,(grid.ver-1)-squarey) = not grid.grid((grid.hor-1)-squarex,(grid.ver-1)-squarey)
		        grid.open = if(grid.grid((grid.hor-1)-squarex,(grid.ver-1)-squarey), grid.open-1, grid.open+1)
		      end
		    Case 5
		      grid.grid(squarey,(grid.hor-1)-squarex) = not grid.grid(squarey,(grid.hor-1)-squarex)
		      grid.open = if(grid.grid(squarey,(grid.hor-1)-squarex), grid.open-1, grid.open+1)
		      grid.grid((grid.ver-1)-squarey,squarex) = not grid.grid((grid.ver-1)-squarey,squarex)
		      grid.open = if(grid.grid((grid.ver-1)-squarey,squarex), grid.open-1, grid.open+1)
		      if squarex <> (grid.hor-1)-squarex or squarey <> (grid.ver-1)-squarey then
		        grid.grid((grid.hor-1)-squarex,(grid.ver-1)-squarey) = not grid.grid((grid.hor-1)-squarex,(grid.ver-1)-squarey)
		        grid.open = if(grid.grid((grid.hor-1)-squarex,(grid.ver-1)-squarey), grid.open-1, grid.open+1)
		      end
		    End
		    
		    setContentsChanged
		  end
		  Refresh
		  
		End Function
	#tag EndEvent

	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  dim i,j as integer
		  
		  g.PenWidth = 2
		  for i = 0 to grid.hor
		    g.DrawLine i*27+5,5,i*27+5,grid.ver*27+5
		  next
		  g.PenHeight = 2
		  for j = 0 to grid.ver
		    g.DrawLine 5,j*27+5,grid.hor*27+5,j*27+5
		  next
		  
		  for i = 0 to grid.hor-1
		    for j = 0 to grid.ver-1
		      if grid.grid(i,j) then
		        g.FillRect(i*27+7,j*27+7,25,25)
		      end
		    next
		  next
		End Sub
	#tag EndEvent


	#tag MenuHandler
		Function GridInfo() As Boolean Handles GridInfo.Action
			GridInfoWindow.InfoListbox.AddRow("White squares:",str(grid.open))
			GridInfoWindow.InfoListbox.AddRow("Black squares:",str(grid.hor*grid.ver-grid.open))
			
			GridInfoWindow.ShowModal
			Return True
			
		End Function
	#tag EndMenuHandler


	#tag Method, Flags = &h0
		Sub setContentsChanged()
		  dim x,y as Integer
		  
		  for x = 0 to grid.hor-1
		    for y = 0 to grid.ver-1
		      if grid.grid(x,y) then
		        ContentsChanged = true
		        return
		      end
		    next
		  next
		  
		  ContentsChanged = false
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub storeGrid()
		  MsgBox "grid saved"
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		grid As Grid
	#tag EndProperty

	#tag Property, Flags = &h0
		selectedSymmetry As Integer
	#tag EndProperty


#tag EndWindowCode

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
		Name="selectedSymmetry"
		Group="Behavior"
		Type="Integer"
	#tag EndViewProperty
#tag EndViewBehavior
