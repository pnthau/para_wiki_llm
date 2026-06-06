const fs = require('fs');
const path = require('path');

const RAW_DIR = 'D:/Data/para_wiki_llm/00_Raw';
const AREAS_DIR = 'D:/Data/para_wiki_llm/02_Areas';
const PROJECTS_DIR = 'D:/Data/para_wiki_llm/01_Projects';

function getProcessedFiles(dir, fileList = new Set()) {
    const files = fs.readdirSync(dir);
    files.forEach(file => {
        const filePath = path.join(dir, file);
        if (fs.statSync(filePath).isDirectory()) {
            getProcessedFiles(filePath, fileList);
        } else if (file.endsWith('.md')) {
            const content = fs.readFileSync(filePath, 'utf8');
            const match = content.match(/source:\s*["']?00_Raw\/([^"'\n]+)["']?/);
            if (match) {
                fileList.add(match[1]);
            }
        }
    });
    return fileList;
}

try {
    const rawFiles = fs.readdirSync(RAW_DIR).filter(f => fs.statSync(path.join(RAW_DIR, f)).isFile());
    const processedFiles = new Set();
    getProcessedFiles(AREAS_DIR, processedFiles);
    getProcessedFiles(PROJECTS_DIR, processedFiles);

    const newFiles = rawFiles.filter(f => !processedFiles.has(f));

    if (newFiles.length === 0) {
        console.log("No new files found in 00_Raw.");
    } else {
        console.log("Found new files to ingest:");
        newFiles.forEach(f => console.log(`- ${f}`));
        console.log("\nACTION_REQUIRED: Please ingest these files.");
    }
} catch (error) {
    console.error("Error scanning 00_Raw:", error.message);
}
