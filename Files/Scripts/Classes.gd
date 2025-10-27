#extends Node
#
##import copy
#from effects import Effect, effect_dict
#class Card:
	#def __init__(self,ctype="Miscellaneous",ct="m",value=5,name="Plain Card",effect="\"Tastes Bland\"",trigger=0):
		#self.type=ctype
		#self.value=value
		#self.name=name
		#self.e=effect
		#self.elist=[]
		#self.t=ct
		#self.hse=hand_size_e
		#self.trigger=trigger #triggers for 0-user (always for defense); 1-target entity; 2-user AND target entity
		## make triggers for card
		##ex.) strength, chill
		#
	#def effect(self,target):
		#for e in self.elist:
			#match e:
				#case 'bastion': #increases shield effectiveness
					  #target.bastion+=e.value
				#case 'cracked': #decreases shield effectiveness
					#target.cracked+=e.value
				#case 'vulnerable': #increases damage taken
					  #target.vulnerable+=e.value
				#case 'fortify': #decreases damage taken
					#target.fortify+=e.value
				#case 'strength': #increases damage given
					  #target.strength+=e.value
				#case 'weak': #decreases damage given
					#target.weak+=e.value
		#target.apply_effect()
	#def add_effect(self,effect):
		#exists=False
		#if len(self.elist)>=1:
			#for e in self.elist:
				#if e.name==effect.name:
					#e.value+=effect.value
					#exists=True
		#if not exists:
			#self.elist.append(copy.copy(effect))
	#def remove_effect(self,effect):
		#for e in self.elist:
			#if e.name==effect.name:
				#self.elist.remove(e)
				#break
		#
	#def print_card(self):
		#print("Name:",self.name)
		#print(self.type+": "+str(self.value))
		#print("Effect: ",self.e)
		#print("Type:",self.type,"\n")
#class Defend(Card):
	#def __init__(self,guard,name,effect):
		#self.value=guard
		#self.name=name
		#self.e=effect
		#self.elist=[]
		#self.t='d'
		#self.type="Defence"
		#self.trigger=0
	#def block(self,defender):
		#print(defender.name+" blocks for "+str(self.value)+" shield.")
		#defender.shield+=self.value
		#self.effect(defender)
#class Attack(Card):
	#def __init__(self,damage,name,effect,trigger=1):
		#self.value=damage
		#self.name=name
		#self.e=effect
		#self.elist=[]
		#self.t='a'
		#self.type="Attack"
		#self.trigger=trigger
	#def attack(self,defender,attacker):
		#print(attacker.name+" Deals "+str(self.value) +" damage to "+defender.name)
		#defender.hurt(self.value*(1-attacker.d_out/100))
		#match self.trigger:
			#case 0:
				#self.effect(attacker)
			#case 1:
				#self.effect(defender)
			#case 2:
				#self.effect(attacker)
				#self.effect(defender)
		##Trigger effects targeting the defender and attacker respectively
#class Enemy:
	#def __init__(self,name,mhp,deck,d_out=0):
		#self.name=name
		#self.mhp=mhp
		#self.chp=self.mhp
		#self.dpile=[]
		#self.deck=deck
		#self.shield=0
		#self.d_out=1
		#self.dr=1
		#self.bp=1
		#self.cd_out=1
		#self.cdr=1
		#self.cbp=1
		#self.bastion=0
		#self.cracked=0
		#self.vulnerable=0
		#self.fortify=0
		#self.strength=0
		#self.weak=0
	#def apply_effect(self):
		#self.cd_out=self.d_out*(1+(self.strength-self.weak)/100)
		#self.cdr=self.dr*(1+(self.fortify-self.vulnerable)/100)
		#self.cbp=self.bp*(1+(self.bastion-self.cracked)/100)
	#def effect_reduct(self):
		#if self.strength!=0:
			#self.strength-=1
		#if self.weak!=0:
			#self.weak-=1
		#if self.bastion!=0:
			#self.bastion-=1
		#if self.cracked!=0:
			#self.cracked-=1
		#if self.vulnerable!=0:
			#self.vulnerable-=1
		#if self.fortify!=0:
			#self.fortify-=1
	#def shuffle(self):
		#new_deck=self.deck.copy()
		## self.deck.clear()
		#for i in range(len(self.deck)):
			#self.deck[i]=new_deck.pop(random.randrange(len(new_deck))-1)
	#def print_deck(self):
		#print('Deck:')
		#for i in self.deck:
			#i.print_card()
		#if len(self.dpile)!=0:
			#print('Discard Pile:')
			#for i in self.dpile:
				#i.print_card()
		## print(new_deck)
	#def hurt(self,damage_recieve):
		#damage=round(damage_recieve*(self.dr/100))#gets dmg times dmg mult. (mult. can be - for dmg up and + for damage down)
		#damage-=self.shield
		#if damage>=0:
			#self.chp-=damage
		#print(damage)
		#print(self.chp)
	#def info(self):
		#print("\n-----")
		#print("[Name: "+self.name)
		#print("HP: " + str(self.chp)+"/"+str(self.mhp)+"]\n")
		#self.print_deck()
		#print("-----\n")
	#def stat(self):
		#print('Name: '+str(self.name)+'\nHp: '+str(self.chp)+'/'+str(self.mhp)+'\nShield: '+str(self.shield)+'\nDamage Given Mult: '+str(self.d_out)+'\nDamage Taken Mult: '+str(self.dr))
	#def draw(self):
		#draw_left=self.hand_size
		#while draw_left!=0:
		## for i in range(self.hand_size):
			#if len(self.deck)!=0:
				#pick_card=self.deck.pop(0)
				#self.hand.append(pick_card)
				#draw_left-=1
			#else:
				#self.shuffle
		#self.print_deck()
				## self.hand[i].print_card()
	#def print_hand(self):
		#for i in self.hand:
			#i.print_card()
	#def use(self,index,defender):
		#card=self.hand.pop(index)
		#match card.t:
			#case 'a' | 'A':
				#card.attack(defender,self)
			#case 'd' | 'D':
				#card.block(self)
	#def print_effect(self):
		#print('Bastion:',self.bastion)
		#print('Cracked:',self.cracked)
		#print('Strength:',self.strength)
		#print('Weak:',self.weak)
		#print('Vulnerable:',self.vulnerable)
		#print('Fortify:',self.fortify)
