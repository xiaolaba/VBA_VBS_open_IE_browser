# Opening IE Using C# or VB
testing code snippet  


### uses_IE_browser
no working any more,  
~~if user invoke IE directly, the exe,~~
```
C:\Program Files\Internet Explorer\iexplore.exe
```

### WIN10, Microsoft says IE browser was no longer working if user invoke IE directly
WIN7, no such issue;  
WIN8, no sucb issue;  
WIN10 HOME, 22H2, build 19045.33xx, no such issue;  
WIN10 HOME, 22H2, build 19045.3570, IE is not working;

### VBA to open IE browser,   
always working;
WIN10 HOME, 22H2, build 19045.3570, Windows Feature Experience Pack 1000.19052.1000.0  
testing, done, 2023-NOV-01

```
'ref: https://www.automateexcel.com/vba/automate-internet-explorer-ie-using/

Sub Automate_IE_Load_Page()

' !!!! note : add reference,
' Microsoft HTML object library
' Microsoft Internet Control library

'
' ref, https://www.codeproject.com/Articles/43491/Opening-IE-Using-C-and-Firing-Events
' c#, add COM, shdocvw.dll

'This will load a webpage in IE
    Dim i As Long
    Dim URL As String
    Dim IE As Object
    Dim objElement As Object
    Dim objCollection As Object
 
    'Create InternetExplorer Object
    Set IE = New InternetExplorer  'it is faster ?? ''Microsoft Internet Control library
    'Set IE = CreateObject("InternetExplorer.Application")
 
    'Set IE.Visible = True to make IE visible, or False for IE to run in the background
    IE.Visible = True
 
    'Define URL, the webpage
    'URL = "http://www.st.com/" 'testing ok, 2010
    'URL = "http://atmel.com/" ' testing ok, 2014
    'URL = "http://www.google.com/" 'testing,ok 2015
    'URL = "https://pst.comub.com/" ' change to https, testing ok, 2019
    URL = "https://www.timeanddate.com/worldclock/taiwan/taipei" 'testing, done, 2023-NOV-02
 
    'Navigate to URL
    IE.Navigate URL
 
    ' Statusbar let's user know website is loading
    Application.StatusBar = URL & " is loading. Please wait..."
 
    ' Wait while IE loading...
    'IE ReadyState = 4 signifies the webpage has loaded (the first loop is set to avoid inadvertently skipping over the second loop)
    Do While IE.ReadyState = 4: DoEvents: Loop   'Do While
    Do Until IE.ReadyState = 4: DoEvents: Loop   'Do Until
 
    'Webpage Loaded
    Application.StatusBar = URL & " Loaded"
    
    'Unload IE
    Set IE = Nothing
    Set objElement = Nothing
    Set objCollection = Nothing
    
End Sub


```


### C#, no complete testing yet
Microsoft Web Brower used, not shown, testing pending,  
```
ref : ?
// 2010-SEP

using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

using System.Diagnostics;


namespace csharpIEapp
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
            OpenApplication("www.yahoo.com");
            OpenWithArguments();
            OpenWithStartInfo();

        }

        private void axWebBrowser1_Enter(object sender, EventArgs e)
        {
            OpenApplication("www.google.com");
        }

        /// <summary>
        /// Shell for the sample.
        /// </summary>
        //public class myProcess
       // {
            /// <summary>
            /// Opens the Internet Explorer application.
            /// </summary>
            public void OpenApplication(string myFavoritesPath)
        {
            // Start Internet Explorer. Defaults to the home page.
            Process.Start("IExplore.exe");

            // Display the contents of the favorites folder in the browser.
            Process.Start(myFavoritesPath);

        }

        /// <summary>
        /// Opens urls and .html documents using Internet Explorer.
        /// </summary>
        public void OpenWithArguments()
        {
            // url's are not considered documents. They can only be opened
            // by passing them as arguments.
            Process.Start("IExplore.exe", "www.northwindtraders.com");

            // Start a Web page using a browser associated with .html and .asp files.
            Process.Start("IExplore.exe", "C:\\myPath\\myFile.htm");
            Process.Start("IExplore.exe", "C:\\myPath\\myFile.asp");
        }

        /// <summary>
        /// Uses the ProcessStartInfo class to start new processes, both in a minimized 
        /// mode.
        /// </summary>
        public void OpenWithStartInfo()
        {

            ProcessStartInfo startInfo = new ProcessStartInfo("IExplore.exe");
            startInfo.WindowStyle = ProcessWindowStyle.Minimized;

            Process.Start(startInfo);

            startInfo.Arguments = "www.northwindtraders.com";

            Process.Start(startInfo);

        }

        private void axWebBrowser1_Enter_1(object sender, EventArgs e)
        {
            OpenApplication("www.google.com");
        }
    }


}
}
```



### VBS open IE under Win10 or Win11
看起來是還有其他潛藏的問題.  
試驗過並非 KB5031356 或者 build# 的問題,  
它自動更新到 'Windows 10 家用版 22H2 19045.3636 Windows Feature Experience Pack 1000.19053.1000.0,  
又跳出提示 IE11 斷炊, 選擇不換EDGE瀏覽器, 提示7天後再來提醒  
系統完全沒有替換任何 DLL, 純粹原裝  

一直用的這個 VBS 測試, 都順利開 IE  

```
'2023-NOV-01 testing
'Windows 10 家用版 22H2 19045.3570 Windows Feature Experience Pack 1000.19053.1000.0
'open IE11 is still working

'2023-NOV-03 testing
'Windows 10 家用版 22H2 19045.3636 Windows Feature Experience Pack 1000.19053.1000.0
'open IE11 is still working

Set ie = CreateObject("InternetExplorer.Application")
URL = "www.st.com"
ie.Navigate "about:blank"
ie.Navigate URL
ie.Visible = 1
```
