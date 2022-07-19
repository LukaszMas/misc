#How-To use gdown to download files from google drives (cmd):

Ref guide: [stackoverflow][1]

1. Installation:
    - `pip3 install gdown`

2. Usage:
    - `gdown http://drive.google.com/uc?id=<file_id>`
    - `gdown <file_id>`
    - `gdown --folder https://drive.google.com/drive/folders/<file_id>`
    - `gdown --folder --id <file_id>`

3. Limitations:
    - Works only on open access files. ("Anyone who has a link can View")
    - Cannot download more than 50 files into a single folder.
        - If you have access to the source file, you can use tar/zip to make  
          it a single file to work around this limitation.

[1]: <https://stackoverflow.com/questions/25010369/wget-curl-large-file-from-google-drive> "stackoverflow"
