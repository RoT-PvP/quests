function event_say(e)
    -- if the player has spoken with Seta Bakindo, then the databucket will be set
    if(eq.get_data("tomers_rescue") == "started") then
    	if(e.message:findi("hail")) then
    		e.self:Say("Arrgggghhh...Those mangy [dogs] put up a tough fight...if I don't make it back to the [Clan House] soon, it'll all be over for me.");
    	elseif(e.message:findi("dogs") or (e.message:findi("mutts"))) then
    		e.self:Say("It's those Darkpaws...they've beat me pretty badly...but they'll get theirs soon enough!");
        elseif(e.message:findi("clan house")) then
            e.self:Say("I am a new member of the Silent Fist Clan...I need someone from my guild to help me find my way back.");
        elseif(e.message:findi("seta sent me")) then
    		e.self:Say("Oh! Thank goodness you found me...I'm lost and weak, those [mutts] are a vicious lot...can you carry my [backpack] for me?");
        elseif(e.message:findi("backpack")) then
            e.self:Say("Thank you, friend... Now, can you [lead me back] to Master Seta of the Silent Fist Clan?");
            e.other:SummonItem(20459); -- Item: Tomer's Bag of Provisions
        elseif(e.message:findi("lead you back")) then
            e.self:Say("Lead the way, and I shall follow. When we make it back, please inform Seta that you have rescued me.");
            -- tell Tomer to follow
    		eq.follow(e.other:GetID(), 10);           
        end
    else 
        -- player has not spoken with Seta Bakindo 
        if(e.message:findi("hail")) then
            e.self:Emote("seems too weak to speak.");
        end
    end
    -- player has spoken with Seta Bakindo after completing rescue
    if(eq.get_data("tomers_rescue") == "finished") then
    	if(e.message:findi("hail") or (e.message:findi("young tomer"))) then
    		e.self:Say(string.format("Yes, %s saved my life...I owe them much thanks. Please return my pack to me now, good friend.",e.other:GetName()));
        end
    end
end

function event_trade(e)
    local item_lib = require("items");

     if((item_lib.check_turn_in(e.trade, {item1 = 20459})) and (eq.get_data("tomers_rescue") == "finished")) then -- Item: Tomer's Bag of Provisions
      		e.self:Say("Oh, you have the makings of a true hero! The Silent Fist Clan is proud to have you as ally. May your soul guide and protect you through these chaotic times.");
      		e.other:Ding();
      		e.other:Faction(309,35,0); -- Faction: Silent Fist Clan
      		e.other:Faction(262,5,0); -- Faction: Guards of Qeynos
      		e.other:Faction(361,1,0); -- Faction: Ashen Order
      		e.other:AddEXP(100);
            -- clear databucket key and have Tomer stop following
            eq.delete_data("tomers_rescue");
            eq.stop_follow();
    end
    item_lib.return_items(e.self, e.other, e.trade)
end