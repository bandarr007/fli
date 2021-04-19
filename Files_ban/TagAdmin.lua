local function TagAd(msg)
local text = msg.content_.text_
if text and text == "تفعيل @all" and Owner(msg) then 
database:set(bot_id.."Tag:Admins:"..msg.chat_id_,true)
send(msg.chat_id_, msg.id_,"⌔︙تم تفعيل @all")
end
if text and text == "تعطيل @all" and Owner(msg) then 
database:del(bot_id.."Tag:Admins:"..msg.chat_id_)
send(msg.chat_id_, msg.id_, "⌔︙تم @all")
end

if text == '@all' then
if database:get(bot_id.."Tag:Admins:"..msg.chat_id_) then 
tdcli_function ({ID = "GetChannelFull",channel_id_ = msg.chat_id_:gsub('-100','')},function(arg,b)
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""), offset_ = 0,limit_ = dataa.member_count_ 
},function(a,data)
x = 0
tags = 0
local list = TagAd.members_
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


end
return {B = TagAd}