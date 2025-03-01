import * as fs from 'fs';
import * as path from 'path';

class MyLogger {
    private logDir: string;

    constructor(logDir: string) {
        this.logDir = logDir;
        if (!fs.existsSync(logDir)) {
            fs.mkdirSync(logDir, { recursive: true });
        }
    }

    log(message: string): void {
        const logFilePath = path.join(this.logDir, 'log.txt');
        const logMessage = `${new Date().toISOString()} - ${message}\n`;
        fs.appendFileSync(logFilePath, logMessage, 'utf8');
    }
}

const myLogger:MyLogger = new MyLogger('/workspaces/');

export default myLogger;
