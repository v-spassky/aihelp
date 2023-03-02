# `aihelp`

This is my own convenience tool for getting help from AI on the command line.

It uses the [OpenAI API](https://platform.openai.com/docs/api-reference/making-requests) to get suggestions for the last command you ran.

<img title="demo dif" src="assets/demo.gif" style="width:100%; max-width: 100%;">

### Installation

##### Automatic (Ubuntu, Debian only)

*Note that this is deemed unsafe. Don't do this it you don't trust the author.*

```bash
wget -O - https://raw.githubusercontent.com/v-spassky/aihelp/main/distribution/install.sh \
| bash /dev/stdin <folder-to-save-script-to> <shell-conf-file> <command-name>
```
- `<folder-to-save-script-to>` - the script will be downloaded to this path. Make sure it is in your `$PATH`;
- `<shell-conf-file>` - the script will add an alias to this file;
- `<command-name>` - the name of the command that will be used to run the script.

Example:

```bash
wget -O - https://raw.githubusercontent.com/v-spassky/aihelp/main/distribution/install.sh \
| bash /dev/stdin ~/.local/bin/ ~/.zshrc aihelp
```

Afterwards, rerun your shell configuration file (e.g. `source ~/.zshrc`).

##### Manual

- Download the script to a folder that is in your `$PATH` (i.e. at `~/.local/bin`);
- Make it executable;
- Add an alias to your `~/.bashrc`, `~/.zshrc` or whatever:

`alias aihelp="aihelp.sh \"\$(history | cut -c 8- | tail -n 1)\"`

- Make sure you have jq installed.

### Configuring

Open the script with a text editor of your choice and set the `API_KEY` variable:

`nano ~/.local/bin/aihelp.sh`

```bash
...

OPENAI_MODEL="gpt-3.5-turbo"
OPENAI_API_TOKEN="sk-zWHHjthO...LudGVG"
PROMPT_PREFIX="What is wrong with this command: "
PROMPT_POSTFIX=" ? I ran it in Linux terminal and it gave me an error. \
Please give a concise answer (ideally, 3-4 sentences)."

...
```

You might as well change all the other settings to your liking.

Also, you can change the alias to something else if you wish:

`alias whatever="aihelp.sh \"\$(history | cut -c 8- | tail -n 1)\"`

### Usage

Print `aihelp` to get a suggestion on the last command you ran.
