//pronoun procs, for getting pronouns without using the text macros that only work in certain positions
//datums don't have gender, but most of their subtypes do!
/datum/proc/p_they(capitalized, temp_gender)
	. = "???"
	if(capitalized)
		. = capitalize(.)

/datum/proc/p_their(capitalized, temp_gender)
	. = "???"
	if(capitalized)
		. = capitalize(.)

/datum/proc/p_them(capitalized, temp_gender)
	. = "???"
	if(capitalized)
		. = capitalize(.)

/datum/proc/p_have(temp_gender)
	. = "?????"

/datum/proc/p_are(temp_gender)
	. = "????????"

/datum/proc/p_were(temp_gender)
	. = "????"

/datum/proc/p_do(temp_gender)
	. = "??????"

/datum/proc/p_kon(temp_gender)
	. = "?"

/datum/proc/p_theyve(capitalized, temp_gender)
	. = p_they(capitalized, temp_gender) + "'" + copytext(p_have(temp_gender), 3)

/datum/proc/p_theyre(capitalized, temp_gender)
	. = p_they(capitalized, temp_gender) + "'" + copytext(p_are(temp_gender), 2)

/datum/proc/p_s(temp_gender) //is this a descriptive proc name, or what?
	. = "s"

/datum/proc/p_es(temp_gender)
	. = "es"

//like clients, which do have gender.
/client/p_they(capitalized, temp_gender)
	if(!temp_gender)
		temp_gender = gender
	. = "???"
	switch(temp_gender)
		if(FEMALE)
			. = "???"
		if(MALE)
			. = "??"
	if(capitalized)
		. = capitalize(.)

/client/p_their(capitalized, temp_gender)
	if(!temp_gender)
		temp_gender = gender
	. = "???"
	switch(temp_gender)
		if(FEMALE)
			. = "???"
		if(MALE)
			. = "??"
	if(capitalized)
		. = capitalize(.)

/client/p_them(capitalized, temp_gender)
	if(!temp_gender)
		temp_gender = gender
	. = "???"
	switch(temp_gender)
		if(FEMALE)
			. = "??"
		if(MALE)
			. = "???"
	if(capitalized)
		. = capitalize(.)

/client/p_have(temp_gender)
	if(!temp_gender)
		temp_gender = gender
	. = "?????"
	if(temp_gender == PLURAL || temp_gender == NEUTER)
		. = "?????"

/client/p_are(temp_gender)
	if(!temp_gender)
		temp_gender = gender
	. = "????????"
	if(temp_gender == PLURAL || temp_gender == NEUTER)
		. = "????????"

/client/p_were(temp_gender)
	if(!temp_gender)
		temp_gender = gender
	. = "????"
	if(temp_gender == PLURAL || temp_gender == NEUTER)
		. = "????"

/client/p_do(temp_gender)
	if(!temp_gender)
		temp_gender = gender
	. = "does"
	if(temp_gender == PLURAL || temp_gender == NEUTER)
		. = "do"

/client/p_s(temp_gender)
	if(!temp_gender)
		temp_gender = gender
	if(temp_gender != PLURAL && temp_gender != NEUTER)
		. = "s"

/client/p_es(temp_gender)
	if(!temp_gender)
		temp_gender = gender
	if(temp_gender != PLURAL && temp_gender != NEUTER)
		. = "es"

//mobs(and atoms but atoms don't really matter write your own proc overrides) also have gender!
/mob/p_they(capitalized, temp_gender)
	if(!temp_gender)
		temp_gender = gender
	. = "???"
	switch(temp_gender)
		if(FEMALE)
			. = "???"
		if(MALE)
			. = "??"
		if(PLURAL)
			. = "???"
	if(capitalized)
		. = capitalize(.)

/mob/p_their(capitalized, temp_gender)
	if(!temp_gender)
		temp_gender = gender
	. = "??"
	switch(temp_gender)
		if(FEMALE)
			. = "??"
		if(MALE)
			. = "???"
		if(PLURAL)
			. = "???"
	if(capitalized)
		. = capitalize(.)

/mob/p_them(capitalized, temp_gender)
	if(!temp_gender)
		temp_gender = gender
	. = "??"
	switch(temp_gender)
		if(FEMALE)
			. = "??"
		if(MALE)
			. = "???"
		if(PLURAL)
			. = "???"
	if(capitalized)
		. = capitalize(.)

