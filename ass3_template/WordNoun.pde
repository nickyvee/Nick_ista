
public class WordNoun extends Word {
  
 public WordNoun(String _w, String _pos) {
    super(_w, _pos);
 }

 public void render(int x, int y) {
  textFont(font2, 22);
  fill(255,0,0);
  text(word, x, y);
 } 
  
}
