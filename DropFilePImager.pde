private class DropFilePImager extends DropFileHandler {
  List<PImage> portPImageList;

  DropFilePImager(List<PImage> _portPImageList) {
    super(new ArrayList());
    portPImageList=_portPImageList;
  }

  //ドロップされたファイルを受け取る
  @Override
    public boolean importData(TransferSupport support) {
    // 受け取っていいものか確認する
    if (!canImport(support)) {
      return false;
    }

    // ドロップ処理
    Transferable t = support.getTransferable();
    try {
      // ファイルを受け取る
      currentFiles = (List<File>) t.getTransferData(DataFlavor.javaFileListFlavor);

      for (File file : currentFiles) {
        portList.add(file);

        String path=file.getPath();
        if (isCorrectFormat(path, "jpg") || isCorrectFormat(path, "jpeg")|| isCorrectFormat(path, "png")|| isCorrectFormat(path, "bmp")|| isCorrectFormat(path, "gif")) {
          portPImageList.add(loadImage(file.getPath()));
          second = new SecondApplet(mainApplet, loadImage(file.getPath()));
        }
      }
    } 
    catch (IOException e) {
      e.printStackTrace();
    } 
    catch(UnsupportedFlavorException ue) {
      ue.printStackTrace();
    }
    return true;
  }
}

//---------------------

boolean isCorrectFormat(String path, String format) {
  if (path.indexOf(format)==path.length()-format.length()) {
    return true;
  } else {
    return false;
  }
}