import MySQLdb as mdb
#from Automation.tcc.functions import *
import difflib
import itertools

#This function converts the words (passed as names) into their respective soundex codes.

def soundex(name):  
	"""Get the soundex code for the string"""
	name = name.upper()
	soundex = ""
	soundex += name[0]
	dictionary = {"BFPV": "1", "CGJKQSXZ":"2", "DT":"3", "L":"4", "MN":"5", "R":"6", "AEIOUHWY":".", " ":"."}
	for char in name[1:]:
		for key in dictionary.keys():
			if char in key:
				code = dictionary[key]
				if code != soundex[-1]:
					soundex += code
	soundex = soundex.replace(".", "")
	soundex = soundex[:4].ljust(4, "0")
	return  soundex

if __name__ == '__main__':
	con = mdb.connect('localhost', 'root', 'h', 'tcc_automation');
	with con:
		cur = con.cursor()
		columns = ['first_name', 'middle_name', 'last_name','address', 'city']
		for value in columns:
			cur.execute("SELECT " + value + " FROM tcc_userprofile WHERE " + value + " IS NOT NULL AND " +  value + " <> ''")
			rows = cur.fetchall()
			for row in rows:         #For implementing phonetic with spaces using python lists.
				for val in row:    # rows = rows of table, row = single row from table
					k = val.split()  #splitting when space is encountered
					exist = cur.execute("SELECT word FROM tcc_codetable") #word is column name
					exist_values = cur.fetchall()  #fetching all values from CodeTable.
					lists = [ soundex(x) for x in k ] #values in rows can be lists (may contain spaces), convert them into codes using soundex function.
					for x, y in itertools.izip(k, lists): 
						word = x
						code = y
						flag = 0  # flag for checking condtion: word already exist
						for z in exist_values:
							for v in z:
								if word == v:
										flag = 1      #set flag=1 if word already exists.
								else:
									continue
						if flag == 1:   # if flag is 1 then check next value otherwise generate code
							continue
						else:
							query = "'"+word+"','"+code+"'"  #concatenation
							cur.execute("INSERT into tcc_codetable(word,code) VALUES(" + query + ")")
                                                          # insert the values into tcc_codetable
