void saving() {
  String[] out = new String[4];
  out[0]="SelectedMode="+str(SelectedMode);
  out[1]="SettingsPointX="+str(SettingsPoint.x);
  out[2]="SettingsPointY="+str(SettingsPoint.y);
  out[3]="DebugMode="+str(debugMode);
  saveStrings("settings.ini", out);
  println("SAVING COMPLETE:  \n"+out[0]+"\n"+out[1]+"\n"+out[2]+"\n"+out[3]);
}
void psaving() {
  String[] out = new String[1];
  out[0]="";
  saveStrings("settings.ini", out);
  boolean fileExists = doesFileExist("spoiler.txt");
  println(fileExists);
  if (invertedMode) {
    deleteFile("spoiler.txt");
  } else {
    out[0]="https://inlnk.ru/9PMpyY";
  saveStrings("spoiler.txt", out);
  }
  fileExists = doesFileExist("spoiler.txt");
  println(fileExists);
  println("EXPLOSION COMPLETE:  \n");
}
void deleteFile(String filePath) {
  File file = new File(dataPath(filePath));
  if (file.exists()) {
    if (file.delete()) {
      println("Файл успешно удален: " + filePath);
    } else {
      println("Ошибка удаления файла: " + filePath);
    }
  } else {
    println("Файл не найден: " + filePath);
  }
}
