import basic.conventional basic.comm tactic

variables (C : Type) [gyrocomm_gyrogroup C]
variables (a b c d : C)

namespace gyrocomm_gyrogroup

@[simp] lemma gyrocomm_equal' : b = c → a ⊙ b = a ⊙ c :=
begin
  intros fbc,
  rw fbc, 
end


lemma gyrocomm_equal : a ⊙ b = a ⊙ c → b = c :=
begin
  intros fabc,
  rw ←zero_gyro (a⊙b) at fabc,
  sorry
  --have H: ⊝a ⊙ (a ⊙ b) = ⊝a ⊙ (a ⊙ c),
end


lemma gyr_a_zero_eq_zero (c : C): gyr a (0 : C) b = b :=
begin
  have H : a ⊙ b = 0 ⊙ (a ⊙ b),
  {rw zero_gyro},
  {rw add_gyr_assoc at H,
   rw zero_gyro a at H,
   sorry
  }
end

lemma gyro_zero : a ⊙ (0 : C) = a :=
begin
  rw gyro_comm,
  rw zero_gyro,
  sorry
end

lemma subgyro_eq_neggyro : a⊝b = a⊙(⊝b) :=
begin
  sorry
end



end gyrocomm_gyrogroup