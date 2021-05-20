class FileUtil {
  static List imageType = ["gif", "jpeg", "jpg", "png", "3gp", "mov", "rm", "ram", "mpeg", "mpg"];
  static List videoType = [
    "mpg",
    "mpeg",
    "mp4",
    "3gp",
    "mov",
    "rm",
    "ram",
    "rmvb",
    "wmv",
    "asf",
    "avi",
    "asx",
    "mpg4",
    "rmvb",
    "wmv",
    "asf",
    "avi",
    "asx",
    "m4u",
    "m4v",
    "mpe",
    "RMVB"
  ];
  static List docType = [
    "doc",
    "docx",
    "xls",
    "xlsx",
    "pdf",
    "ppt",
  ];
  static List audioType = [
    "wav",
    "mp3",
  ];
  static bool isVideo(String fileType) {
    return videoType.contains(fileType);
  }

  static bool isPDF(String fileType) {
    return fileType == "pdf";
  }

  static bool isXLS(String fileType) {
    return fileType == "xls" || fileType == "xlsx";
  }

  static bool isDOC(String fileType) {
    return fileType == "doc" || fileType == "docx";
  }

  static bool isImage(String fileType) {
    return imageType.contains(fileType);
  }

  static bool isDoc(String fileType) {
    return docType.contains(fileType);
  }

  static bool isAudio(String suffix) {
    return audioType.contains(suffix);
  }
}
