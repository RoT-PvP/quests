sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Well met, $name.  I am Holly Windstalker, Protector of the Pine.  What brings you out to the Qeynos Hills?  Not hunting, I hope. These stains on my blade are all that is left of the last adventurer I caught harming my bear and wolf friends.");
	}
}

sub EVENT_ITEM {
	#:: Return unused items
	plugin::returnUnusedItems();
}
