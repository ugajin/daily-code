# Areas on the Cross-Section Diagram
#
# -------------------------------------
# Question
#
# Your task is to simulate a flood damage.
# For a given cross-section diagram, reports areas of flooded sections.
# 
# Assume that rain is falling endlessly in the region and the water overflowing from the region is falling in the sea at the both sides.
# For example, for the above cross-section diagram, the rain will create floods which have areas of 4, 2, 1, 19 and 9 respectively.
#
# -------------------------------------
# Input
#
# A string, which represents slopes and flatlands by '/', '\' and '_' respectively, is given in a line.
# For example, the region of the above example is given by a string "\\///\_/\/\\\\/_/\\///__\\\_\\/_\/_/\".
#
# -------------------------------------
# Output
#
# Report the areas of floods in the following format:
# A
# k L1 L2 ... Lk
#
# n the first line, print the total area A of created floods.
# In the second line, print the number of floods K and areas Li(i = 1, 2, ..., k) for each flood from the left side of the cross-section diagram.
# Print a space character before Li.
#
# -------------------------------------
# Constraints
#
# 1 ≤ length of the string ≤ 20,000
#
# -------------------------------------

def additable_flood?(after_sections, dup)
  cur_dup = 0
  is_cur = false
  is_dup = false
  after_sections.size.times do |i|
    case after_sections[i]
    when '\\'
      cur_dup -= 1
    when '/'
      cur_dup += 1

      is_dup = true if dup >= 0
      is_cur = true if cur_dup - dup >= 0
    end
  end

  is_dup && is_cur
end

sections = gets
down_steps = []
floods = []
area = 0
step = 0
dup = 0

sections.size.times do |i|
  step += 1
  case sections[i]
  when '\\'
    down_steps << step
    dup += 1

  when '/'
    if down_steps != []
      ds = down_steps.pop
      area += step - ds
      dup -= 1

      if sections[i] == '/' && additable_flood?(sections[i+1..-1], dup)
        floods << area
        area = 0
        down_step = []
        step = 0
        next
      end
    end
  end

  if (dup == 0 && area != 0)
    floods << area
    area = 0
    down_step = []
    step = 0
  end
end

floods << area if area != 0

puts floods.sum
floods.size != 0 ? puts("#{floods.size} #{floods.join(' ')}") : puts('0')
