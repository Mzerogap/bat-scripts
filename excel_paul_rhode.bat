Sub updateFinanceLinks()

    Dim oSld As Slide
    Dim oSh As Shape
    Dim sOldPath As String
    Dim sNewPath As String


    sOldPath = "\\SFOHYP01\Finance\FP&A\2019 Jul LE\"
    sNewPath = "C:\Data\Post Holdings\AN-Finance-TEAM - General\2019 Jul LE\"

    sNewNewPath = "C:\Data\OneDrive - Post Holdings\Documents\Paul Rode - Personal Data"

    On Error GoTo ErrorHandler

    For Each oSld In ActivePresentation.Slides
        For Each oSh In oSld.Shapes
            ' Change only linked OLE objects
            If oSh.Type = msoLinkedOLEObject Then
                On Error Resume Next
                ' Verify that file exists
                If Len(Dir$(Replace(oSh.LinkFormat.SourceFullName, sOldPath, sNewPath))) > 0 Then
                     oSh.LinkFormat.SourceFullName = Replace(oSh.LinkFormat.SourceFullName, sOldPath, sNewPath)
                Else
                      MsgBox("File is missing; cannot relink to a file that isn't present")
                End If
                On Error GoTo ErrorHandler
             End If
        Next    ' shape
    Next    ' slide

    MsgBox("Done!")

NormalExit:
    Exit Sub
ErrorHandler:
    MsgBox("Error " & err.number & vbcrlf & err.description)
    Resume NormalExit

End Sub