/mob/p_kon(temp_gender)
	if(!temp_gender)
		temp_gender = gender
	. = "?"
	switch(temp_gender)
		if(FEMALE)
			. = "??"
		if(MALE)
			. = "??"
		if(PLURAL)
			. = "?"

/mob/p_have(temp_gender)
	if(!temp_gender)
		temp_gender = gender
	. = "?????"
	if(temp_gender == PLURAL)
		. = "?????"

/mob/p_are(temp_gender)
	if(!temp_gender)
		temp_gender = gender
	. = "????????"
	if(temp_gender == PLURAL)
		. = "????????"

/mob/p_were(temp_gender)
	if(!temp_gender)
		temp_gender = gender
	. = "???"
	if(temp_gender == PLURAL)
		. = "????"

/mob/p_do(temp_gender)
	if(!temp_gender)
		temp_gender = gender
	. = "??????"
	if(temp_gender == PLURAL)
		. = "??????"

/mob/p_s(temp_gender)
	if(!temp_gender)
		temp_gender = gender
	if(temp_gender != PLURAL)
		. = "s"

/mob/p_es(temp_gender)
	if(!temp_gender)
		temp_gender = gender
	if(temp_gender != PLURAL)
		. = "es"

//humans need special handling, because they can have their gender hidden
/mob/living/carbon/human/p_they(capitalized, temp_gender)
	var/list/obscured = check_obscured_slots()
	var/skipface = (wear_mask && (wear_mask.flags_inv & HIDEFACE)) || (head && (head.flags_inv & HIDEFACE))
	if((SLOT_W_UNIFORM in obscured) && skipface)
		temp_gender = PLURAL
	return ..()

/mob/living/carbon/human/p_their(capitalized, temp_gender)
	var/list/obscured = check_obscured_slots()
	var/skipface = (wear_mask && (wear_mask.flags_inv & HIDEFACE)) || (head && (head.flags_inv & HIDEFACE))
	if((SLOT_W_UNIFORM in obscured) && skipface)
		temp_gender = PLURAL
	return ..()

/mob/living/carbon/human/p_them(capitalized, temp_gender)
	var/list/obscured = check_obscured_slots()
	var/skipface = (wear_mask && (wear_mask.flags_inv & HIDEFACE)) || (head && (head.flags_inv & HIDEFACE))
	if((SLOT_W_UNIFORM in obscured) && skipface)
		temp_gender = PLURAL
	return ..()

/mob/living/carbon/human/p_have(temp_gender)
	var/list/obscured = check_obscured_slots()
	var/skipface = (wear_mask && (wear_mask.flags_inv & HIDEFACE)) || (head && (head.flags_inv & HIDEFACE))
	if((SLOT_W_UNIFORM in obscured) && skipface)
		temp_gender = PLURAL
	return ..()

/mob/living/carbon/human/p_are(temp_gender)
	var/list/obscured = check_obscured_slots()
	var/skipface = (wear_mask && (wear_mask.flags_inv & HIDEFACE)) || (head && (head.flags_inv & HIDEFACE))
	if((SLOT_W_UNIFORM in obscured) && skipface)
		temp_gender = PLURAL
	return ..()

/mob/living/carbon/human/p_were(temp_gender)
	var/list/obscured = check_obscured_slots()
	var/skipface = (wear_mask && (wear_mask.flags_inv & HIDEFACE)) || (head && (head.flags_inv & HIDEFACE))
	if((SLOT_W_UNIFORM in obscured) && skipface)
		temp_gender = PLURAL
	return ..()

/mob/living/carbon/human/p_do(temp_gender)
	var/list/obscured = check_obscured_slots()
	var/skipface = (wear_mask && (wear_mask.flags_inv & HIDEFACE)) || (head && (head.flags_inv & HIDEFACE))
	if((SLOT_W_UNIFORM in obscured) && skipface)
		temp_gender = PLURAL
	return ..()

/mob/living/carbon/human/p_s(temp_gender)
	var/list/obscured = check_obscured_slots()
	var/skipface = (wear_mask && (wear_mask.flags_inv & HIDEFACE)) || (head && (head.flags_inv & HIDEFACE))
	if((SLOT_W_UNIFORM in obscured) && skipface)
		temp_gender = PLURAL
	return ..()

/mob/living/carbon/human/p_es(temp_gender)
	var/list/obscured = check_obscured_slots()
	var/skipface = (wear_mask && (wear_mask.flags_inv & HIDEFACE)) || (head && (head.flags_inv & HIDEFACE))
	if((SLOT_W_UNIFORM in obscured) && skipface)
		temp_gender = PLURAL
	return ..()
