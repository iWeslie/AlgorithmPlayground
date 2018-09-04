/**
 * Node
 */
public class Node<T> extends Object {

    public T data;
    public Node<T> next;

    public Node(T data, Node<T> next) {
        this.data = data;
        this.next = next;
    }

    public Node() {
        this(null, null);
    }

    public static void main(String[] args) {
        System.out.println("hello");
    }


}
