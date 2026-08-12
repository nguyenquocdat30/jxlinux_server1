tbConfig = {}
tbConfig[1] = --Tèng Kim 1000 §iÓm
{
	nId = 1,
	szMessageType = "FinishSongJin",
	szName = "Tèng Kim Cao CÊp 1000 §iÓm",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckBT_PL_BATTLEPOINT",	{1000,">="} },
		{"PlayerFunLib:CheckTotalLevel",	{120,"",">="} },
	},
	tbActition = 
	{
		
{"PlayerFunLib:GetItem",	{{nExpiredTime=20250729,tbProp={6,1,4401,1,0,0},},50,"[Event] [tTongKim1000]"} },
{"PlayerFunLib:GetItem",	{{nExpiredTime=20250729,tbProp={4,417,1,0,0},},1,"[tien dong] [tTongKim1000]"} },



	},
}
tbConfig[2] = --Tèng Kim 3000 §iÓm
{
	nId = 2,
	szMessageType = "FinishSongJin",
	szName = "Tèng Kim Cao CÊp 3000 §iÓm",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckBT_PL_BATTLEPOINT",	{3000,">="} },
		{"PlayerFunLib:CheckTotalLevel",	{120,"",">="} },
	},
	tbActition = 
	{
{"PlayerFunLib:GetItem",	{{nExpiredTime=20250729,tbProp={6,1,4401,1,0,0},},50,"[Event] [tTongKim3000]"} },
{"PlayerFunLib:GetItem",	{{nExpiredTime=20250729,tbProp={4,417,1,0,0},},3,"[tien dong] [tTongKim3000]"} },

             

	},
}
tbConfig[3] =
{
	nId = 3,
	szMessageType = "Chuanguan",
	szName = "V­ît Qua ¶i 17 Giai §o¹n 1",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"17"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{120,"",">="} },
	},
	tbActition = 
	{
         {"PlayerFunLib:GetItem",	{{nExpiredTime=20250729,tbProp={6,1,4401,1,0,0},},50,"[Event] [tVuotAi17]"} },
         {"PlayerFunLib:GetItem",	{{nExpiredTime=20250729,tbProp={6,1,4413,1,0,0},},3,"[bao ruong do xanh] [tVuotAi17]"} },
  

	},
}
tbConfig[4] =
{
	nId = 4,
	szMessageType = "Chuanguan",
	szName = "V­ît Qua ¶i 28 Giai §o¹n 2",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"28"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{120,"",">="} },
	},
	tbActition = 
	{
     {"PlayerFunLib:GetItem",	{{nExpiredTime=20250729,tbProp={6,1,4401,1,0,0},},50,"[Event] [tVuotAi28]"} },
     {"PlayerFunLib:GetItem",	{{nExpiredTime=20250729,tbProp={6,1,4413,1,0,0},},5,"[bao ruong do xanh] [tVuotAi28]"} },
	
	},
}
tbConfig[5] = --Thñy TÆc §Çu LÜnh
{
	nId = 5,
	szMessageType = "NpcOnDeath",
	szName = "GiÕt ChÕt 1 Thñy TÆc §Çu LÜnh",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckBoatBoss",	{nil} },
		{"PlayerFunLib:CheckTotalLevel",	{120,"",">="} },
	},
	tbActition = 
	{
           {"PlayerFunLib:GetItem",	{{nExpiredTime=20250729,tbProp={6,1,4401,1,0,0},},50,"[Event] [tTieuDietThuyTacDauLinh]"} },
           {"PlayerFunLib:GetItem",	{{nExpiredTime=20250729,tbProp={4,417,1,0,0},},1,"[tien dong] [tTieuDietThuyTacDauLinh]"} },
           {"PlayerFunLib:GetItem",	{{nExpiredTime=20250729,tbProp={6,1,4413,1,0,0},},1,"[bao ruong do xanh] [tTieuDietThuyTacDauLinh]"} },

},
}
tbConfig[6] = --Thñy TÆc §¹i §Çu LÜnh
{
	nId = 6,
	szMessageType = "NpcOnDeath",
	szName = "Tiªu DiÖt Thñy TÆc §¹i §Çu LÜnh",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{120,"",">="} },
		{"NpcFunLib:CheckId",	{"1692"} },
		{"NpcFunLib:CheckInMap",	{"337,338,339"} },
	},
	tbActition = 
	{          
           {"PlayerFunLib:GetItem",	{{nExpiredTime=20250729,tbProp={6,1,4401,1,0,0},},50,"[Event] [tTieuDietThuyTacDaiDauLinh]"} },
           {"PlayerFunLib:GetItem",	{{nExpiredTime=20250729,tbProp={4,417,1,0,0},},3,"[tien dong] [tTieuDietThuyTacDaiDauLinh]"} },
           {"PlayerFunLib:GetItem",	{{nExpiredTime=20250729,tbProp={6,1,4413,1,0,0},},3,"[bao ruong do xanh] [tTieuDietThuyTacDaiDauLinh]"} },           
  
	},
}
tbConfig[7] = --Viªm §Õ
{
	nId = 7,
	szMessageType = "YDBZguoguan",
	szName = "V­ît Qua ¶i Viªm §Õ Thø 10",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {10},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{120,"",">="} },
	},
	tbActition = 
	{
   {"PlayerFunLib:GetItem",	{{nExpiredTime=20240729,tbProp={6,1,4401,1,0,0},},50,"[Event_Quèc TÕ Phô N÷] [tVuotAiViemDe10]"} },
	 	 
	},
}
tbConfig[8] = --Tin Su
{
	nId = 8,
	szMessageType = "FinishMail",
	szName = "Tin Su",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{120,"",">="} },
	},
	tbActition = 
	{        
   {"PlayerFunLib:GetItem",	{{nExpiredTime=20240729,tbProp={6,1,4401,1,0,0},},50,"[Event_Quèc TÕ Phô N÷] [tTinSu10]"} },  
                
	},
}
tbConfig[9] = --V­LMC
{
	nId = 9,
	szMessageType = "FinishVLMC_VNG",
	szName = "Hoµn Thµnh VLMC",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{120,"",">="} },
	},
	tbActition = 
	{          
            {"PlayerFunLib:GetItem",	{{nExpiredTime=20240729,tbProp={6,1,4401,1,0,0},},50,"[Event_Quèc TÕ Phô N÷] [tVLMC]"} },

	},
}
tbConfig[10] = --Boss Hoµng Kim
{
	nId = 10,
	szMessageType = "NpcOnDeath",
	szName = "Tiªu diÖt boss Hoµng Kim",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckWorldBoss",	{nil} },
		{"PlayerFunLib:CheckTotalLevel",	{120,"",">="} },
	},
	tbActition = 
	{
	      {"PlayerFunLib:GetItem",{{nExpiredTime=20240729,tbProp={6,1,4401,1,0,0},},50,"[Event_Quèc TÕ Phô N÷] [tTieuDietBossS¸tThñ]"} },
           {"PlayerFunLib:GetItem",	{{nExpiredTime=20250729,tbProp={6,1,4413,1,0,0},},1,"[bao ruong do xanh] [tTieuDietBossS¸tThñ]"} },
          {"PlayerFunLib:GetItem",	{{tbProp={4,417,1,0,0},},5,"[tien dong] [tTieuDietBossTheGioi]"} },
				
	},
}
tbConfig[11] = --Boss S¸t Thñ
{
	nId = 11,
	szMessageType = "NpcOnDeath",
	szName = "NhiÖm Vô S¸t Thñ CÊp 90",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{120,"",">="} },
		{"NpcFunLib:CheckKillerdBoss",	{90} },
	},
	tbActition = 
	{
	      {"PlayerFunLib:GetItem",{{nExpiredTime=20240729,tbProp={6,1,4401,1,0,0},},50,"[Event_Quèc TÕ Phô N÷] [tTieuDietBossS¸tThñ]"} },
           {"PlayerFunLib:GetItem",	{{nExpiredTime=20250729,tbProp={6,1,4413,1,0,0},},1,"[bao ruong do xanh] [tTieuDietBossS¸tThñ]"} },
          {"PlayerFunLib:GetItem",	{{tbProp={4,417,1,0,0},},1,"[tien dong] [tTieuDietBossTheGioi]"} },

	},
}
tbConfig[12] = --B¶n §å §¸nh Qu¸i Rí Nguyªn LiÖu
{
	nId = 12,
	szMessageType = "NpcOnDeath",
	szName = "B¶n §å §¸nh Qu¸i Rít Ra Nguyªn LiÖu",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	{"PlayerFunLib:CheckTotalLevel",	{120,"",">="} },
	{"NpcFunLib:CheckInMap",	{"321,322,75,227,340,93"} },
	},
	tbActition = 
	{
         {"NpcFunLib:DropSingleItem",	{{nExpiredTime=20240729,tbProp={6,1,4401,1,0,0},},1,"7"} },  
 {"NpcFunLib:DropSingleItem",	{{nExpiredTime=20240729,tbProp={6,1,4407,1,0,0},},1,"7"} },  
	},
}
tbConfig[13] = --§èi tho¹i §¹i ThÇn Tµi
{
	nId = 13,
	szMessageType = "ClickNpc",
	szName = "§èi Tho¹i Npc",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Thiªn Sø"},
	tbCondition = 
	{
	},
	tbActition = 
	{
	    	{"AddDialogOpt",{"GhÐp Vßng Hoa",14} },
		{"AddDialogOpt",{"GhÐp B¸nh Trung Thu",15} },

	},
}
tbConfig[14] = 
{
	nId = 14,
	szMessageType = "CreateCompose",
	szName = "Lµm Vßng Hoa",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Lµm Vßng Hoa",1,1,1,0.02,0,1000},
	tbCondition = 
	{
		{"AddOneMaterial",	{"Hoa cóc vµng",{tbProp={6,1,4402},},1} },
		{"AddOneMaterial",	{"Hoa cóc tr¾ng",{tbProp={6,1,4403},},1} },
		{"AddOneMaterial",	{"Hoa cóc tÝm",{tbProp={6,1,4404},},1} },
		{"AddOneMaterial",	{"Hoa Hång §á",{tbProp={6,1,4405},},1} },
		{"AddOneMaterial",	{"10000 l­îng",{nJxb=10000,},1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{nExpiredTime=20240729,tbProp={6,1,4406,1,0,0},},1,"[Event_Quèc TÕ Phô N÷] [Bã Hoa Tø S¾c]"} },
	},
}
tbConfig[16] = 
{
	nId = 16,
	szMessageType = "CreateCompose",
	szName = "Hép Nguyªn LiÖu",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Hép Nguyªn LiÖu",1,1,1,0.02,0,1000},
	tbCondition = 
	{
		{"PlayerFunLib:CheckFreeBagCell",	{5,"H·y §Ó Trèng 5 ¤ Råi Më"} },
		{"AddOneMaterial",	{" 2 Xu  = 1 Hép Nguyªn LiÖu",{tbProp={4,417,1,1,0,0},},2} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{nExpiredTime=20240729,tbProp={6,1,4401,1,0,0},},1,"[Event_Quèc TÕ Phô N÷] [Hoa Hång §á]"} },
	},
}
tbConfig[20] = 
{
	nId = 20,
	szMessageType = "CreateCompose",
	szName = "Hép Nguyªn LiÖu",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Hép Nguyªn LiÖu",1,1,1,0.02,0,1000},
	tbCondition = 
	{
		{"PlayerFunLib:CheckFreeBagCell",	{5,"H·y §Ó Trèng 5 ¤ Råi Më"} },
		{"AddOneMaterial",	{" 1 KNB  = 5 Hép Nguyªn LiÖu",{tbProp={4,1496,1,1,0,0},},1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{nExpiredTime=20240729,tbProp={6,1,4401,1,0,0},},5,"[Event_Quèc TÕ Phô N÷] [Hoa Hång §á]"} },
	},
}
tbConfig[21] = 
{
	nId = 21,
	szMessageType = "CreateCompose",
	szName = "Mua S÷a t­¬i",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Mua S÷a t­¬i",1,1,1,0.02,0,1000},
	tbCondition = 
	{
		{"PlayerFunLib:CheckFreeBagCell",	{5,"H·y §Ó Trèng 5 ¤ Råi Më"} },
		{"AddOneMaterial",	{" 5 KNb   = 1 S÷a t­¬i",{tbProp={4,1496,1,1,0,0},},5} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,5023,1,0,0},},1,"[Event_Quèc TÕ Phô N÷] [Hoa Hång §á]"} },
	},
}
tbConfig[23] = 
{
	nId = 23,
	szMessageType = "CreateCompose",
	szName = "Mua S÷a t­¬i",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Mua S÷a t­¬i",1,1,1,0.02,0,1000},
	tbCondition = 
	{
		{"PlayerFunLib:CheckFreeBagCell",	{5,"H·y §Ó Trèng 5 ¤ Råi Më"} },
		{"AddOneMaterial",	{" 11 KNb   = 1 B¸nh Kem Trøng Gµ",{tbProp={4,1496,1,1,0,0},},11} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,5024,1,0,0},},1,"[Event_Quèc TÕ Phô N÷] [Hoa Hång §á]"} },
	},
}
tbConfig[15] = 
{
	nId = 15,
	szMessageType = "CreateCompose",
	szName = "Lµm B¸nh ",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Lµm B¸nh",1,1,1,0.02,0,1000},
	tbCondition = 
	{
		{"AddOneMaterial",	{"§­êng",{tbProp={6,1,4408},},1} },
		{"AddOneMaterial",	{"Bét",{tbProp={6,1,4409},},1} },
		{"AddOneMaterial",	{"B¬",{tbProp={6,1,4410},},1} },
		{"AddOneMaterial",	{"S÷a t­¬i",{tbProp={6,1,4411},},1} },
		{"AddOneMaterial",	{"10000 l­îng",{nJxb=10000,},1} },
		{"AddOneMaterial",	{"TiÒn Xu",{tbProp={4,417,1},},1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{nExpiredTime=20240729,tbProp={6,1,4412,1,0,0},},1,"[Event_Quèc TÕ Phô N÷] [Bã Hoa Tø S¾c]"} },
	},
}


