sub EVENT_SPAWN {
	quest::gmsay("[$zoneln] Master Yael has been awakened" . "!", 13, 1, 0, 0); 
}


sub EVENT_DEATH {
	quest::gmsay("[$zoneln] Master Yael has been slain by " . ($entity_list->GetMobByID($killer_id) ? $entity_list->GetMobByID($killer_id)->GetCleanName() : "an unknown hand") . ".", 13, 1, 0, 0);
}

