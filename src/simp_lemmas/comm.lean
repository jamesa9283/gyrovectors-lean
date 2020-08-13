import basic.conventional basic.comm

variables (C : Type) [gyrocomm_group C]
variables (a b c d : C)

namespace gyrogroup


lemma gyrocomm_equal' : b = c → a ⊙ b = a ⊙ c :=
begin
  intros fbc,
  rw fbc, 
end


/-
a ⊙ b = a ⊙ c
⊝a ⊙ a ⊙ b = ⊝a ⊙ a ⊙ c

-/

lemma zero_gyrop_zero : (0 : C) ⊙ (0 : C) = 0 := by {rw zero_gyro}

lemma gyrocomm_equal : a ⊙ b = a ⊙ c ↔ b = c :=
begin
  split,
  {
    intros fabc,
    have H : ⊝a ⊙ (a ⊙ b) = ⊝a ⊙ (a ⊙ c) := by rw fabc,
    rw [add_gyr_assoc, add_gyr_assoc, gyr_add_left_neg, zero_gyro, zero_gyro] at H,
    cases gyr_bijective (⊝a) a,
    specialize left H,
    apply left,
  },
  {
    intros fbc,
    rw fbc,
  }
end

@[simp] lemma gyr_zero_a_b_eq_b : gyr 0 a b = b :=
begin
  have H : a ⊙ b = 0 ⊙ (a ⊙ b) := by {rw zero_gyro},
  {
    rw [add_gyr_assoc, zero_gyro, gyrocomm_equal] at H,
    exact eq.symm H,
  } 
end

@[simp] lemma gyr_suba_a_b_eq_b : gyr (⊝a) a b = b :=
begin
  rw [gyr_loop, gyr_add_left_neg],
  apply gyr_zero_a_b_eq_b,
end

lemma gyro_zero (a b : C) : a ⊙ (0 : C) = a:=
begin 
    have H : ⊝a ⊙ (a ⊙ 0) = (⊝a ⊙ a) ⊙ gyr (⊝a) a 0 := by {rw add_gyr_assoc},
    rw [gyr_suba_a_b_eq_b, gyr_add_left_neg, zero_gyrop_zero] at H,
    have F : a ⊙ (⊝a ⊙ (a ⊙ 0)) = a ⊙ 0 := by rw H,
    rw [add_gyr_assoc, gyr_add_left_neg, zero_gyro] at H,

    sorry
end

end gyrogroup
