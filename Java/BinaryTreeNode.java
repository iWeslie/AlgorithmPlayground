public class BinaryTreeNode {
    Object element;
    BinaryTreeNode left, right;

    public BinaryTreeNode(Object obj) {
        element = obj;
        left = right = null;
    }

    public BinaryTreeNode(Object obj, BinaryTreeNode left, BinaryTreeNode right) {
        element = obj;
        this.left = left;
        this.right = right;
    }

}
