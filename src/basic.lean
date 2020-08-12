import data.real.basic category_theory.endomorphism


noncomputable theory
open_locale classical
universe u

open real
/-?

# The Maths

A groupoid (G, *) is a gyrogroup if its binary operation satisfies the following axioms:

* In G there is at least one element e called a left identity with e * a = a for all a ∈ G.
* For each a ∈ G there is an element a⁻¹ in G called a left inverse of a with a⁻¹ * a = e.
* For any a, b, c in G there exists a unique element gyr[a, b]c in G such that the binary operation obeys the left gyroassociative law: a{\displaystyle \oplus }\oplus (b{\displaystyle \oplus }\oplus c) = (a{\displaystyle \oplus }\oplus b){\displaystyle \oplus }\oplus gyr[a, b]c
The map gyr[a, b]:G → G given by c → gyr[a, b]c is an automorphism of the groupoid (G, {\displaystyle \oplus }\oplus ). That is gyr[a, b] is a member of Aut(G, {\displaystyle \oplus }\oplus ) and the automorphism gyr[a, b] of G is called the gyroautomorphism of G generated by a, b in G. The operation gyr:G × G → Aut(G, {\displaystyle \oplus }\oplus ) is called the gyrator of G.
The gyroautomorphism gyr[a, b] has the left loop property gyr[a, b] = gyr[a{\displaystyle \oplus }\oplus b, b]
The first pair of axioms are like the group axioms. The last pair present the gyrator axioms and the middle axiom links the two pairs.

Since a gyrogroup has inverses and an identity it qualifies as a quasigroup and a loop.

Gyrogroups are a generalization of groups. Every group is an example of a gyrogroup with gyr defined as the identity map.
-/

open category_theory

/-?
Magma, which may be called a groupoid by different people.

A group is a magma (G, +) whose binary operation satisfies the following axioms.
* In G there is at least one element, 0, called a left identity, satisfying 
                                  *(G1) 0+a=a for all a ∈ G*. 
* There is an element 0 ∈ G satisfying axion (G1) such that for each a ∈ G there is 
an element −a ∈ G, called a left inverse of a, satisfying
                                  *(G2) −a + a = 0*
* Moreover, the binary operation obeys the associative law
                                 *(G3) (a + b) + c = a + (b + c) for all a, b, c ∈ G*.

-/
class magma (S : Type) extends has_add S, has_neg S, has_zero S :=
-- axiom 1: ∀ a ∃ 0, 0 + a = a
(zero_add: ∀ (a : S), 0 + a = a)
-- axiom 2: ∀ a ∃ -a, -a + a = 0
(add_left_neg: ∀ (a : S), -a + a = 0)
-- axiom 3: ∀ a b c, (a + b) + c = a + (b + c)
(add_magma_assoc: ∀ (a b c : S), (a + b) + c = a + (b + c)) 

/-?
A loop is a magma (S, +) with an identity element in
which each of the two equations a + x = b and y + a = b for the unknowns x
and y possesses a unique solution.
-/

class loop (S : Type) extends has_add S, has_neg S, has_zero S :=
-- axiom 1: ∀ a ∃ 0, 0 + a = a
(zero_add: ∀ (a : S), 0 + a = a)
-- axiom 2: ∀ a ∃ -a, -a + a = 0
(add_left_neg: ∀ (a : S), -a + a = 0)
(add_right_neg: ∀ (a : S), a + -a = 0)
-- axiom 3: ∀ a b c, (a + b) + c = a + (b + c)
(add_magma_assoc: ∀ (a b c : S), (a + b) + c = a + (b + c)) 

/-
A groupoid (G, ⊕) is a gyrogroup if its binary operation satisfies the following axioms.
* In G there is at least one element, 0, called a left identity, satisfying
(G1) 0⊕a = a for all a ∈ G. 
* There is an element 0 ∈ G satisfying axiom (G1) such that for each a ∈ G there is an element 
⊖a ∈ G, called a left inverse of a, satisfying
(G2) ⊖a⊕a = 0
* Moreover, for any a, b, c ∈ G there exists a unique element gyr[a, b]c ∈ G such that the binary 
operation obeys the left gyroassociative law
(G3) a⊕(b⊕c) = (a⊕b)⊕gyr[a, b]c
* The map gyr[a, b] : G → G given by c 7→ gyr[a, b]c is an automorphism of the groupoid (G, ⊕),
(G4) gyr[a, b] ∈ Aut(G, ⊕)
and the automorphism gyr[a, b] of G is called the gyroautomorphism of G,
generated by a, b ∈ G. The operation gyr : G × G → Aut(G, ⊕) is called
the gyrooperation of G. 
* Finally, the gyroautomorphism gyr[a, b] generated by any a, b ∈ G possesses the left loop property
(G5) gyr[a, b] = gyr[a⊕b, b]
-/

