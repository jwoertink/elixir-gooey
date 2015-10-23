defmodule Gooey do
  import Widget
  import Seagull

  require Enum
  require String

  def start() do
    f = frame id: :main_frame, title: "Little Gooey", size: {800,600} do
      box :horizontal do
        button id: :btn_one, label: "Button 1", react: [:click]
      end
      # box :horizontal do
      #   button id: :btn_two, label: "Button 2", react: [:click]
      # end
    end
    pid = WindowProcess.spawn_gui f
    reaction pid
  end

  defp reaction(pid) do
    continue = true
    receive_event do
      from pid: ^pid do
        from widget: :main_frame do
          :close->
            IO.puts "You closed frame."
            send pid, :destroy
            continue = false
        end

        from widget: :btn_one do
          :click->
            IO.puts "clicked button 1"
        end
      end
    end
    if continue, do: reaction pid
  end

end
