sub EVENT_SPAWN {
	quest::settimer(2,600);
}

sub EVENT_SAY {
	if ($text=~/trick or treat/i) {
		quest::say("Careful with these, or they'll get stuck in your teeth!");
		quest::summonitem(quest::ChooseRandom(84091,84092,84093,84086,84086,84086,84086,84086,84086)); # Item(s): Sand (84091), Chunk of Coal (84092), Pocket Lint (84093), Caramel Apples (84086), Caramel Apples (84086), Caramel Apples (84086), Caramel Apples (84086), Caramel Apples (84086), Caramel Apples (84086)
                quest::updatetaskactivity(220,5);
	}
}

sub EVENT_TIMER {

	if ($timer == 2) {
		quest::shout("Trick or treat! Smell my feet! Give me something good to eat!");
	}
}
