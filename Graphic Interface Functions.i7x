Graphic Interface Functions (for Glulx only) by Mangouste begins here.

"Allows the author to set per-room images and show these as the player moves from room to room. Requires Simple Graphical Window by Emily Short."

Include Graphic Interface by Mangouste.

[A room has a figure-name called room illustration.

An object has a figure-name called object illustration.
	
The location-drawing rule is listed in the carry out looking rules. 

This is the location-drawing rule:
	change current room picture to the room illustration of the location;
	follow the draw location rule.
]

A room has a figure-name called room illustration.
Figure of generic room is the file "genericRoom.png".
The room illustration of a room is usually Figure of generic room.

A person has a figure-name called person illustration.
Figure of character is the file "Character.png".
The person illustration of a person is usually Figure of character.

An object has a figure-name called object illustration.
The object illustration of an object is usually Figure of character.

An object has a figure-name called object illustration.
The object illustration of an object is usually Figure of character.

	
The room display rule is listed in the carry out looking rules. 

This is the room display rule:
	change currently shown picture to the room illustration of the location;
	loc-clear;
	follow the draw locality rule.

Every person has a text called pName.
The pName of a person is usually "????".
Every person has a text called pRank.
The pRank of a person is usually "Civillian".
Every person has a text called pSpecies.
The pSpecies of a person is usually "Unknown species".
Every person has a text called pAffiliation.
The pAffiliation of a person is usually "Unknown Affiliation".

After examining a person (called the guy) (this is the display person rule):	
	follow the desc-clear rule;
	change currently shown picture to the person illustration of the guy;
	follow the draw right desc rule;
	change currently shown picture to the fac-pic of the faction of the guy;
	follow the line draw in desc rule;
	descPrint "[bold type] ";
	descPrint the pName of the guy;
	descPrint "[line break][roman type]";
	descPrint "[line break][bold type][roman type]";
	descPrint the pSpecies of the guy;
	descPrint "[line break][bold type][roman type]";
	[descPrint the appellation of the faction of the guy;]
	descPrint "[line break][bold type][roman type]";
	descPrint the pRank of the guy;
	descPrint "[line break][line break]";
	desc-skipp;
	descPrint "[line break]";
	descPrint the description of the guy.

After examining something (called the object) (this is the display object rule):	
	follow the desc-clear rule;
	change currently shown picture to the object illustration of the object;
	follow the draw right desc rule;
	descPrint "[bold type]";
	descPrint the printed name of the object;
	desc-skipp;
	descPrint the description of the object.


To visutalk to (the guy - a person) with (the words - a sayable value):
	change currently shown picture to the person illustration of the guy;
	follow the draw right desc rule;
	descPrint "[bold type]";
	descPrint the pName of the guy;
	descPrint "[roman type][line break][line break]";
	descPrint the words;
	descPrint "[line break]";
	desc-skipp;
	descPrint "[line break]".


To visusay (the words - a sayable value):
	change currently shown picture to the person illustration of the player;
	follow the draw desc rule;
	descPrint "[bold type]";
	descPrint the pName of the player;
	descPrint "[roman type][line break][line break]";
	descPrint the words;
	descPrint "[line break]";
	desc-skipp;
	descPrint "[line break]".





[Before printing the description of a room: say "Text before the room description";]

[The standard examining rule is not listed in the carry out examining rulebook.
The examine directions rule is not listed in the carry out examining rulebook.
The examine containers rule is not listed in the carry out examining rulebook.
The examine supporters rule is not listed in the carry out examining rulebook.
The examine devices rule is not listed in the carry out examining rulebook.
The examine undescribed things rule is not listed in the carry out examining rulebook.
]

Printing the description of something is an activity.

[Last for printing the description of something (called the chosen item) (this is the default item description printing rule):
	say "Hello";
	[Change the Menu text to the description of the chosen item;]
	TextToMenu.
The default item description printing rule is listed in the carry out looking rules.]

foo is an action applying to nothing. 
Understand "foo" as foo.

Carry out foo:
	say "Foo yourself!".

[

After examining one person (called the guy) (This is the pprint rule):
	[follow the name-clear rule;]
	Change the name-text to the printed name of the guy;
	TextToName;
	follow the desc-clear rule;
	Change the desc text to the description of the guy;
	TextToDesc.
]


Last for printing the description of a room (called the chosen room) (this is the default room description printing rule):
if the description of the chosen room is not "" begin;
	follow the change window rule;
	say the description of the chosen room;
	say line break;
	otherwise;
	say "Error - [The chosen room] lacks a description.";
	end if.


Part Inventory

to say /l: say line break.

instead of taking inventory:
	follow the self-inventory rule.


[after examining yourself:
	follow the self-inventory rule.]


this is the self-inventory rule:
	follow the menu-clear rule;
	say "INVENTORY[/l]";
	if yourself carries something and yourself wears something:
		say "You are carrying: [/l]";
		repeat with item running through things carried by yourself:
			change currently shown picture to the mini-pic of the item;
			follow the draw menu rule;
			say " [item]";
			follow the flush item rule;
		say "[/l]You are wearing: [/l]";
		repeat with item running through things worn by yourself:
			change currently shown picture to the mini-pic of the item;
			follow the draw menu rule;
			say " [item]";
			flush item;
		change window to main;
	otherwise if yourself carries something and yourself wears nothing:
		say "You are carrying: [/l]";
		repeat with item running through things carried by yourself:
			change currently shown picture to the mini-pic of the item;
			follow the draw menu rule;
			say " [item]";
			flush item;
		change window to main;
	otherwise if yourself wears something and yourself carries nothing:
		say "You are wearing: [/l]";
		repeat with item running through things worn by yourself:
			change currently shown picture to the mini-pic of the item;
			follow the draw menu rule;
			say " [item]";
			flush item;
		change window to main;
	otherwise if yourself carries nothing and yourself wears nothing:
		say "You fave nothing.".

After examining one thing (called the object) (This is the oprint rule):
	follow the desc-clear rule;
	descPrint the printed name of the object;
	descPrint "[line break][line break]";
	descPrint the description of the object.

The windowed inventory is a rulebook.

Before taking inventory (This is the print inv in window 1 rule):
	follow the preprint inv in window rule.

This is the preprint inv in window rule:
	menuPrint "INVENTORY[line break]";
	change window to menu.


This is the postprint inv in window rule:
	[now the inventory window is ON;]
	change window to main.



After taking inventory (This is the print inv in window 2 rule):
	follow the postprint inv in window rule.


Every object has a figure name called a mini-pic.
Figure of generic-minipic is the file "mini-object.png".
The mini-pic of an object is usually Figure of generic-minipic.

The inventory window is a kind of thing.
The inventory window can be ON or OFF.
[The inventory is OFF.]

After taking an object (called the object):
	follow the preprint inv in window rule;
	Follow the self-inventory rule;
	follow the oprint rule for the object.

After dropping an object (called the object) (this is the dropClean rule):
	follow the preprint inv in window rule;
	Follow the self-inventory rule.

This is the autoInv rule:
	follow the menu-clear rule;
	follow the preprint inv in window rule;
	follow the print standard inventory rule;
	follow the postprint inv in window rule.

Before going somewhere (this is the close desc rule):
	follow the menu-clear rule;
	follow the desc-clear rule.

Graphic Interface Functions ends here.
