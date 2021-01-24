#Inktuta #a_confused_exile (296033)

my $say_ready = 1;

sub EVENT_SPAWN {
	quest::set_proximity($x-50,$x+50,$y-50,$y+50);
}

sub EVENT_ENTER {
	quest::emote("grapples with an imaginary opponent. He seems quite convinced that another humanoid is struggling against him.");
	quest::say("Raargh! This worship room is mine, ask Kelekdrix. You'll not take it!");
}

sub EVENT_SAY {
	if ($say_ready) { 
		if ($text=~/awaken me from this nightmare/i) {
			$say_ready = 0;
			quest::settimer("set_ready",30);
			quest::signalwith(296070,296033); #signal zone_status
		} else {
			$say_ready = 0;
			quest::settimer("set_ready",30);
			exile_fail();
		}
	}
}

sub EVENT_TIMER {
	if ($timer eq "set_ready") {
		quest::stoptimer("set_ready");
		$say_ready = 1;
	}
}

sub EVENT_SIGNAL {
	if ($signal == 1) { #success
		quest::emote("blinks and a spark of sanity returns.");
		quest::say("Ah, wha . . . what? How strange. I can see clearly now.");
		quest::say("Thank you for restoring our clarity. Something in this cursed place had stolen away my sanity, and I will not allow it to happen again. Death would be preferable to that endless madness. Be warned, the gateway to the lower reaches of this temple will be unsealed soon. Leave this place before you become mad yourselves!");
	#signal from zone_status saying fail
	} elsif ($signal == 2) {
		exile_fail();
	}
}

sub exile_fail {
      quest::spawn2(296044,0,0,$x+5,$y,$z,$h); # NPC: an_ancient_stonemite
      quest::spawn2(296044,0,0,$x+5,$y+10,$z,$h); # NPC: an_ancient_stonemite
      quest::spawn2(296044,0,0,$x+5,$y-10,$z,$h); # NPC: an_ancient_stonemite
      quest::spawn2(296044,0,0,$x+10,$y-10,$z,$h); # NPC: an_ancient_stonemite
      quest::spawn2(296044,0,0,$x+10,$y+10,$z,$h); # NPC: an_ancient_stonemite
      quest::spawn2(296044,0,0,$x,$y-15,$z,$h); # NPC: an_ancient_stonemite
      quest::spawn2(296044,0,0,$x,$y+15,$z,$h); # NPC: an_ancient_stonemite
      quest::spawn2(296044,0,0,$x+25,$y+25,$z,$h); # NPC: an_ancient_stonemite
      quest::spawn2(296044,0,0,$x+25,$y-25,$z,$h); # NPC: an_ancient_stonemite
      quest::spawn2(296044,0,0,$x+25,$y,$z,$h); # NPC: an_ancient_stonemite
	  }
