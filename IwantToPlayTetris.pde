import processing.awt.*;
import java.awt.*;
import javax.swing.*;

PApplet mainApplet;
SecondApplet second;
JPanel panel;
List<PImage> imgList=new ArrayList();

void settings() {
  size(300, 300);
  mainApplet=this;
}

void setup() {
  panel=new JPanel();
  panel.setBounds(0, 0, width, height);
  panel.setBackground(new Color(255, 0, 0));
  panel.setTransferHandler(new DropFilePImager(imgList));

  Canvas canvas =(Canvas)surface.getNative();
  Container pane =(Container)canvas.getParent();
  pane.add(panel);
}

void draw() {
  background(-1);
}