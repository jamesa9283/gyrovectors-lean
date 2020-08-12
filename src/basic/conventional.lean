import category_theory.endomorphism


noncomputable theory
open_locale classical
universe u

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


class has_gyrop        (α : Type u) := (gyrop : α → α → α)
class has_subgyrop     (α : Type u) := (subgyrop : α → α → α)
class has_neggyrop     (α : Type u) := (neggyrop : α → α)
class has_cogyrop      (α : Type u) := (cogyrop : α → α → α)
class has_subcogyrop      (α : Type u) := (subcogyrop : α → α → α)
class has_negcogyrop      (α : Type u) := (negcogyrop : α → α)

infix `⊙`:75 := has_gyrop.gyrop
infix `⊝`:75 := has_subgyrop.subgyrop
prefix `⊝`:65 := has_neggyrop.neggyrop
infix `⊞`:80 := has_cogyrop.cogyrop
infix `⊟`:80 := has_subcogyrop.subcogyrop -- what a long name
infix `⊟`:85 := has_negcogyrop.negcogyrop

--#check a ⊝ b



