Attribute VB_Name = "Module1"
Sub 定義された名前をすべて削除する()
  Dim nm As Name

  For Each nm In Names
    nm.Delete
  Next nm
 End Sub

