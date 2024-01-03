unmap <Space>

imap jk <Esc>`^
imap kj <Esc>`^

set clipboard=unnamed
" Custom commands
""" Periodic Notes
exmap daily obcommand periodic-notes:open-daily-note
exmap dnext obcommand periodic-notes:next-daily-note
exmap dprev obcommand periodic-notes:prev-daily-note
nmap <Space>pnd :dnext
nmap <Space>ppd :dprev
nmap <Space>pd :daily
exmap weekly obcommand periodic-notes:open-weekly-note
exmap wnext obcommand periodic-notes:next-weekly-note
exmap wprev obcommand periodic-notes:prev-weekly-note
nmap <Space>pw :weekly
nmap <Space>pnw :wnext
nmap <Space>ppw :wprev
exmap monthly obcommand periodic-notes:open-monthly-note
exmap mnext obcommand periodic-notes:next-monthly-note
exmap mprev obcommand periodic-notes:prev-monthly-note
nmap <Space>pm :monthly
nmap <Space>pnm :mnext
nmap <Space>ppm :mprev
exmap quarterly obcommand periodic-notes:open-quarterly-note
exmap qnext obcommand periodic-notes:next-quarterly-note
exmap qprev obcommand periodic-notes:prev-quarterly-note
nmap <Space>pq :quarterly
nmap <Space>pnq :qnext
nmap <Space>ppq :qprev
exmap yearly obcommand periodic-notes:open-yearly-note
exmap ynext obcommand periodic-notes:next-yearly-note
exmap yprev obcommand periodic-notes:prev-yearly-note
nmap <Space>py :yearly
nmap <Space>pny :ynext
nmap <Space>ppy :yprev

""" Workspace
exmap split obcommand workspace:split-horizontal
exmap hsplit obcommand workspace:split-horizontal
exmap vsplit obcommand workspace:split-vertical
exmap newtab obcommand workspace:new-tab
nmap <Space>wv :vsplit
nmap <Space>w% :vsplit
nmap <Space>ws :hsplit
nmap <Space>ws :hsplit
nmap <Space>n :newtab

""" Navigation
exmap follow obcommand editor:follow-link
exmap ftab obcommand editor:open-link-in-new-leaf
exmap fwin obcommand editor:open-link-in-new-window
exmap fwindow obcommand editor:open-link-in-new-window
exmap fsplit obcommand editor:open-link-in-new-split
nmap <Space>b :follow
nmap <Space>B :ftab
nmap <Space>B :fwin
exmap back obcommand app:go-back
exmap forward obcommand app:go-forward
nmap <Space>h :back
nmap <Space>l :forward

""" Notes
exmap new obcommand file-explorer:new-file
exmap move obcommand file-explorer:move-file
exmap duplicate obcommand file-explorer:duplicate-file
nmap <Space>N :new
nmap <Space>M :move
nmap <Space>D :duplicate
exmap close obcommand workspace:close
nmap ZZ :close
nmap ZO :close

""" Editing
exmap togglecheck obcommand editor:toggle-checklist-status
nmap <Space>c :togglecheck
nmap <Space><Space> :togglecheck


""" Obsidian
exmap reload obcommand app:reload
nmap <Space>R :reload
exmap history obcommand sync:view-version-history
nmap <Space>gl :history

" Emulate Folding https://vimhelp.org/fold.txt.html#fold-commands
exmap togglefold obcommand editor:toggle-fold
nmap zo :togglefold
nmap zc :togglefold
nmap za :togglefold

exmap unfoldall obcommand editor:unfold-all
nmap zR :unfoldall

exmap foldall obcommand editor:fold-all
nmap zM :foldall

" Emulate Tab Switching https://vimhelp.org/tabpage.txt.html#gt
" requires Cycle Through Panes Plugins https://obsidian.md/plugins?id=cycle-through-panes
exmap tabnext obcommand workspace:next-tab
nmap gt :tabnext
exmap tabprev obcommand workspace:previous-tab
nmap gT :tabprev
