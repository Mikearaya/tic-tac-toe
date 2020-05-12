# Tic Tac Toe [![Run on Repl.it](https://repl.it/badge/github/Mikearaya/tic-tac-toe)](https://repl.it/@MichaelAraya1/tic-tac-toe)

Command line based Tic Tac Toe game build with Ruby

![cover](./assets/cover.png)

## Getting Started

To get a local copy up and running follow these simple example steps.

- Clone or download this repository to your local workstation.
- enter the directory of the cloned project and change `setup.sh` to be executable by running the following command on linux based OS
  or the equivalent command in other OS
  `chmod 755 setup.sh`
- Next run the following code to create the project artifact
  `./setup.sh`

### Prerequisites

Since all the code is written using ruby `Ruby Runtime >= 1.9` ruby is required to interpret the code. if you don't have ruby runtime installed on your computer follow the instruction for your specific operating system on the [official installation guide](https://www.ruby-lang.org/en/documentation/installation/)

### Usage

- After completing the steps on the Getting stated successfuly run the following command to start the game
  `tic-tac-toe`
- Next you will be promted to enter each players name and to select symbol each player want to use for marking tiles.
  (Note: player name can be any 1 or more characters while symbol can only be single none digit character)
- Now you are ready to play the game

### Game Rules

1. The game is played on a grid that's 3 \* 3 square of tiles
2. Each player registers into the game by providing his/her name and their prefered symbol for use to mark the tiles
3. First player to get 3 of his/her marks in a row (horizontally, Vertically or diagonally) is the winner
4. When all 9 tiles are full but if no player has 3 marks in a row, the game ends in a tie

### Clean Up

if you are done playing the game and want to clean all the artifacts created, run this command on the root directory of the project
`./reset.sh`

### Testing

For testing RSpec is used. To run test run the following command line.

`rspec`

## Troubleshooting

1. `/bin/bash^M: bad interpreter: No such file or directory` when running `./setup.sh`
   run the following command on the root directory of project

   `sed -i -e 's/\r$//' setup.sh reset.sh`

## Author

👤 **Mikael Araya**

- Github: [@mikearaya](https://github.com/mikearaya)
- Twitter: [@mikearaya12](https://twitter.com/mikearaya12)
- Linkedin: [linkedin](https://linkedin.com/in/mikael-araya)

## 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check the [issues page](issues/).

## Show your support

Give a ⭐️ if you like this project!

## 📝 License

This project is [MIT](lic.url) licensed.
