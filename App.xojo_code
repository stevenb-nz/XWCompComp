#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Close()
		  if xwDB <> nil then
		    xwDB.Close
		  end
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub EnableMenuItems()
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  Dim tables As RecordSet
		  
		  xwDB = new SQLiteDatabase
		  xwDB.DatabaseFile = SpecialFolder.Documents.Child("Crosswords.sqlite")
		  if xwDB.CreateDatabaseFile then
		    tables = xwDB.TableSchema
		    If tables <> Nil Then
		      if tables.eof then
		        addTables
		      end if
		      tables.close
		    End If
		  else
		    MsgBox "Something went wrong creating a new database file."
		  end if
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub addTables()
		  xwDB.SQLExecute("CREATE TABLE Settings (id Integer, Setting VarChar NOT NULL, value VarChar, PRIMARY KEY(id));")
		  xwDB.SQLExecute("CREATE TABLE grids (id Integer, lights VarChar, x Integer, y Integer, PRIMARY KEY(id));")
		  xwDB.SQLExecute("CREATE TABLE clues (id Integer, clue VarChar, answer_id Integer, PRIMARY KEY(id));")
		  xwDB.SQLExecute("CREATE TABLE answers (id Integer, answer VarChar, PRIMARY KEY(id));")
		  xwDB.SQLExecute("CREATE TABLE crosswords (id Integer, series VarChar, series_number Integer, grid_id, PRIMARY KEY(id));")
		  xwDB.SQLExecute("CREATE TABLE crossword_clues (id Integer, crossword_id Integer, clue_id Integer, clue_number VarChar, PRIMARY KEY(id));")
		  
		  xwDB.Commit()
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		xwDB As SQLiteDatabase
	#tag EndProperty


	#tag Constant, Name = kEditClear, Type = String, Dynamic = False, Default = \"&Delete", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"&Delete"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"&Delete"
	#tag EndConstant

	#tag Constant, Name = kFileQuit, Type = String, Dynamic = False, Default = \"&Quit", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"E&xit"
	#tag EndConstant

	#tag Constant, Name = kFileQuitShortcut, Type = String, Dynamic = False, Default = \"", Scope = Public
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"Cmd+Q"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"Ctrl+Q"
	#tag EndConstant


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
