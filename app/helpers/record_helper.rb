module RecordHelper

  def select_for_normal_question_one_tag(attr)
    # "<h5>问题一：你认为有没有这回事?请选择最符合你想法的一项描述：</h5>".html_safe + select_tag(attr, options_for_select(
    #     [
    #         ["有，这项工作完全由他主导", 5],
    #         ["有，他是这项工作的最重要的参与者", 4],
    #         ["有，但他只是这项工作的参与者之一", 3],
    #         ["不太清楚，不知道这项工作原来还有他", 2],
    #         ["我肯定，这项工作基本与他无关", 1]
    #     ]
    # ))
    "<h5>问题一：你认为有没有这回事？请选择最符合你想法的一项描述：</h5>".html_safe +
        radio_button_tag(attr, 5) + "有，这项工作完全由他主导<br>".html_safe +
        radio_button_tag(attr, 4) + "有，他是这项工作的最重要的参与者<br>".html_safe +
        radio_button_tag(attr, 3) + "有，但他只是这项工作的参与者之一<br>".html_safe +
        radio_button_tag(attr, 2) + "不太清楚，不知道这项工作原来还有他<br>".html_safe +
        radio_button_tag(attr, 1) + "我肯定，这项工作基本与他无关<br>".html_safe
  end

  def select_for_normal_question_two_tag(attr)
    # "<h5>问题二：你认为这项工作他做得怎么样?请选择最符合你想法的一项描述：</h5>".html_safe + select_tag(attr, options_for_select(
    #     [
    #         ["这项工作他做得非常棒，我非常佩服他", 5],
    #         ["这项工作他做得好，我点赞", 4],
    #         ["这项工作他做得还可以，但我认为他还可以做得更好", 3],
    #         ["就这项工作来说，我认为他做得不好", 2],
    #         ["就这项工作，我认为他就是完成个任务, 敷衍了事", 1]
    #     ]
    # ))
    "<h5>问题二：你认为这项工作他做得怎么样？请选择最符合你想法的一项描述：</h5>".html_safe +
        radio_button_tag(attr, 5) + "这项工作他做得非常棒，我非常佩服他<br>".html_safe +
        radio_button_tag(attr, 4) + "这项工作他做得好，我点赞<br>".html_safe +
        radio_button_tag(attr, 3) + "这项工作他做得还可以，但我认为他还可以做得更好<br>".html_safe +
        radio_button_tag(attr, 2) + "就这项工作来说，我认为他做得不好<br>".html_safe +
        radio_button_tag(attr, 1) + "就这项工作，我认为他就是完成个任务，敷衍了事<br>".html_safe
  end

  def select_for_special_question_one_tag(attr)
    # "<h5>问题一：你认为有没有这回事?请选择最符合你想法的一项描述：</h5>".html_safe + select_tag(attr, options_for_select(
    #     [
    #         ["有，这项贡献完全由他主导", 5],
    #         ["有，他是这项贡献的最重要的参与者", 4],
    #         ["有，但他只是这项贡献的参与者之一", 3],
    #         ["有, 但我觉得这不算是一种杰出的贡献", 2],
    #         ["这项贡献跟他没什么关系", 1]
    #     ]
    # ))
    "<h5>问题一：你认为有没有这回事？请选择最符合你想法的一项描述：</h5>".html_safe +
        radio_button_tag(attr, 5) + "这确实是杰出的贡献，并且完全由他主导<br>".html_safe +
        radio_button_tag(attr, 4) + "这确实是杰出的贡献，他是这项贡献的最重要的参与者<br>".html_safe +
        radio_button_tag(attr, 3) + "这确实是贡献，但我觉得一般，这不算是杰出<br>".html_safe +
        radio_button_tag(attr, 2) + "这应该是他工作的一部分，不能说是特别贡献<br>".html_safe +
        radio_button_tag(attr, 1) + "这件事跟他没什么关系<br>".html_safe
  end

  def select_for_special_question_two_tag(attr)
    # "<h5>问题二：你认为这项工作他做得怎么样?请选择最符合你想法的一项描述：</h5>".html_safe + select_tag(attr, options_for_select(
    #     [
    #         ["他做得非常棒，我很佩服他", 5],
    #         ["他做得好，我点赞", 4],
    #         ["他做得还可以，但我认为他还可以做得更好", 3],
    #         ["就这项贡献来说，我认为他做得不好", 2],
    #         ["我认为他就是完成个任务, 不算贡献", 1]
    #     ]
    # ))
    "<h5>问题二：你认为这项工作他做得怎么样？请选择最符合你想法的一项描述：</h5>".html_safe +
        radio_button_tag(attr, 5) + "他做得非常棒，我非常佩服他<br>".html_safe +
        radio_button_tag(attr, 4) + "他做得好，我点赞<br>".html_safe +
        radio_button_tag(attr, 3) + "他做得还可以，但我认为他还可以做得更好<br>".html_safe +
        radio_button_tag(attr, 2) + "就这项贡献来说，我认为他做得不好<br>".html_safe +
        radio_button_tag(attr, 1) + "我觉得他仅是完成个任务而已<br>".html_safe
  end

  def select_for_growup_question_tag(attr)
    # "<h5>问题：你对他所描述的成长的看法是?请选择最符合你想法的一项描述：</h5>".html_safe + select_tag(attr, options_for_select(
    #     [
    #         ["很棒，我觉得他在这一点上确实有很大提高", 5],
    #         ["很好，我觉得他在这一点上有进步", 4],
    #         ["还可以，但我觉得他的进步不如描述的明显", 3],
    #         ["不清楚，可能有，没有明显感受出来", 2],
    #         ["我没有看出来他有这个成长", 1]
    #     ]
    # ))
    "<h5>问题：你对他所描述的成长怎么看？请选择最符合你想法的一项描述：</h5>".html_safe +
        radio_button_tag(attr, 5) + "很棒，我觉得他在这一点上确实有很大提高<br>".html_safe +
        radio_button_tag(attr, 4) + "很好，我觉得他在这一点上有进步<br>".html_safe +
        radio_button_tag(attr, 3) + "我觉得他的进步不如描述的明显<br>".html_safe +
        radio_button_tag(attr, 2) + "不太清楚，没有明显感受出来他有这个成长<br>".html_safe +
        radio_button_tag(attr, 1) + "我觉得这不算是成长<br>".html_safe
  end

end
