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

