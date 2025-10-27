extends Card
class_name Defend

func _init(guard,name,effect):
		self.value=guard
		self.name=name
		self.e=effect
		self.elist=[]
		self.t='d'
		self.type="Defense"
		self.trigger=0
func block(defender):
	print(defender.name+" blocks for "+str(self.value)+" shield.")
	defender.shield+=self.value
	self.effect.new(defender)
