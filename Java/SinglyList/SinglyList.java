/**
 * SinglyList
 */

public class SinglyList<T> extends Object {

    public Node<T> head;

    public SinglyList() {
        this.head = new Node();
    }

    public SinglyList(T[] values) {
        this();
        Node<T> rear = this.head;
        for (int i = 0; i < values.length; i++) {
            rear.next = new Node<T>(values[i], null);
            rear = rear.next;
        }
    }

    public boolean isEmpty() {
        return this.head.next == null;
    }

    public String toString() {
        String str = this.getClass().getName() + "[";
        for(Node<T> p = this.head.next; p != null; p = p.next) {
            str += p.data.toString();
            if (p.next != null) {
                str += ",";
            }
        }
        return str += "]";
    }

    public static void main(String[] args) {
        String[] array = {1, 4, 6, 3, 6, 8, 5, 7, 9, 0, 1};
        SinglyList<String> list = new SinglyList<>(array);
        System.out.println(list.toString);
    }
}
