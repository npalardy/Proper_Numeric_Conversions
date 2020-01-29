#tag Window
Begin Window Window1
   Backdrop        =   0
   BackgroundColor =   &cFFFFFF00
   Composite       =   False
   DefaultLocation =   "0"
   FullScreen      =   False
   HasBackgroundColor=   False
   HasCloseButton  =   True
   HasFullScreenButton=   False
   HasMaximizeButton=   True
   HasMinimizeButton=   True
   Height          =   400
   ImplicitInstance=   True
   MacProcID       =   0
   MaximumHeight   =   32000
   MaximumWidth    =   32000
   MenuBar         =   1939806207
   MenuBarVisible  =   True
   MinimumHeight   =   64
   MinimumWidth    =   64
   Resizeable      =   True
   Title           =   "Untitled"
   Type            =   "0"
   Visible         =   True
   Width           =   600
   Begin Listbox Listbox1
      AllowAutoDeactivate=   True
      AllowAutoHideScrollbars=   True
      AllowExpandableRows=   False
      AllowFocusRing  =   True
      AllowResizableColumns=   False
      AllowRowDragging=   False
      AllowRowReordering=   False
      Bold            =   False
      ColumnCount     =   3
      ColumnWidths    =   ""
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   -1
      DropIndicatorVisible=   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      GridLinesHorizontalStyle=   "0"
      GridLinesVerticalStyle=   "0"
      HasBorder       =   True
      HasHeader       =   True
      HasHorizontalScrollbar=   False
      HasVerticalScrollbar=   True
      HeadingIndex    =   -1
      Height          =   360
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   " 	Framework	Proper"
      Italic          =   False
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      RequiresSelection=   False
      RowSelectionType=   "0"
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   20
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   560
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  TestInt8
		  TestUInt8
		  
		  TestInt16
		  TestUInt16
		  
		  TestInt32
		  TestUInt32
		  
		  TestInt64
		  TestUInt64
		  
		  TestCurrency
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h1
		Protected Sub TestCurrency()
		  Dim s As String
		  Dim c1 As Currency
		  Dim currencyValue As Currency = -1.6363
		  
		  // ===================================================
		  listbox1.AddRow("Currency to bin")
		  // should be an 64 bit value string return but its not
		  s = "framework has no builtin" // Bin(currencyValue)
		  listbox1.CellValueAt(listbox1.LastAddedRowIndex,frameworkColumn) = s
		  
		  // should be an 64 bit value string return 
		  s = currencyValue.ProperToBinary 
		  listbox1.CellValueAt(listbox1.LastAddedRowIndex,properColumn) = s
		  
		  // sadly converting BACK to currency from binry is problematic
		  // ie/ if you did
		  // dim c as currency = &b1 what you get is currency = 1 not .0001
		  // so we need a ProperFromBinary
		  // but there is no way to add a method to the CurrencyModule :(
		  c1 = ProperConversions.CurrencyFromBinary( s )
		  If c1 <> currencyValue Then 
		    Break
		  End If
		  // ===================================================
		  listbox1.AddRow("Currency to hex")
		  s = "framework has no builtin" // Hex(currencyValue) // currencyValue.ToHex 
		  // since each hex digit is 4 bits the string return _should_ be 
		  // at least 16 hex digis 
		  listbox1.CellValueAt(listbox1.LastAddedRowIndex,frameworkColumn) = s
		  
		  s = currencyValue.ProperToHex 
		  // since each hex digit is 4 bits the string return _should_ be 
		  // at least 16 hex digis 
		  listbox1.CellValueAt(listbox1.LastAddedRowIndex,properColumn) = s
		  
		  c1 = ProperConversions.CurrencyFromHex( s )
		  If c1 <> currencyValue Then 
		    Break
		  End If
		  
		  // ===================================================
		  listbox1.AddRow("Currency to oct")
		  s = "framework has no builtin" //  Oct(currencyValue) // doubleValue.ToOctal
		  // since each octal digit is 3 bits the string return _should_ be 
		  // at least 22 octal digis 
		  listbox1.CellValueAt(listbox1.LastAddedRowIndex,frameworkColumn) = s
		  
		  s = currencyValue.ProperToOctal
		  // since each octal digit is 3 bits the string return _should_ be 
		  // at least 22 octal digis 
		  listbox1.CellValueAt(listbox1.LastAddedRowIndex,properColumn) = s
		  
		  c1 = ProperConversions.CurrencyFromOctal( s )
		  If c1 <> currencyValue Then 
		    Break
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub TestDouble()
		  Dim s As String
		  
		  Dim doubleValue As Double = -1.6363e2
		  
		  // ===================================================
		  listbox1.AddRow("double to bin")
		  // should be an 64 bit value string return but its not
		  s = Bin(doubleValue) // doubleValue.ToBinary 
		  listbox1.CellValueAt(listbox1.LastAddedRowIndex,frameworkColumn) = s
		  
		  // should be an 64 bit value string return 
		  s = doubleValue.ProperToBinary 
		  listbox1.CellValueAt(listbox1.LastAddedRowIndex,properColumn) = s
		  
		  
		  // ===================================================
		  listbox1.AddRow("double to hex")
		  s = Hex(doubleValue) // doubleValue.ToHex 
		  // since each hex digit is 4 bits the string return _should_ be 
		  // at least 16 hex digis 
		  listbox1.CellValueAt(listbox1.LastAddedRowIndex,frameworkColumn) = s
		  
		  s = doubleValue.ProperToHex 
		  // since each hex digit is 4 bits the string return _should_ be 
		  // at least 16 hex digis 
		  listbox1.CellValueAt(listbox1.LastAddedRowIndex,properColumn) = s
		  
		  
		  
		  // ===================================================
		  listbox1.AddRow("double to oct")
		  s = Oct(doubleValue) // doubleValue.ToOctal
		  // since each octal digit is 3 bits the string return _should_ be 
		  // at least 22 octal digis 
		  listbox1.CellValueAt(listbox1.LastAddedRowIndex,frameworkColumn) = s
		  
		  s = doubleValue.ProperToOctal
		  // since each octal digit is 3 bits the string return _should_ be 
		  // at least 22 octal digis 
		  listbox1.CellValueAt(listbox1.LastAddedRowIndex,properColumn) = s
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub TestInt16()
		  Dim s As String
		  
		  Dim i16 As Int16 = &h0A0A
		  
		  // ===================================================
		  listbox1.AddRow("int16 to bin")
		  // should be an 16 bit value string return but its not
		  s = i16.ToBinary 
		  listbox1.CellValueAt(listbox1.LastAddedRowIndex,frameworkColumn) = s
		  
		  // should be an 16 bit value string return 
		  s = i16.ProperToBinary 
		  listbox1.CellValueAt(listbox1.LastAddedRowIndex,properColumn) = s
		  
		  
		  // ===================================================
		  listbox1.AddRow("int16 to hex")
		  s = i16.ToHex 
		  // since each hex digit is 4 bits the string return _should_ be 
		  // at least 4 hex digis 
		  listbox1.CellValueAt(listbox1.LastAddedRowIndex,frameworkColumn) = s
		  
		  s = i16.ProperToHex 
		  // since each hex digit is 4 bits the string return _should_ be 
		  // at least 4 hex digis 
		  listbox1.CellValueAt(listbox1.LastAddedRowIndex,properColumn) = s
		  
		  
		  // ===================================================
		  listbox1.AddRow("int16 to oct")
		  s = i16.ToOctal
		  // since each octal digit is 3 bits the string return _should_ be 
		  // at least 6 octal digis
		  listbox1.CellValueAt(listbox1.LastAddedRowIndex,frameworkColumn) = s
		  
		  s = i16.ProperToOctal
		  // since each octal digit is 3 bits the string return _should_ be 
		  // at least 6 octal digis 
		  listbox1.CellValueAt(listbox1.LastAddedRowIndex,properColumn) = s
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub TestInt32()
		  Dim s As String
		  
		  Dim i32 As Int32 = &h0A0A0A0A
		  
		  // ===================================================
		  listbox1.AddRow("Int32 to bin")
		  
		  // should be an 32 bit value string return but its not
		  s = i32.ToBinary 
		  listbox1.CellValueAt(listbox1.LastAddedRowIndex,frameworkColumn) = s
		  
		  // should be an 16 bit value string return 
		  s = i32.ProperToBinary 
		  listbox1.CellValueAt(listbox1.LastAddedRowIndex,properColumn) = s
		  
		  
		  // ===================================================
		  listbox1.AddRow("Int32 to hex")
		  s = i32.ToHex 
		  // since each hex digit is 4 bits the string return _should_ be 
		  // at least 8 hex digis 
		  listbox1.CellValueAt(listbox1.LastAddedRowIndex,frameworkColumn) = s
		  
		  s = i32.ProperToHex 
		  // since each hex digit is 4 bits the string return _should_ be 
		  // at least 8 hex digis 
		  listbox1.CellValueAt(listbox1.LastAddedRowIndex,properColumn) = s
		  
		  
		  
		  // ===================================================
		  listbox1.AddRow("Int32 to oct")
		  s = i32.ToOctal
		  // since each octal digit is 3 bits the string return _should_ be 
		  // at least 11 octal digis 
		  listbox1.CellValueAt(listbox1.LastAddedRowIndex,frameworkColumn) = s
		  
		  s = i32.ProperToOctal
		  // since each octal digit is 3 bits the string return _should_ be 
		  // at least 11 octal digis 
		  listbox1.CellValueAt(listbox1.LastAddedRowIndex,properColumn) = s
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub TestInt64()
		  Dim s As String
		  
		  Dim i64 As Int64 = &h0A0A0A0A0A0A0A0A
		  
		  // ===================================================
		  listbox1.AddRow("Int64 to bin")
		  // should be a 64 bit value string return but its not
		  s = i64.ToBinary 
		  listbox1.CellValueAt(listbox1.LastAddedRowIndex,frameworkColumn) = s
		  
		  // should be an i64 bit value string return 
		  s = i64.ProperToBinary 
		  listbox1.CellValueAt(listbox1.LastAddedRowIndex,properColumn) = s
		  
		  // ===================================================
		  listbox1.AddRow("Int64 to hex")
		  s = i64.ToHex 
		  // since each hex digit is 4 bits the string return _should_ be 
		  // at least 16 hex digis 
		  listbox1.CellValueAt(listbox1.LastAddedRowIndex,frameworkColumn) = s
		  
		  s = i64.ProperToHex 
		  // since each hex digit is 4 bits the string return _should_ be 
		  // at least 16 hex digis 
		  listbox1.CellValueAt(listbox1.LastAddedRowIndex,properColumn) = s
		  
		  
		  // ===================================================
		  listbox1.AddRow("Int64 to oct")
		  s = i64.ToOctal
		  // since each octal digit is 3 bits the string return _should_ be 
		  // at least 22 octal digis 
		  listbox1.CellValueAt(listbox1.LastAddedRowIndex,frameworkColumn) = s
		  
		  
		  s = i64.ProperToOctal
		  // since each octal digit is 3 bits the string return _should_ be 
		  // at least 22 octal digis 
		  listbox1.CellValueAt(listbox1.LastAddedRowIndex,properColumn) = s
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub TestInt8()
		  Dim s As String
		  
		  Dim i8 As Int8 = &h0A
		  
		  // ===================================================
		  listbox1.AddRow("Int8 to bin")
		  // should be an 8 bit value string return but its not
		  s = i8.ToBinary 
		  listbox1.CellValueAt(listbox1.LastAddedRowIndex,frameworkColumn) = s
		  
		  // should be an 8 bit value string return 
		  s = i8.ProperToBinary 
		  listbox1.CellValueAt(listbox1.LastAddedRowIndex,properColumn) = s
		  
		  
		  // ===================================================
		  listbox1.AddRow("Int8 to hex")
		  s = i8.ToHex 
		  // since each hex digit is 4 bits the string return _should_ be 
		  // at least 2 hex digis (or 8 bits)
		  listbox1.CellValueAt(listbox1.LastAddedRowIndex,frameworkColumn) = s
		  
		  s = i8.ProperToHex 
		  // since each hex digit is 4 bits the string return _should_ be 
		  // at least 2 hex digis (or 8 bits)
		  listbox1.CellValueAt(listbox1.LastAddedRowIndex,properColumn) = s
		  
		  
		  // ===================================================
		  listbox1.AddRow("Int8 to oct")
		  s = i8.ToOctal
		  // since each octal digit is 3 bits the string return _should_ be 
		  // at least 3 octal digis (or 8 bits)
		  listbox1.CellValueAt(listbox1.LastAddedRowIndex,frameworkColumn) = s
		  
		  s = i8.ProperToOctal
		  // since each octal digit is 3 bits the string return _should_ be 
		  // at least 3 octal digis (or 8 bits)
		  listbox1.CellValueAt(listbox1.LastAddedRowIndex,properColumn) = s
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub TestSingle()
		  Dim s As String
		  
		  Dim singleValue As Single = -1.6363e3
		  
		  // ===================================================
		  listbox1.AddRow("Single to bin")
		  // should be an 32 bit value string return but its not
		  s = Bin(singleValue) // singleValue.ToBinary 
		  listbox1.CellValueAt(listbox1.LastAddedRowIndex,frameworkColumn) = s
		  
		  // should be an 32 bit value string return 
		  s = singleValue.ProperToBinary 
		  listbox1.CellValueAt(listbox1.LastAddedRowIndex,properColumn) = s
		  
		  
		  // ===================================================
		  listbox1.AddRow("Single to hex")
		  s = Hex(singleValue) // singleValue.ToHex 
		  // since each hex digit is 4 bits the string return _should_ be 
		  // at least 8 hex digis 
		  listbox1.CellValueAt(listbox1.LastAddedRowIndex,frameworkColumn) = s
		  
		  s = singleValue.ProperToHex 
		  // since each hex digit is 4 bits the string return _should_ be 
		  // at least 8 hex digis 
		  listbox1.CellValueAt(listbox1.LastAddedRowIndex,properColumn) = s
		  
		  
		  
		  // ===================================================
		  listbox1.AddRow("Single to oct")
		  s = Oct(singleValue) // singleValue.ToOctal
		  // since each octal digit is 3 bits the string return _should_ be 
		  // at least 11 octal digis 
		  listbox1.CellValueAt(listbox1.LastAddedRowIndex,frameworkColumn) = s
		  
		  s = singleValue.ProperToOctal
		  // since each octal digit is 3 bits the string return _should_ be 
		  // at least 11 octal digis 
		  listbox1.CellValueAt(listbox1.LastAddedRowIndex,properColumn) = s
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub TestUInt16()
		  Dim s As String
		  
		  Dim i16 As UInt16 = &h0A0A
		  
		  // ===================================================
		  listbox1.AddRow("UInt16 to bin")
		  // should be an 16 bit value string return but its not
		  s = i16.ToBinary 
		  listbox1.CellValueAt(listbox1.LastAddedRowIndex,frameworkColumn) = s
		  
		  // should be an 16 bit value string return 
		  s = i16.ProperToBinary 
		  listbox1.CellValueAt(listbox1.LastAddedRowIndex,properColumn) = s
		  
		  
		  // ===================================================
		  listbox1.AddRow("UInt16 to hex")
		  s = i16.ToHex 
		  // since each hex digit is 4 bits the string return _should_ be 
		  // at least 4 hex digis 
		  listbox1.CellValueAt(listbox1.LastAddedRowIndex,frameworkColumn) = s
		  
		  s = i16.ProperToHex 
		  // since each hex digit is 4 bits the string return _should_ be 
		  // at least 4 hex digis 
		  listbox1.CellValueAt(listbox1.LastAddedRowIndex,properColumn) = s
		  
		  
		  // ===================================================
		  listbox1.AddRow("UInt16 to oct")
		  s = i16.ToOctal
		  // since each octal digit is 3 bits the string return _should_ be 
		  // at least 6 octal digis
		  listbox1.CellValueAt(listbox1.LastAddedRowIndex,frameworkColumn) = s
		  
		  
		  s = i16.ProperToOctal
		  // since each octal digit is 3 bits the string return _should_ be 
		  // at least 6 octal digis 
		  listbox1.CellValueAt(listbox1.LastAddedRowIndex,properColumn) = s
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub TestUInt32()
		  Dim s As String
		  
		  Dim i32 As UInt32 = &h0A0A0A0A
		  
		  // ===================================================
		  listbox1.AddRow("UInt32 to bin")
		  // should be an 32 bit value string return but its not
		  s = i32.ToBinary 
		  listbox1.CellValueAt(listbox1.LastAddedRowIndex,frameworkColumn) = s
		  
		  // should be an 16 bit value string return 
		  s = i32.ProperToBinary 
		  listbox1.CellValueAt(listbox1.LastAddedRowIndex,properColumn) = s
		  
		  
		  // ===================================================
		  listbox1.AddRow("UInt32 to hex")
		  s = i32.ToHex 
		  // since each hex digit is 4 bits the string return _should_ be 
		  // at least 8 hex digis 
		  listbox1.CellValueAt(listbox1.LastAddedRowIndex,frameworkColumn) = s
		  
		  s = i32.ProperToHex 
		  // since each hex digit is 4 bits the string return _should_ be 
		  // at least 8 hex digis 
		  listbox1.CellValueAt(listbox1.LastAddedRowIndex,properColumn) = s
		  
		  
		  // ===================================================
		  listbox1.AddRow("UInt32 to oct")
		  s = i32.ToOctal
		  // since each octal digit is 3 bits the string return _should_ be 
		  // at least 11 octal digis 
		  listbox1.CellValueAt(listbox1.LastAddedRowIndex,frameworkColumn) = s
		  
		  
		  s = i32.ProperToOctal
		  // since each octal digit is 3 bits the string return _should_ be 
		  // at least 11 octal digis 
		  listbox1.CellValueAt(listbox1.LastAddedRowIndex,properColumn) = s
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub TestUInt64()
		  Dim s As String
		  
		  Dim i64 As UInt64 = &h0A0A0A0A0A0A0A0A
		  
		  // ===================================================
		  listbox1.AddRow("UInt64 to bin")
		  // should be an i64 bit value string return but its not
		  s = i64.ToBinary 
		  listbox1.CellValueAt(listbox1.LastAddedRowIndex,frameworkColumn) = s
		  
		  // should be an i64 bit value string return 
		  s = i64.ProperToBinary 
		  listbox1.CellValueAt(listbox1.LastAddedRowIndex,properColumn) = s
		  
		  
		  // ===================================================
		  listbox1.AddRow("UInt64 to hex")
		  s = i64.ToHex 
		  // since each hex digit is 4 bits the string return _should_ be 
		  // at least 16 hex digis 
		  listbox1.CellValueAt(listbox1.LastAddedRowIndex,frameworkColumn) = s
		  
		  s = i64.ProperToHex 
		  // since each hex digit is 4 bits the string return _should_ be 
		  // at least 16 hex digis 
		  listbox1.CellValueAt(listbox1.LastAddedRowIndex,properColumn) = s
		  
		  
		  // ===================================================
		  listbox1.AddRow("UInt64 to oct")
		  s = i64.ToOctal
		  // since each octal digit is 3 bits the string return _should_ be 
		  // at least 22 octal digis 
		  listbox1.CellValueAt(listbox1.LastAddedRowIndex,frameworkColumn) = s
		  
		  s = i64.ProperToOctal
		  // since each octal digit is 3 bits the string return _should_ be 
		  // at least 22 octal digis 
		  listbox1.CellValueAt(listbox1.LastAddedRowIndex,properColumn) = s
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub TestUInt8()
		  Dim s As String
		  
		  Dim i8 As UInt8 = &h0A
		  
		  // ===================================================
		  listbox1.AddRow("UInt8 to bin")
		  // should be an 8 bit value string return but its not
		  s = i8.ToBinary 
		  listbox1.CellValueAt(listbox1.LastAddedRowIndex,frameworkColumn) = s
		  
		  // should be an 8 bit value string return 
		  s = i8.ProperToBinary 
		  listbox1.CellValueAt(listbox1.LastAddedRowIndex,properColumn) = s
		  
		  
		  // ===================================================
		  listbox1.AddRow("UInt8 to hex")
		  s = i8.ToHex 
		  // since each hex digit is 4 bits the string return _should_ be 
		  // at least 2 hex digis (or 8 bits)
		  listbox1.CellValueAt(listbox1.LastAddedRowIndex,frameworkColumn) = s
		  
		  s = i8.ProperToHex 
		  // since each hex digit is 4 bits the string return _should_ be 
		  // at least 2 hex digis (or 8 bits)
		  listbox1.CellValueAt(listbox1.LastAddedRowIndex,properColumn) = s
		  
		  
		  
		  // ===================================================
		  listbox1.AddRow("UInt8 to oct")
		  s = i8.ToOctal
		  // since each octal digit is 3 bits the string return _should_ be 
		  // at least 3 octal digis (or 8 bits)
		  listbox1.CellValueAt(listbox1.LastAddedRowIndex,frameworkColumn) = s
		  
		  
		  s = i8.ProperToOctal
		  // since each octal digit is 3 bits the string return _should_ be 
		  // at least 3 octal digis (or 8 bits)
		  listbox1.CellValueAt(listbox1.LastAddedRowIndex,properColumn) = s
		  
		  
		  
		  
		End Sub
	#tag EndMethod


	#tag Constant, Name = frameworkColumn, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = labelColumn, Type = Double, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant

	#tag Constant, Name = properColumn, Type = Double, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant


#tag EndWindowCode

