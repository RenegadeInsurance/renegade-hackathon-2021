const LEFT = 0;
const RIGHT = 1;

class Node{
  constructor()
  {
    this.left = null;
    this.right = null;
    this.root = null;
  }
}

class TreeNode {
  constructor(value) {
    this.value = value;
    this.node = new Node()
    this.setUpTree()
  }


  setUpTree()
  {
    if(this.value.length > 0)
    {
      this.node.root = this.value[0]
      this.node.left = this.getQuestionById(this.value[0].y)
      this.node.right = this.getQuestionById(this.value[0].n)
      this.createNode(this.node.left, this.getQuestionById(this.node.left.y),  this.getQuestionById(this.node.left.n))
      this.createNode(this.node.right, this.getQuestionById(this.node.right.y),  this.getQuestionById(this.node.right.n))
    }
        
  }

  createNode(node, left ,right)
  {
    if(left == null && right == null)
    {
      return 
    }


    node.left = left;
    node.right = right;
    this.createNode(left, this.getQuestionById(left.y), this.getQuestionById(left.n))
    this.createNode(right, this.getQuestionById(left.y), this.getQuestionById(left.n))
  }

  getQuestionById(questionNumber)
  {

    if(questionNumber == null)
    {
      return null
    }

    const found = this.value.find( e => e.id == questionNumber)
  
    if(found)
    {
      return found
    }
  
    return null
  }


  traverse()
  {
    console.log("Node is ", this.node)
  }

  


}

export default TreeNode

