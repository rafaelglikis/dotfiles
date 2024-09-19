unmap <Space>

imap jk <Esc>`^
imap kj <Esc>`^

set clipboard=unnamed
" Vim
" Vim - Folding
exmap togglefold obcommand editor:toggle-fold
nmap zo :togglefold
nmap zc :togglefold
nmap za :togglefold
exmap unfoldall obcommand editor:unfold-all
nmap zR :unfoldall
exmap foldall obcommand editor:fold-all
nmap zM :foldall
" Vim - Tabs
exmap tabnext obcommand workspace:next-tab
nmap gt :tabnext
exmap tabprev obcommand workspace:previous-tab
nmap gT :tabprev

" Periodic Notes
" Periodic Notes - Daily
exmap daily obcommand periodic-notes:open-daily-note
exmap dnext obcommand periodic-notes:next-daily-note
exmap dprev obcommand periodic-notes:prev-daily-note
nmap <Space>d :daily
nmap ]d :dnext
nmap [d :dprev
" Periodic Notes - Weekly
exmap weekly obcommand periodic-notes:open-weekly-note
exmap wnext obcommand periodic-notes:next-weekly-note
exmap wprev obcommand periodic-notes:prev-weekly-note
nmap <Space>w :weekly
nmap ]w :wnext
nmap [w :wprev
" Periodic Notes - Monthly
exmap monthly obcommand periodic-notes:open-monthly-note
exmap mnext obcommand periodic-notes:next-monthly-note
exmap mprev obcommand periodic-notes:prev-monthly-note
nmap <Space>m :monthly
nmap ]m :mnext
nmap [m :mprev
" Periodic Notes - Quarterly
exmap quarterly obcommand periodic-notes:open-quarterly-note
exmap qnext obcommand periodic-notes:next-quarterly-note
exmap qprev obcommand periodic-notes:prev-quarterly-note
nmap <Space>q :quarterly
nmap ]q :qnext
nmap [q :qprev
" Periodic Notes - Yearly
exmap yearly obcommand periodic-notes:open-yearly-note
exmap ynext obcommand periodic-notes:next-yearly-note
exmap yprev obcommand periodic-notes:prev-yearly-note
nmap <Space>y :yearly
nmap ]y :ynext
nmap [y :yprev

" Window Management
exmap newtab obcommand workspace:new-tab
nmap <Space>n :newtab
" Window Management - Splits
exmap split obcommand workspace:split-horizontal
exmap hsplit obcommand workspace:split-horizontal
exmap vsplit obcommand workspace:split-vertical
nmap <Space>% :vsplit
nmap <Space>" :hsplit

" Navigation
exmap back obcommand app:go-back
exmap forward obcommand app:go-forward
nmap <Space>h :back
nmap <Space>l :forward
" Navigation - Links
exmap follow obcommand editor:follow-link
exmap ftab obcommand editor:open-link-in-new-leaf
exmap fwin obcommand editor:open-link-in-new-window
exmap fwindow obcommand editor:open-link-in-new-window
exmap fsplit obcommand editor:open-link-in-new-split
nmap <Space>b :ftab
nmap <Space>B :fsplit
nmap <Space>f :follow
nmap <Space>W :fwin

" Notes
exmap new obcommand file-explorer:new-file
exmap move obcommand file-explorer:move-file
exmap duplicate obcommand file-explorer:duplicate-file
nmap <Space>N :new
nmap <Space>M :move
nmap <Space>D :duplicate
exmap close obcommand workspace:close
nmap ZZ :close
nmap ZO :close

" Bookmarks
exmap bookmark obcommand bookmarks:bookmark-current-view
nmap M :bookmark
exmap unbookmark obcommand bookmarks:unbookmark-current-view
nmap <Space>M :unbookmark
exmap openbookmarks obcommand bookmarks:unbookmark-current-view
nmap <Space>m :openbookmarks

" Editing
exmap togglecheck obcommand editor:toggle-checklist-status
nmap <Space>c :togglecheck
nmap <Space><Space> :togglecheck
" Editing - Remove extra braces
nmap <Space>x $F[xf]x

" Obsidian
exmap reload obcommand app:reload
nmap <Space>R :reload
exmap history obcommand sync:view-version-history
nmap <Space>gl :history
