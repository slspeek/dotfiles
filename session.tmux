new  -s Gotube -n Vim 'cd ~/projs/nog/src/github.com/slspeek/gotube/ && vim .'
split-window -d 'cd ~/projs/nog/src/github.com/slspeek/gotube/web && karma start --singleRun=false'
resize-pane -D 26

neww -n Server 'cd ~/projs/nog/; bash -i'

neww -n Grunt 'cd ~/projs/nog/src/github.com/slspeek/gotube/web/; bash -i' 

neww -n GoTest  'cd ~/projs/nog/; bash -i'

neww -n Protractor 'cd ~/projs/nog/src/github.com/slspeek/gotube/web/; bash -i' 

neww -n MongoDB 'cd ~ && mongo devserver'

neww -n Musica 'cd ~ && mocp'

neww -n TmuxManual 'man tmux'

neww -n Config 'cd ~ && vim ~/session.tmux'

neww -n Snippets 'vim ~/.vim/snippets/'

neww 'autocutsel'
