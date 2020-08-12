import basic.conventional


/-?
A gyrogroup (G, ⊕) is gyrocommutative if its binary operation obeys the gyrocommutative law
(G6) a ⊕ b = gyr[a, b](b ⊕ a) for all a, b ∈ G.
-/

class gyrocomm_gyrogroup (C : Type) extends has_gyrop C, has_subgyrop C, has_neggyrop C, has_zero C :=
-- axiom 1: 0 ⊕ a = a
(zero_gyro : ∀ (a : C), 0 ⊙ a = a)
-- axiom 2: ⊖a⊕a = 0
(gyr_add_left_neg : ∀ (a : C), ⊝a ⊙ a = 0)
(gyr : C → C → C → C) -- gyr a b c is gyr[a, b]c in the notation from the Wiki
-- axiom 3: ∀ a b c ∈ G, a + (b + c) = (a + b) + gyr a b c
(add_gyr_assoc : ∀ a b c, a ⊙ (b ⊙ c) = (a ⊙ b) ⊙ gyr a b c)
(add_gyr_assoc' : ∀ a b c d, a ⊙ (b ⊙ c) = (a ⊙ b) ⊙ d → d = gyr a b c) -- uniqueness
-- axiom 5: gyr a b = gyr (a + b) b
(gyr_loop : ∀ a b, gyr a b = gyr (a ⊙ b) b)
--axiom 6: a ⊕ b = gyr[a, b](b ⊕ a) for all a, b ∈ G
(gyro_comm: ∀ (a b : C), a ⊙ b = gyr a b (b ⊙ a))
variables (C : Type) [gyrocomm_gyrogroup C]
variables (a b c d : C)
namespace gyrocomm_gyrogroup

axiom gyr_a_b_zero : gyr a b 0 = 0
axiom gyr_distrib : gyr a b (c ⊙ d) = gyr a b c ⊙ gyr a b d

end gyrocomm_gyrogroup