Include("\\script\\global\\nobitaxd\\gm\\admin_auth.lua")

function AdminItem_ProcessLogin()
	if (tbAdminAuth and tbAdminAuth.ProcessLogin) then
		return tbAdminAuth:ProcessLogin()
	end
	return 0
end
