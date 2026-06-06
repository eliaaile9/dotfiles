return {
  {
    "lervag/vimtex",
    lazy = false, -- VimTeX si attiva da solo sui file .tex, ma caricarlo subito evita problemi
    init = function()
      -- Scegli il tuo lettore PDF (es. 'zathura', 'skim', o 'general')
      vim.g.vimtex_view_method = "zathura"
      
      -- Dice a VimTeX di compilare automaticamente al salvataggio (:w)
      vim.g.vimtex_compiler_method = "latexmk"
      
      -- Nasconde i tag LaTeX fastidiosi mentre scrivi (es. mostra il testo in grassetto anziché \textbf{testo})
      -- Impostalo a 0 se preferisci vedere sempre tutto il codice sorgente raw
      vim.g.tex_conceal = "abdmg"
    end,
  }
}
