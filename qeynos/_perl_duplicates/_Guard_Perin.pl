sub EVENT_COMBAT {
	if ($combat_state == 1) {
		my $cur_target = $npc->GetHateTop();
		if($cur_target) {
		my $target_name = $cur_target->GetCleanName();
		quest::say("Time to die $target_name!");
		}
	}
}

sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Hail! My name is Perin. If you had any smarts at all you would be careful who you talk to around here.");
	}
}

sub EVENT_ITEM {
	#:: Return unused items
	plugin::returnUnusedItems();
}
