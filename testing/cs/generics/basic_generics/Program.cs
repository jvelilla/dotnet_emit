using basic_generics;

class Program
{
    static void Main(string[] args)
    {
            // Instantiate the generic class with int as its type parameter
        GenericClass<int> intGenericClass = new GenericClass<int>(10);

        int val = intGenericClass.GenericMethod(200);
        Console.WriteLine(val);

        // Instantiate the generic class with string as its type parameter
        GenericClass<string> stringGenericClass = new GenericClass<string>("Hello Eiffel");

        string result = stringGenericClass.GenericMethod("Hello Eiffel.Net");

        Console.WriteLine(result);
    }
}
