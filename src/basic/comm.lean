import basic.conventional basic.non_comm


/-?
A gyrogroup (G, ⊕) is gyrocommutative if its binary operation obeys the gyrocommutative law
(G6) a ⊕ b = gyr[a, b](b ⊕ a) for all a, b ∈ G.
-/

-- Why does gyr not work anymore when I extend gyrogroup C?!?!?!

class gyrocomm_group (C : Type) extends gyrogroup C :=
--axiom 6: a ⊕ b = gyr[a, b](b ⊕ a) for all a, b ∈ G
(gyro_comm: ∀ (a b : C), a ⊙ b = gyr a b (b ⊙ a))
variables (C : Type) [gyrocomm_group C]
variables (a b c d : C)

lemma gyro_comm : ∀ (a b : C), a ⊙ b = gyrogroup.gyr a b (b ⊙ a) := gyrocomm_group.gyro_comm

def e : C := (0 : C)