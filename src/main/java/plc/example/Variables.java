
// package plc.example;

import java.util.Arrays;
import java.util.List;
import java.util.function.BiFunction;
import java.util.stream.Collectors;

class Variables1 {
    void m() {
        // 8< class-vars-1
        int a = 1;
        int b = 2;
        int c = a + b;
        // >8 class-vars-1
    }
}

class Variables2 {
    void m() {

        // 8< class-vars-2
        int a = 1;
        int b = 2;
        int d;
        {
            // int b = 4;
            d = a + b;
        }
        // >8 class-vars-2
    }
}

class DynamicBinding {

    // 8<| dynamic-bind
    void m(List<String> list) {
        list.add("Hello");
    }

}

// 8< variable-shadowing
class Shadowing {
    String name = "McCoy";
    void who() {
        System.out.println(name);
        String name = "Kirk";
        System.out.println(name);
    }
}
// >8

class LambdaStreams {
    void m() {
        BiFunction<Integer, Integer, Integer> add = (a, b) -> a + b;
        add.apply(1, 2);
        List<Integer> numbers = Arrays.asList(1, 2, 3, 4);
        List<Integer> squares = numbers.stream().map(i -> i * i).collect(Collectors.toList());

        System.out.println(squares);
    }
}

// 8< vec3
class Vec3 {
    double x, y, z;

    Vec3(double x, double y, double z) {
        this.x = x;
        this.y = y;
        this.z = z;
    }

    Vec3 add(Vec3 v) {
        x += v.x;
        y += v.y;
        z += v.z;
        return this; // Allow method chaining
    }

    @Override
    public String toString() {
        return "(" + x + " " + y + " " + z + ")";
    }
}
// >8

// 8<| vec3-test
class Vec3Test {
    static void run() {
        Vec3 a = new Vec3(0, 1, 0);
        Vec3 b = new Vec3(1, 0, 0);
        System.out.println(a.add(b));
        System.out.println(a.add(b));
    }
}
