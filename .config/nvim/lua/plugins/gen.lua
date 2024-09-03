require('gen').setup({
    model = "llama3.1",
    display_mode = "split",
})

require('gen').prompts['Convert_Language'] = {
    prompt = "Convert this code to another language: $input.\nHere is the code\n: $text",
    replace = false,
}
