# ChatGPT_AHKv2_Code_Generator
ChatGPT_AHKv2_Code_Generator

# Premise

- ChatGPT generates trash AHK code, relatively speaking.
- It is limited to periods before 2020, and cannot generate AHKv2 consistently. 95% of online AHK content is AHKv1, it will largely pull from those resources.
- AHKv2Converter does an amazing job of taking imperfect AHKv1 code and converting it regardless of bad spacing, bad functions, etc.
- Combining github.com/kdalanon/ChatGPT-AutoHotkey-Utility with github.com/mmikeww/AHK-v2-script-converter brought me this solution.
- Heres the same question with different responses, something that would require multiple libs, outside of docs, multistep, and vague enough to require creativity.

```ahk
; == Credit to creator of ChatGPT-AutoHotkey-Utility @ https://github.com/kdalanon/ChatGPT-AutoHotkey-Utility ==
; == Credit to creator of AHK-v2-script-converter @ https://github.com/mmikeww/AHK-v2-script-converter ==

; === Global Variables ===
API_Key := "sk-"
API_Model := "gpt-3.5-turbo"
ChatGPT_Prompt := "Write an AutoHotkey script with verbose and complete class-based and static methods based on the request's parameters."

; === Examples ===
; Msgbox (ChatGPT()) ; provides input box for user

; Msgbox (ChatGPT("this request is made via params")) 

```

# Test cases

### Prompt "write a winhttp request then comobject strip all html"

Response 1:

```ahk
ahk
; Import required libraries
#Include "<WinHttp.ahk>"

; Create a class for handling the HTTP request
class HttpRequest {
    static StripHtml(url) {
        ; Send a GET request to the specified URL
        whr := ComObject("WinHttp.WinHttpRequest.5.1")
        whr.Open("GET", url)
        whr.Send()

        ; Retrieve the response text
        response := whr.ResponseText

        ; Strip HTML tags using regular expressions
        regex := "<[^>]*>"
        return RegExReplace(response, regex, "")
    }
}

; Example usage
url := "http://example.com"
response := HttpRequest.StripHtml(url)
MsgBox(response)
 ```

Response 2:

```ahk
; Include the AHK HTTP library
#Include "Http.ahk"

class Request
{
    static GetResponse(url)
    {
        HttpObj := ComObject("WinHttp.WinHttpRequest.5.1")
        HttpObj.Open("GET", url)
        HttpObj.Send()
        return HttpObj.ResponseText
    }
}

class HtmlStripper
{
    static StripHTML(html)
    {
        oRegEx := ComObject("VBScript.RegExp")
        oRegEx.Pattern := "<[^>]+>"
        oRegEx.Global := true
        return oRegEx.Replace(html, "")
    }
}

; Usage example
url := "https://www.example.com"
response := Request.GetResponse(url)
strippedText := HtmlStripper.StripHTML(response)
MsgBox(strippedText)


Sources:
- AHK HTTP library: http://www.autohotkey.net/~tank/Day-Download/FileDownload24/include/HTTP.ahk
- WinHttpRequest COM object: https://docs.microsoft.com/en-us/windows/win32/winhttp/winhttprequest-and-ssl
- VBScript.RegExp COM object: https://docs.microsoft.com/en-us/previous-versions/windows/internet-explorer/ie-developer/scripting-articles/ms974570(v=msdn.10)?redirectedfrom=MSDN```


