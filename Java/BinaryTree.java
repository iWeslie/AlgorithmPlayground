import javafx.geometry.VPos;

public interface BinaryTree {
    final String []mode = {"preOrder", "inOrder", "postOrder"};

    void initTree();

    boolean isEmpty();

    void traverse(String s);

    Object search(Object obj);

    int depth();

    int count();

    void print();

    void clear();

}

