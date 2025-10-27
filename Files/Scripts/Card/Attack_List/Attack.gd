extends Card
class_name Attack

func _init(damage,name,effect,trigger=1):
		self.value=damage
		self.name=name
		self.effect=effect
		self.elist=[]
		self.t='a'
		self.type="Attack"
		self.trigger=trigger
		
func attack(defender,attacker):
		print(attacker.name+" Deals "+str(self.value) +" damage to "+defender.name)
		defender.hurt(self.value*(1-attacker.d_out/100))
		match self.trigger:
			0:
				self._effect(attacker)
			1:
				self._effect(defender)
			2:
				self._effect(attacker)
				self._effect(defender)
