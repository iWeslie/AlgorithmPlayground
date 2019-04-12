import java.util.Stack;

/**
 * LinkedBinaryTree
 * 
 */
public class LinkedBinaryTree implements BinaryTree {
    protected BinaryTreeNode root;

    public LinkedBinaryTree() {
        root = null;
    }

    public BinaryTreeNode getRoot() {
        return root;
    }

    public void initTree(String str) {
        Stack stack = new Stack<Character>();
        root = null;
        BinaryTreeNode p = null;
        int k = 1;
        char []a = str.toCharArray();
        for (int i = 0; i < a.length; i++) {
            switch (a[i]) {
                case ' ':
                    break;
                case '(':
                    stack.push(p);
                    k = 1;
                    break;
                case ')':
                    if (stack.isEmpty()) {
                        System.out.println("Input string is wrong");
                        System.exit(1);
                    }
                    stack.pop();
                    break;
                case ',':
                    k = 2;
                    break;
                default:
                    p = new BinaryTreeNode(a[i]);
                    if (root == null) {
                        root = p;
                    } else if (k == 1) {
                        ((BinaryTreeNode)stack.peek()).left = p;
                    } else {
                        ((BinaryTreeNode)stack.peek()).right = p;
                    }
            }
        }
    }

    public void preOrder(BinaryTreeNode node) {
        if (node != null) {
            System.out.println(node.element + " ");
            preOrder(node.left);
            preOrder(node.right);
        }
    }

    public void inOrder(BinaryTreeNode node) {
        if (node != null) {
            inOrder(node.left);
            System.out.println(node.element + " ");
            inOrder(node.right);
        }
        
    }

    public void postOrder(BinaryTreeNode node) {
        if (node != null) {
            postOrder(node.left);
            postOrder(node.right);
            System.out.println(node.element + " ");
        }
    }

    public void levelOrder(BinaryTreeNode node) {
        
    }

    private Object search(BinaryTreeNode node, Object obj) {
        if (node == null) {
            return null;
        }
        if (node.element.equals(obj)) {
            return node.element;
        }
        Object value;
        value = search(node.left, obj);
        if (value != null) {
            return value;
        } else {
            return search(node.right, obj);
        }
    }

    public int depth(BinaryTreeNode node) {
        if (node == null) {
            return 0;
        } 
        int leftDepth = depth(node.left);
        int rightDepth = depth(node.right);
        if (leftDepth > rightDepth) {
            return leftDepth + 1;
        } else {
            return rightDepth + 1;
        }
    }

    public int count(BinaryTreeNode node) {
        if (node == null) {
            return 0;
        }
        return count(node.left) + 1 + count(node.right);
    }

    public void print(BinaryTreeNode node) {
        
    }

    public boolean isEmpty() {
        return root == null;
    }

    public void initTree() {

    }

    public void traverse(String s) {
        if (s.equals(mode[0])) {
            preOrder(root);
        } else if (s.equals(mode[1])) {
            inOrder(root);
        } else if (s.equals(mode[2])) {
            postOrder(root);
        }        
        System.out.println();
    }

    public Object search(Object obj) {
        return search(root, obj);
    }

    public int depth() {
        return depth(root);
    }

    public int count() {
        return count(root);
    }

    public void print() {
        print(root);
        System.out.println();
    }

    public void clear() {
        root = null;
    }

}