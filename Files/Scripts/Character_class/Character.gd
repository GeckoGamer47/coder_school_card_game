extends Enemy
class_name Character

func _init(name,size_h=5,deck=[]):
		self.hand=[]
		self.hand_size=size_h
		super(name,100,deck)
func draw():
		super().draw()
		# for i in range(self.hand_size):
		#     self.hand.append(self.deck.pop(0))
		self.show_hand()
func show_hand():
		print("-----")
		for i in self.hand:
			print(i.name)
		print("-----")
