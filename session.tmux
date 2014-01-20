new  -s Gotube -n Vim 'cd ~/projs/nog/src/github.com/slspeek/gotube/ && stty -ixon; vim .'
split-window -d 'cd ~/projs/nog/src/github.com/slspeek/gotube/web && karma start --singleRun=false'
resize-pane -D 26

neww -n Server 'cd ~/projs/nog/; fish -i'

neww -n Grunt 'cd ~/projs/nog/src/github.com/slspeek/gotube/web/; fish -i' 

neww -n GoTest  'cd ~/projs/nog/; fish -i'

neww -n Protractor 'cd ~/projs/nog/src/github.com/slspeek/gotube/web/; fish -i' 

neww -n MongoDB 'cd ~ && mongo devserver'

neww -n Musica 'cd ~ && mocp'

neww -n Tmux 'man tmux'

neww -n Config 'cd ~ && vim ~/dotfiles/session.tmux'

neww 'autocutsel'

neww -n Watch 'cd ~/projs/nog/src/github.com/slspeek/gotube/web/; grunt watch'

select-window -t 1
