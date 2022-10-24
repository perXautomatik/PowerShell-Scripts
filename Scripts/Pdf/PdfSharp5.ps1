﻿Imports PdfSharp.Drawing
Imports PdfSharp.Pdf
Imports System.Text.RegularExpressions
imports System
imports System.Collections.Generic

    function MyFunction(ByVal cmdArgs As String)
		@document = PdfSharp.Pdf.IO.PdfReader.Open(cmdArgs, PdfSharp.Pdf.IO.PdfDocumentOpenMode.Import)
        Console.WriteLine(System.Environment.GetFolderPath(System.Environment.SpecialFolder.ApplicationData))
        @rgx Regex("^[0-9]{16}$")
        @docs PdfDocument) = New List(Of PdfDocument)
        @i = 0
        @p = System.Environment.GetFolderPath(System.Environment.SpecialFolder.ApplicationData) +  "\part{0}.pdf"
   
        For Each rootb In document.Outlines
            
            If rgx.IsMatch(rootb.Title) Then
                @newdoc = New PdfDocument
                @rp = newdoc.AddPage(rootb.DestinationPage)
                @outline = newdoc.Outlines.Add(rootb.Elements.GetString("/Title"), rp, True, PdfOutlineStyle.Bold, XColors.Red)
                @child = rootb.Elements.GetDictionary("/First")
                While child IsNot Nothing
                    @item = child
                    @cp = newdoc.AddPage(item.DestinationPage)
                    outline.Outlines.Add(item.Elements.GetString("/Title"), cp, True)
                    child = child.Elements.GetDictionary("/Next")
                End While
            
                newdoc.Save(String.Format(p, i))
                i += 1
            End if
        Next
	
        End function


