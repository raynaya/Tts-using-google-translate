package freetts;



import com.sun.speech.freetts.*;
import java.util.*;

 public class Demofreetts
  {
   private String speaktext;
   public void doSpeak(String speak, String voice)
    {
     speaktext = speak;
     try
      {
       VoiceManager voiceManager = VoiceManager.getInstance();
       Voice [] v=voiceManager.getVoices();
       System.out.print("boo");
       for(int i=0;i<v.length;i++)
       System.out.println(v[i].getName()+v[i].getLocale());
       Voice voices = voiceManager.getVoice(voice);
       Voice sp = null;
       if(voices != null)
        sp= voices;
       else
         System.out.println("No Voice Available");
       //==================================================
        sp.allocate();
        sp.speak(speaktext);
        sp.deallocate();
      //==================================================
      }
     catch(Exception e)
      {
       e.printStackTrace();
      }
    }
   public static void main(String[]args)
   {
    Demofreetts obj = new Demofreetts();
    obj.doSpeak("gandu","kevin16");
   }
  } 