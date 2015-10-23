defmodule Gooey do
  import Widget

  require Enum
  require String
  require Gooey.Events
  require Gooey.MenuBar

  def start() do
    mb = Gooey.MenuBar.build
    f = frame id: :main_frame, title: "Little Gooey", size: {800,600}, menu_bar: mb do
      box :vertical do
        box :horizontal do
          button id: :btn_one, label: "Button 1", react: [:click]
        end
        box :horizontal do
          button id: :btn_two, label: "Button 2", react: [:click]
        end
      end
    end
    pid = WindowProcess.spawn_gui f
    Gooey.Events.emit pid
  end

end
