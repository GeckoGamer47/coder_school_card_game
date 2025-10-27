extends Enemy
class_name Stone_Golem

func _init():
		self.name="Golem"
		self.mhp=250
		self.chp=self.mhp
		self.hand=[]
		self.hand_size=1
		self.deck=[]
		self.dpile=[]
		self.shield=15
		self.dr=5
		self.d_out=0
		
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
		for i in range(4):
			self.deck.append(SGolem_Slash.new())
		for i in range(2):
			self.deck.append(SGolem_Guard.new())
		self.deck.append(SGolem_Stone_Defense.new())
		self.deck.append(SGolem_Armor_Crack.new())
		self.deck.append(SGolem_Big_Attack.new())
		self.shuffle()
