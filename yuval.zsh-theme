unsetopt PROMPT_SP

PROMPT='
%{$(echo -e "\e[1;38;5;48m")%} %*%{$(echo -e "\e[1;38;5;81m")%} %~%{$(echo -e "\e[1;38;5;203m")%}$(git branch 2>/dev/null | sed -n "s/\* \(.*\)/ \1/p")
%{$(echo -e "\e[1;97m")%} >>%{$(echo -e "\e[0m")%} ' 
