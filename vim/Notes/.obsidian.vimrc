unmap <Space>

imap jk <Esc>`^
imap kj <Esc>`^

set clipboard=unnamed
" Vim
" Vim - Folding
exmap togglefold obcommand editor:toggle-fold
nmap zo :togglefold<CR>
nmap zc :togglefold<CR>
nmap za :togglefold<CR>
exmap unfoldall obcommand editor:unfold-all
nmap zR :unfoldall<CR>
exmap foldall obcommand editor:fold-all
nmap zM :foldall<CR>
" Vim - Tabs
exmap tabnext obcommand workspace:next-tab
nmap gt :tabnext<CR>
exmap tabprev obcommand workspace:previous-tab
nmap gT :tabprev<CR>

" Periodic Notes
" Periodic Notes - Daily
exmap daily obcommand periodic-notes:open-daily-note
exmap dnext obcommand periodic-notes:next-daily-note
exmap dprev obcommand periodic-notes:prev-daily-note
nmap <Space>d :daily<CR>
nmap ]d :dnext<CR>
nmap [d :dprev<CR>
" Periodic Notes - Weekly
exmap weekly obcommand periodic-notes:open-weekly-note
exmap wnext obcommand periodic-notes:next-weekly-note
exmap wprev obcommand periodic-notes:prev-weekly-note
nmap <Space>w :weekly<CR>
nmap ]w :wnext<CR>
nmap [w :wprev<CR>
" Periodic Notes - Monthly
exmap monthly obcommand periodic-notes:open-monthly-note
exmap mnext obcommand periodic-notes:next-monthly-note
exmap mprev obcommand periodic-notes:prev-monthly-note
nmap <Space>m :monthly<CR>
nmap ]m :mnext<CR>
nmap [m :mprev<CR>
" Periodic Notes - Quarterly
exmap quarterly obcommand periodic-notes:open-quarterly-note
exmap qnext obcommand periodic-notes:next-quarterly-note
exmap qprev obcommand periodic-notes:prev-quarterly-note
nmap <Space>q :quarterly<CR>
nmap ]q :qnext<CR>
nmap [q :qprev<CR>
" Periodic Notes - Yearly
exmap yearly obcommand periodic-notes:open-yearly-note
exmap ynext obcommand periodic-notes:next-yearly-note
exmap yprev obcommand periodic-notes:prev-yearly-note
nmap <Space>y :yearly<CR>
nmap ]y :ynext<CR>
nmap [y :yprev<CR>

" Window Management
exmap newtab obcommand workspace:new-tab
nmap <Space>n :newtab<CR>
" Window Management - Splits
exmap split obcommand workspace:split-horizontal
exmap hsplit obcommand workspace:split-horizontal
exmap vsplit obcommand workspace:split-vertical
nmap <Space>% :vsplit<CR>
nmap <Space>" :hsplit<CR>

" Navigation
exmap back obcommand app:go-back
exmap forward obcommand app:go-forward
nmap <Space>h :back<CR>
nmap <Space>l :forward<CR>
" Navigation - Links
exmap follow obcommand editor:follow-link
exmap ftab obcommand editor:open-link-in-new-leaf
exmap fwin obcommand editor:open-link-in-new-window
exmap fwindow obcommand editor:open-link-in-new-window
exmap fsplit obcommand editor:open-link-in-new-split
nmap <Space>b :ftab<CR>
nmap <Space>B :fsplit<CR>
nmap <Space>f :follow<CR>
nmap <Space>W :fwin<CR>

" Notes
exmap new obcommand file-explorer:new-file
exmap move obcommand file-explorer:move-file
exmap duplicate obcommand file-explorer:duplicate-file
nmap <Space>N :new<CR>
nmap <Space>M :move<CR>
nmap <Space>D :duplicate<CR>
exmap close obcommand workspace:close
nmap ZZ :close<CR>
nmap ZO :close<CR>

" Bookmarks
exmap bookmark obcommand bookmarks:bookmark-current-view
nmap M :bookmark<CR>
exmap unbookmark obcommand bookmarks:unbookmark-current-view
nmap <Space>M :unbookmark<CR>
exmap openbookmarks obcommand bookmarks:unbookmark-current-view
nmap <Space>m :openbookmarks<CR>

" Editing
exmap togglecheck obcommand editor:toggle-checklist-status
nmap <Space>c :togglecheck<CR>
nmap <Space><Space> :togglecheck<CR>
" Editing - Remove extra braces
nmap <Space>x $F[xf]x<CR>

" Obsidian
exmap reload obcommand app:reload
nmap <Space>R :reload<CR>
exmap history obcommand sync:view-version-history
nmap <Space>gl :history<CR>
