using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace basic_generics;

public class GenericClass<T>
{
    private T genericMember;

    public GenericClass(T value)
    {
        genericMember = value;
    }

    public T GenericMethod(T genericParameter)
    {
        Console.WriteLine("Parameter type: {0}, value: {1}", typeof(T).ToString(), genericParameter);
        Console.WriteLine("Return type: {0}, value: {1}", typeof(T).ToString(), genericMember);

        return genericMember;
    }

    public T? GenericProperty { get; set; }
}

