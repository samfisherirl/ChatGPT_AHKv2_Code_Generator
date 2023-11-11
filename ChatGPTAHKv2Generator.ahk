#SingleInstance force       
#Requires Autohotkey v2
#Include convert\JSONS.ahk
#Include convert\ConvertFuncs.ahk

; == Credit to creator of ChatGPT-AutoHotkey-Utility @ https://github.com/kdalanon/ChatGPT-AutoHotkey-Utility ==
; == Credit to creator of AHK-v2-script-converter @ https://github.com/mmikeww/AHK-v2-script-converter ==
; 

API_Model  := "gpt-3.5-turbo"
API_Key := "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"
ChatGPT_Prompt := "Write an autohotkey script with verbose and complete class-based and static methods based on the request's parameters."

ChatGPT(scriptRequest)
{
	ChatGPT_Prompt := ChatGPT_Prompt " Write the autohotkey script all together in one long section, surrounding by ````(ahkcode)````. Cite any and all sources or libraries used. "
	API_URL := "https://api.openai.com/v1/chat/completions"
	global HTTP_Request := ComObject("WinHttp.WinHttpRequest.5.1")
	HTTP_Request.open("POST", API_URL, true)
	HTTP_Request.SetRequestHeader("Content-Type", "application/json")
	HTTP_Request.SetRequestHeader("Authorization", "Bearer " API_Key)
	Messages := '{ "role": "user", "content": "' ChatGPT_Prompt '" }'
	JSON_Request := '{ "model": "' API_Model '", "messages": [' Messages '] }'
	HTTP_Request.SetTimeouts(60000, 60000, 60000, 60000)
	HTTP_Request.Send(JSON_Request)
	HTTP_Request.WaitforResponse()
	JMAP := Jsons.Load(&x:=HTTP_Request.ResponseText)
	try {
		arrayofMessage := StrSplit(JMAP["choices"][1]["message"]['content'], "``````")
		code := arrayofMessage[2]
		Msgbox Convert(arrayofMessage[1] code arrayofMessage[3])
	} catch as e {
		Msgbox("Error when splitting response, potentially there was no request for ahkv2 code. `n`n" e.Message)
	}
}
