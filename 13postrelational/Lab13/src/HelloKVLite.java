import java.util.Arrays;

import oracle.kv.KVStore;
import oracle.kv.KVStoreConfig;
import oracle.kv.KVStoreFactory;
import oracle.kv.Key;
import oracle.kv.Value;

/**
 * This program connects to kvlite on localhost, puts a single key-value pair,
 * reads/prints it, updates it and the deletes it. It is based on Oracle's
 * example:
 * 
 * 		C:\Program Files\kv-3.0.9\examples\hello\HelloBigDataWorld.java
 * 
 * You'll need to copy the code into a Java class/application file. See lab 13.1 for details.
 * 
 * @author kvlinden
 * @version Summer, 2014
 */
public class HelloKVLite {

	public static void main(String[] args) {
		
		KVStore store = KVStoreFactory.getStore(new KVStoreConfig("kvstore", "localhost:5000"));

		// C(reate)
		// This initializes an arbitrary key-value pair and stores it in KVLite.
		// The key-value structure is /helloKey : $value
		String keyString = "helloKey", valueString = "Hello, Oracle NoSQL!";
		Key key = Key.createKey(Arrays.asList(keyString));
		Value value = Value.createValue(valueString.getBytes());
		store.put(key, value);

		//Create method added for lab13
		String keyStringTwo = "helloLabKey", valueStringTwo = "Hello, Lab 13!";
		Key key2 = Key.createKey(Arrays.asList(keyStringTwo));
		Value value2 = Value.createValue(valueStringTwo.getBytes());
		store.put(key2, value2);

		// R(ead)
		// This queries KVLite using the same key.
		// The result, a byte array, is converted into a string.
		String result = new String(store.get(key).getValue().getValue());
		System.out.println(key.toString() + " : " + result);

		//Read method added for lab13
		String resultTwo = new String(store.get(key2).getValue().getValue());
		System.out.println(key2.toString() + " : " + result);

		// U(pdate)
		// This modifies the value, puts the new value, overwriting the old
		// value, and gets/prints it again.
		valueString = "Hello, KVLite!";
		value = Value.createValue(valueString.getBytes());
		store.put(key, value);
		result = new String(store.get(key).getValue().getValue());
		System.out.println(key.toString() + " : " + result);

		//Update method for lab13
		valueStringTwo = "Hello, Lab13KVLite!";
		value2 = Value.createValue(valueStringTwo.getBytes());
		store.put(key2, value2);
		resultTwo = new String(store.get(key2).getValue().getValue());
		System.out.println(key2.toString() + " : " + resultTwo);

		// D(elete)
		// This deletes the key-value pair.
		store.delete(key);
		if (store.get(key) == null) {
			System.out.println("Good, key successfully deleted...");
		} else {
			System.out.println("Oops, key not deleted...");
		}

		//Delete method added for lab13
		store.delete(key2);
		if (store.get(key2) == null) {
			System.out.println("Good, key2 successfully deleted...");
		} else {
			System.out.println("Oops, key2 not deleted...");
		}

		store.close();
	}

}
