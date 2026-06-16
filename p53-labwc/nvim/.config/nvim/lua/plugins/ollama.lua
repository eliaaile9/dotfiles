return {

  "nomnivore/ollama.nvim",

  dependencies = {

    "nvim-lua/plenary.nvim",

  },


  -- Lazy loading per non rallentare l'avvio di Neovim

  cmd = { "Ollama", "OllamaModel", "OllamaServe", "OllamaServeStop" },


  keys = {

    -- Premi <leader>oo per aprire il menu di Ollama

    {

      "<leader>oo",

      ":<c-u>lua require('ollama').prompt()<cr>",

      desc = "Apri menu Ollama",

      mode = { "n", "v" },

    },

  },


  opts = {

    model = "qwen2.5-coder:3b",

    url = "http://127.0.0.1:11434",


    -- Configurazione dei prompt

    prompts = {

      -- Questo è un prompt custom che abbiamo creato per te

      Riscrivi_e_Sostituisci = {

        prompt = "Riscrivi il seguente codice seguendo rigorosamente queste istruzioni: $input\n\nCodice originale:\n```$ftype\n$sel\n```\nRestituisci SOLO il nuovo codice, senza preamboli, senza spiegazioni e senza markdown block se non strettamente necessario, in modo che sia pronto per l'inserimento.",

        action = "replace", -- Questa è la magia: sostituisce il testo evidenziato

        -- extract = "```$ftype\n(.-)```", -- Estrae solo il codice ignorando il testo attorno

      }

    }

  }

}
