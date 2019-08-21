package plc.example;

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
// >8

    @Override
    public String toString() {
        return "(" + x + " " + y + " " + z + ")";
    }

// 8<| vec3-test
    static void main() {
        Vec3 a = new Vec3(0, 1, 0);
        Vec3 b = new Vec3(1, 0, 0);
        Vec3 c = a.add(b);
        Vec3 d = c.add(a);
        System.out.println(c);
        System.out.println(d);
    }
}
