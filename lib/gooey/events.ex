defmodule Gooey.Events do
  import Seagull

  def emit(pid) do
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

        from widget: :btn_two do
          :click->
            IO.puts "clicked button 2"
        end

        from widget: :first_item do
          :click->
            IO.puts "opened first menu item"
        end
      end
    end
    if continue, do: emit pid
  end
end
