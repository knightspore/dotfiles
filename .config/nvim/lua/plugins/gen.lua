require('gen').setup({
    model = "mistral-nemo",
    display_mode = "split",
})

require('gen').prompts['Convert_Language'] = {
    prompt = "Convert this code to: $input.\nHere is the code\n: $text",
    replace = false,
}
