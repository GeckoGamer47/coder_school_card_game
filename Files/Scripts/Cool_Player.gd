extends Character

func _init(name):
	self.name=name
	self.mhp=100
	self.chp=self.mhp
	self.dpile=[]
	self.deck=[]
	self.shield=0
	self.d_out=0
	self.dr=0
	self.hand_size=3
	self.hand=[]
	
	self.d_out=1
	self.dr=1
	self.bp=1
	self.cd_out=1
	self.cdr=1
	self.cbp=1
	self.bastion=0
	self.cracked=0
	self.vulnerable=0
	self.fortify=0
	self.strength=0
	self.weak=0
	
	self.deck.append(Attack.new(20,"Cool Attack","Coolness"))
	self.deck.append(Attack.new(20,"Cooler Attack","Extra Coolness"))
	self.deck.append(Attack.new(15,"Cool Ranged Attack","Coolness from afar"))
	self.deck.append(Attack.new(20,"Chill Attack","Chill"))
	self.deck.append(Attack.new(20,"Average Attack","Nothing of note"))
