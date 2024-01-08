---
title: Whitebox vs. Blackbox Testing
layout: post
---

Many blog posts on testing belabor the need for "pure functions" that will always return the save value given the same inputs and never have any side effects. While this is nice to have, it is rarely achievable in real code bases that need to do IO operations or deal with third-party APIs. Even when it is technically achievable, it can be impractical. Instead, developers should aim for "blackbox" testing based entirely on inputs when possible, and "whitebox" testing, which "peeks" into the implementation, when it is not.

## Blackbox Testing

The "gold standard" of testing is "blackbox testing", where code can be treated as a "blackbox" that you send inputs into and it returns outputs. Here is a very simple example of a blackbox test:

{% highlight java %}
class MyClass {
    public static int add(int x, int y) {
        return x + y;
    }
}

class MyClassTest {
    @Test
    void testAdd() {
        assertEquals(4, MyClass.add(2,2))
    }
}
{% endhighlight %}

Here, the `add` method will always return the same output for a given set of inputs. It doesn't have any side effects, and will not throw an exception because it cannot reach the internet, for example.

 While this is a good ideal, it tends not to be very practical for "real" applications. Let me provide some examples so you can understand what the issues are:

### Problem 1: Third Party Methods/APIs

{% highlight java %}
import com.vendor.library.Vendor

class MyClass { 
    private Vendor v;

    public MyClass(Vendor v) {
        this.v = v;
    }

    public String myMethod(int x) {
        if (x == 1) {
            return "Hello";
        } else {
            Vendor v = new Vendor();
            return v.vendorMethod(x);
        }
    }
}
{% endhighlight %}

You *could* cover this case by checking what the value returned by `vendorMethod` is for each value of x, update them when the third party API changes, and write a bunch of tests that don't really have anything to do with the code that you wrote. If `vendorMethod` is a utility method that runs entirely locally and is stable, that is a practical option; however, if `vendorMethod` is making an HTTP call or something, then perhaps it might be a good idea to mock it out and only test code that you wrote. Unfortunately, this breaks the blackbox philosophy.

If you wanted to keep it as a blackbox, you could write an interface and a wrapper for the VendorClass that implements it as well as a "test implementation" that you control, but if you do that you are doing the same exact thing as mocking, but with extra steps.


### Problem 2: Error States

Another issue with blackbox testing is testing error states that occur from IO or are not directly related to input.

{% highlight java %}
public String myMethod(String url) {
    try {
        return webApi.getData(url);
    } catch (HttpException e) {
        log.error("An error occurred", e)
        return "";
    }
}
{% endhighlight %}

How are you going to trigger an HttpException? Without mocking, it would be a pain. You could, again, create a test implementation for you webApi and force it throw an exception, but that is equivalent to mocking and requires considerably more effort. 

## Whitebox Testing

The common refrain to these issues is refactor your application to make everything "pure". For most applications that need to communicate with the file system, a database, or the web this is completely impractical advice. You can "isolate" the impurity by wrapping all IO calls in a utility class, but for large applications this often can mean a lot of boilerplate code that is basically duplicating the interface of an existing module. Also, if you are dealing with a legacy application that has a huge number of existing impure methods, you can spend literally years of developer time to refactor code with no practical value beyond "testability". Instead, I would advocate whitebox testing in those cases to isolate the bits of code that you actually want to test. Whitebox testing does assume some knowledge of how the method works, but it also allows you to isolate exactly the code flows you want to test.

Going back to the vendor example and using the Mockito library to mock out the vendor methods:

{% highlight java %}
import com.vendor.library.Vendor

class MyClass { 
    private Vendor v;

    public MyClass(Vendor v) {
        this.v = v;
    }
    
    public String myMethod(int x) {
        if (x == 1) {
            return "Hello";
        } else {
            Vendor v = new Vendor();
            return v.vendorMethod(x);
        }
    }
}

@ExtendWith(MockitoExtension.class)
class MyClassTest {
    @InjectMocks
    MyClass myClass;

    @Mock
    Vendor v;

    @Test
    void returnsHelloWhenXIsOne() {
        assertEquals("Hello", myClass.myMethod(1));
    }

    @Test
    void returnsVendorStringWhenXIsNotOne() {
        when(v.vendorMethod(2)).thenReturn("vendor string");
        assertEquals("vendor string", myClass.myMethod(2));
    }
}
{% endhighlight %}

Some will dismiss this as beating the code into shape and then testing that it takes that shape, but I think that this is sort of the essence of unit testing. Unlike integration tests, in unit test you want to check that a particular unit of code is doing what you want, irrespective of other units. To do that you need to check each branching pathway. If you can't control the flow, you cannot do that. 

That being said, if you find yourself mocking out methods that you wrote, non-IO methods, or "normal" execution (e.g. non-error states), then perhaps a refactor is in order to make your code more "pure". Whitebox testing should be used sparingly and in places where it makes sense. Over-utilizing whitebox testing can make tests fragile, as a change to implementation may require changes to tests.