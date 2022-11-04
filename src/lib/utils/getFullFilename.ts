const path = require("path");
const ROOT_DIR = path.dirname(path.dirname(path.dirname(__filename)));

const getFullFilename = (fileName: string): string => {
  if (fileName.startsWith(ROOT_DIR)) {
    return fileName.substring(ROOT_DIR.length + 1);
  }
  return fileName;
};

export default getFullFilename;
