from flask import Flask, request, send_from_directory, redirect
from werkzeug.utils import secure_filename

import markdown
import os, subprocess
import uuid

app = Flask(__name__)
FILES_DIR = "files"

# Ensure the files/ directory exists
os.makedirs(FILES_DIR, exist_ok=True)

@app.route('/')
def index():
# / shows a basic HTML page and form for submitting markdown.
#...[snip]...

@app.route('/submit', methods=['POST'])
def submit():
# /submit takes a POST request to upload markdown, which is converted to HTML and saved with a random name to the files directory.
#...[snip]...

@app.route('/files')
def list_files():
# /files shows a page that displays the saved HTML files.
#...[snip]...


@app.route('/routines/<rid>')
def routines(rid):
    # Call the script that manages the routines
    # Run bash script with the input as an argument (NO shell)
    subprocess.run(["./routines.sh", rid])
    # ME: command output is not returned, so in SSRF you have to ping yourself to make sure POC works
    return "Routine executed !"


@app.route('/view/<filename>')
def view_file(filename):
# /view/<filename> shows the HTML file. 
#...[snip]...

# The webapp should only be accessible through localhost
# Thats why we need to later ssh port forward.
if __name__ == '__main__':
    app.run(host='127.0.0.1', port=5000)
