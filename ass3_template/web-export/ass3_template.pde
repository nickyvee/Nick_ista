
import java.util.*;

List<Word> words;

PFont font = createFont("", 16);
PFont font2 = createFont("", 16);
/*
ADJ:quick,brown,agile
NOUN:fox,dog,person
VERB:jump,bark
*/


void setup() {
  size(900,500); 
  
  Map<String, List<String>> wordMap = loadInWords("words.txt"); 
  
  /*
  for (String k : wordMap.keySet()) {
   // println("key = " + k); 
  
    List<String> values = wordMap.get(k);
  
    for (String v : values) {
     // println("\tvalue = " + v);
    }   
  }
  */
  
  words = parseGrammar(wordMap, "grammar.txt");
}


/*** 
  Loads in a text file indicating words assoicated with parts of speech, parses it, 
  and returns a Map of each part of speech and its assoicated List of words.
  Assumes each line looks like:

    POS:word1,word2,...,wordN
***/  
Map<String, List<String>> loadInWords(String filename) {
  
  Map<String, List<String>> m = new HashMap<String, List<String>>();
  
  String[] lines = loadStrings(filename);
  
  for (int i = 0 ; i < lines.length; i++) {
    //println(lines[i]);
    String[] chop = split(lines[i], ':');
    
    String POS = chop[0];
    String wordsStr = chop[1];
    //println("\tLEFT SIDE = " + POS);
    //println("\tRIGHT SIDE = " + wordsStr + "\n");
    
    String[] wordsArr = split(wordsStr, ','); //split right side into an array of Strings
    List<String> wordsList = Arrays.asList(wordsArr); //turns array into a List
   
    for (String tmpStr : wordsList) {
      //println("\t\tword="+tmpStr);
    }
    
    
    m.put(POS, wordsList);
  }
  
  return m;
}

List<Word> parseGrammar( Map<String, List<String>> m, String filename) {
  
  List<Word> ws = new ArrayList<Word>();
  // TO DO - 
  // 1. Load in Strings from "grammar.txt" and loop through each line.
  String[] lines = loadStrings(filename);
  
  
  for(String line : lines) {
    //println(line); 
    
    String[] posArr = line.split(" ");
    List<String> posList = Arrays.asList(posArr); //turns array into a List
    
    for (String p : posList) {
      //println("\t" + p);
      
      List<String> listOfWords = m.get(p);
      
      int randNum = (int) random(0,listOfWords.size());
       
      String randomWord = listOfWords.get( randNum );
      println("\t\t" + randomWord);
      
      Word w;
      if (p.equals("NOUN")) {
        w = new WordNoun(randomWord, p);
      } else {
        w = new Word(randomWord, p);
      }
      
      ws.add(w);
      
    }
  }
  
  return ws;
 }


float t = 0.0;

void draw() {
   background(237,238,240,0); 
   line(15,0,15,480);
   stroke(50,50,200);
   line(0,60,890,60);
   stroke(50,50,200);
   line(0,100,890,100);
   stroke(50,50,200);
   line(0,140,890,140);
   stroke(50,50,200,255);
   line(0,180,890,180);
   stroke(50,50,200,255);
   line(0,220,890,220);
   stroke(50,50,200,255);
   line(0,260,890,260);
   stroke(50,50,200,255);
   line(0,300,890,300);
   stroke(50,50,200,255);
   line(0,340,890,340);
   stroke(50,50,200,255);
   line(0,380,890,380);
   stroke(50,50,200,255);
   line(0,420,890,420);
   stroke(50,50,200,255);
   line(0,460,890,460);
   stroke(250,50,200,255);
   strokeWeight(2);
   
   int pX = 75;
   int pY = 50;
   
   //for (Word w : words) {
   for (int i = 0; i < words.size(); i++) {
     Word w = words.get(i);
     
     if (millis() < i * 200) {
       continue;
     }
     
     w.render(pX, pY);
     
     int sw = (int)textWidth(w.word);
     pX += sw + 15;
     
     if (pX > width -70) {
       pX = 30;
       pY += 40;
     }
   }
}
  

public class Word {
  
 String word;
 String POS; 
  
 public Word(String _w, String _pos) {
   this.word = _w;
   this.POS = _pos;
 }

 public void render(int x, int y) {
  textFont(font, 18);
  fill(0,0,0);
  text(word, x, y);

  
 } 
  
}

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