tbConfig[22] = 
{
	nId = 30,
	szMessageType = "CreateCompose",
	szName = "Lµm B¸nh kem Sè 1",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Lµm B¸nh kem Sè 1",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"B¸nh Kem Sè 3",{tbProp={6,1,6712,1,0,0},},10} },
              {"AddOneMaterial",	{"B¸nh Kem Sè 2",{tbProp={6,1,6713,1,0,0},},5} },
		{"AddOneMaterial",	{"300000 l­îng",{nJxb=300000,},1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{nExpiredTime=20211231,tbProp={6,1,6714,1,0,0},},1,"[Event_Quèc TÕ Phô N÷] [Giá Hoa Hång]"} },
	},
}

tbConfig[17] = --Sö Dông
{
	nId = 17,
	szMessageType = "ItemScript",
	szName = "Hép Quµ §Æc BiÖt",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2299,1,0,0},}},
	tbCondition = 
	{		
		{"PlayerFunLib:CheckFreeBagCell",	{1,"H·y §Ó Trèng 1 ¤ Råi Më"} },
	},
	tbActition = 
	{
		{"ThisActivity:GioHoaHong", {nil}},
	},
}
tbConfig[18] = --Sö Dông
{
	nId = 18,
	szMessageType = "ItemScript",
	szName = "Giá §ùng Hoa LÔ Bao",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,3125,1,0,0},}},
	tbCondition = 
	{		
		{"PlayerFunLib:CheckFreeBagCell",	{1,"H·y §Ó Trèng 1 ¤ Råi Më"} },
	},
	tbActition = 
	{
		{"ThisActivity:GioDungHoa", {nil}},
	},
}
tbConfig[19] = --Add NPC
{
	nId = 19,
	szMessageType = "ServerStart",
	szName = "Khi Khëi §éng Server SÏ T¶i Npc",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:AddInitNpc",	{nil} },
	},
}
tbConfig[24] = --Tèng Kim 6000 §iÓm
{
	nId = 2,
	szMessageType = "FinishSongJin",
	szName = "Tèng Kim Cao CÊp 6000 §iÓm",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckBT_PL_BATTLEPOINT",	{6000,">="} },
		{"PlayerFunLib:CheckTotalLevel",	{120,"",">="} },
	},
	tbActition = 
	{
{"PlayerFunLib:GetItem",	{{nExpiredTime=20250729,tbProp={6,1,4401,1,0,0},},50,"[Event] [tTongKim6000]"} },
{"PlayerFunLib:GetItem",	{{nExpiredTime=20250729,tbProp={4,417,1,0,0},},6,"[tien dong] [tTongKim6000]"} },

             

	},
}

