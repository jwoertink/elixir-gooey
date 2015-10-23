defmodule Gooey.MenuBar do
  import Widget

  def build() do
    menu_bar id: :menu_bar, react: [:select] do
      menu "File", id: :file_menu do
        menu_item "First", id: :first_item
        menu_item "Second", id: :second_item
        menu_item "Third", id: :third_item
        menu_item "Fourth", id: :fourth_item
        menu "Submenu", id: :submenu do
          menu_item "Fifth", id: :fifth_item
          menu_item "Sixth", id: :sixth_item
        end
      end
      menu "Help", id: :help_menu, react: [:open, :close, :highlight]
    end
  end

end
