sub EVENT_SAY
{
if($text=~/Hail/i){quest::say("Greetings $name. When a hero of our world is slain  their soul returns to the place it was last bound and the body is reincarnated. As a member of the Order of Eternity  it is my duty to [bind your soul] to this location if that is your wish.");}
if($text=~/bind my soul/i)
  {
  quest::say("Binding your soul.  You will return here when you die.");
  quest::selfcast(2049);
  }
}

