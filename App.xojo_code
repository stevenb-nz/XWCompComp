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
		  'wordsDB.SQLExecute("CREATE TABLE Words (id Integer, Word VarChar NOT NULL, reversed VarChar, f_hook_of Integer, b_hook_of Integer, combo_id Integer, playability Integer, PRIMARY KEY(id));")
		  'wordsDB.SQLExecute("CREATE TABLE Combos (id Integer, Combo VarChar NOT NULL, length Integer, frequency Integer, combo_playability Integer, PRIMARY KEY(id));")
		  'wordsDB.SQLExecute("CREATE TABLE Quiz (id Integer, type VarChar, length Integer, states VarChar, current Integer, current_new Boolean, PRIMARY KEY(id));")
		  'wordsDB.SQLExecute("CREATE TABLE Settings (id Integer, Setting VarChar NOT NULL, value VarChar, PRIMARY KEY(id));")
		  'wordsDB.SQLExecute("CREATE UNIQUE INDEX Words_ix_Word ON Words (Word);")
		  'wordsDB.SQLExecute("CREATE UNIQUE INDEX Combos_ix_Combo ON Combos (Combo);")
		  
		  'xwDB.SQLExecute("CREATE TABLE grids (id Integer, PRIMARY KEY(id));")
		  'xwDB.SQLExecute("CREATE TABLE clues (id Integer, PRIMARY KEY(id));")
		  'xwDB.SQLExecute("CREATE TABLE crosswords (id Integer, PRIMARY KEY(id));")
		  'xwDB.SQLExecute("CREATE TABLE crossword_clues (id Integer, PRIMARY KEY(id));")
		  
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
