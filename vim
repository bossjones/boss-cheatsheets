# ------------------------------------------------
# Leader key
# ------------------------------------------------
# default leader key
/
# remapped leader key (look for :let mapleader = "," in vimrc )
,

# ------------------------------------------------
# File management
# ------------------------------------------------
# reload file
:e
# quit
:q
# quit without saving changes
:q!
# write file
:w
# write new file
:w {file}
# write file and exit
:x

# ------------------------------------------------
# Movement
# ------------------------------------------------
#   k
# h   l         basic motion
#   j

# next start of word
w
# next start of whitespace-delimited word
W
# next end of word
e
# next end of whitespace-delimited word
E
# previous start of word
b
# previous start of whitespace-delimited word
B
# start of line
0
# end of line
$
# go to first line in file
gg
# go to end of file
G
# move down one displayed line
gk
# move up one displayed line
gj


# ------------------------------------------------
# Insertion
#   To exit from insert mode use Esc or Ctrl-C
#   Enter insertion mode and:
# ------------------------------------------------

# append after the cursor
a
# append at the end of the line
A
# insert before the cursor
i
# insert at the beginning of the line
I
# create a new line under the cursor
o
# create a new line above the cursor
O
# enter insert mode but replace instead of inserting chars
R
# insert from file
:r {file}

# ------------------------------------------------
# Editing
# ------------------------------------------------
# undo
u
# yank (copy) a line
yy
# yank text that {motion} moves over
y{motion}
# paste after cursor
p
# paste before cursor
P
# delete a character
<Del> or x
# delete a line
dd
# delete text that {motion} moves over
d{motion}


# ------------------------------------------------
# Search and replace with the `:substitute` (aka `:s`) command
# ------------------------------------------------
# replace the first match of 'foo' with 'bar' on the current line only
:s/foo/bar/
# replace all matches (`g` flag) of 'foo' with 'bar' on the current line only
:s/foo/bar/g
# replace all matches of 'foo' with 'bar' in the entire file (`:%s`)
:%s/foo/bar/g
# ask to manually confirm (`c` flag) each replacement
:%s/foo/bar/gc

# ------------------------------------------------
# Preceding a motion or edition with a number repeats it 'n' times
# ------------------------------------------------
# Examples:
# moves 50 lines up
50k
# deletes 2 words
2dw
# copies 5 lines
5yy
# go to line 42
42G


#     ________  ________   _   ____________  ____     __________  ____________~
#    /_  __/ / / / ____/  / | / / ____/ __ \/ __ \   /_  __/ __ \/ ____/ ____/~
#     / / / /_/ / __/    /  |/ / __/ / /_/ / / / /    / / / /_/ / __/ / __/   ~
#    / / / __  / /___   / /|  / /___/ _, _/ /_/ /    / / / _, _/ /___/ /___   ~
#   /_/ /_/ /_/_____/  /_/ |_/_____/_/ |_/_____/    /_/ /_/ |_/_____/_____/   ~
#
#
#                               Reference Manual~
#
#
#
#
# ==============================================================================

# Open files, directories and bookmarks....................|NERDTree-o|
o
# Open selected file, but leave cursor in the NERDTree.....|NERDTree-go|
go
# Open selected node/bookmark in a new tab.................|NERDTree-t|
t
# Same as 't' but keep the focus on the current tab........|NERDTree-T|
T
# Open selected file in a split window.....................|NERDTree-i|
i
# Same as i, but leave the cursor on the NERDTree..........|NERDTree-gi|
gi
# Open selected file in a new vsplit.......................|NERDTree-s|
s
# Same as s, but leave the cursor on the NERDTree..........|NERDTree-gs|
gs
# Recursively open the selected directory..................|NERDTree-O|
O
# Close the current nodes parent...........................|NERDTree-x|
x
# Recursively close all children of the current node.......|NERDTree-X|
X
# Edit the current dir.....................................|NERDTree-e|
e

# same as |NERDTree-o|.
<CR>
# same as the |NERDTree-o| map.
double-click
# same as |NERDTree-i| for files, same as |NERDTree-e| for dirs.
middle-click

# Delete the current bookmark .............................|NERDTree-D|
D

# Jump to the root node....................................|NERDTree-P|
P
# Jump to current nodes parent.............................|NERDTree-p|
p
# Jump up inside directories at the current tree depth.....|NERDTree-K|
K
# Jump down inside directories at the current tree depth...|NERDTree-J|
J
# Jump down to the next sibling of the current directory...|NERDTree-C-J|
<C-J>
# Jump up to the previous sibling of the current directory.|NERDTree-C-K|
<C-K>

# Change the tree root to the selected dir.................|NERDTree-C|
C
# Move the tree root up one directory......................|NERDTree-u|
u
# Same as 'u' except the old root node is left open........|NERDTree-U|
U
# Recursively refresh the current directory................|NERDTree-r|
r
# Recursively refresh the current root.....................|NERDTree-R|
R
# Display the NERD tree menu...............................|NERDTree-m|
m
# Change the CWD to the dir of the selected node...........|NERDTree-cd|
cd
# Change tree root to the CWD..............................|NERDTree-CD|
CD

# Toggle whether hidden files displayed....................|NERDTree-I|
I
# Toggle whether the file filters are used.................|NERDTree-f|
f
# Toggle whether files are displayed.......................|NERDTree-F|
F
# Toggle whether the bookmark table is displayed...........|NERDTree-B|
B

# Close the NERDTree window................................|NERDTree-q|
q
#maximize/minimize) the NERDTree window.............|NERDTree-A|
A
# the display of the quick help.....................|NERDTree-?|
?
