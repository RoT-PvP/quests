sub EVENT_ENTERZONE {
	if ($status < 80) {
		$client->BuffFadeAll();
	}
	$client->Message(13, "You have entered a zone with no PvP level range restrictions."); 
}
