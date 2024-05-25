class GamesController < ApplicationController
  def show
    @win = [1, 2, 3, 4, 5, 6, 7, 8]
    if params[:id] == "medium"
      @win = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]
    elsif params[:id] == "hard"
      @win = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24]
    end
    @new_game = winnable(@win.shuffle)
    @new_game << ""
    @size = Math.sqrt(@new_game.count).to_i
  end
end

private
def winnable(nums)
  count = 0
  for i in 0...nums.count do
    for j in (i+1)..nums.count do
      if nums[j] and nums[i] and nums[i] > nums[j]
        count += 1
      end
    end
  end
  if count % 2 == 0
    return nums
  else
    winnable(nums.shuffle)
  end
end
