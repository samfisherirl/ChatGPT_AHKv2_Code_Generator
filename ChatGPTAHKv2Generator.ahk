#SingleInstance force       
#Requires Autohotkey v2
#Include convert\JSONS.ahk
#Include convert\ConvertFuncs.ahk

; === Credit ===
; - Credit to the creator of ChatGPT-AutoHotkey-Utility: https://github.com/kdalanon/ChatGPT-AutoHotkey-Utility
; - Credit to the creator of AHK-v2-script-converter: https://github.com/mmikeww/AHK-v2-script-converter

; === Global Variables ===
API_Key := "sk-"
API_Model := "gpt-3.5-turbo"
ChatGPT_Prompt := "Write an AutoHotkey script with verbose and complete class-based and static methods based on the request's parameters."

; === Entry Point ===
FileAppend(ChatGPT() "`n`n`n`n", "ChatGPT.txt")

; === Function: ChatGPT ===
; Description: This function interacts with the OpenAI GPT-3.5 model to generate an AutoHotkey script based on a user request.
; Parameters:
;   - scriptRequest (optional): A user-provided request for the AutoHotkey script. Without a request, the user will be prompted for one.
; Returns: The generated AutoHotkey script as a string.
ChatGPT(scriptRequest?)
{
	global ChatGPT_Prompt
	global HTTP_Request := ComObject("WinHttp.WinHttpRequest.5.1")

	if not IsSet(scriptRequest)
		scriptRequest := UserPrompt()
	ChatGPT_Prompt := ChatGPT_Prompt " Write the autohotkey script all together in one long section, surrounding by ````(ahkcode)````. Cite any and all sources or libraries used. My Request: " scriptRequest
	API_URL := "https://api.openai.com/v1/chat/completions"
	HTTP_Request.open("POST", API_URL, true)
	HTTP_Request.SetRequestHeader("Content-Type", "application/json")
	HTTP_Request.SetRequestHeader("Authorization", "Bearer " API_Key)
	Messages := '{ "role": "user", "content": "' ChatGPT_Prompt '" }'
	JSON_Request := '{ "model": "' API_Model '", "messages": [' Messages '] }'
	HTTP_Request.SetTimeouts(60000, 60000, 60000, 60000)
	HTTP_Request.Send(JSON_Request)
	HTTP_Request.WaitforResponse()
	JMAP := Jsons.Load(&x := HTTP_Request.ResponseText)
	If InStr(HTTP_Request.ResponseText, "``````")
	{
		arrayofMessage := StrSplit(JMAP["choices"][1]["message"]['content'], "``````")
		code := arrayofMessage[2]
		return Convert(arrayofMessage[1] code arrayofMessage[3])
	} else if not InStr(HTTP_Request.ResponseText, "error") {
		Msgbox("No error but no code:. `n`n" HTTP_Request.ResponseText)
		return HTTP_Request.ResponseText
	} else{
		Msgbox("Error when splitting response, potentially there was no request for ahkv2 code. `n`n" HTTP_Request.ResponseText)
		return false
	}
}

UserPrompt(){
	IB := InputBox("Please enter a specification for your AHKv2 Script needs:", "Script", "")
	if IB.Result = "Cancel"
	    return false
	else
	    return IB.Value
}
