# Odd Jobs @ NUS

A CS3226 Capstone Project

# Setting up the Development Environment

### Installing ruby
First check if you have ruby installed, run:  
`ruby --version`  
If you get a response showing ruby version 2.2.4, you're all set!

If not,  
Windows users can download ruby 2.2.4 from [RubyInstaller.org][ruby_installer]  
Mac users can run the following:  
*\# Prepare package managers*  
`brew update`  
`brew install rbenv`  
`brew install ruby-build`  
*\# Add rbenv to bash so that it loads every time you open a terminal*  
`echo 'if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi' >> ~/.bash_profile`
`source ~/.bash_profile`  
*\# Install Ruby*  
`rbenv install 2.2.4`  
`rbenv global 2.2.4`  
`ruby -v`

[ruby_installer]: http://rubyinstaller.org/downloads/

### Installing Rails
To install Ruby on Rails, run:  
`gem install rails -v 4.2.6`

# Resources
[Ruby on Rails Tutorial][rails_tut]

[rails_tut]: https://www.railstutorial.org/book