#class Character(Enemy):
	## pass
	#def __init__(self,name,size_h=5,deck=[]):
		#self.hand=[]
		#self.hand_size=size_h
		#super(name,100,deck)
		#
	#def draw(self):
		#super().draw()
		## for i in range(self.hand_size):
		##     self.hand.append(self.deck.pop(0))
		#self.show_hand() 
	#def show_hand(self):
		#print("-----")
		#for i in self.hand:
			#print(i.name)
		#print("-----")
#class Stone_Golem(Enemy):
	#def __init__(self):
		#self.name="Golem"
		#self.mhp=250
		#self.chp=self.mhp
		#self.hand=[]
		#self.hand_size=1
		#self.deck=[]
		#self.dpile=[]
		#self.shield=15
		#self.dr=5
		#self.d_out=0
		#
		#self.d_out=1
		#self.dr=1
		#self.bp=1
		#self.cd_out=1
		#self.cdr=1
		#self.cbp=1
		#self.bastion=0
		#self.cracked=0
		#self.vulnerable=0
		#self.fortify=0
		#self.strength=0
		#self.weak=0
		## self.deck=["Attack","Attack","Attack","Attack","Attack","Block","Block","Stone Guard","Armor Crack","Big Attack"]
		#for i in range(4):
			#self.deck.append(Attack(10,"Attack",""))
		#for i in range(2):
			#self.deck.append(Defend(10,"Guard",""))
		#self.deck.append(Defend(8,"Stone Defense","+15% Damage Reduction"))
		#self.deck.append(Attack(8,"Armor Crack","-5 enemy defense"))
		#self.deck.append(Attack(15,"Big Attack","Big Damage"))
		#self.shuffle()
#class Cool_Player(Character):
	#name='Cool Connor'
	#def __init__(self,name):
		#self.name=name
		#self.mhp=100
		#self.chp=self.mhp
		#self.dpile=[]
		#self.deck=[]
		#self.shield=0
		#self.d_out=0
		#self.dr=0
		#self.hand_size=3
		#self.hand=[]
		#
		#self.d_out=1
		#self.dr=1
		#self.bp=1
		#self.cd_out=1
		#self.cdr=1
		#self.cbp=1
		#self.bastion=0
		#self.cracked=0
		#self.vulnerable=0
		#self.fortify=0
		#self.strength=0
		#self.weak=0
		## super(name,3,[])
		#
		#self.deck.append(Attack(20,"Cool Attack","Coolness"))
		#self.deck.append(Attack(20,"Cooler Attack","Extra Coolness"))
		#self.deck.append(Attack(15,"Cool Ranged Attack","Coolness from afar"))
		#self.deck.append(Attack(20,"Chill Attack","Chill"))
		#self.deck.append(Attack(20,"Average Attack","Nothing of note"))
#
#
#cool_connor=Cool_Player("Cool Connor")
## cool_connor.append(Attack(20,"Cool Attack","Coolness"))
## cool_connor.deck.append(Attack(20,"Cooler Attack","Extra Coolness"))
## cool_connor.deck.append(Attack(15,"Cool Ranged Attack","Coolness from afar"))
## cool_connor.deck.append(Attack(20,"Chill Attack","Chill"))
## cool_connor.deck.append(Attack(20,"Average Attack","Nothing of note"))
#Golem=Enemy("Golem",250,[])
#
#coolGolem = Stone_Golem()
#coolGolem.draw()
## coolGolem.info()
#cool_connor.draw()
#
#
#coolGolem.use(0,cool_connor)
## cool_connor.use(0,coolGolem)
## cool_connor.print_deck()
#
## testClass=Effect('Frenzy',1)
