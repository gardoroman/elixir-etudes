defmodule GuessingGame do

    def start_game() do
        player_input = get_input()
        number_to_guess = Enum.random(1..100)
        play_game(player_input, number_to_guess)
    end

    defp play_game("q", _), do: "Game over"
    defp play_game(number, number), do: "You guessed correctly"
    defp play_game(guess, number) do
        high_or_low = is_higher_or_lower?(guess, number)
        IO.puts "#{guess} is too #{high_or_low}"
        new_guess = get_input()
        play_game(new_guess, number)
    end

    defp is_higher_or_lower?(guess, number) when guess > number, do: "high"
    defp is_higher_or_lower?(guess, number) when guess < number, do: "low"

    defp get_input() do
        message = "Guess a number from 1 to 100 or type 'q' to quit:  "
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