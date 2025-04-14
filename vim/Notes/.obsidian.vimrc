unmap <Space>

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
" Navigation - Editor
exmap nextheading obcommand quick-snippets-and-navigation:goToNextHeading
nmap ]h :nextheading<CR>
exmap prevheading obcommand quick-snippets-and-navigation:goToPrevHeading
nmap [h :prevheading<CR>
" Navigation - popups
exmap popup obcommand obsidian-hover-editor:open-link-in-new-popover
nmap <Space>Q :popup<CR>

" View
exmap toggleproperties obcommand editor:toggle-fold-properties
nmap <Space>p :toggleproperties<CR>

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
exmap bookmarks obcommand bookmarks-caller:search-bookmarks
nmap <Space>m :bookmarks<CR>
exmap mark obcommand bookmarks:bookmark-current-view
nmap m :mark<CR>
exmap umark obcommand bookmarks:unbookmark-current-view
nmap M :Mark<CR>

" Editing
" Editing - Tasks
exmap togglecheck obcommand editor:toggle-checklist-status
" nmap <Space><Space> :togglecheck<CR>
nmap <Space><Space> :tasknextstatus<CR>
exmap tasknextstatus obcommand obsidian-tasks-plugin:toggle-done
nmap <Space>. :tasknextstatus<CR>
exmap edittask obcommand obsidian-tasks-plugin:edit-task
nmap <Space>/ :edittask<CR>
" Editing - Remove extra braces
nmap <Space>x $F[xf]x<CR>
" Editing - Paste into
vmap <A-p> :pasteinto<CR>

" Obsidian
exmap reload obcommand app:reload
nmap <Space>R :reload<CR>
exmap history obcommand sync:view-version-history
nmap <Space>gl :history<CR>


" Useful commands
" quick-snippets-and-navigation:copyCodeBlock
" quick-snippets-and-navigation:copyNextCodeBlock
" quick-snippets-and-navigation:increaseHeading
" quick-snippets-and-navigation:decreaseHeading
" quick-snippets-and-navigation:insertDefaultCallout
" quick-snippets-and-navigation:insertCodeBlock

" editor:toggle-fold-properties
" editor:open-search
" editor:open-search-replace
" editor:insert-callout
" editor:insert-codeblock

" bookmarks:open
" bookmarks:bookmark-current-view
" bookmarks:unbookmark-current-view
" bookmarks:bookmark-current-section
" bookmarks:bookmark-current-heading

" calendar:show-calendar-view
" quickadd:runQuickAdd

" obsidian-spaced-repetition:srs-note-review-open-note
" obsidian-spaced-repetition:srs-note-review-easy
" obsidian-spaced-repetition:srs-note-review-good
" obsidian-spaced-repetition:srs-note-review-hard
" obsidian-spaced-repetition:srs-review-flashcards
" obsidian-spaced-repetition:srs-cram-flashcards
" obsidian-spaced-repetition:srs-review-flashcards-in-note
" obsidian-spaced-repetition:srs-cram-flashcards-in-note
" obsidian-spaced-repetition:srs-open-review-queue-view