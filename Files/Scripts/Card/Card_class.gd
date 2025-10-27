extends Node
class_name Card

func _init(ctype,ct,value,name,effect,trigger):
	self.ctype=ctype
	self.value=value
	self.name=name
	self.effect=effect
	var elist=[]
	var t=ct
	self.trigger=trigger

#func _init(self,ctype="Miscellaneous",ct="m",value=5,name="Plain Card",effect="\"Tastes Bland\"",trigger=0):
	#self.type=ctype
	#self.value=value
	#self.name=name
	#self.e=effect
	#self.elist=[]
	#self.t=ct #ct=card type
	#self.hse=hand_size_e
	#self.trigger=trigger #triggers for 0-user (always for defense); 1-target entity; 2-user AND target entity
	## make triggers for card
	##ex.) strength, chill
	
func _effect(target):
	for e in self.elist:
		match e:
			'bastion': #increases shield effectiveness
					target.bastion+=e.value
			'cracked': #decreases shield effectiveness
				target.cracked+=e.value
			'vulnerable': #increases damage taken
					target.vulnerable+=e.value
			'fortify': #decreases damage taken
				target.fortify+=e.value
			'strength': #increases damage given
					target.strength+=e.value
			'weak': #decreases damage given
				target.weak+=e.value
	target.apply_effect()
func add_effect(effect):
	#adds a status effect to a creature
	var exists=false
	if len(self.elist)>=1:
		for e in self.elist:
			if e.name==effect.name:
				e.value+=effect.value
				exists=true
	if not exists:
		self.elist.append(duplicate(effect))
func remove_effect(effect):
	for e in self.elist:
		if e.name==effect.name:
			self.elist.remove(e)
			break
	