class has_gyrop        (α : Type u) := (gyrop : α → α → α)
class has_neggyrop     (α : Type u) := (neggyrop : α → α → α)
class has_cogyrop      (α : Type u) := (cogyrop : α → α → α)
class has_negcogyrop      (α : Type u) := (negcogyrop : α → α → α)

infix `⊙`:75 := has_gyrop.gyrop
infix `⊝`:75 := has_neggyrop.neggyrop
infix `⊞`:80 := has_cogyrop.cogyrop
infix `⊟`:80 := has_negcogyrop.negcogyrop -- what a long name

--#check has_gyrop


class gyrogroup (G : Type) extends has_gyrop G, has_neggyrop G, has_zero G :=
-- axiom 1: 0 ⊕ a = a
(zero_add : ∀ (a : G), 0 ⊙ a = a)
-- axiom 2: ⊖a⊕a = 0
(add_left_neg : ∀ (a : G), ⊝a ⊙ a = 0)
(gyr : G → G → G → G) -- gyr a b c is gyr[a, b]c in the notation from the Wiki
-- axiom 3: ∀ a b c ∈ G, a + (b + c) = (a + b) + gyr a b c
(add_gyr_assoc : ∀ a b c, a ⊙ (b ⊙ c) = (a ⊙ b) ⊙ gyr a b c)
(add_gyr_assoc' : ∀ a b c d, a ⊙ (b ⊙ c) = (a ⊙ b) ⊙ d → d = gyr a b c) -- uniqueness
-- axiom 5: gyr a b = gyr (a + b) b
(gyr_loop : ∀ a b, gyr a b = gyr (a ⊙ b) b)


-- axiom 4 has been removed and is going to be a seperate function, see below
variables (G : Type) [gyrogroup G]
variables (a b c d : G)
open gyrogroup

-- #check (a : G)

-- axiom 4: gyr a b ∈ Aut(G, ⊕)
axiom gyr_a_b_zero (a b : G): gyr a b 0 = 0
axiom gyr_distrib : gyr a b (c ⊙ d) = gyr a b c ⊙ gyr a b d

/-?
A gyrogroup (G, ⊕) is gyrocommutative if its binary operation obeys the gyrocommutative law
(G6) a ⊕ b = gyr[a, b](b ⊕ a) for all a, b ∈ G.
-/

class gyrocomm_gyrogroup (C : Type) extends has_add C, has_neg C, has_zero C :=
-- axiom 1: 0 ⊕ a = a
(zero_add : ∀ (a : C), 0 + a = a)
-- axiom 2: ⊖a⊕a = 0
(add_left_neg : ∀ (a : C), -a + a = 0)
(gyr : C → C → C → C) -- gyr a b c is gyr[a, b]c in the notation from the Wiki
-- axiom 3: ∀ a b c ∈ G, a + (b + c) = (a + b) + gyr a b c
(add_gyr_assoc : ∀ a b c, a + (b + c) = (a + b) + gyr a b c)
(add_gyr_assoc' : ∀ a b c d, a + (b + c) = (a + b) + d → d = gyr a b c) -- uniqueness
-- axiom 5: gyr a b = gyr (a + b) b
(gyr_loop : ∀ a b, gyr a b = gyr (a + b) b)
--axiom 6: a ⊕ b = gyr[a, b](b ⊕ a) for all a, b ∈ G
(gyro_comm: ∀ (a b : C), a + b = gyr a b (b + a))

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


/-
So what do gyrooperation and cogyrooperation take in as inputs and output?

gyrooperation is my a ⊕ b and cogyrooperation is a ⊞ b = a⊕gyr[a, ⊖b]b 
-/

--def I := gyr 0 0 


/- 001
 Lets start this off easy, well not properly easy but easy enough, hopefully
The maths proof is:
a + b = a + c (by statement)
a⁻¹ + a + b = a⁻¹ + a + c (by adding a⁻¹)
0 + b = 0 + c (by (2) )
b = c (by (1) ) 

-/

lemma gyro_equal : b = c → a ⊙ b = a ⊙ c :=
begin
  intros fbc,
  rw fbc, 
end

/- 
I maybe didn't start off fundemental enough, we know that 0 + a = a,
what about a + 0 = a?
Ahhh... is this true? We dont know that it's commutitive, actually it
isn't commutitive. 
-/

/-
I could literally prove one thing and the gyroautomorphisms have come to bite
me again. Lets try and just sort them out. 
-/

--lemma gyr_a_zero : gyr a 0 = I :=
