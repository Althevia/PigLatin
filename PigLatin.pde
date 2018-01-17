int count = 0;
public void setup() 
{
	String[] lines = loadStrings("words.txt");
	System.out.println("there are " + lines.length + " lines");
	for (int i = 0 ; i < lines.length; i++) 
	{
	  System.out.println(pigLatin(lines[i]));
	}
}
public void draw()
{
        //not used
}
public int findFirstVowel(String sWord)
//precondition: sWord is a valid String of length greater than 0.
//postcondition: returns the position of the first vowel in sWord.  If there are no vowels, returns -1
{
  int i = 0;
  if (sWord.substring(i,i+1).equals("a") || sWord.substring(i,i+1).equals("e") || sWord.substring(i,i+1).equals("i") || sWord.substring(i,i+1).equals("o") || sWord.substring(i,i+1).equals("u"))
    return -1;
  else 
    return 1;
}

public boolean ifQu(String sWord)
{
  if (sWord.substring(0,2).equals("qu"))
    return true;
  else 
    return false;
}

public boolean ifNoVowels(String sWord)
{
  for (int i=0; i<sWord.length(); i++)
  {
    if (sWord.substring(i,i+1).equals("a") || sWord.substring(i,i+1).equals("e") || sWord.substring(i,i+1).equals("i") || sWord.substring(i,i+1).equals("o") || sWord.substring(i,i+1).equals("u"))
      return false;
  }
  return true;
}

public int moveConsonants(String sWord)
{
  boolean stop = false;
  count = 0;
  for (int i=0; i<sWord.length();i++)
    {
      if (stop == false)
      {
        if (sWord.substring(i,i+1).equals("a") || sWord.substring(i,i+1).equals("e") || sWord.substring(i,i+1).equals("i") || sWord.substring(i,i+1).equals("o") || sWord.substring(i,i+1).equals("u"))
          stop = true;
        else
          count = count + 1;
      }
    }
  return count;
}

public String pigLatin(String sWord)
//precondition: sWord is a valid String of length greater than 0
//postcondition: returns the pig latin equivalent of sWord
{
  if (ifNoVowels(sWord) == true)
  {
    return sWord+"ay";
  }
	else if(findFirstVowel(sWord) == -1)
	{
		return sWord + "way";
	}
  else if (ifQu(sWord) == true)
    return sWord.substring(2,sWord.length())+"quay";
  else if (moveConsonants(sWord)>0)
    {
      return (sWord.substring(count,sWord.length()) + sWord.substring(0,count) + "ay");
    }
	else 
	{
		return "ERROR!";
	}
}