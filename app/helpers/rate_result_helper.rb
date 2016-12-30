module RateResultHelper

  def show_text(text)
    (text.nil? or text.empty?) ? "&nbsp;&nbsp;".html_safe : text
  end

  def report_merge_cells(sheet, person)
    sheet.merge_cells("B2:E2")
    sheet.merge_cells("B3:E3")
    sheet.merge_cells("B5:E5")
    sheet.merge_cells("B7:E7")
    sheet.merge_cells("B8:B10")
    sheet.merge_cells("C8:E8")
    sheet.merge_cells("C9:E9")
    sheet.merge_cells("C10:E10")
    sheet.merge_cells("B11:B13")
    sheet.merge_cells("C11:E11")
    sheet.merge_cells("C12:E12")
    sheet.merge_cells("C13:E13")
    sheet.merge_cells("B14:B15")
    sheet.merge_cells("C14:E14")
    sheet.merge_cells("C15:E15")

    if person.is_manager
      sheet.merge_cells("B16:B18")
      sheet.merge_cells("C16:E16")
      sheet.merge_cells("C17:E17")
      sheet.merge_cells("C18:E18")
      sheet.merge_cells("B19:B20")
      sheet.merge_cells("C19:E19")
      sheet.merge_cells("C20:E20")

      sheet.merge_cells("B21:E21")
      sheet.merge_cells("B23:E23")
      sheet.merge_cells("D24:E24")
      sheet.merge_cells("B27:E27")
      sheet.merge_cells("B29:E29")

      sheet.merge_cells("D35:E35")
      sheet.merge_cells("B36:E36")

      sheet.merge_cells("B37:B38")
      sheet.merge_cells("C37:C38")
      sheet.merge_cells("D37:D38")

      sheet.merge_cells("B39:E39")
    else
      sheet.merge_cells("B16:E16")
      sheet.merge_cells("B18:E18")
      sheet.merge_cells("B22:E22")
      sheet.merge_cells("B24:E24")

      sheet.merge_cells("D28:E28")
      sheet.merge_cells("B29:E29")

      sheet.merge_cells("B30:B31")
      sheet.merge_cells("C30:C31")
      sheet.merge_cells("D30:D31")

      sheet.merge_cells("B32:E32")
    end
  end

end
