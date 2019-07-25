# Queue
#
# -------------------------------------
# Question
#
# Your task is to write a program which simulates the round-robin scheduling.
#
# -------------------------------------
# Input
#
# n q
# name1 time1
# name2 time2
# ...
# namen timen
#
# In the first line the number of processes n and the quantum q are given separated by a single space.
# In the following n lines, names and times for the n processes are given.
# namei and timei are separated by a single space.
#
# -------------------------------------
# Output
#
# For each process, prints its name and the time the process finished in order.
#
# -------------------------------------
# Constraints
#
# - 1 ≤ n ≤ 100000
# - 1 ≤ q ≤ 1000
# - 1 ≤ timei ≤ 50000
# - 1 ≤ length of namei ≤ 10
# - 1 ≤ Sum of timei ≤ 1000000
#
# -------------------------------------

n, round = gets.split(' ').map(&:to_i)
queue = (0..n-1).map { q = gets.split(' '); [q[0], q[1].to_i] }.to_h

roundtime = 0
finishes = {}

while queue.size != 0 do
  q = queue.shift
  if q[1] <= round
    roundtime += q[1]
    finishes.store(q[0], roundtime)
  else
    roundtime += round
    queue.store(q[0], q[1] - round)
  end
end

finishes.each { |k, v| puts "#{k} #{v}" }
