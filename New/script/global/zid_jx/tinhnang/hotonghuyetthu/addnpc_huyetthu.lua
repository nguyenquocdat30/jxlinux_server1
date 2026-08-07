-------------------------------------------------***Create*By*Heart*Doldly***---------------------------------------------------------------
huyetthu_parserby = {
	{228,121,1987,4477,"\\script\\global\\zid_jx\\tinhnang\\hotonghuyetthu\\npc_tongtieudau.lua","Tæng Tiªu §Çu TriÖu Thiªn Hµo"},
	{308,37,1690,3150,"\\script\\global\\zid_jx\\tinhnang\\hotonghuyetthu\\npc_chaudainhan.lua","Ch©u §¹i Nh©n"},--Bien Kinh
	{308,101,1633,3207,"\\script\\global\\zid_jx\\tinhnang\\hotonghuyetthu\\npc_chaudainhan.lua","Ch©u §¹i Nh©n"},--Dao Huong Thon
	{308,78,1604,3227,"\\script\\global\\zid_jx\\tinhnang\\hotonghuyetthu\\npc_chaudainhan.lua","Ch©u §¹i Nh©n"},--Tuong Duong
	{308,100,1658,3144,"\\script\\global\\zid_jx\\tinhnang\\hotonghuyetthu\\npc_chaudainhan.lua","Ch©u §¹i Nh©n"},--Chu Tien Tran
	{308,11,3061,4991,"\\script\\global\\zid_jx\\tinhnang\\hotonghuyetthu\\npc_chaudainhan.lua","Ch©u §¹i Nh©n"},--Thanh Do
	{308,99,1670,3225,"\\script\\global\\zid_jx\\tinhnang\\hotonghuyetthu\\npc_chaudainhan.lua","Ch©u §¹i Nh©n"},--Vinh Lac
	{308,174,1597,3271,"\\script\\global\\zid_jx\\tinhnang\\hotonghuyetthu\\npc_chaudainhan.lua","Ch©u §¹i Nh©n"},--Long Tuyen Thon
	{308,20,3517,6157,"\\script\\global\\zid_jx\\tinhnang\\hotonghuyetthu\\npc_chaudainhan.lua","Ch©u §¹i Nh©n"},--Giang Tan Thon
	{308,153,1622,3205,"\\script\\global\\zid_jx\\tinhnang\\hotonghuyetthu\\npc_chaudainhan.lua","Ch©u §¹i Nh©n"},--Thach Co Tran
	{308,1,1596,3090,"\\script\\global\\zid_jx\\tinhnang\\hotonghuyetthu\\npc_chaudainhan.lua","Ch©u §¹i Nh©n"},--Phuong Tuong
	{308,162,1640,3214,"\\script\\global\\zid_jx\\tinhnang\\hotonghuyetthu\\npc_chaudainhan.lua","Ch©u §¹i Nh©n"},--Dai Ly
	{308,80,1785,3032,"\\script\\global\\zid_jx\\tinhnang\\hotonghuyetthu\\npc_chaudainhan.lua","Ch©u §¹i Nh©n"},--Duong Chau
	{308,176,1421,3309,"\\script\\global\\zid_jx\\tinhnang\\hotonghuyetthu\\npc_chaudainhan.lua","Ch©u §¹i Nh©n"},--Lam An Nam
	{48,176,1473,3237,"\\script\\global\\zid_jx\\tinhnang\\hotonghuyetthu\\npc_camyve.lua","CÈm Y VÖ"},--Hoang Cung Lam An Nam
}

function add_allnpc_huyetthu()
	huyetthu_huyetthubynpc(huyetthu_parserby)
end

function huyetthu_huyetthubynpc(Tab)
	for i = 1 , getn(Tab) do 
		SId = SubWorldID2Idx(Tab[i][2]);
		if (SId >= 0) then
			npcindex = AddNpc(Tab[i][1],1,SId,Tab[i][3]*32,Tab[i][4]*32,1,Tab[i][6]);
			SetNpcScript(npcindex, Tab[i][5]);
		end;
	end	
end;

