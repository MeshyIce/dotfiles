unsetopt PROMPT_SP

PROMPT='
%{$(echo -e "\e[93m")%} %*%{$(echo -e "\e[1;94m")%} %~%{$(echo -e "\e[1;91m")%}$(git branch 2>/dev/null | sed -n "s/\* \(.*\)/ \1/p")
%{$(echo -e "\e[1;95m")%} >>%{$(echo -e "\e[0m")%} ' 
