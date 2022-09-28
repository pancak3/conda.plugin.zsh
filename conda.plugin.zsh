# A small plugin for parsing Conda environments into OMZ themes
# The idea is to be able to add this plugin to your favorite OMZ theme
# In addition to the regular conda config info, this plugin gives the current python version

# the prompt
function conda_prompt_info() {
  echo "$(conda_env)${ZSH_THEME_CONDA_PROMPT_SEPARATOR}$(conda_py_ver)"
}

# a simpler prompt (this is the more tradtional version)
function conda_env_prompt_info() {
  echo "$(conda_env)"
}

# Conda evniornment
function conda_env() {
  if [[ -n ${CONDA_DEFAULT_ENV} ]]; then
    echo ${CONDA_DEFAULT_ENV}
  fi
}

# Python version
function conda_py_ver() {
  if [[ -n ${CONDA_DEFAULT_ENV} ]]; then
    echo "py:$(python -V | cut -d ' ' -f 2)"
  fi
}


# Default values for the appearance of the prompt. Customize in your theme if you like.
ZSH_THEME_CONDA_PROMPT_SEPARATOR=" "


#Disable conda prompt changes
#https://conda.io/docs/user-guide/configuration/use-condarc.html#change-command-prompt-changeps1
#changeps1: False
#`conda config --set changeps1 false`
