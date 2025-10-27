extends Node
class_name Enemy
var rng=RandomNumberGenerator.new()

func _init(name,mhp,deck,d_out=0):
	self.name=name
	self.mhp=mhp
	self.chp=self.mhp
	self.dpile=[]
	self.deck=deck
	self.shield=0
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
func apply_effect():
		self.cd_out=self.d_out*(1+(self.strength-self.weak)/100)
		self.cdr=self.dr*(1+(self.fortify-self.vulnerable)/100)
		self.cbp=self.bp*(1+(self.bastion-self.cracked)/100)
func effect_reduct():
		if self.strength!=0:
			self.strength-=1
		if self.weak!=0:
			self.weak-=1
		if self.bastion!=0:
			self.bastion-=1
		if self.cracked!=0:
			self.cracked-=1
		if self.vulnerable!=0:
			self.vulnerable-=1
		if self.fortify!=0:
			self.fortify-=1
func shuffle():
		var new_deck=self.deck.copy()
		# self.deck.clear()
		for i in range(len(self.deck)):
			self.deck[i]=new_deck.pop(rng.randrange(len(new_deck))-1)
func print_deck():
		print('Deck:')
		for i in self.deck:
			i.print_card()
		if len(self.dpile)!=0:
			print('Discard Pile:')
			for i in self.dpile:
				i.print_card()
func hurt(damage_recieve):
		var damage=round(damage_recieve*(self.dr/100))#gets dmg times dmg mult. (mult. can be - for dmg up and + for damage down)
		damage-=self.shield
		if damage>=0:
			self.chp-=damage
		print(damage)
		print(self.chp)
func info():
		print("\n-----")
		print("[Name: "+self.name)
		print("HP: " + str(self.chp)+"/"+str(self.mhp)+"]\n")
		self.print_deck()
		print("-----\n")
func stat():
	print('Name: '+str(self.name)+'\nHp: '+str(self.chp)+'/'+str(self.mhp)+'\nShield: '+str(self.shield)+'\nDamage Given Mult: '+str(self.d_out)+'\nDamage Taken Mult: '+str(self.dr))
func draw():
		var draw_left=self.hand_size
		while draw_left!=0:
		# for i in range(self.hand_size):
			if len(self.deck)!=0:
				var pick_card=self.deck.pop(0)
				self.hand.append(pick_card)
				draw_left-=1
			else:
				self.shuffle
		self.print_deck()	
func print_hand():
		for i in self.hand:
			i.print_card()
func use(index,defender):
		var card=self.hand.pop(index)
		match card.t.to_upper():
			'A':
				card.attack(defender,self)
			'D':
				card.block(self)
func print_effect():
		print('Bastion:',self.bastion)
		print('Cracked:',self.cracked)
		print('Strength:',self.strength)
		print('Weak:',self.weak)
		print('Vulnerable:',self.vulnerable)
		print('Fortify:',self.fortify)
