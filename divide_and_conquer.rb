
def pow(base, exponent)
  return 1 if exponent == 0

  base_to_exponent_over_two = pow(base, exponent / 2)

  if exponent % 2 == 0
    return base_to_exponent_over_two * base_to_exponent_over_two
  else
    return base * base_to_exponent_over_two * base_to_exponent_over_two
  end
end

