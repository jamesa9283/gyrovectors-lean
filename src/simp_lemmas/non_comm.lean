import basic.conventional basic.non_comm

variables (G : Type) [gyrogroup G]
variables (a b c d : G)

namespace gyrogroup

@[simp] lemma gyro_equal : b = c → a ⊙ b = a ⊙ c :=
begin
  intros fbc,
  rw fbc, 
end

end gyrogroup