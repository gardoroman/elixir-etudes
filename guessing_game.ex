defmodule GuessingGame do

    def start_game() do
        message = "Guess a number from 1 to 100 or type 'q' to quit:  "
        player_input =get_input(message)
        number_to_guess = Enum.random(1..100)
        play_game(player_input, number_to_guess, message)
    end

    defp play_game("q", _, _), do: "Game over"
    defp play_game(number, number, _), do: "You guessed correctly"
    defp play_game(guess, number, message) do
        high_or_low = is_higher_or_lower?(guess, number)
        IO.puts "#{guess} is too #{high_or_low}"
        new_guess = get_input(message)
        play_game(new_guess, number, message)
    end

    defp is_higher_or_lower?(guess, number) when guess > number, do: " high"
    defp is_higher_or_lower?(guess, number) when guess < number, do: " low"

    defp get_input(message) do
        player_input = IO.gets(message) |> String.trim()
        case player_input do
            "q" -> 
                player_input
            "Q" -> 
                "q"
            _ ->
                 String.to_integer(player_input)
        end
    end
end