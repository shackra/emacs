;;; tools/shackra:lsp-tailwindcss/doctor.el -*- lexical-binding: t; -*-

(unless (executable-find "rustywind")
  (warn! "rustywind isn't installed. run: yarn global add rustywind"))
