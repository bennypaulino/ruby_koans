# Triangle Project Code.

# Triangle analyzes the lengths of the sides of a triangle
# (represented by a, b and c) and returns the type of triangle.
#
# It returns:
#   :equilateral  if all sides are equal
#   :isosceles    if exactly 2 sides are equal
#   :scalene      if no sides are equal
#
# The tests for this method can be found in
#   about_triangle_project.rb
# and
#   about_triangle_project_2.rb
#
def triangle(a, b, c)
  sides = [a, b, c].sort

  raise TriangleError, 'all sides must be > 0' if sides.reduce(:+) <= 0
  raise TriangleError, 'a side cannot be negative' if sides.any?(&:negative?)
  raise TriangleError, 'sum of 2 smaller sides must be > 3rd side' unless (sides[0] + sides[1]) > sides.max

  if (a == b) && (b == c)
    return :equilateral
  elsif (a == b) || (a == c) || (b == c)
    return :isosceles
  else
    :scalene
  end
end

# Error class used in part 2.  No need to change this code.
class TriangleError < StandardError
end
