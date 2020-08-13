import basic.conventional basic.non_comm

/-
(The Gyrogroup Cooperation). Let (G, ⊕) be a gyrogroup. The
gyrogroup cooperation is a second binary operation, ⊞, in G given by the
equation
a ⊞ b = a⊕gyr[a, ⊖b]b (2)
for all a, b ∈ G. The gyrogroup operation, ⊕, is also called a gyrooperation
and, accordingly, the gyrogroup cooperation, ⊞, is also called a cogyrooperation.
Replacing b by ⊖b in(2) we have
a ⊟ b = a⊖gyr[a, b]b
-/

--class cogyro_group (B : Type)




/-
So what do gyrooperation and cogyrooperation take in as inputs and output?

gyrooperation is my a ⊕ b and cogyrooperation is a ⊞ b = a⊕gyr[a, ⊖b]b 
-/

--open gyrogroup

--variables (G : Type) [gyrogroup G]
--variables (a b c d : G)
