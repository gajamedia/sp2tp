VERSION 5.00
Object = "{C2000000-FFFF-1100-8200-000000000001}#8.0#0"; "pvnum.ocx"
Begin VB.Form rpt10BlThKab 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Lap 10 Besar Penyakit / Bln & Tahun Kab.Gresik"
   ClientHeight    =   2085
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   5670
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   2085
   ScaleWidth      =   5670
   ShowInTaskbar   =   0   'False
   Begin VB.Frame Frame1 
      Height          =   1815
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   5415
      Begin PVNumericLib.PVNumeric pvNum 
         Height          =   300
         Index           =   0
         Left            =   1080
         TabIndex        =   1
         Top             =   480
         Width           =   1095
         _Version        =   524288
         _ExtentX        =   1931
         _ExtentY        =   529
         _StockProps     =   253
         Text            =   "0"
         ForeColor       =   -2147483640
         BackColor       =   -2147483643
         Appearance      =   1
         Alignment       =   2
         LimitValue      =   -1  'True
         DecimalMax      =   0
      End
      Begin VB.CheckBox chkTahun 
         Caption         =   "Rekap Per Tahun"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   1920
         TabIndex        =   7
         Top             =   1200
         Width           =   1935
      End
      Begin VB.CheckBox chkData 
         Caption         =   "Dengan Grafik"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   120
         TabIndex        =   6
         Top             =   1200
         Width           =   1695
      End
      Begin VB.CommandButton cmdButton 
         Caption         =   "Cetak"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   495
         Left            =   3840
         TabIndex        =   5
         Top             =   1200
         Width           =   1335
      End
      Begin VB.ComboBox cmbData 
         Height          =   315
         Index           =   0
         ItemData        =   "rpt10BlThKab.frx":0000
         Left            =   3480
         List            =   "rpt10BlThKab.frx":0028
         Style           =   2  'Dropdown List
         TabIndex        =   2
         Top             =   480
         Width           =   1575
      End
      Begin VB.Line Line2 
         X1              =   120
         X2              =   5280
         Y1              =   1080
         Y2              =   1080
      End
      Begin VB.Line Line1 
         X1              =   120
         X2              =   5280
         Y1              =   240
         Y2              =   240
      End
      Begin VB.Label Label1 
         AutoSize        =   -1  'True
         Caption         =   "Bulan :"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000002&
         Height          =   240
         Left            =   2760
         TabIndex        =   4
         Top             =   480
         Width           =   690
      End
      Begin VB.Label Label2 
         AutoSize        =   -1  'True
         Caption         =   "Tahun :"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000002&
         Height          =   240
         Left            =   240
         TabIndex        =   3
         Top             =   480
         Width           =   750
      End
   End
End
Attribute VB_Name = "rpt10BlThKab"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim con As New ADODB.Connection
Dim rsdata As New ADODB.Recordset

Option Explicit

Private Sub chkTahun_Click()
 If chkTahun.Value = Unchecked Then
   cmbData(0).Enabled = True
 Else
   cmbData(0).Enabled = False
 End If
End Sub

Private Sub cmbData_Click(Index As Integer)
 Select Case Index
 Case 1
   'Set rsdata = con.Execute("select nama from tbKec " & _
       "where kode='" & Trim(Left(cmbData(1).Text, 3)) & "'")
   'If Not rsdata.EOF Then
   ' txtdata(0).Text = rsdata("nama").Value
   'Else
   ' txtdata(0).Text = "SELURUH KECAMATAN"
   'End If
   'Set rsdata = Nothing
   
   'cmbData(2).Clear
   'Set rsdata = con.Execute("select * from tbPuskesmas " & _
       "where kdKec='" & Trim(Left(cmbData(1).Text, 3)) & "'")
   'cmbData(2).AddItem "N/A"
   'If Not rsdata.EOF Then rsdata.MoveFirst
   'While Not rsdata.EOF
   ' cmbData(2).AddItem rsdata("kode").Value
   ' rsdata.MoveNext
   'Wend
   'Set rsdata = Nothing
   
 Case 2
   'Set rsdata = con.Execute("select nama from tbPuskesmas " & _
       "where kode='" & Trim(cmbData(2).Text) & "'")
   'If Not rsdata.EOF Then
   ' txtdata(1).Text = rsdata("nama").Value
   'Else
   ' txtdata(1).Text = "SELURUH PUSKESMAS"
   'End If
   'Set rsdata = Nothing
 End Select
End Sub

Private Sub cmdButton_Click()
  If chkData.Value = Unchecked Then     'Laporan Tanpa Chart
   noLap = 5
   If chkTahun.Value = Checked Then
    noLap = 9
   End If
  Else                                  'Laporan dg Chart
   noLap = 13                                'Per Bulan/Tahun
   If chkTahun.Value = Checked Then
    noLap = 6                                'Per Tahun
   End If
  End If
  rptForm.Show
End Sub

Private Sub Form_Load()
 pvNum(0).ValueInteger = Year(Date)
 cmbData(0).ListIndex = Month(Date) - 1
 
 'con.CursorLocation = adUseClient
 'con.Open "PROVIDER=Microsoft.Jet.OLEDB.4.0;" & _
             "Data Source=" & App.Path & "\dinkes07.mdb;"
             
 'Set rsdata = con.Execute("select * from tbKec")
 'cmbData(1).AddItem "N/A"
 'If Not rsdata.EOF Then rsdata.MoveFirst
 'While Not rsdata.EOF
 ' cmbData(1).AddItem rsdata("kode").Value & " " & rsdata("nama").Value
 ' rsdata.MoveNext
 'Wend
 'Set rsdata = Nothing
End Sub

Private Sub Form_Unload(Cancel As Integer)
 'con.Close
End Sub
