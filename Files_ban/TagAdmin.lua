local function TagAd(msg)
local text = msg.content_.text_
if text == 'تفعيل @all' and Owner(msg) then   
redis:del(bot_id..'Tag:Admins'..msg.chat_id_) 
Text = '\n اهلا عزيزي \n تم تفعيل امر @all' 
send(msg.chat_id_, msg.id_,Text) 
end
if text == 'تعطيل @all' and Owner(msg) then  
redis:set(bot_id..'Tag:Admins'..msg.chat_id_,true) 
Text = '\nاهلا عزيزي \n تم تعطيل امر @all' 
send(msg.chat_id_, msg.id_,Text) 
end 
if text == ("@all") and Owner(msg) and not redis:get(bot_id..'Tag:Admins'..msg.chat_id_) then
tdcli_function({ID="GetChannelFull",channel_id_ = msg.chat_id_:gsub('-100','')},function(argg,dataa) 
tdcli_function({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub('-100',''), offset_ = 0,limit_ = dataa.member_count_
},function(ta,NightRang)
x = 0
tags = 0
local list = NightRang.members_
for k, v in pairs(list) do
tdcli_function({ID="GetUser",user_id_ = v.user_id_},function(arg,data)
if x == 5 or x == tags or k == 0 then
tags = x + 5
t = ""
end
x = x + 1
tagname = data.first_name_
tagname = tagname:gsub("[[]","")
t = t..", ["..tagname.."](tg://user?id="..v.user_id_..")"
if x == 5 or x == tags or k == 0 then
local Text = t:gsub(' ,','')
sendText(msg.chat_id_,Text,msg.id_/2097152/0.5,'md')
end
end,nil)
end
end,nil)
end,nil)
end
if text and text:match('@all (.*)') and Owner(msg) and not redis:get(bot_id..'Tag:Admins'..msg.chat_id_) then
tdcli_function({ID="GetChannelFull",channel_id_ = msg.chat_id_:gsub('-100','')},function(argg,dataa) 
tdcli_function({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub('-100',''), offset_ = 0,limit_ = dataa.member_count_
},function(ta,NightRang)
x = 0
tags = 0
local list = NightRang.members_
for k, v in pairs(list) do
tdcli_function({ID="GetUser",user_id_ = v.user_id_},function(arg,data)
if x == 5 or x == tags or k == 0 then
tags = x + 5
t = ""
end
x = x + 1
tagname = data.first_name_
tagname = tagname:gsub("]","")
tagname = tagname:gsub("[[]","")
t = t..", ["..tagname.."](tg://user?id="..v.user_id_..")"
if x == 5 or x == tags or k == 0 then
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendMessage?chat_id=' .. msg.chat_id_ .. '&text=' .. URL.escape(text:match('@all (.*)')..'\n'..t).."&parse_mode=Markdown&reply_to_message_id="..msg_id)
end
end,nil)
end
end,nil)
end,nil)
end

end
return {B = TagAd}