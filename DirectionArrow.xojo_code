#tag Class
Protected Class DirectionArrow
	#tag Method, Flags = &h0
		Sub advance(key as string)
		  dim i,offset as Integer
		  
		  i = 1
		  offset = 0
		  Select case Asc(Key)
		  case 28
		    while offset = 0 and x-i > -1
		      if not FitWords.grid.grid(x-i,y) then
		        offset = i
		      end
		      i = i + 1
		    wend
		    x=x-offset
		    horizontal = true
		  case 29
		    if horizontal then
		      while offset = 0 and x+i < FitWords.grid.hor
		        if not FitWords.grid.grid(x+i,y) then
		          offset = i
		        end
		        i = i + 1
		      wend
		      x=x+offset
		    end
		    horizontal = true
		  case 30
		    while offset = 0 and y-i > -1
		      if not FitWords.grid.grid(x,y-i) then
		        offset = i
		      end
		      i = i + 1
		    wend
		    y=y-offset
		    horizontal = false
		  case 31
		    if not horizontal then
		      while offset = 0 and y+i < FitWords.grid.ver
		        if not FitWords.grid.grid(x,y+i) then
		          offset = i
		        end
		        i = i + 1
		      wend
		      y=y+offset
		    end
		    horizontal = false
		  else
		    if horizontal and x < FitWords.grid.hor-1 then
		      if not FitWords.grid.grid(x+1,y) then
		        x = x + 1
		      end
		    end
		    if not horizontal and y < FitWords.grid.ver-1 then
		      if not FitWords.grid.grid(x,y+1) then
		        y = y + 1
		      end
		    end
		  end
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		horizontal As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		x As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		y As Integer
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="x"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="horizontal"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="y"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
