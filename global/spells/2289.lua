-- Ring of Tox
function event_spell_effect(e)
  local client = eq.get_entity_list():GetClientByID(e.caster_id);
  -- If Rof2 client; move them to east commonland ldon camp.
--  if (bit.band(client:GetClientVersionBit(), 4294967264) ~= 0) then
 --   client:MovePC(414, -1172, 1060, 27, 240);
 -- else

  if (client.valid) then
    client:MovePC(98, 751, -1772, 3, 128); -- Zone: erudsxing
  end

 -- end

  return 1;
end
