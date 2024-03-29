sub EVENT_ENTERZONE {
	$client->Message(13, "You have entered a zone with no PvP level range restrictions."); 
}

sub EVENT_CLICKDOOR {
  my $dragonsup = 0;
  if ($entity_list->IsMobSpawnedByNpcTypeID(108053)) { #Xygoz
    $dragonsup++;
  }
  if ($entity_list->IsMobSpawnedByNpcTypeID(108040)) { #Druushk
    $dragonsup++;
  }
  if ($entity_list->IsMobSpawnedByNpcTypeID(108047)) { #Nexona
    $dragonsup++;
  }
  if ($entity_list->IsMobSpawnedByNpcTypeID(108043)) { #Hoshkar
    $dragonsup++;
  }
  if ($entity_list->IsMobSpawnedByNpcTypeID(108050)) { #Silverwing
    $dragonsup++;
  }
  if ($doorid == 56 || $doorid == 57) {
    if ($dragonsup == 0) {
      $client->Message(0,"You got the door open.");
      quest::forcedooropen(56);
      quest::forcedooropen(57);
    }
    else {
      $client->Message(0,"A seal has been placed on this door by Phara Dar. Perhaps there is a way to remove it.");
    }
  }
}